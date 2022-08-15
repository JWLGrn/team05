package com.eeit147.groupfive.users.controller;


import java.io.File;
import java.util.HashMap;
import java.util.List;
import java.util.Optional;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.multipart.MultipartFile;

import com.eeit147.groupfive.recipe.model.Recipe;
import com.eeit147.groupfive.recipe.model.RecipeDao;
import com.eeit147.groupfive.recipe.service.RecipeService;
import com.eeit147.groupfive.users.model.Favorite;
import com.eeit147.groupfive.users.model.FavoriteDao;
import com.eeit147.groupfive.users.model.Follow;
import com.eeit147.groupfive.users.model.FollowDao;
import com.eeit147.groupfive.users.model.Users;
import com.eeit147.groupfive.users.model.UsersDao;
import com.eeit147.groupfive.users.service.UsersService;

@Controller
@SessionAttributes({"loginUser","result"})
public class UsersController {
	@Autowired
	private UsersService UService;
	
	@Autowired
	private RecipeDao rDao;
	
	@Autowired
	private UsersDao uDao;
	
	@Autowired
<<<<<<< HEAD
	private FavoriteDao fDao;
=======
	private FollowDao flDao;
>>>>>>> 79c4db2a94b6c8f05fbe1edd3b8d1bb4b72b77ec
	
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
		Optional<Users> Optional = uDao.findById(user_id);
		Users getUser = Optional.get();
		System.out.println(getUser);
		model.addAttribute("getUser", getUser);
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
	
	// 抓取recipe and userid 案讚關聯
		@GetMapping("/favorite")
		public  String  favorite(@RequestParam("recipe_id") Integer recipe_id,@RequestParam("user_id") Integer user_id,Model model) {
			Optional<Recipe> optional = rDao.findById(recipe_id);
			Recipe recipe = optional.get();
			Optional<Users> optional02 = uDao.findById(user_id);
			 Users usering = optional02.get();	
                  boolean exist = fDao.existsByUsersAndRecipe(usering, recipe);
                  Favorite favorite = new Favorite(usering, recipe);
                  String url ="";
		
                  if(exist) {			
                	  fDao.deleteByUsersAndRecipe(usering, recipe);
                	  model.addAttribute("exist", exist);
                	  System.out.println(favorite+"===============================test=====================================");  				
      			}else {    				
      				fDao.save(favorite);
      				model.addAttribute("exist", exist);
      				 System.out.println(favorite+"==============================test======================================");     					
      			}
                  return "SuccessUser";
                  }
		//Ajax抓取全部recipe資料
		@GetMapping("/finder")
		public @ResponseBody  List<Recipe>  findRecipe( Model model) {
			List<Recipe> rList = rDao.findAll();
			return rList;
			
		}
		@PostMapping("/association/{userid}/{trackid}")
		public void followAssociation(@PathVariable("userid")Integer userid,
						   @PathVariable("trackid")Integer trackid) {
				Users user = UService.findUsersById(userid);
				Users track = UService.findUsersById(trackid);
				//確認關聯是否存在
				Boolean isAssociation = flDao.existsByUsersAndTrack(user, track);
				if(isAssociation) {
					//如果存在關聯 那刪除 = 取消追蹤
					flDao.deleteByUsersAndTrack(user, track);
				}else {
					//如果不存在 那新增 = 我要追蹤
					Follow follow = new Follow(user, track);
					flDao.save(follow);
				}
		}
	
	

}
