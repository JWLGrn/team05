package com.eeit147.groupfive.users.controller;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Optional;

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
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.eeit147.groupfive.recipe.model.Recipe;
import com.eeit147.groupfive.recipe.model.RecipeDao;
import com.eeit147.groupfive.recipe.model.RecipeDto;
import com.eeit147.groupfive.recipe.service.RecipeService;
import com.eeit147.groupfive.users.model.Collect;
import com.eeit147.groupfive.users.model.Favorite;
import com.eeit147.groupfive.users.model.FavoriteDao;
import com.eeit147.groupfive.users.model.Follow;
import com.eeit147.groupfive.users.model.FollowDao;
import com.eeit147.groupfive.users.model.FollowDto;
import com.eeit147.groupfive.users.model.Report;
import com.eeit147.groupfive.users.model.ReportDao;
import com.eeit147.groupfive.users.model.Users;
import com.eeit147.groupfive.users.model.UsersDao;
import com.eeit147.groupfive.users.service.CollectService;
import com.eeit147.groupfive.users.service.FollowService;
import com.eeit147.groupfive.users.service.UsersService;

@Controller
@SessionAttributes({ "loginUser", "result","updateUserResult" })
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
	@Autowired
	private RecipeService rService;

	// ??????????????????
	@GetMapping("/user/login")
	public String login(Model m) {
		Users u = new Users();
		m.addAttribute("login", u);
		return "login/login";
	}

	// ?????????????????? ??????????????????
	@PostMapping("/user/login.controller")
	public String checkLogin(HttpSession session,SessionStatus out, @ModelAttribute Users user, Model m,RedirectAttributes redirectAttributes) {
		HashMap<String, String> msg = new HashMap<String, String>();
		Users loginUser = UService.findUsersByEmailandPassword(user.getEmail(), user.getPassword());
		if (loginUser == null) {
			redirectAttributes.addFlashAttribute("message", "<span class='typcn typcn-warning-outline' style='font-size:25px;'>&nbsp;</span>???????????????????????????????????????????????????");
			return "redirect:/user/login";
		}		
		//Users userid = UService.findUsersById(loginUser.getUserId());
		System.out.println(loginUser.getUserId());
		Integer permission = loginUser.getPermission();
			if(permission==0) {
				redirectAttributes.addFlashAttribute("message", "<span class='typcn typcn-warning-outline' style='font-size:25px;'>&nbsp;</span>????????????????????????????????????");
				out.isComplete();
				return "redirect:/user/login";
			}
		if (msg.isEmpty()) {
			session.setMaxInactiveInterval(10*60);
			session.setAttribute("loginUser", loginUser);
			if(permission == 1) {
				return "index";
			}else if(permission == 2) {
				return "index";
			}
		}
		return "redirect:/user/login";
	}

	// ????????????
	@GetMapping("/users/logout")
	public String logout(HttpSession session, SessionStatus sessionStatus) {
		if(session.getAttribute("loginUser") != null){
			session.removeAttribute("loginUser");
			sessionStatus.setComplete();
		}
		
		return "redirect:/user/login";
	}

	// ????????????
	@PostMapping("/insertUser")
	public String InsertUser(@RequestParam("user_name") String user_name, 	
							 @RequestParam("email") String email,
							 @RequestParam("password") String password, 
							 @RequestParam("permission") Integer permission,
							 @RequestParam("user_photo") MultipartFile file, 
							 Model model,HttpSession session
							 ) {
		String photoName = file.getOriginalFilename();
		String photopath = "";
		// ???????????????email.??????
		Users newuser = new Users();
		newuser.setUserName(user_name);
		newuser.setEmail(email);
		newuser.setPassword(password);
		newuser.setPermission(permission);
		newuser.setUserPhoto(photopath);
		Users user = UService.insertUser(newuser);
		// ????????????User???id ???User????????????????????????
		Integer userId = user.getUserId();
		user.setUserPhoto(userId + ".jpeg");
		Users result = UService.insertUser(user);
		System.out.println(result);
		if(!file.isEmpty()) {
				try {
					//??????????????????????????? ????????????userid.jpeg
					file.transferTo(new File("C:\\Git\\Project\\team05\\src\\main\\webapp\\image\\users\\" + userId + ".jpeg"));
				} catch (Exception e) {
					e.printStackTrace();
				}
		}else {
			try {
				//???????????????????????????????????????
				InputStream fis = new FileInputStream(new File("C:\\Git\\Project\\team05\\src\\main\\webapp\\image\\user.png"));
				OutputStream fos = new FileOutputStream(new File("C:\\Git\\Project\\team05\\src\\main\\webapp\\image\\users\\" + userId + ".jpeg"));
				fos.write(fis.readAllBytes());
				fos.flush();
				fos.close();
				fis.close();
				} catch (Exception e) {
				e.printStackTrace();
				}
		}
		
		System.out.println(newuser);

//		model.addAttribute("loginUser", result);
//		if(permission ==1) {
//
//			return "redirect:/user/login";
//
//		} else if (permission ==2){
//			return "test/adminIndex";
//		}
		return "redirect:/user/login";
	}

	// ????????????????????????email
	@PostMapping("/users/checkmail")
	public @ResponseBody String checkEmailIsNotRepeat(@RequestParam("email") String email) {
		System.out.println(email + "email");
		boolean checkMail = UService.findByEmailCheckIsNotRepeat(email);
		// ?????? ??????true ????????????????????????????????????
		if (checkMail) {
			return "0";
		}
		return "1";
	}

	// ??????????????????
	@GetMapping("/users/updatemember")
	public String updateMemberDetail(@RequestParam("user_id") Integer user_id, Model model) {
		Optional<Users> Optional = uDao.findById(user_id);
		Users getUser = Optional.get();
		System.out.println(getUser);
		model.addAttribute("loginUser", getUser);
		return "user/updatemember";

	}

	// ??????????????????
	@PostMapping("/users/updateMember02")
	public String UpdateUser(@RequestParam("user_id") Integer user_id, 
							 @RequestParam("user_name") String user_name,
							 @RequestParam("email") String email, 
							 @RequestParam("password") String password,
							 @RequestParam("user_photo") MultipartFile file,
							 Model model,RedirectAttributes rAttr) {
		String photoName = file.getOriginalFilename();
		String photopath = "";
		// ???????????????email.??????
		Users updateUser = UService.findOneUserById(user_id);
		updateUser.setUserId(user_id);
		updateUser.setUserName(user_name);
		updateUser.setEmail(email);
		updateUser.setPassword(password);
		updateUser.setUserPhoto(photopath);
		Users user = UService.insertUser(updateUser);
		// ????????????User???id ???User????????????????????????
		Integer userId = user.getUserId();
		user.setUserPhoto(userId + ".jpeg");
		Users updateUserResult = UService.insertUser(user);
		if(!file.isEmpty()) {
			try {
			file.transferTo(new File("C:\\Git\\Project\\team05\\src\\main\\webapp\\image\\users\\" + userId + ".jpeg"));
			} catch (Exception e) {
			e.printStackTrace();
			}
		}
		
		System.out.println(updateUser);

		model.addAttribute("loginUser", updateUserResult);
		rAttr.addFlashAttribute("msg", "<span class='icon mu txt-24 mu-pass'></span> ???????????????");
		return "redirect:/users/updatemember?user_id="+updateUserResult.getUserId();
	}

	// ??????recipe and userid ????????????
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

	// Ajax????????????recipe??????
	@GetMapping("/finder")
	public @ResponseBody List<Recipe> findRecipe(Model model) {
		List<Recipe> rList = rDao.findAll();
		return rList;

	}


	// Ajax?????????????????????
	@GetMapping("/findUsers")
	public @ResponseBody List<Users> findUsers() {
		List<Users> uList = uDao.findAll();
		return uList;
	}

	// ???????????????ID???????????????ID???????????????????????????????????????
	@GetMapping("/users/report")
	public String usersReport(@RequestParam("user_id") Integer user_id, Model model) {
		Users usering = (Users) model.getAttribute("result");
		Optional<Users> authorUser = uDao.findById(user_id);
		Users getAuthorUser = authorUser.get();
		model.addAttribute("getAuthorUser", getAuthorUser);
		model.addAttribute("loginUser", usering);
        
		Date date = new Date();
		model.addAttribute("date", date);

		return "user/usersreport";
	}

	@GetMapping("/users/reportSuccess")
	public String userReportSuccess(@RequestParam("getAuthorUser") Integer getAuthorUser,
									@RequestParam("loginUser") Integer loginUser, 
									@RequestParam("reportTime") Date reportTime,
									@RequestParam("reportType") String reportType, 
									@RequestParam("reportContext") String reportContext,
									@RequestParam("reportStatus") String reportStatus,
									Model model) {
		
		System.out.println(getAuthorUser + "????????????");
		System.out.println(loginUser + "?????????");
		// ???????????????
//		Users user = (Users) model.getAttribute("loginUser");
		Optional<Users> Optional01 = uDao.findById(loginUser);
		Users loginUserReport = Optional01.get();
		Integer getUserId = loginUserReport.getUserId();
		// ??????????????????
		Optional<Users> Optional02 = uDao.findById(getAuthorUser);
		Users reportUser = Optional02.get();
		Integer reportUserId = reportUser.getUserId();
		Report report = new Report();
		if ((getUserId != 0 && reportUserId != 0)) {

			report.setUsers(reportUser);
			report.setReportContext(reportContext);
			report.setReportType(reportType);
			report.setReportStatus(reportStatus);
			rpDao.save(report);
			System.out.println(getAuthorUser + "????????????");
			System.out.println(loginUser + "?????????");
		

		} else {
			return null;
		}
		System.out.println(report+"============================================================");
		model.addAttribute("report", report);
		return "redirect:/";
	}
	
	// ?????? + ????????????
	@PostMapping("/associationfollow/{userid}/{trackid}")
	@ResponseBody
	public void followAssociation(@PathVariable("userid") Integer userid, 
								  @PathVariable("trackid") Integer trackid) {
		Users user = UService.findUsersById(userid);
		Users track = UService.findUsersById(trackid);
		// ????????????????????????
		boolean isAssociation = flService.existsByUsersAndTrack(user, track);
		if (isAssociation) {
			// ?????????????????? ????????? = ????????????
			flService.deleteByUsersAndTrack(user, track);
		} else {
			// ??????????????? ????????? = ??????
			Follow follow = new Follow(user, track);
			flService.saveUserandTrack(follow);
		}
	}
	// ???????????????????????????(????????????????????? ??? ??????????????????)
	@GetMapping("/imagefollow/{usersid}/{trackid}")
	public @ResponseBody ResponseEntity<byte[]> imageFollow(@PathVariable("usersid") Integer userid,
															@PathVariable("trackid") Integer trackid) throws IOException {
		// ??????user bean ??????user and track
		Users user = UService.findUsersById(userid);
		Users track = UService.findUsersById(trackid);
		// ????????????????????????
		boolean isAssociation = flService.existsByUsersAndTrack(user, track);
		
		// ????????????
		HttpHeaders header = new HttpHeaders();
		header.setContentType(MediaType.IMAGE_PNG);
		
		// ?????????????????? ??? ??????????????????
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
	//?????? + ????????????	
	@PostMapping("/collectaction/{userid}/{recipeid}")
	@ResponseBody
	public void collectAction(@PathVariable("userid")Integer userid,
							  @PathVariable("recipeid")Integer recipeid) {
		//??????Userid
		Users user = cService.findByUserId(userid);
		//??????recipeid
		Recipe recipe = cService.findByRecipeId(recipeid);
		System.out.println(user + "==================================================================================");
		System.out.println(recipe + "==================================================================================");
		
		//????????????????????????
		Boolean isExisit = cService.exisitByUsersAndRecipe(user, recipe);
		
		if(isExisit) {
			//true -> ????????? -> ???????????? -> ??????
			cService.deleteByUserAndRecipe(user, recipe);
		}else {
			//false-> ????????? -> ????????? -> ??????
			Collect collect = new Collect(recipe,user);
			cService.saveUserandRecipe(collect);
		}
	}
	//???????????????
	@GetMapping("/imagecollect/{usersid}/{recipeid}")
	public @ResponseBody ResponseEntity<byte[]> imageCollect(@PathVariable("usersid") Integer userid,
															 @PathVariable("recipeid") Integer recipeid) throws IOException {
		// ??????user bean ??????user and track
		Users user = cService.findByUserId(userid);
		Recipe recipe = cService.findByRecipeId(recipeid);
		
		// ????????????????????????
		Boolean isExisit = cService.exisitByUsersAndRecipe(user, recipe);
		// ????????????
		HttpHeaders header = new HttpHeaders();
		header.setContentType(MediaType.IMAGE_PNG);
		
		// ?????????????????? ??? ??????????????????
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
	//??????session??????????????????????????????
	@GetMapping("/follow.personal.controller")
	public @ResponseBody List<FollowDto>findByUsers(Model m) {
		Users usersession = (Users) m.getAttribute("loginUser");
		System.out.println(usersession.getUserName());
		List<FollowDto> list = flService.findByUsers(usersession);
		return list;
	}
	
	//??????session???????????????????????????
	@GetMapping("/collect.personal.controller")
	public  @ResponseBody List<RecipeDto> findCollectByUsers(Model m){
		Users session = (Users)m.getAttribute("loginUser");
		List<RecipeDto> collect = cService.findCollectByUsers(session);
//		m.addAttribute("collect", collect);
		return collect;
	}
	//??????id??????????????????????????????????????????
	@PostMapping("/user/findfollowuser/{userid}")
	@ResponseBody
	public  List<FollowDto> useridfindByFollerUsers(@PathVariable("userid")Integer id,Model m){
		Users user = UService.findUsersById(id);
		List<FollowDto> followlist = flService.findByUsers(user);
		return followlist;
	}
	//??????id?????????????????????????????????
	@PostMapping("/user/findcollectuser/{userid}")
	@ResponseBody
	public  List<RecipeDto> useridfindByCollectUsers(@PathVariable("userid")Integer id,Model m){
		Users user = UService.findUsersById(id);
		List<RecipeDto> collectlist = cService.findCollectByUsers(user);
		return collectlist;
	}
	//??????id???????????????????????????????????????
	@PostMapping("/user/findrecipeuser/{userid}")
	@ResponseBody
	public  List<Recipe> useridfindByRecipeUsers(@PathVariable("userid")Integer id,Model m) {
		Users user = UService.findUsersById(id);
		List<Recipe> recipelist = rService.findRecipeByUserId(user);
		m.addAttribute("recipe", user);
		return recipelist ;
	}
}
