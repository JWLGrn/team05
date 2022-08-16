package com.eeit147.groupfive.reply.controller;

import java.io.File;
import java.util.Date;
import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.ResponseBody;

import com.eeit147.groupfive.recipe.model.Recipe;
import com.eeit147.groupfive.recipe.model.RecipeDao;
import com.eeit147.groupfive.recipe.model.ReplyDto;
import com.eeit147.groupfive.reply.service.ReplyService;
import com.eeit147.groupfive.users.model.Reply;
import com.eeit147.groupfive.users.model.ReplyDao;
import com.eeit147.groupfive.users.model.Users;
import com.eeit147.groupfive.users.model.UsersDao;


@Controller
public class ReplyController {
	@Autowired
	private ReplyService rpService;
	@Autowired
	private UsersDao uDao;
	@Autowired
	private ReplyDao rpDao;
	@Autowired
	private RecipeDao rDao;
	//@Autowired
	//private PostsDao pDao;replytypeId
	
	
	//測試
	Integer usersId=3;
	Integer recipeId=2; //replytype=1
	Integer postsId; //replytype=2
	
	@GetMapping("/reply/page")
	public String replyPage(Model m) {
		Integer replytype=1;
		Integer replyTypeId=2;
				
		m.addAttribute("usersId",usersId);
		return "reply";
	}
	
	@ResponseBody
	@GetMapping("/reply/show")
	public List<Reply> replyShow() {
		Integer replytype=1;
		Integer replyTypeId=2;
		List<Reply> allReply=rpDao.findAllByRecipeReplyById(replyTypeId);
		//撈資料
		//if(replytype==2) {
			//List<Posts> allReply=rpDao.findAllByPostsReplyById(replyTypeId);
		//}				
		return allReply;
	}
	@ResponseBody
	@PostMapping("/reply/insert")
	public List<Reply> replyInsert(@RequestBody ReplyDto replydto, Model m) {
		Integer rtype=replydto.getOther();
		//System.out.println(replydto.getRtype());//抓不到值???
		
		Reply reply=new Reply();
		Integer replyId=replydto.getReplyId();
		
		System.out.println(replyId);
		
		
		Date date=new Date();//修改時用
		reply.setUploadTime(date);
		//新增時先存一次,取得id <新增時id設1>
		if(replyId==1) {
			rpService.insertReply(reply);
		    replyId=reply.getReplyId();
		}
		//判斷是否有圖片
		String imgPath="reply"+replyId+".jpg";
		//if(reply.getFinallyPhoto().isEmpty()) {
		//	imgPath="noimg.jpg";
		//}else {
			//try {
			//	reply.getFinallyPhoto().transferTo(new File("C:\\Git\\Project\\team05\\src\\main\\webapp\\image\\reply\\reply"+replyId+".jpg"));		
			//    } catch (IOException e) {
			//	  e.printStackTrace();
			 //   }
		//}
		if(rtype==1) {
			Optional<Recipe> optional = rDao.findById(replydto.getReplytypeId());
			Recipe recipe = optional.get();
			reply.setRecipe(recipe);
		}else {
			//Optional<Posts> optional = pDao.findById(replytypeId);
			//Posts posts = optional.get();
			//reply.setPosts(posts);
		}
		reply.setReplyId(replyId);
		reply.setMessage(replydto.getMessage());
		reply.setFinallyPhoto(imgPath);
		Optional<Users> optional2 = uDao.findById(replydto.getUsersId());//抓usersbean
		Users user = optional2.get();
		reply.setUsers(user);
		rpService.insertReply(reply);

		List<Reply> allReply=rpDao.findAllByRecipeReplyById(replydto.getReplytypeId());
		return allReply;
	}
	
	
}
