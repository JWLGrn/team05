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
import org.springframework.web.bind.annotation.PathVariable;
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
	@GetMapping("recipe/reply/{recipeId}")
	public List<Reply> replyShow(@PathVariable("recipeId")Integer recipeId) {
		List<Reply> allReply=rpDao.findAllByRecipeReplyById(recipeId);
		return allReply;
	}
	
	// 新增食譜留言
	@ResponseBody
	@PostMapping(value="/reply/insert", produces = { "application/json; charset=UTF-8" })
	public List<Reply> replyInsert(@RequestBody ReplyDto replydto, Model m) throws Exception {
		List<Reply> allReply = rpService.insertReply(replydto);
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
