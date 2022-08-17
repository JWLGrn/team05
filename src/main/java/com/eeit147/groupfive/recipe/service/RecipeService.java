package com.eeit147.groupfive.recipe.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.eeit147.groupfive.recipe.model.Recipe;
import com.eeit147.groupfive.recipe.model.RecipeDao;

@Service
@Transactional
public class RecipeService {
	@Autowired
	private RecipeDao rDao;
	
//食譜類	
	public Recipe insertrecipe(Recipe recipe) {
		return rDao.save(recipe);
	}
	
	public List<Recipe> findRecipeByUser(@Param("userId") Integer userId){
		return rDao.findAllRecipeByUser(userId);
	}
	
	public List<Recipe> findRecipeByRecipeId(@Param("recipeId") Integer recipeId){
		return rDao.findAllRecipeByRecipeId(recipeId);
	}
}
