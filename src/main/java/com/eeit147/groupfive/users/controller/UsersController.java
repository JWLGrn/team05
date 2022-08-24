package com.eeit147.groupfive.users.controller;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Optional;
import java.util.Set;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.web.server.Cookie;
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
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;
import org.springframework.web.multipart.MultipartFile;

import com.eeit147.groupfive.recipe.model.Recipe;
import com.eeit147.groupfive.recipe.model.RecipeDao;
import com.eeit147.groupfive.users.model.Collect;
import com.eeit147.groupfive.users.model.Favorite;
import com.eeit147.groupfive.users.model.FavoriteDao;
import com.eeit147.groupfive.users.model.Follow;
import com.eeit147.groupfive.users.model.FollowDao;
import com.eeit147.groupfive.users.model.Report;
import com.eeit147.groupfive.users.model.ReportDao;
import com.eeit147.groupfive.users.model.Users;
import com.eeit147.groupfive.users.model.UsersDao;
import com.eeit147.groupfive.users.service.CollectService;
import com.eeit147.groupfive.users.service.FollowService;
import com.eeit147.groupfive.users.service.UsersService;

@Controller
//@SessionAttributes({ "loginUser", "result","updateUserResult" })
public class UsersController {
	@Autowired
	private UsersService UService;
	@Autowired
	private RecipeDao rDao;
	@Autowired
	private UsersDao uDao;
	@Autowired
	private FavoriteDao fDao;
	@Autowired
	private FollowDao flDao;
	@Autowired
	private ReportDao rpDao;
	@Autowired
	private FollowService flService;
	@Autowired
	private CollectService cService;

	// 載入登入頁面
	@GetMapping("/user/login")
	public String login(Model m) {
		Users u = new Users();
		m.addAttribute("login", u);
		return "test/login";
	}
	// 會員執行登入 判斷帳號密碼
	@PostMapping("/user/login.controller")
	public String checkLogin(HttpSession session, @ModelAttribute Users user, Model m) {
		HashMap<String, String> msg = new HashMap<String, String>();
		Users loginUser = UService.findUsersByEmailandPassword(user.getEmail(), user.getPassword());
		if (loginUser == null) {
			msg.put("loginfail", "帳號密碼錯誤，請輸入正確的帳號密碼");
			m.addAttribute("msg", msg);
			return "redirect:/user/login";
		}		
		//Users userid = UService.findUsersById(loginUser.getUserId());
		System.out.println(loginUser.getUserId());
		Integer permission = loginUser.getPermission();
	
		if (msg.isEmpty()) {
			session.setAttribute("loginUser", loginUser);
			if(permission == 1) {
				return "index";
			}else if(permission == 2) {
				return "admin";
			}		
		}
		return "redirect:/user/login";
	}

	// 會員登出
	@GetMapping("/users/logout")
	public String logout(HttpSession session) {
		session.invalidate();
		new Cookie();
		return "redirect:/user/login";
		//要把 logout按鈕隱藏起來!!!!!!!!!!!!!!!!!!!!!!!
	}

	// 會員註冊
	@PostMapping("/insertUser")
	public String InsertUser(@RequestParam("user_name") String user_name, 	
							 @RequestParam("email") String email,
							 @RequestParam("password") String password, 
							 @RequestParam("permission") Integer permission,
							 @RequestParam("user_photo") MultipartFile file, 
							 Model model) {
		String photoName = file.getOriginalFilename();
		String photopath = "";
		// 註冊會員的email.密碼
		Users newuser = new Users();
		newuser.setUserName(user_name);
		newuser.setEmail(email);
		newuser.setPassword(password);
		newuser.setPermission(permission);
		newuser.setUserPhoto(photopath);
		Users user = UService.insertUser(newuser);
		// 取得註冊User的id 將User上傳的圖片命名成
		Integer userId = user.getUserId();
		user.setUserPhoto(userId + ".jpeg");
		Users result = UService.insertUser(user);
		try {
			file.transferTo(new File("C:\\Git\\Project\\team05\\src\\main\\webapp\\image\\users\\" + userId + ".jpeg"));
		} catch (Exception e) {
			e.printStackTrace();
		}
		System.out.println(newuser);

		model.addAttribute("result", result);
		if(permission ==1) {
			return "redirect:/user/login";

		} else if (permission ==2){
			//管理者頁面!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
			return "admin";
		}
		return "redirect:/user/login";
	}

	// 判斷是否有重複的email
	@PostMapping("/users/checkmail")
	public @ResponseBody String checkEmailIsNotRepeat(@RequestParam("email") String email) {
		System.out.println(email + "email");
		boolean checkMail = UService.findByEmailCheckIsNotRepeat(email);
		// 判斷 如為true 表示資料庫沒有重複的帳號
		if (checkMail) {
			return "0";
		}
		return "1";
	}

