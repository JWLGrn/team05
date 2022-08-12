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

	// 新增食材
	@GetMapping("/addfoods")
	public String addFoods(@ModelAttribute("foods") Foods fd, Model model) {
		Foods food = new Foods();
		model.addAttribute("addfoods", food);
		return "test/addfoods";
	}

	@GetMapping("/testt")
	public String test() {
		return "test";

	}
}
