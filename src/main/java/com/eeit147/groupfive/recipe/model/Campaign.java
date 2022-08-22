package com.eeit147.groupfive.recipe.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

import com.fasterxml.jackson.annotation.JsonIgnore;

@Entity
@Table(name = "campaign")
public class Campaign {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name="campaign_id")
	private Integer campaignId;
	
	@JsonIgnore
	@ManyToOne(fetch = FetchType.EAGER)
	@JoinColumn(name = "fk_campaign_event")
	private Event event;
	
	@JsonIgnore
	@ManyToOne(fetch = FetchType.EAGER)
	@JoinColumn(name = "fk_campaign_recipe")
	private Recipe recipe;

	public Campaign() {
	}
	
	public Campaign(Integer campaignId, Event event, Recipe recipe) {
		super();
		this.campaignId = campaignId;
		this.event = event;
		this.recipe = recipe;
	}

	public Integer getcampaignId() {
		return campaignId;
	}

	public void setcampaignId(Integer campaignId) {
		this.campaignId = campaignId;
	}

	public Event getEvent() {
		return event;
	}

	public void setEvent(Event event) {
		this.event = event;
	}

	public Recipe getRecipe() {
		return recipe;
	}

	public void setRecipe(Recipe recipe) {
		this.recipe = recipe;
	}

	@Override
	public String toString() {
		StringBuilder builder = new StringBuilder();
		builder.append("Campaign [campaign_id=");
		builder.append(campaignId);
		builder.append(", event=");
		builder.append(event);
		builder.append(", recipe=");
		builder.append(recipe);
		builder.append("]");
		return builder.toString();
	}
	
	//-----------------------
	public String getCookTitle(){
		return recipe.getCookTitle();
	}
	public String getCookPhoto(){
		return recipe.getCookPhoto();
	}	
}
