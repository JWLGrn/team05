package com.eeit147.groupfive.recipe.service;

import org.springframework.transaction.annotation.Transactional;


import com.eeit147.groupfive.recipe.model.RecipeStep;
import com.eeit147.groupfive.recipe.model.RecipeStepDao;

import org.springframework.beans.factory.annotation.Autowired;
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
}
