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
	private Integer favoritenum;
	
	public Integer getFavoritenum() {
		return favoritenum;
	}
	public void setFavoritenum(Integer favoritenum) {
		this.favoritenum = favoritenum;
	}
	public Integer getCampaignId() {
		return campaignId;
	}
	public void setCampaignId(Integer campaignId) {
		this.campaignId = campaignId;
	}
	public Integer getEventId() {
		return eventId;
	}
	public void setEventId(Integer eventId) {
		this.eventId = eventId;
	}
	public Integer getRecipeId() {
		return recipeId;
	}
	public void setRecipeId(Integer recipeId) {
		this.recipeId = recipeId;
	}
	public Recipe getRecipe() {
		return recipe;
	}
	public void setRecipe(Recipe recipe) {
		this.recipe = recipe;
	}
	public String getCookTitle() {
		return cookTitle;
	}
	public void setCookTitle(String cookTitle) {
		this.cookTitle = cookTitle;
	}
	public String getCookPhoto() {
		return cookPhoto;
	}
	public void setCookPhoto(String cookPhoto) {
		this.cookPhoto = cookPhoto;
	}
	public Users getUsers() {
		return users;
	}
	public void setUsers(Users users) {
		this.users = users;
	}
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	public String getUserPhoto() {
		return userPhoto;
	}
	public void setUserPhoto(String userPhoto) {
		this.userPhoto = userPhoto;
	}
	

	
}