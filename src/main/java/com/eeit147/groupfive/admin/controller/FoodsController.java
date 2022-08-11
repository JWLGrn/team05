package com.eeit147.groupfive.admin.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;

import com.eeit147.groupfive.admin.service.FoodsService;
import com.eeit147.groupfive.recipe.model.Foods;

@Controller
public class FoodsController {
	
	@Autowired
	private FoodsService  fService;
	
	@PostMapping("/insertFoods")
	public String postMessage(@ModelAttribute Foods fd,Model model) {
		fService.insertFood(fd);
		
		Foods newFd = new Foods();
//		Foods latestFd = Foods.lastestFd();
		
		model.addAttribute("Foods", newFd);
//		model.addAttribute("latestFd", latestFd);
		
		return "insertFoods";
	}
	

}
