package com.eeit147.groupfive.users.model;

import com.eeit147.groupfive.recipe.model.Recipe;

public class CollectCount {

	private Recipe recipe;
	
	private Integer count;
	
	public CollectCount() {
	}

	public Recipe getRecipe() {
		return recipe;
	}

	public void setRecipe(Recipe recipe) {
		this.recipe = recipe;
	}

	public Integer getCount() {
		return count;
	}

	public void setCount(Integer count) {
		this.count = count;
	}
	
}
