package com.eeit147.groupfive.recipe.controller;

import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.eeit147.groupfive.recipe.model.Recipe;
import com.eeit147.groupfive.recipe.service.RecipeService;
import com.eeit147.groupfive.recipe.service.RecipeSteptService;
import com.eeit147.groupfive.users.model.Users;
import com.eeit147.groupfive.users.model.UsersDao;
import com.eeit147.groupfive.users.service.UsersService;


@Controller
public class RecipeController {
	@Autowired
	private RecipeSteptService rsService;
	@Autowired
	private RecipeService rService;
	@Autowired
	private UsersDao uDao;
	
//測試
	Integer userId=3;
	Integer recipeId=25;
//食譜	
	@GetMapping("/recipe/insert")
	public String recipepage(Model m) {
		m.addAttribute("userId", userId);
		m.addAttribute("recipeId", recipeId);
		return "recipe";
	}
//新增食譜
	@RequestMapping("/recipe/insertRecipe")
	public String uploadNewPhoto2(@RequestParam(value="rfile") MultipartFile rfile,
			                      @RequestParam(value="rtitle") String rtitle,
			                      @RequestParam(value="rdescript") String rdescript,
								  @RequestParam(value="rtime") Integer rtime,
								  @RequestParam(value="rpeople") Integer rpeople,Model m){
	 String rphotopath="recipe"+recipeId+".jpg";	
	 Recipe recipe=new Recipe();
	 Optional<Users> optional = uDao.findById(userId);
	 Users user = optional.get();
	 
	 
	 recipe.setCookPhoto(rphotopath);
	 recipe.setCookTitle(rtitle);
	 recipe.setCookDescription(rdescript);
	 recipe.setCookServe(rpeople);
	 recipe.setCookTime(rtime);
	 recipe.setUsers(user); 
	//傳值給下一頁
//新增食譜	 測試先隱藏
	//Recipe recipeview = rService.insertrecipe(recipe);
	//m.addAttribute("recipe",recipeview);
	
	
    /*測試*/m.addAttribute("recipe",recipe);
    /*測試*/m.addAttribute("userId",user.getUserId());
//存圖片	 
/*	try {
		rfile.transferTo(new File("C:\\Git\\Project\\team05\\src\\main\\webapp\\image\\recipe\\recipe"+recipeview.getRecipeId()+".jpg"));		
		return "recipeStep";
	} catch (IOException e) {
		e.printStackTrace();
	}
*/	
//新增食譜		 
	return "recipeStep";
}
	

}