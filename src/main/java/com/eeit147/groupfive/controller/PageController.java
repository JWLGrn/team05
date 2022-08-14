package com.eeit147.groupfive.controller;



import java.util.LinkedHashSet;
import java.util.List;
import java.util.Set;

import org.springframework.beans.factory.annotation.Autowired;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;

import com.eeit147.groupfive.recipe.model.Foods;
import com.eeit147.groupfive.recipe.model.FoodsDao;

@Controller
public class PageController {
@Autowired
FoodsDao fDao;

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
	
=======
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
>>>>>>> master

	@GetMapping("/testt")
	public String test() {
		return "test";

	}
	
	//測試查詢頁面
	@GetMapping("/searchpage")
	public String searchpage() {
		return  "test/searchTest";
		
	}
	
	//測試查詢頁面
	@GetMapping("/favorpage")
	public String favorpage() {
		return "test/favorTest";
	}
	@GetMapping("/loginpage")
	public String login() {
		return "redirect:/user/login";
	}

}
