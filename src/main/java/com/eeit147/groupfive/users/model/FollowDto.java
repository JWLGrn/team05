package com.eeit147.groupfive.users.model;

public class FollowDto {
	
	public FollowDto() {
		super();
	}
	
	public FollowDto(String userName, String userPhoto, int followCount, int recipeCount) {
		super();
		this.userName = userName;
		this.userPhoto = userPhoto;
		this.followCount = followCount;
		this.recipeCount = recipeCount;
	}

	private String userName;
	private String userPhoto;
	private int followCount;
	private int recipeCount;
	
	
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
	public int getRecipeCount() {
		return recipeCount;
	}
	public void setRecipeCount(int recipeCount) {
		this.recipeCount = recipeCount;
	}
	public int getFollowCount() {
		return followCount;
	}
	public void setFollowCount(int followCount) {
		this.followCount = followCount;
	}
	
	
}
