package com.eeit147.groupfive.users.model;

public class FollowDto {
	
	public FollowDto() {
		super();
	}
	
	public FollowDto(String userName, String userPhoto, int followCount, int recipeCount, int favoriteCount,
			Integer userId) {
		super();
		this.userName = userName;
		this.userPhoto = userPhoto;
		this.followCount = followCount;
		this.recipeCount = recipeCount;
		this.favoriteCount = favoriteCount;
		this.userId = userId;
	}

	private String userName;
	private String userPhoto;
	private int followCount;
	private int recipeCount;
	private int favoriteCount;
	private Integer userId;
	


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
	public int getFollowCount() {
		return followCount;
	}
	public void setFollowCount(int followCount) {
		this.followCount = followCount;
	}
	public int getRecipeCount() {
		return recipeCount;
	}
	public void setRecipeCount(int recipeCount) {
		this.recipeCount = recipeCount;
	}
	public int getFavoriteCount() {
		return favoriteCount;
	}
	public void setFavoriteCount(int favoriteCount) {
		this.favoriteCount = favoriteCount;
	}
	public Integer getUserId() {
		return userId;
	}
	public void setUserId(Integer userId) {
		this.userId = userId;
	}



	
}