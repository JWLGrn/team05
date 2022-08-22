package com.eeit147.groupfive.recipe.model;

import java.io.Serializable;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;

import com.eeit147.groupfive.users.model.Users;
import com.eeit147.groupfive.users.model.UsersDao;
import com.fasterxml.jackson.annotation.JsonProperty;

public class CampaignDto implements Serializable{
	
	@JsonProperty("campaign")
	private Integer campaignId;
	private Integer eventId;
	private Integer recipeId;
	private Recipe recipe;
	private String cookTitle;
	private String cookPhoto;
	private Users users;
	private String userName;
	private String userPhoto;
	
	@Autowired
	private UsersDao uDao;
	@Autowired
	private RecipeDao rDao;

	public Integer getRecipeId() {
		return recipeId;
	}
	public void setRecipeId(Integer recipeId) {
		this.recipeId = recipeId;
	}
	public Integer getEventId() {
		return eventId;
	}
	public void setEventId(Integer eventId) {
		this.eventId = eventId;
	}
//----------------------
	public Recipe getRecipe() {
		Optional<Recipe> r=rDao.findById(recipeId);
		Recipe recipe=r.get();
		return recipe;
	}
	public String getCookTitle() {
		cookTitle=recipe.getCookTitle();
		return cookTitle;
	}
	public String getCookPhoto() {
		cookPhoto=recipe.getCookPhoto();
		return cookPhoto;
	}
//----------------------
	public Users getUsers() {
		Users users=recipe.getUsers();
		return users;
	}
	
	public void setCampaignId(Integer campaignId) {
		this.campaignId = campaignId;
	}
	public void setRecipe(Recipe recipe) {
		this.recipe = recipe;
	}
	public void setCookTitle(String cookTitle) {
		this.cookTitle = cookTitle;
	}
	public void setCookPhoto(String cookPhoto) {
		this.cookPhoto = cookPhoto;
	}
	public void setUsers(Users users) {
		this.users = users;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	public void setUserPhoto(String userPhoto) {
		this.userPhoto = userPhoto;
	}
	public void setuDao(UsersDao uDao) {
		this.uDao = uDao;
	}
	public void setrDao(RecipeDao rDao) {
		this.rDao = rDao;
	}
	public String getUserName() {
		userName=users.getUserName();
		return userName;
	}
	
	public String getUserPhoto() {
		userPhoto=users.getUserPhoto();
		return userPhoto;
	}
	
	
	
	
}