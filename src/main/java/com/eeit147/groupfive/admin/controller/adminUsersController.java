package com.eeit147.groupfive.admin.controller;



import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.eeit147.groupfive.admin.service.adminUsersService;
import com.eeit147.groupfive.users.model.Report;
import com.eeit147.groupfive.users.model.ReportDao;
import com.eeit147.groupfive.users.model.Users;
import com.eeit147.groupfive.users.model.UsersDao;

@Controller
public class adminUsersController {
	@Autowired
	private adminUsersService aService;
	@Autowired
	private UsersDao uDao;
	
	@Autowired
	private ReportDao rDao;
	
	
	//編輯使用者
	@PostMapping("/editAdminUsers")
	public String editAdminUsers(@RequestParam("userId") Integer userid,@RequestParam("userName") String username, @RequestParam("email") String email,
			@RequestParam("password") String password, @RequestParam("permission") Integer permission,
			//@RequestParam("user_photo")MultipartFile file,
			Model model){
		
		String photopath= "";
		Users au = new Users();
		au.setUserId(userid);
		au.setUserName(username);
		au.setEmail(email);
		au.setPassword(password);
		au.setPermission(permission);
//		au.setUserPhoto(photopath);
		
		aService.insertUser(au);
		model.addAttribute("allUsers",uDao.findAll() );
		
		return "test/showAllUsers";
	}
	
	@GetMapping("/deleteUser/{userId}")
	public String deleteUser(@PathVariable Integer userId) {
		aService.deleteUser(userId);
		return "redirect:/showAllUsers";
	}
	//列出所有檢舉資料在網頁上面(Ajax-JSON)
	@GetMapping("/adminReplyReport")
	public @ResponseBody  List<Report> reportList() {
		List<Report> rList = rDao.findAll();
		return rList ;
		
	}
	//還沒寫完先睡覺 
	@GetMapping("/adminReplyReportToSendMail")
	public String reportToSendMail(@RequestParam("report_id") Integer  report_id ){
		Optional<Users> user = uDao.findById(report_id);
		user.get().getEmail();
		user.get().getUserId();
		rDao.findById(report_id);
		
		System.out.println("==========================----------------------------");
		return "";
	}
		
}





