package com.eeit147.groupfive.recipe.model;

import java.io.Serializable;

public class CampaignDto implements Serializable{
	private Integer eventId;
	private Integer recipeId;
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
}