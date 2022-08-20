package com.eeit147.groupfive.reply.controller;

import java.util.Date;
import java.util.List;
import java.util.Optional;
import java.io.FileOutputStream;
import java.util.ArrayList;
import java.util.Base64;
import java.util.Base64.Decoder;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.ResponseBody;

import com.eeit147.groupfive.recipe.model.Recipe;
import com.eeit147.groupfive.recipe.model.RecipeDao;
import com.eeit147.groupfive.reply.service.ReplyService;
import com.eeit147.groupfive.users.model.Reply;
import com.eeit147.groupfive.users.model.ReplyDao;
import com.eeit147.groupfive.users.model.ReplyDto;
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
	//private ReplyDto rDto;
	//@Autowired
	//private PostsDao pDao;replytypeId
	
	
	//測試
	
	Integer usersId=3;
	Integer replytype=1;//1為recipe,2為posts(有posts前端設定2)
	Integer replytypeId=2; //recipeId或postsId
	Integer replyId=9; //recipeId或postsId
	
	
	@GetMapping("/reply/page")
	public String replyPage(Model m) {
		m.addAttribute("replytype", replytype);
		m.addAttribute("replytypeId", replytypeId);
		m.addAttribute("usersId",usersId);
		m.addAttribute("replyId",replyId);
		return "reply";
	}
	
	@ResponseBody
	@GetMapping("/reply/show")
	public List<Reply> replyShow() {
		List<Reply> allReply=rpDao.findAllByRecipeReplyById(replytypeId);
		for(Reply r:allReply) {
			System.out.println(r.getUsers().getUserName());
		}
		return allReply;
	}
	public void hello() {
		System.out.println("hello");
	}
	@ResponseBody
	@PostMapping(value="/reply/insert", produces = { "application/json; charset=UTF-8" })
	public List<Reply> replyInsert(@RequestBody ReplyDto replydto, Model m) throws Exception {
		Integer rtype=replydto.getReplytype();
		Reply reply=new Reply();
		Integer replyId=replydto.getReplyId();//=recipeId or =postsId
		Date date=new Date();//修改時用
		reply.setUploadTime(date);
		boolean updatejudge=true;
		if(replyId==1) {   //新增時先存一次,取得id <新增時id設1>
			rpService.insertReply(reply);
		    replyId=reply.getReplyId();
		    updatejudge=false;   
		}
		String imgPath="reply"+replyId+".jpg";//路徑儲存
		//判斷是否有選擇圖片
		if(replydto.getFinallyPhoto()==null) {
			if(updatejudge==false) {
				imgPath="noimg.jpg";//預設圖片
			}	
		}else{
			//存圖片
			String pfile=replydto.getFinallyPhoto().substring(replydto.getFinallyPhoto().indexOf(",") + 1);
			byte[] a = Base64.getDecoder().decode(pfile);
			FileOutputStream out = new FileOutputStream("C:\\Git\\Project\\team05\\src\\main\\webapp\\image\\reply\\"+imgPath);
			out.write(a);
			out.close();
		}
		
		if(rtype==1) { //1.recipe
			Optional<Recipe> optional = rDao.findById(replydto.getReplytypeId());
			Recipe recipe = optional.get();
			reply.setRecipe(recipe);
		}else { //2.posts
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
	@ResponseBody
	@PostMapping(value="/reply/update", produces = { "application/json; charset=UTF-8" })
	public Reply replyUpdate(@RequestBody Integer replyId, Model m){
		Optional<Reply> r=rpDao.findById(replyId);
		Reply reply=r.get();
		return reply;
	}
	@ResponseBody	@PostMapping(value="/reply/delete", produces = { "application/json; charset=UTF-8" })
	public void replyDelete(@RequestBody Integer replyId, Model m){
		rpDao.deleteById(replyId);

	}
}
