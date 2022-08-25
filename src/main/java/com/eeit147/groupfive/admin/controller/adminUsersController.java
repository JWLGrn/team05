package com.eeit147.groupfive.admin.controller;



import java.util.ArrayList;
import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.eeit147.groupfive.admin.service.adminUsersService;
import com.eeit147.groupfive.recipe.model.Recipe;
import com.eeit147.groupfive.recipe.model.RecipeDto;
import com.eeit147.groupfive.users.model.Report;
import com.eeit147.groupfive.users.model.ReportDao;
import com.eeit147.groupfive.users.model.Users;
import com.eeit147.groupfive.users.model.UsersDao;
import com.eeit147.groupfive.users.model.UsersDto;

@Controller
public class adminUsersController {
	@Autowired
	private adminUsersService aService;
	@Autowired
	private UsersDao uDao;
	
	@Autowired
	private ReportDao rDao;
	
	@Autowired	
	private JavaMailSender  mailSender;
	
	@Autowired
	private ReportDao rpDao;
	
	
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
	
	//使用者篩選結果編輯傳值
	@GetMapping("/editAdminUsers/{userId}/{userName}/{email}/{password}/{permission}")
	public String editAdminUsersget(@PathVariable("userId") Integer userid,@PathVariable("userName") String username, @PathVariable("email") String email,
			@PathVariable("password") String password, @PathVariable("permission") Integer permission
			//@PathVariable("user_photo")MultipartFile file,
			){
		String photopath= "";
		Users au = new Users();
		au.setUserId(userid);
		au.setUserName(username);
		au.setEmail(email);
		au.setPassword(password);
		au.setPermission(permission);
//		au.setUserPhoto(photopath);
		
		aService.insertUser(au);
		
		return "redirect:/showAllUsers";
	}
	
	//刪除使用者
	@GetMapping("/deleteUser/{userId}")
	public String deleteUser(@PathVariable Integer userId) {
		aService.deleteUser(userId);
		return "redirect:/showAllUsers";
	}
	//列出所有檢舉資料在網頁上面(非同步Ajax-JSON)
	@GetMapping("/adminReplyReport")
	public @ResponseBody  List<Report> reportList() {
		List<Report> rList = rDao.findAll();
		return rList ;
		
	}
	//找到使用者，送出罐頭檢舉信且權限改為0，導回首頁，順帶model出去。
	@GetMapping("/adminReplyReportToSendMail")
	public String reportToSendMail(@RequestParam("report_id") Integer  report_id, Model model ){
		Optional<Report> Optional = rDao.findById(report_id);
		Report user = Optional.get();
		 Users userId = user.getUsers();
		String userEmail = userId.getEmail();
		System.out.println("userEmail"+userEmail);
		userId.setPermission(0);
		Report report = new Report();
		report.setReportId(report_id);
		report.setReportStatus("已受理");
		System.out.println(report+"++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++");
		rpDao.save(report);
		SimpleMailMessage message = new SimpleMailMessage();
		message.setFrom("stu60406666@gmail.com");
        message.setTo(userEmail);
        message.setSubject("主旨：I-Cook 通知");
        message.setText("由於近期文章有接獲檢舉，會暫時停權三天，還請見諒。");
        mailSender.send(message);
        model.addAttribute("user",user);
        model.addAttribute("report",report);
		return "test/adminIndex";
	}
	
	// 模糊搜尋使用者名稱
		@GetMapping("/find/searchUser/{userName}")
		public @ResponseBody List<UsersDto> findByUserNameLike(@PathVariable String userName) {
			System.out.println("userName:"+userName);
			List<Users> fList = aService.findByUserNameLike("%"+userName+"%");
			List<UsersDto> users = changeUsersToDto(fList);
			return users;
		}
		
		
	// List<Users> 轉 List<UsersDto>
		public List<UsersDto> changeUsersToDto(Iterable<Users> users){
			List<UsersDto> dtoList=new ArrayList<UsersDto>();
			for(Users u:users) {
				UsersDto dto = new UsersDto();
				dto.setUserId(u.getUserId());
				dto.setUserName(u.getUserName());
				dto.setPassword(u.getPassword());
				dto.setEmail(u.getEmail());
				dto.setUserPhoto(u.getUserPhoto());
				dto.setPermission(u.getPermission());
				dtoList.add(dto);
			}
			return dtoList;
		}	
}





