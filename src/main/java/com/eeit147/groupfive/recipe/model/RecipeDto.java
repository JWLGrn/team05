package com.eeit147.groupfive.recipe.model;

import java.util.ArrayList;
import java.util.List;

public class RecipeDto {

	private Integer recipeId;
	
	private String cookTitle;
	
	private String cookDescription;
	
	private String cookPhoto;
	
	private Integer cookTime;
	
	private Integer userId;
	
	private String userName;
	
	private List<RecipeKeywordDto> recipeKeyword = new ArrayList<RecipeKeywordDto>();

	public RecipeDto() {
	}

	public Integer getRecipeId() {
		return recipeId;
	}

	public void setRecipeId(Integer recipeId) {
		this.recipeId = recipeId;
	}

	public String getCookTitle() {
		return cookTitle;
	}

	public void setCookTitle(String cookTitle) {
		this.cookTitle = cookTitle;
	}

	public String getCookDescription() {
		return cookDescription;
	}

	public void setCookDescription(String cookDescription) {
		this.cookDescription = cookDescription;
	}

	public String getCookPhoto() {
		return cookPhoto;
	}

	public void setCookPhoto(String cookPhoto) {
		this.cookPhoto = cookPhoto;
	}

	public Integer getCookTime() {
		return cookTime;
	}

	public void setCookTime(Integer cookTime) {
		this.cookTime = cookTime;
	}

	public Integer getUserId() {
		return userId;
	}

	public void setUserId(Integer userId) {
		this.userId = userId;
	}

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public List<RecipeKeywordDto> getRecipeKeyword() {
		return recipeKeyword;
	}

	public void setRecipeKeyword(List<RecipeKeywordDto> recipeKeyword) {
		this.recipeKeyword = recipeKeyword;
	}
	
}
