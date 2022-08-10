package com.eeit147.groupfive.users.controller;


import java.io.File;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.multipart.MultipartFile;

import com.eeit147.groupfive.users.model.Users;
import com.eeit147.groupfive.users.service.UsersService;

@Controller
@SessionAttributes("loginUser")
public class UsersController {
	@Autowired
	private UsersService UService;
	
	//載入登入頁面
	@GetMapping("/user/login")
	public String login(Model m) {
		Users u = new Users();
		m.addAttribute("login", u);
		return "test/login";
	}
	//執行登入 判斷帳號密碼 
	@PostMapping("/user/login.controller")
	public String checkLogin(HttpSession session,@ModelAttribute("login")Users user,Model m) {
		HashMap<String, String> msg = new HashMap<String,String>();	
		Users loginUser = UService.findUsersByEmailandPassword(user.getEmail(), user.getPassword());
		
		if(loginUser == null) {
			msg.put("loginfail", "帳號密碼錯誤，請輸入正確的帳號密碼");
		}
		if(msg.isEmpty()) {
			session.setAttribute("loginUser", loginUser);
			return "loginSuccess";
		}
		m.addAttribute("msg" , msg);
		return "test/login";
	}
	//登出
	@GetMapping("/users/logout")
	public String logout(HttpSession session) {
		session.invalidate();
		return "redirect:/user/login";
	}
	//會員註冊
	@PostMapping("/insertUser")
	public String InsertUser(@RequestParam("user_name") String user_name, @RequestParam("email") String email,
			@RequestParam("password") String password, @RequestParam("permission") Integer permission,@RequestParam("user_photo")MultipartFile file,
			Model model) {
		String photoName = file.getOriginalFilename();
		String photopath= "";
		Users newuser = new Users();
		newuser.setUserName(user_name);
		newuser.setEmail(email);
		newuser.setPassword(password);
		newuser.setPermission(permission);
		newuser.setUserPhoto(photopath);
		Users user = UService.insertUser(newuser);
		Integer userId = user.getUserId();
		user.setUserPhoto(userId + ".jpeg");
		Users result = UService.insertUser(user);
		try {
		file.transferTo(new File("C:\\Git\\Project\\team05\\src\\main\\webapp\\image\\users\\" + userId+ ".jpeg"));
		} catch (Exception e) {
			e.printStackTrace();
		}
		System.out.println(newuser);

		model.addAttribute("result", result);
		return "SuccessUser";
	}
	
	@PostMapping("/FindAll")
	public String FindAllUsers(Integer user_id) {
		List<Users> FindUser = UService.findUsersById(user_id);
		
		return null;
	}
	public void testYang() {
		
	}
}
