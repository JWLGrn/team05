package com.eeit147.groupfive.recipe.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "foods")
public class Foods {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "foods_id")
	private Integer foodsId;

	@Column(name="foods_name")
	private String foodsName;

	@Column(name="foods_type")
	private String foodsType;

	@Column(name="calorie")
	private Integer calorie;

//	@OneToMany(fetch = FetchType.LAZY,mappedBy = "foods",cascade = CascadeType.REFRESH)
//	private Set<RecipeFoods> recipeFoods= new LinkedHashSet<RecipeFoods>();

	public Foods() {
	}

	public Foods(Integer foodsId, String foodsName, String foodsType, Integer calorie) {
		super();
		this.foodsId = foodsId;
		this.foodsName = foodsName;
		this.foodsType = foodsType;
		this.calorie = calorie;
	}

	public Integer getFoodsId() {
		return foodsId;
	}

	public void setFoodsId(Integer foodsId) {
		this.foodsId = foodsId;
	}

	public String getFoodsName() {
		return foodsName;
	}

	public void setFoodsName(String foodsName) {
		this.foodsName = foodsName;
	}

	public String getFoodsType() {
		return foodsType;
	}

	public void setFoodsType(String foodsType) {
		this.foodsType = foodsType;
	}

	public Integer getCalorie() {
		return calorie;
	}

	public void setCalorie(Integer calorie) {
		this.calorie = calorie;
	}

//	public Set<RecipeFoods> getRecipeFoods() {
//		return recipeFoods;
//	}
//
//	public void setRecipeFoods(Set<RecipeFoods> recipeFoods) {
//		this.recipeFoods = recipeFoods;
//	}

//	public Foods(Integer foodsId, String foodsName, String foodsType, Integer calorie, Set<RecipeFoods> recipeFoods) {
//		super();
//		this.foodsId = foodsId;
//		this.foodsName = foodsName;
//		this.foodsType = foodsType;
//		this.calorie = calorie;
//		this.recipeFoods = recipeFoods;
//	}

//	@Override
//	public String toString() {
//		return "Foods [foodsId=" + foodsId + ", foodsName=" + foodsName + ", foodsType=" + foodsType + ", calorie="
//				+ calorie + ", recipeFoods=" + recipeFoods + "]";
//	}



}
