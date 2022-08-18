package com.eeit147.groupfive.recipe.controller;



import java.io.File;
import java.io.IOException;
import java.util.Date;
import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.eeit147.groupfive.recipe.model.EventDao;
import com.eeit147.groupfive.recipe.model.Recipe;
import com.eeit147.groupfive.recipe.model.RecipeDao;
import com.eeit147.groupfive.recipe.model.RecipeStep;
import com.eeit147.groupfive.recipe.model.RecipeStepDao;
import com.eeit147.groupfive.recipe.service.RecipeService;
import com.eeit147.groupfive.recipe.service.RecipeSteptService;
import com.eeit147.groupfive.users.model.Reply;
import com.eeit147.groupfive.users.model.Users;
import com.eeit147.groupfive.users.model.UsersDao;


@Controller
public class EventController {
	@Autowired
	private RecipeSteptService rsService;
	@Autowired
	private RecipeService rService;
	@Autowired
	private UsersDao uDao;
	@Autowired
	private RecipeDao rDao;
	@Autowired
	private RecipeStepDao rsDao;
	@Autowired
	private EventDao eDao;
	
	Integer userId=1;

	@GetMapping("/event/page")
	public String recipepage(Model m) {
		m.addAttribute("userId", userId);	
		return "event";
	}
	
	@ResponseBody
	@GetMapping("/event/showrecipe")
	public List<Recipe> recipeShow() {
		List<Recipe> recipe=rDao.findAllRecipeByUser(1);
		return recipe;
	}

	
}