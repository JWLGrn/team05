package com.eeit147.groupfive.admin.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.eeit147.groupfive.admin.service.FoodsService;
import com.eeit147.groupfive.recipe.model.Foods;


@Controller
public class FoodsController {
	
	
	
	//呼叫service存入食材方法
	@Autowired
	private FoodsService fService;
	
	@PostMapping("/insertFoods")
	public String InsertFoods(@RequestParam("foods_name") String foods_name, @RequestParam("foods_type") String foods_type,
		@RequestParam("calorie") Integer calorie,Model model){
		Foods ifd = new Foods();
		ifd.setFoodsName(foods_name);
		ifd.setFoodsType(foods_type);
		ifd.setCalorie(calorie);
		
		Foods f = fService.insertFoods(ifd);
		model.addAttribute("newFoods", f);
		return "insertFoods";
	}
	
	@PostMapping("/foodname/checkFoodsByName")
	public @ResponseBody String checkFoodsNameExist(@RequestParam("foodname")String foodname) {
		System.out.println(foodname + "foodname");
		boolean checkFoodsName = fService.checkFoodsNameExist(foodname);
		if(checkFoodsName) {
			return "0";
		}
		return "1";
	}
	

}
