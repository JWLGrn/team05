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
@Table(name = "recipefoods")
public class RecipeFoods {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "recipefoods_id")
	private Integer recipefoodsId;

	@Column(name = "gram")
	private Double gram;

	@JsonIgnore
	@ManyToOne(fetch = FetchType.EAGER)
	@JoinColumn(name = "fk_recipefoods_recipe")
	private Recipe recipe;
	
	@JsonIgnore
	@ManyToOne(fetch = FetchType.EAGER)
	@JoinColumn(name = "fk_recipefoods_foods")
	private Foods foods;

	public RecipeFoods() {
	}

	public RecipeFoods(Double gram, Foods foods, Recipe recipe) {
		super();
		this.gram = gram;
		this.recipe = recipe;
		this.foods = foods;
	}

	public Integer getRecipefoodsId() {
		return recipefoodsId;
	}

	public void setRecipefoodsId(Integer recipefoodsId) {
		this.recipefoodsId = recipefoodsId;
	}

	public Double getGram() {
		return gram;
	}

	public void setGram(Double gram) {
		this.gram = gram;
	}

	public Recipe getRecipe() {
		return recipe;
	}

	public void setRecipe(Recipe recipe) {
		this.recipe = recipe;
	}

	public Foods getFoods() {
		return foods;
	}

	public void setFoods(Foods foods) {
		this.foods = foods;
	}

	@Override
	public String toString() {
		StringBuilder builder = new StringBuilder();
		builder.append("RecipeFoods [recipefoods_id=");
		builder.append(recipefoodsId);
		builder.append(", gram=");
		builder.append(gram);
		builder.append(", recipe=");
		builder.append(recipe);
		builder.append(", foods=");
		builder.append(foods);
		builder.append("]");
		return builder.toString();
	}
	
}
