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
@Table(name = "recipekeyword")
public class RecipeKeyword {
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "recipekeyword_id")
	private Integer recipekeywordId;
	
	@JsonIgnore
	@ManyToOne(fetch = FetchType.EAGER)
	@JoinColumn(name = "fk_recipekeyword_recipe")
	private Recipe recipe;
	
	@JsonIgnore
	@ManyToOne(fetch = FetchType.EAGER)
	@JoinColumn(name = "fk_recipekeyword_keyword")
	private Keyword keyword;
	
	public RecipeKeyword() {
	}

	public RecipeKeyword(Integer recipekeywordId, Recipe recipe, Keyword keyword) {
		super();
		this.recipekeywordId = recipekeywordId;
		this.recipe = recipe;
		this.keyword = keyword;
	}

	public RecipeKeyword(Recipe recipe, Keyword keyword) {
		super();
		this.recipe = recipe;
		this.keyword = keyword;
	}

	public Integer getRecipekeywordId() {
		return recipekeywordId;
	}

	public void setRecipekeywordId(Integer recipekeywordId) {
		this.recipekeywordId = recipekeywordId;
	}

	public Recipe getRecipe() {
		return recipe;
	}

	public void setRecipe(Recipe recipe) {
		this.recipe = recipe;
	}

	public Keyword getKeyword() {
		return keyword;
	}

	public void setKeyword(Keyword keyword) {
		this.keyword = keyword;
	}
	
	public String getKeywords() {
		return keyword.getKeyword();
	}
}
