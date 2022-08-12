package com.eeit147.groupfive.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;

import com.eeit147.groupfive.recipe.model.Foods;

@Controller
public class PageController {

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
		return "test/addRecipeTest";
	}
//<<<<<<< HEAD
//
//	// 新增食材
//	@GetMapping("/addfoods")
//	public String addFoods(@ModelAttribute("foods") Foods fd, Model model) {
//		Foods food = new Foods();
//		model.addAttribute("addfoods", food);
//		return "test/addfoods";
//	}
//=======
//	
//	//新增食材
//	@GetMapping("/addfoods")
//	public String addFoods(@ModelAttribute("foods")Foods fd,Model model) {
//		Foods food = new Foods();
//		model.addAttribute("addfoods", food);
//		return "test/addfoods";
//		}
//	
//	//顯示食材
//		@GetMapping("/showAllFoods123")
//		public String showAllFoods() {
//			return "test/showAllFoods123";
//		}
//	
//>>>>>>> f47ff9209afb2f3897078f7df9e623edca5dca38

	@GetMapping("/testt")
	public String test() {
		return "test";

	}
	
	//測試查詢頁面
	@GetMapping("/searchpage")
	public String searchpage() {
		return  "test/searchTest";
		
	}
	
<<<<<<< HEAD
	//測試查詢頁面
	@GetMapping("/favorpage")
	public String favorpage() {
		return "test/favorTest";
=======
	@GetMapping("/loginpage")
	public String login() {
		return "redirect:/user/login";
>>>>>>> c7a2fc2d412d2188caa3217f2b000c1e50a5e5ff
	}
}