	// 抓取資料會員資料
	@GetMapping("/users/updatemember")
	public String updateMemberDetail(@RequestParam("user_id") Integer user_id, Model model) {
		Optional<Users> Optional = uDao.findById(user_id);
		Users getUser = Optional.get();
		System.out.println(getUser);
		model.addAttribute("getUser", getUser);
		return "updatemember";

	}

	// 更改會員資料
	@PostMapping("/users/updateMember02")
	public String UpdateUser(@RequestParam("user_id") Integer user_id, 
							 @RequestParam("user_name") String user_name,
							 @RequestParam("email") String email, 
							 @RequestParam("password") String password,
							 @RequestParam("permission") Integer permission, 
							 @RequestParam("user_photo") MultipartFile file,
							 Model model) {
		String photoName = file.getOriginalFilename();
		String photopath = "";
		// 註冊會員的email.密碼
		Users updateUser = new Users();
		updateUser.setUserId(user_id);
		updateUser.setUserName(user_name);
		updateUser.setEmail(email);
		updateUser.setPassword(password);
		updateUser.setPermission(permission);
		updateUser.setUserPhoto(photopath);
		Users user = UService.insertUser(updateUser);
		// 取得註冊User的id 將User上傳的圖片命名成
		Integer userId = user.getUserId();
		user.setUserPhoto(userId + ".jpeg");
		Users updateUserResult = UService.insertUser(user);
		try {
			file.transferTo(new File("C:\\Git\\Project\\team05\\src\\main\\webapp\\image\\users\\" + userId + ".jpeg"));
		} catch (Exception e) {
			e.printStackTrace();
		}
		System.out.println(updateUser);

		model.addAttribute("updateUserResult", updateUserResult);
		return "SuccessUser";
	}

	// 抓取recipe and userid 案讚關聯
	@GetMapping("/favorite")
	public String favorite(@RequestParam("recipe_id") Integer recipe_id, 
						   @RequestParam("user_id") Integer user_id,
						   Model model) {
		Optional<Recipe> optional = rDao.findById(recipe_id);
		Recipe recipe = optional.get();
		Optional<Users> optional02 = uDao.findById(user_id);
		Users usering = optional02.get();
		boolean exist = fDao.existsByUsersAndRecipe(usering, recipe);
		Favorite favorite = new Favorite(usering, recipe);
		String url = "";

		if (exist) {
			fDao.deleteByUsersAndRecipe(usering, recipe);
			model.addAttribute("exist", exist);
		} else {
			fDao.save(favorite);
			model.addAttribute("exist", exist);
		}
		return "SuccessUser";
	}

	// Ajax抓取全部recipe資料
	@GetMapping("/finder")
	public @ResponseBody List<Recipe> findRecipe(Model model) {
		List<Recipe> rList = rDao.findAll();
		return rList;

	}


	// Ajax找到所有使用者
	@GetMapping("/findUsers")
	public @ResponseBody List<Users> findUsers() {
		List<Users> uList = uDao.findAll();
		return uList;
	}

	// 抓取檢舉者ID和被檢舉者ID，導入檢舉表單，填寫資料。
	@GetMapping("/users/report")
	public String usersReport(@RequestParam("user_id") Integer user_id, Model model) {
		Users usering = (Users) model.getAttribute("result");
		Optional<Users> authorUser = uDao.findById(user_id);
		Users getAuthorUser = authorUser.get();
		model.addAttribute("getAuthorUser", getAuthorUser);
		model.addAttribute("usering", usering);
        
		Date date = new Date();
		model.addAttribute("date", date);

		return "test/usersreport";
	}

	@GetMapping("/users/reportSuccess")
	public String userReportSuccess(@RequestParam("getAuthorUser") Integer getAuthorUser,
									@RequestParam("usering") Integer usering, 
									@RequestParam("reportTime") Date reportTime,
									@RequestParam("reportType") String reportType, 
									@RequestParam("reportContext") String reportContext,
									Model model) {
		System.out.println(getAuthorUser + "被檢舉者1");
		System.out.println(usering + "檢舉者1");
		// 使用者查詢
		Users user = (Users) model.getAttribute("result");
		Integer getUserId = user.getUserId();
		// 被檢舉者查詢
		Optional<Users> Optional = uDao.findById(getAuthorUser);
		Users reportUser = Optional.get();
		Integer reportUserId = reportUser.getUserId();
		Report report = new Report();
		if ((getUserId != 0 && reportUserId != 0)) {

			report.setUsers(reportUser);
			report.setReportContext(reportContext);
			report.setReportType(reportType);
			rpDao.save(report);
			System.out.println(getAuthorUser + "被檢舉者");
			System.out.println(usering + "檢舉者");

		} else {
			return null;
		}
		model.addAttribute("report", report);
		return "SuccessUser";
	}
	
