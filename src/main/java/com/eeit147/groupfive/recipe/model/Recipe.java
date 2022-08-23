package com.eeit147.groupfive.recipe.model;

import java.util.Date;
import java.util.LinkedHashSet;
import java.util.LinkedList;
import java.util.List;
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
import javax.persistence.PrePersist;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

import org.springframework.format.annotation.DateTimeFormat;

import com.eeit147.groupfive.users.model.Collect;
import com.eeit147.groupfive.users.model.Favorite;
import com.eeit147.groupfive.users.model.Reply;
import com.eeit147.groupfive.users.model.Users;
import com.fasterxml.jackson.annotation.JsonFormat;
import com.fasterxml.jackson.annotation.JsonIgnore;

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
	
	@JsonFormat(pattern = "yyyy/MM/dd",timezone = "Asia/Taipei") //for JSON  需加timezone時區
	@DateTimeFormat(pattern = "yyyy/MM/dd") //for SpringMVC
	@Temporal(TemporalType.DATE)
	@Column(name="date")
	private Date date;
	
	@PrePersist //物件轉換成 Persistent(永續) 狀態前要執行的方法
	public void onCreate() {
		//若added為空則放入當下時間
		if(date == null) {
			date = new Date();
		}
	}
	
	@Column(name="total_cal")
	private Integer totalCal;
	
	@JsonIgnore
	@ManyToOne(fetch = FetchType.EAGER)
	@JoinColumn(name = "fk_recipe_users")
	private Users users;
	
	@OneToMany(fetch = FetchType.LAZY,mappedBy = "recipe",cascade = CascadeType.ALL)
	private Set<RecipeFoods> recipeFoods= new LinkedHashSet<RecipeFoods>();
	
	@OneToMany(fetch = FetchType.LAZY,mappedBy = "recipe",cascade = CascadeType.ALL)
	private Set<Campaign> campaign= new LinkedHashSet<Campaign>();
	
	@OneToMany(fetch = FetchType.LAZY,mappedBy = "recipe",cascade = CascadeType.ALL)
	private List<RecipeStep> recipeStep= new LinkedList<RecipeStep>();
	
	@OneToMany(fetch = FetchType.LAZY,mappedBy = "recipe",cascade = CascadeType.ALL)
	private Set<RecipeKeyword> recipeKeyword= new LinkedHashSet<RecipeKeyword>();
	
	@OneToMany(fetch = FetchType.LAZY,mappedBy = "recipe",cascade = CascadeType.ALL)
	private Set<Favorite> favorite= new LinkedHashSet<Favorite>();
	
	@OneToMany(fetch = FetchType.LAZY,mappedBy = "recipe",cascade = CascadeType.ALL)
	private Set<Collect> collect= new LinkedHashSet<Collect>();
	
	@OneToMany(fetch = FetchType.LAZY,mappedBy = "recipe",cascade = CascadeType.ALL)
	private Set<Reply> reply= new LinkedHashSet<Reply>();

	public Recipe() {
	}

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

	public Integer getTotalCal() {
		return totalCal;
	}

	public void setTotalCal(Integer totalCal) {
		this.totalCal = totalCal;
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


	public List<RecipeStep> getRecipeStep() {
		return recipeStep;
	}

	public void setRecipeStep(List<RecipeStep> recipeStep) {
		this.recipeStep = recipeStep;
	}

	public Set<Favorite> getFavorite() {
		return favorite;
	}

	public void setFavorite(Set<Favorite> favorite) {
		this.favorite = favorite;
	}

	public Set<Collect> getCollect() {
		return collect;
	}

	public void setCollect(Set<Collect> collect) {
		this.collect = collect;
	}

	public Set<Reply> getReply() {
		return reply;
	}

	public void setReply(Set<Reply> reply) {
		this.reply = reply;
	}
	
	public Set<RecipeKeyword> getRecipeKeyword() {
		return recipeKeyword;
	}

	public void setRecipeKeyword(Set<RecipeKeyword> recipeKeyword) {
		this.recipeKeyword = recipeKeyword;
	}

	@Override
	public String toString() {
		StringBuilder builder = new StringBuilder();
		builder.append("Recipe [recipe_id=");
		builder.append(recipeId);
		builder.append(", cookTitle=");
		builder.append(cookTitle);
		builder.append(", cookDescription=");
		builder.append(cookDescription);
		builder.append(", cookPhoto=");
		builder.append(cookPhoto);
		builder.append(", cookTime=");
		builder.append(cookTime);
		builder.append(", cookServe=");
		builder.append(cookServe);
		builder.append(", date=");
		builder.append(date);
		builder.append(", totalCal=");
		builder.append(totalCal);
		builder.append("]");
		return builder.toString();
	}
	public String getUserName() {
		return users.getUserName();
	}
	public String getUserPhoto() {
		return users.getUserPhoto();
	}

	public Integer getUserId() {
		return users.getUserId();
	}
}
