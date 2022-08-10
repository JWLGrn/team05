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

@Entity
@Table(name="collect")
public class Collect {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name="collect_id")
	private Integer collectId;
	
	@ManyToOne(fetch = FetchType.EAGER)
	@JoinColumn(name = "fk_collect_recipe")
	private Recipe recipe;
	
	@ManyToOne(fetch = FetchType.EAGER)
	@JoinColumn(name = "fk_collect_users")
	private Users users;
	
	public Collect() {
	}

	public Collect(Integer collectId, Recipe recipe, Users users) {
		super();
		this.collectId = collectId;
		this.recipe = recipe;
		this.users = users;
	}

	public Integer getCollectId() {
		return collectId;
	}

	public void setCollectId(Integer collectId) {
		this.collectId = collectId;
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
	
}
