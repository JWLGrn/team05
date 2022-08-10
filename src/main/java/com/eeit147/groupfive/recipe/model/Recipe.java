package com.eeit147.groupfive.recipe.model;

import java.util.Date;
import java.util.LinkedHashSet;
import java.util.Set;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;

import com.eeit147.groupfive.users.model.Users;

@Entity
@Table(name="recipe")
public class Recipe {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name="recipe_id")
	private Integer recipeId;
	
	@Column(name="cook_title")
	private String cookTitle;

	@Column(name="cook_description")
	private String cookDescription;
	
	@Column(name="cook_photo")
	private String cookPhoto;
	
	@Column(name="cook_time")
	private Integer cookTime;
	
	@Column(name="cook_serve")
	private Integer cookServe;
	
	private Date date;
	
	@Column(name="total_cal")
	private Integer totalcal;
		
	@ManyToOne(fetch = FetchType.EAGER)
	@JoinColumn(name = "fk_recipe_users")
	private Users users;
	
	@OneToMany(fetch = FetchType.LAZY,mappedBy = "recipe",cascade = CascadeType.ALL)
	private Set<RecipeFoods> recipeFoods= new LinkedHashSet<RecipeFoods>();
	
	@OneToMany(fetch = FetchType.LAZY,mappedBy = "recipe",cascade = CascadeType.ALL)
	private Set<Campaign> campaign= new LinkedHashSet<Campaign>();
	
	@OneToMany(fetch = FetchType.LAZY,mappedBy = "recipe",cascade = CascadeType.ALL)
	private Set<RecipeStep> recipeStep= new LinkedHashSet<RecipeStep>();

	public Recipe() {}
	
	

	public Integer getRecipeId() {
		return recipeId;
	}



	public void setRecipeId(Integer recipeId) {
		this.recipeId = recipeId;
	}



	public String getCookTitle() {
		return cookTitle;
	}



	public void setCookTitle(String cookTitle) {
		this.cookTitle = cookTitle;
	}



	public String getCookDescription() {
		return cookDescription;
	}



	public void setCookDescription(String cookDescription) {
		this.cookDescription = cookDescription;
	}



	public String getCookPhoto() {
		return cookPhoto;
	}



	public void setCookPhoto(String cookPhoto) {
		this.cookPhoto = cookPhoto;
	}



	public Integer getCookTime() {
		return cookTime;
	}



	public void setCookTime(Integer cookTime) {
		this.cookTime = cookTime;
	}



	public Integer getCookServe() {
		return cookServe;
	}



	public void setCookServe(Integer cookServe) {
		this.cookServe = cookServe;
	}



	public Date getDate() {
		return date;
	}



	public void setDate(Date date) {
		this.date = date;
	}



	public Integer getTotalcal() {
		return totalcal;
	}



	public void setTotalcal(Integer totalcal) {
		this.totalcal = totalcal;
	}



	public Users getUsers() {
		return users;
	}



	public void setUsers(Users users) {
		this.users = users;
	}



	public Set<RecipeFoods> getRecipeFoods() {
		return recipeFoods;
	}



	public void setRecipeFoods(Set<RecipeFoods> recipeFoods) {
		this.recipeFoods = recipeFoods;
	}



	public Set<Campaign> getCampaign() {
		return campaign;
	}



	public void setCampaign(Set<Campaign> campaign) {
		this.campaign = campaign;
	}



	public Set<RecipeStep> getRecipeStep() {
		return recipeStep;
	}



	public void setRecipeStep(Set<RecipeStep> recipeStep) {
		this.recipeStep = recipeStep;
	}

	public Recipe(String cookTitle, String cookDescription, String cookPhoto, Integer cookTime, Integer cookServe,
			Date date, Integer totalcal, Users users, Set<RecipeFoods> recipeFoods, Set<Campaign> campaign,
			Set<RecipeStep> recipeStep) {
		super();
		this.cookTitle = cookTitle;
		this.cookDescription = cookDescription;
		this.cookPhoto = cookPhoto;
		this.cookTime = cookTime;
		this.cookServe = cookServe;
		this.date = date;
		this.totalcal = totalcal;
		this.users = users;
		this.recipeFoods = recipeFoods;
		this.campaign = campaign;
		this.recipeStep = recipeStep;
	}
	
	
}
