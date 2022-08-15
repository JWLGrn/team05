package com.eeit147.groupfive.controller;



import java.util.LinkedHashSet;
import java.util.List;
import java.util.Set;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.eeit147.groupfive.admin.service.FoodsService;
import com.eeit147.groupfive.recipe.model.Foods;
import com.eeit147.groupfive.recipe.model.FoodsDao;
import com.eeit147.groupfive.users.model.Users;
import com.eeit147.groupfive.users.model.UsersDao;

@Controller
public class PageController {
@Autowired
FoodsDao fDao;
@Autowired
UsersDao uDao;
@Autowired
private FoodsService fService;

	// 首頁
	@GetMapping("/")
	public String goIndex() {
		return "index";
	}

	// 新增使用者
	@GetMapping("/Users")
	public String UsersIndex() {
		return "Usersindex";
	}

	// 驗證信
	@GetMapping("/setGmail")
	public String FindAllUsersById() {
		return "email/sendmail";
	}

	// 新增食譜(測試用)
	@GetMapping("/addpage")
	public String goAddRecipe() {
		return "test/addfoods";
	}

	
	//新增食材
	@GetMapping("/addfoods")
	public String addFoods(Model model) {
		Foods food = new Foods(); 
		model.addAttribute("addfoodsAttribute", food);
		return "test/addfoods";
		}
	
	//顯示食材
		@GetMapping("/showAllFoods123")
		public String showAllFoods(Model model) {
			Set<String> data = new LinkedHashSet<String>(); 
			 List<Foods> foods=fDao.findAll();
			for(Foods food : foods ) { 
			 data.add(food.getFoodsType()); 
			}
			model.addAttribute("allFoods",fDao.findAll() );
			model.addAttribute("option", data);
			return "test/showAllFoods123";
		}
		
		//顯示使用者
		@GetMapping("/showAllUsers")
		public String showAllUsers(Model model) {
			List<Users> users=uDao.findAll();
			model.addAttribute("allUsers",uDao.findAll() );
			return "test/showAllUsers";
		}
		
		//食材列表分頁
		@GetMapping("/page")
		public String viewFoodsPage(@RequestParam(name="p",defaultValue = "1") Integer pageNumber, Model model) {
			Page<Foods> page = fService.findByPage(pageNumber);
			System.out.println(page+"================================================");
	
			model.addAttribute("page", page);
			return "test/showAllFoods123";
		}
	

	@GetMapping("/testt")
	public String test() {
		return "test";

	}
	
	//測試查詢頁面
	@GetMapping("/searchpage")
	public String searchpage() {
		return  "test/searchTest";
		
	}
	
	//測試按讚頁面
	@GetMapping("/favorpage")
	public String favorpage() {
		return "test/favorTest";
	}
	
	@GetMapping("/loginpage")
	public String login() {
		return "redirect:/user/login";
	}
	
	
	

}
