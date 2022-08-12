package com.eeit147.groupfive.users.controller;


import java.io.File;
import java.util.HashMap;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.multipart.MultipartFile;

import com.eeit147.groupfive.recipe.model.Recipe;
import com.eeit147.groupfive.users.model.Favorite;
import com.eeit147.groupfive.users.model.Users;
import com.eeit147.groupfive.users.service.UsersService;

@Controller
@SessionAttributes({"loginUser","result"})
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
	//會員執行登入 判斷帳號密碼 
	@PostMapping("/user/login.controller")
	public String checkLogin(HttpSession session,@ModelAttribute("login")Users user,Model m) {
		HashMap<String, String> msg = new HashMap<String,String>();	
		Users loginUser = UService.findUsersByEmailandPassword(user.getEmail(), user.getPassword());
		
		if(loginUser == null) {
			msg.put("loginfail", "帳號密碼錯誤，請輸入正確的帳號密碼");
		}
		if(msg.isEmpty()) {
			session.setAttribute("loginUser", loginUser);
			return "test/loginSuccess";
		}
		m.addAttribute("msg" , msg);
		return "test/login";
	}
	//會員登出
	@GetMapping("/users/logout")
	public String logout(HttpSession session) {
		session.invalidate();
		return "redirect:/user/login";
	}
	//會員註冊
	@PostMapping("/insertUser")
	public String InsertUser(@RequestParam("user_name") String user_name, 
							@RequestParam("email") String email,
							@RequestParam("password") String password, 
							@RequestParam("permission") Integer permission,
							@RequestParam("user_photo")MultipartFile file,
							Model model) {
		String photoName = file.getOriginalFilename();
		String photopath= "";
		//註冊會員的email.密碼
		Users newuser = new Users();
		newuser.setUserName(user_name);
		newuser.setEmail(email);
		newuser.setPassword(password);
		newuser.setPermission(permission);
		newuser.setUserPhoto(photopath);
		Users user = UService.insertUser(newuser);
		//取得註冊User的id 將User上傳的圖片命名成
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
		
	//判斷是否有重複的email
	@PostMapping("/users/checkmail")
	public @ResponseBody String checkEmailIsNotRepeat(@RequestParam("email")String email) {
		System.out.println(email + "email");
		boolean checkMail = UService.findByEmailCheckIsNotRepeat(email);	
		//判斷 如為true 表示資料庫沒有重複的帳號
		if(checkMail) {
			return "0";
		}
		return "1";
	}
	
	//抓取資料會員資料
	@GetMapping("/users/updatemember")
	public String updateMemberDetail( @RequestParam("user_id") Integer user_id,Model model) {
		Users GetOneUser = (Users)model.getAttribute("result");
		model.getAttribute("loginUser");
		model.addAttribute("GetOneUser", GetOneUser);
		return "updatemember";
		
		
	}
	//更改會員資料
	@PostMapping("/users/updateMember02")
	public String UpdateUser( @RequestParam("user_id") Integer user_id,@RequestParam("user_name") String user_name, @RequestParam("email") String email,
			@RequestParam("password") String password, @RequestParam("permission") Integer permission,@RequestParam("user_photo")MultipartFile file,
			Model model) {
		String photoName = file.getOriginalFilename();
		String photopath= "";
		//註冊會員的email.密碼
		Users updateUser = new Users();
		updateUser.setUserId(user_id);
		updateUser.setUserName(user_name);
		updateUser.setEmail(email);
		updateUser.setPassword(password);
		updateUser.setPermission(permission);
		updateUser.setUserPhoto(photopath);
		Users user = UService.insertUser(updateUser);
		//取得註冊User的id 將User上傳的圖片命名成
		Integer userId = user.getUserId();
		user.setUserPhoto(userId + ".jpeg");
		Users updateUserResult = UService.insertUser(user);
		try {
		file.transferTo(new File("C:\\Git\\Project\\team05\\src\\main\\webapp\\image\\users\\" + userId+ ".jpeg"));
		} catch (Exception e) {
			e.printStackTrace();
		}
		System.out.println(updateUser);

		model.addAttribute("updateUserResult", updateUserResult);
		return "updatesuccess";
	}
	
	//測試Ajax
		@GetMapping("/heart")
		public String favorite(Favorite favorite) {
			Recipe recipe = new Recipe();
			
//			favorite.setUsers(recipe.getFavorite());
			
			return "SuccessUser";
		}
	
	
	

}
