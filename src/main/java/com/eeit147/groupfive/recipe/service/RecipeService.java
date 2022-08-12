package com.eeit147.groupfive.recipe.service;

import org.springframework.transaction.annotation.Transactional;


import com.eeit147.groupfive.recipe.model.Recipe;
import com.eeit147.groupfive.recipe.model.RecipeDao;
import com.eeit147.groupfive.users.model.Users;
import com.eeit147.groupfive.users.model.UsersDao;

import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
@Transactional
public class RecipeService {
	@Autowired
	private RecipeDao rDao;
	
//食譜類	
	public Recipe insertrecipe(Recipe recipe) {
		return rDao.save(recipe);
	}
	
}
