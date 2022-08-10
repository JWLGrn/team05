package com.eeit147.groupfive.recipe.service;

import org.springframework.transaction.annotation.Transactional;


import com.eeit147.groupfive.recipe.model.Recipe;
import com.eeit147.groupfive.recipe.model.RecipeDao;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
@Transactional
public class RecipeService {
	@Autowired
	private RecipeDao rDao;
//食譜類	
	public Integer insertrecipe(Recipe recipe) {
		rDao.save(recipe);
		return recipe.getRecipeId();
	}
}
