package com.eeit147.groupfive.reply.controller;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RequestPart;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.eeit147.groupfive.reply.service.PostsService;
import com.eeit147.groupfive.reply.service.ReplyService;
import com.eeit147.groupfive.users.model.Posts;
import com.eeit147.groupfive.users.model.Reply;
import com.eeit147.groupfive.users.model.Users;
import com.eeit147.groupfive.users.model.UsersDao;

@Controller
public class PostsController {

	@Autowired
	private PostsService pService;
	
	@Autowired
	private ReplyService rService;
	
	@Autowired
	private UsersDao uDao;
	
	// 新增文章
	@RequestMapping(value = "/posts/insert", method = RequestMethod.POST, consumes = { "multipart/form-data" })
	@ResponseBody
	public Integer addPosts(@RequestPart("posts")Posts posts,@RequestPart("photo")MultipartFile photo,Model m) {
		Posts newPost = pService.addPost(posts, photo);
		return newPost.getPostsId();
	}
	
	// 查看單一文章
	@GetMapping("/posts/find/{postsId}")
	public String singlePosts(@PathVariable("postsId")Integer postsId,Model m) {
		Posts post = pService.findPostById(postsId);
		if(post != null) {
			m.addAttribute("posts", post);
			return "singlepost";
		}
		return "";
	}

	// 查看文章列表(分頁)
	@GetMapping("/posts/find/all")
	public String allPosts(@RequestParam(name="p",defaultValue = "1") Integer pageNumber,Model m) {
		Page<Posts> postsPage = pService.findAllByPage(pageNumber);
		m.addAttribute("postsPage", postsPage);
		return "postslist";
	}

	// 刪除文章
	@GetMapping("/posts/delete/{postsId}")
	public String deletePost(@PathVariable("postsId")Integer postsId) {
		pService.deletePost(postsId);
		return "redirect:/posts/find/all";
	}
	
	// 修改文章頁面
	@GetMapping("/posts/update/{postsId}")
	public String updatePostPage(@PathVariable("postsId")Integer postsId,Model m) {
		Posts post = pService.findPostById(postsId);
		m.addAttribute("post", post);
		return "updatepost";
	}
	
	// 修改文章
	@RequestMapping(value = "/posts/update", method = RequestMethod.POST, consumes = { "multipart/form-data" })
	@ResponseBody
	public Integer updatePost(@RequestPart("posts")Posts posts,@RequestPart(name="photo",required=false)MultipartFile photo,Model m) {
		Posts updatePost = pService.updatePost(posts, photo);
		return updatePost.getPostsId();
	}
	
	// 回覆文章
	@PostMapping("/posts/reply/insert")
	public String insertReply(String message,Integer postsId) {
		System.out.println("message:"+message+"postsId"+postsId);
		Integer userId=1;
		Optional<Users> op = uDao.findById(userId);
		Users user = op.get();
		
		Posts post = pService.findPostById(postsId);
		
		Reply reply = new Reply();
		reply.setMessage(message);
		reply.setPosts(post);
		reply.setUsers(user);
		Reply reply2 = rService.insertReply(reply);
		return "redirect:/posts/reply/all";
	}
	
	// 顯示所有留言
	@GetMapping("/posts/reply/all")
	@ResponseBody
	public List<Reply> findAllReply(){
		List<Reply> replys = rService.findAllReply();
		return replys;
	}
	
	// 查看最新文章
	@GetMapping("/posts/find/lastest")
	@ResponseBody
	public List<Posts> findLatestPosts(){
		List<Posts> posts = pService.findLatestPosts();
		return posts;
	}
	
	// 最新文章
}
