package com.eeit147.groupfive.users.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

import com.eeit147.groupfive.recipe.model.Recipe;
import com.fasterxml.jackson.annotation.JsonIgnore;

@Entity
@Table(name="favorite")
public class Favorite {
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name="favorite_id")
	private Integer favoriteId;
	
	@JsonIgnore
	@ManyToOne(fetch = FetchType.EAGER)
	@JoinColumn(name = "fk_favorite_recipe")
	private Recipe recipe;
	
	@JsonIgnore
	@ManyToOne(fetch = FetchType.EAGER)
	@JoinColumn(name = "fk_favorite_users")
	private Users users;
	
	public Favorite() {
	}

	public Favorite(Integer favoriteId, Recipe recipe, Users users) {
		super();
		this.favoriteId = favoriteId;
		this.recipe = recipe;
		this.users = users;
	}

	public Integer getFavoriteId() {
		return favoriteId;
	}

	public void setFavoriteId(Integer favoriteId) {
		this.favoriteId = favoriteId;
	}

	public Recipe getRecipe() {
		return recipe;
	}

	public void setRecipe(Recipe recipe) {
		this.recipe = recipe;
	}

	public Users getUsers() {
		return users;
	}

	public void setUsers(Users users) {
		this.users = users;
	}

	@Override
	public String toString() {
		return "Favorite [favoriteId=" + favoriteId + ", recipe=" + recipe + ", users=" + users + "]";
	}
	
	
	
}
