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

@Entity
@Table(name = "recipestep")
public class RecipeStep {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name="recipestep_id")
	private Integer recipeStepId;
	
	@Column(name="step")
	private Integer step;
	
	@Column(name="step_description")
	private String stepDescription;
	
	@Column(name="step_photo")
	private String stepPhoto;
	
	@ManyToOne(fetch = FetchType.EAGER)
	@JoinColumn(name = "fk_recipestep_recipe")
	private Recipe recipe;

	public RecipeStep() {
	}

	public RecipeStep(Integer recipeStepId, Integer step, String stepDescription, String stepPhoto, Recipe recipe) {
		super();
		this.recipeStepId = recipeStepId;
		this.step = step;
		this.stepDescription = stepDescription;
		this.stepPhoto = stepPhoto;
		this.recipe = recipe;
	}

	public Integer getRecipeStepId() {
		return recipeStepId;
	}

	public void setRecipeStepId(Integer recipeStepId) {
		this.recipeStepId = recipeStepId;
	}

	public Integer getStep() {
		return step;
	}

	public void setStep(Integer step) {
		this.step = step;
	}

	public String getStepDescription() {
		return stepDescription;
	}

	public void setStepDescription(String stepDescription) {
		this.stepDescription = stepDescription;
	}

	public String getStepPhoto() {
		return stepPhoto;
	}

	public void setStepPhoto(String stepPhoto) {
		this.stepPhoto = stepPhoto;
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
		builder.append("RecipeStep [recipeStepId=");
		builder.append(recipeStepId);
		builder.append(", step=");
		builder.append(step);
		builder.append(", stepDescription=");
		builder.append(stepDescription);
		builder.append(", stepPhoto=");
		builder.append(stepPhoto);
		builder.append(", recipe=");
		builder.append(recipe);
		builder.append("]");
		return builder.toString();
	}
	
}
