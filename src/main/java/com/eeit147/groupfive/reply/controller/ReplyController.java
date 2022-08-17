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
	public List<ReplyDto> replyShow() {
		Integer replytype=1;
		Integer replyTypeId=2;
		List<Reply> allReply=rpDao.findAllByRecipeReplyById(replyTypeId);
		System.out.println("@@"+allReply.size());
		List<ReplyDto> datadto=changeReplyToDto(allReply,1,2,3);
		
		for(ReplyDto r:datadto) {
				
		System.out.println(r.getReplytype());
		System.out.println(r.getReplytypeId());
		System.out.println(r.getReplyId());
		System.out.println(r.getFinallyPhoto());
		System.out.println(r.getMessage());
		System.out.println(r.getUsersId());
		System.out.println(r.getUserName());
		System.out.println(r.getUserPhoto());
		}
		
		return datadto;
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
		if(replyId==1) {   //新增時先存一次,取得id <新增時id設1>
			rpService.insertReply(reply);
		    replyId=reply.getReplyId();
		}
		String imgPath="reply"+replyId+".jpg";//路徑儲存
		//判斷是否有選擇圖片
		if(replydto.getFinallyPhoto()==null) {
			imgPath="noimg.jpg";//預設圖片
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
	public List<ReplyDto> changeReplyToDto(Iterable<Reply> replys,Integer replytype,Integer replytypeId,Integer userId){
		List<ReplyDto> dtolist=new ArrayList<ReplyDto>();
		for(Reply r:replys) {
			ReplyDto dto=new ReplyDto();
			dto.setReplytype(replytype);
			dto.setReplytypeId(replytypeId);
			dto.setReplyId(r.getReplyId());
			dto.setFinallyPhoto(r.getFinallyPhoto());
			dto.setMessage(r.getMessage());
			dto.setUsersId(userId);
			Optional<Users> optional = uDao.findById(userId);
			Users user = optional.get();
			dto.setUserName(user.getUserName());
			dto.setUserPhoto(user.getUserPhoto());	
			
		}
		return dtolist;
	} 
	
}
