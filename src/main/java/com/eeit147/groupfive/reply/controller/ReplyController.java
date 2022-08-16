package com.eeit147.groupfive.reply.controller;

import java.io.File;
import java.io.IOException;
import java.util.Date;
import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.eeit147.groupfive.recipe.model.Recipe;
import com.eeit147.groupfive.recipe.model.RecipeDao;
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
	//private PostsDao pDao;
	
	
	//測試
	Integer usersId=3;
	Integer recipeId=2; //replytype=1
	Integer postsId; //replytype=2
	
	@GetMapping("/reply/page")
	public String replyPage(Model m) {
		Integer replytype=1;
		Integer replyTypeId=2;
		//List<Reply> allReply
		//撈資料
		if(replytype==1) {
			List<Reply> allReply=rpDao.findAllByRecipeReplyById(replyTypeId);
		}else {
			//List<Posts> allReply=rpDao.findAllByPostsReplyById(replyTypeId);
		}
		
		
		//m.addAttribute("allReply",allReply);
		m.addAttribute("usersId",usersId);
		return "reply";
	}
	
//	@PostMapping("/reply/insert")
//	public String replyInsert(@RequestParam(value="replytype") Integer replytype,
//							  @RequestParam(value="replytypeId") Integer replytypeId,
//							  @RequestParam(value="replyId") Integer replyId,
//							  @RequestParam(value="usersId") Integer usersId,
//			                  @RequestParam(value="finallyPhoto") MultipartFile finallyPhoto,
//                              @RequestParam(value="message") String message, Model m) {
//		Reply reply=new Reply();
//		Date date=new Date();//修改時用
//		reply.setUploadTime(date);
//		//新增時先存一次,取得id <新增時id設1>
//		if(replyId==1) {
//			rpService.insertReply(reply);
//		    replyId=reply.getReplyId();
//		}
//		//判斷是否有圖片
//		String imgPath="reply"+replyId+".jpg";
//		if(finallyPhoto.isEmpty()) {
//			imgPath="noimg.jpg";
//		}else {
//			try {
//				finallyPhoto.transferTo(new File("C:\\Git\\Project\\team05\\src\\main\\webapp\\image\\reply\\reply"+replyId+".jpg"));		
//			    } catch (IOException e) {
//				  e.printStackTrace();
//			    }
//		}
//		if(replytype==1) {
//			Optional<Recipe> optional = rDao.findById(9);
//			Recipe recipe = optional.get();
//			reply.setRecipe(recipe);
//		}else {
//			//Optional<Posts> optional = pDao.findById(replytypeId);
//			//Posts posts = optional.get();
//			//reply.setPosts(posts);
//		}
//		reply.setReplyId(replyId);
//		reply.setMessage(message);
//		reply.setFinallyPhoto(imgPath);
//		Optional<Users> optional = uDao.findById(usersId);//抓usersbean
//		Users user = optional.get();
//		reply.setUsers(user);
//		rpService.insertReply(reply);
//		
//		System.out.println(replytype+"_"+replytypeId);
//		
//		
//
//		m.addAttribute("usersId",usersId);
//		return "redirect:/reply/page";
//	}
	
	@PostMapping("/reply/insert")
	public @ResponseBody Reply replyInsert(@RequestBody Reply reply, Model m) {
		
		System.out.println("message="+reply.getMessage());
		System.out.println("ReplyId="+reply.getReplyId();
		System.out.println("message="+reply.getMessage());
		System.out.println("message="+reply.getMessage());
		System.out.println("message="+reply.getMessage());
		
		return reply;
	}
}
