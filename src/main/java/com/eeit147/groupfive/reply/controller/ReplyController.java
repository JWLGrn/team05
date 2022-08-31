package com.eeit147.groupfive.reply.controller;

import java.util.List;
import java.util.Optional;
import java.util.ArrayList;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.eeit147.groupfive.reply.service.ReplyService;
import com.eeit147.groupfive.users.model.Reply;
import com.eeit147.groupfive.users.model.ReplyDao;
import com.eeit147.groupfive.users.model.ReplyDto;
import com.eeit147.groupfive.users.model.Users;


@Controller
@SessionAttributes("loginUser")
public class ReplyController {
	@Autowired
	private ReplyService rpService;
	@Autowired
	private ReplyDao rpDao;
	
//	//測試
//	
//	Integer userId;
//	Integer replytype=1;//1為recipe,2為posts(有posts前端設定2)
//	Integer replytypeId=2; //recipeId或postsId
//	Integer replyId=9; //recipeId或postsId
//	
//	
//	@GetMapping("/reply/page")
//	public String replyPage(Model m){
//		if((Users)m.getAttribute("loginUser")!=null) {
//			Users user=(Users)m.getAttribute("loginUser");
//		    userId=user.getUserId();
//		}else {
//			userId=0;
//		}
//		m.addAttribute("replytype", replytype);
//		m.addAttribute("replytypeId", replytypeId);
//		m.addAttribute("usersId",userId);
//		m.addAttribute("replyId",replyId);
//		return "reply";
//	}
	
	// 顯示食譜全部留言
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
		Users user=(Users)m.getAttribute("loginUser");
		if(user == null) {
			return new ArrayList<Reply>();
		}
		List<Reply> allReply = rpService.insertReply(replydto,user);
		return allReply;
	}
	
	// 修改留言
	@ResponseBody
	@PostMapping(value="/reply/update", produces = { "application/json; charset=UTF-8" })
	public Reply replyUpdate(@RequestBody Integer replyId, Model m){
		Optional<Reply> r=rpDao.findById(replyId);
		Reply reply=r.get();
		return reply;
	}
	
	// 刪除留言
	@ResponseBody
	@GetMapping("/reply/delete/{replyId}")
	public void replyDelete(@PathVariable("replyId") Integer replyId){
		rpDao.deleteById(replyId);

	}
}
