package com.eeit147.groupfive.reply.service;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.util.Base64;
import java.util.Date;
import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.eeit147.groupfive.recipe.model.Recipe;
import com.eeit147.groupfive.recipe.model.RecipeDao;
import com.eeit147.groupfive.users.model.Posts;
import com.eeit147.groupfive.users.model.PostsDao;
import com.eeit147.groupfive.users.model.Reply;
import com.eeit147.groupfive.users.model.ReplyDao;
import com.eeit147.groupfive.users.model.ReplyDto;
import com.eeit147.groupfive.users.model.Users;
import com.eeit147.groupfive.users.model.UsersDao;

@Service
@Transactional
public class ReplyService {
	@Autowired
	private ReplyDao rpDao;
	
	@Autowired
	private PostsDao pDao;
	
	@Autowired
	private RecipeDao rDao;
	
	//食譜留言新增	
	public List<Reply> insertReply(ReplyDto replydto,Users user) throws IOException {
		Reply reply = new Reply();
		
		Integer replyId = replydto.getReplyId();//食譜id
		Date date = new Date();//修改時用
		reply.setUploadTime(date);

		Reply newReply = rpDao.save(reply);  
		
		String imgPath="reply"+newReply.getReplyId()+".jpeg";//路徑儲存
		
		//判斷是否有選擇圖片
		if(replydto.getFinallyPhoto() != null) {
			
			String pfile=replydto.getFinallyPhoto().substring(replydto.getFinallyPhoto().indexOf(",") + 1);
			byte[] a = Base64.getDecoder().decode(pfile);
			FileOutputStream out = new FileOutputStream("C:\\Git\\Project\\team05\\src\\main\\webapp\\image\\reply\\"+imgPath);
			out.write(a);
			out.close();
		}else {
				InputStream fis = new FileInputStream(new File(
						"C:\\Git\\Project\\team05\\src\\main\\webapp\\image\\food.png"));
				OutputStream fos = new FileOutputStream(new File(
						"C:\\Git\\Project\\team05\\src\\main\\webapp\\image\\reply\\"+imgPath));
				fos.write(fis.readAllBytes());
				fos.flush();
				fos.close();
				fis.close();
		}
		
		Optional<Recipe> optional = rDao.findById(replyId);
		Recipe recipe = optional.get();
		newReply.setRecipe(recipe);
		newReply.setMessage(replydto.getMessage());
		newReply.setFinallyPhoto(imgPath);
		
		//連結user
		newReply.setUsers(user);
		rpDao.save(newReply);

		List<Reply> allReply=rpDao.findAllByRecipeReplyById(replyId);
		
		return allReply;
	}
	
	public Reply insertPostsReply(Reply reply) {
		Reply newReply = rpDao.save(reply);
		return newReply;
	}
	
	// 文章留言
	public List<Reply> findPostAllReply(Integer postId){
		Optional<Posts> op = pDao.findById(postId);
		if(op.isPresent()) {
			Posts post = op.get();
			List<Reply> replys = rpDao.findByPostsOrderByUploadTimeAsc(post);
			return replys;
		}
		
		return null;
	}
	
}