	// 追蹤 + 取消追蹤
	@PostMapping("/associationfollow/{userid}/{trackid}")
	@ResponseBody
	public void followAssociation(@PathVariable("userid") Integer userid, 
								  @PathVariable("trackid") Integer trackid) {
		Users user = UService.findUsersById(userid);
		Users track = UService.findUsersById(trackid);
		// 確認關聯是否存在
		boolean isAssociation = flService.existsByUsersAndTrack(user, track);
		if (isAssociation) {
			// 如果存在關聯 那刪除 = 取消追蹤
			flService.deleteByUsersAndTrack(user, track);
		} else {
			// 如果不存在 那新增 = 追蹤
			Follow follow = new Follow(user, track);
			flService.saveUserandTrack(follow);
		}
	}
	// 追蹤功能的圖片顯示(確認是否有關聯 → 顯示不同圖片)
	@GetMapping("/imagefollow/{usersid}/{trackid}")
	public @ResponseBody ResponseEntity<byte[]> imageFollow(@PathVariable("usersid") Integer userid,
															@PathVariable("trackid") Integer trackid) throws IOException {
		// 取得user bean 拿到user and track
		Users user = UService.findUsersById(userid);
		Users track = UService.findUsersById(trackid);
		// 確認關聯是否存在
		boolean isAssociation = flService.existsByUsersAndTrack(user, track);
		
		// 設定標頭
		HttpHeaders header = new HttpHeaders();
		header.setContentType(MediaType.IMAGE_PNG);
		
		// 判斷有無關聯 → 顯示不同圖片
		if (isAssociation) {
			FileInputStream input = new FileInputStream(new File("C:\\Git\\Project\\team05\\src\\main\\webapp\\image\\follow.png"));
			byte[] bytes = input.readAllBytes();
			input.close();
			return new ResponseEntity<byte[]>(bytes, header, HttpStatus.OK);
		} else {
			FileInputStream input = new FileInputStream(new File("C:\\Git\\Project\\team05\\src\\main\\webapp\\image\\nofollow.png"));
			byte[] bytes = input.readAllBytes();
			input.close();
			return new ResponseEntity<byte[]>(bytes, header, HttpStatus.OK);
		}
	}
	//收藏 + 取消收藏	
	@PostMapping("/collectaction/{userid}/{recipeid}")
	@ResponseBody
	public void collectAction(@PathVariable("userid")Integer userid,
							  @PathVariable("recipeid")Integer recipeid) {
		//取得Userid
		Users user = cService.findByUserId(userid);
		//取得recipeid
		Recipe recipe = cService.findByRecipeId(recipeid);
		System.out.println(user + "==================================================================================");
		System.out.println(recipe + "==================================================================================");
		
		//判斷是否存在關聯
		Boolean isExisit = cService.exisitByUsersAndRecipe(user, recipe);
		
		if(isExisit) {
			//true -> 有關聯 -> 取消收藏 -> 刪除
			cService.deleteByUserAndRecipe(user, recipe);
		}else {
			//false-> 無關聯 -> 無收藏 -> 新增
			Collect collect = new Collect(recipe,user);
			cService.saveUserandRecipe(collect);
		}
	}
	//收藏的圖示
	@GetMapping("/imagecollect/{usersid}/{recipeid}")
	public @ResponseBody ResponseEntity<byte[]> imageCollect(@PathVariable("usersid") Integer userid,
															 @PathVariable("recipeid") Integer recipeid) throws IOException {
		// 取得user bean 拿到user and track
		Users user = cService.findByUserId(userid);
		Recipe recipe = cService.findByRecipeId(recipeid);
		
		// 確認關聯是否存在
		Boolean isExisit = cService.exisitByUsersAndRecipe(user, recipe);
		// 設定標頭
		HttpHeaders header = new HttpHeaders();
		header.setContentType(MediaType.IMAGE_PNG);
		
		// 判斷有無關聯 → 顯示不同圖片
		if (isExisit) {
			FileInputStream input = new FileInputStream(new File("C:\\Git\\Project\\team05\\src\\main\\webapp\\image\\collect.png"));
			byte[] bytes = input.readAllBytes();
			input.close();
			ResponseEntity<byte[]> re = new ResponseEntity<byte[]>(bytes, header, HttpStatus.OK);
			return re;
		} else {
			FileInputStream input = new FileInputStream(new File("C:\\Git\\Project\\team05\\src\\main\\webapp\\image\\nocollect.png"));
			byte[] bytes = input.readAllBytes();
			input.close();
			ResponseEntity<byte[]> re = new ResponseEntity<byte[]>(bytes, header, HttpStatus.OK);
			return re;
		}
	}
	//查詢追蹤使用者的頁面
	@GetMapping("/follow.personal.controller")
	public @ResponseBody List<Follow> findByUsers(Model m) {
		Users session = (Users)m.getAttribute("loginUser");
		List<Follow> follow = flService.findByUsers(session);
//		m.addAttribute("follow", follow);
		return follow;
	}
	@GetMapping("/collect.personal.controller")
	public  String findCollectByUsers(Model m){
		Users session = (Users)m.getAttribute("loginUser");
		List<Collect> collect = cService.findCollectByUsers(session);
		m.addAttribute("collect", collect);
		return "test/collectpage";
	}
}
