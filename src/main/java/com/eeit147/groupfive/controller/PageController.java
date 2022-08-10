package com.eeit147.groupfive.controller;


import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;


@Controller
public class PageController {

	//首頁
	@GetMapping("/")
	public String goIndex() {
		return "index";
	}
	
	//新增使用者
	@GetMapping("/Users")
	public String UsersIndex() {
		return "Usersindex";
	}
	//查詢使用者
	@GetMapping("/setGmail")
	public String FindAllUsersById() {
		return "email/sendmail";
	}
	
	//新增食譜(測試用)
	@GetMapping("/addpage")
	public String goAddRecipe() {
		return "test/addRecipeTest";
	}
	

}
