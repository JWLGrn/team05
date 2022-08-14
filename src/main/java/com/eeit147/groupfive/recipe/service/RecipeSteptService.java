package com.eeit147.groupfive.recipe.service;

import org.springframework.transaction.annotation.Transactional;


import com.eeit147.groupfive.recipe.model.RecipeStep;
import com.eeit147.groupfive.recipe.model.RecipeStepDao;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Service;

@Service
@Transactional
public class RecipeSteptService {
	@Autowired
	private RecipeStepDao rsDao;
//步驟類		
	public void insertrecipestep(RecipeStep step) {
		rsDao.save(step);
	}
	
	public List<RecipeStep> findAllStepById(@Param("recipeId") Integer recipeId){
		return rsDao.findAllRecipeStepId(recipeId);
	}
}
