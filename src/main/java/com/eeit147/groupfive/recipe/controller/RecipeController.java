package com.eeit147.groupfive.recipe.controller;

import java.io.File;
import java.io.IOException;
import java.util.Date;
import java.util.Set;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.eeit147.groupfive.recipe.model.Campaign;
import com.eeit147.groupfive.recipe.model.Recipe;
import com.eeit147.groupfive.recipe.model.RecipeFoods;
import com.eeit147.groupfive.recipe.model.RecipeStep;
import com.eeit147.groupfive.recipe.service.RecipeService;
import com.eeit147.groupfive.recipe.service.RecipeSteptService;
import com.eeit147.groupfive.users.model.Users;


@Controller
public class RecipeController {
	@Autowired
	private RecipeSteptService rsService;
	@Autowired
	private RecipeService rService;
	
//測試
	Integer users=1;
	Integer recipeid=1;
//食譜	
	@GetMapping("/recipe/insert")
	public String recipepage(Model m) {
		m.addAttribute("users", users);
		m.addAttribute("recipe", recipeid);
		return "recipe";
	}
//步驟
	@RequestMapping("/recipe/insertRecipe")
	public String uploadNewPhoto2(@RequestParam(value="cook_photo") MultipartFile cookphoto,
			                      @RequestParam(value="cook_title") String cooktitle,
			                      @RequestParam(value="cook_description") String cookdescription,
								  @RequestParam(value="cook_time") Integer cooktime,
								  @RequestParam(value="cook_serve") Integer cookserve,Model m){
	 String cookphotopath="recipe"+recipeid+".jpg";
	 Date date=new Date();
//	 Recipe recipe=new Recipe(cooktitle, cookdescription,cookphotopath,cooktime,cookserve,date,0,null,null,null,null);

//新增食譜	 測試step先隱藏
	// rService.insertrecipe(recipe);	
//	try {
//		cookphoto.transferTo(new File("C:\\Springboot\\workspace\\groupfive\\src\\main\\webapp\\image\\recipe\\recipe"+recipeid+".jpg"));
//		
//		return "recipeStep";
//	} catch (IOException e) {
//		e.printStackTrace();
//	}
	
//新增食譜		 

//傳值給下一頁
	 m.addAttribute("recipeid", recipeid);
	 m.addAttribute("users", users);
	 m.addAttribute("cookphoto", cookphotopath);
	 m.addAttribute("cooktitle", cooktitle);
	 m.addAttribute("cookdescription", cookdescription);
	 m.addAttribute("cooktime", cooktime);
	 m.addAttribute("cookserve", cookserve);
	 
	 
	 
	 
	return "recipeStep";
	}
	 
}