package com.eeit147.groupfive.recipe.model;

import java.util.LinkedHashSet;
import java.util.Set;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;

@Entity
@Table(name="keyword")
public class Keyword {
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name="keyword_id")
	private Integer keywordId;
	
	@Column(name="keyword")
	private String keyword;

	@Column(name="keywordPhoto")
	private String keywordPhoto;
	
	@OneToMany(fetch = FetchType.LAZY,mappedBy = "keyword",cascade = CascadeType.ALL)
	private Set<RecipeKeyword> recipeKeyword= new LinkedHashSet<RecipeKeyword>();

	public Keyword() {
	}

	public Keyword(String keyword) {
		super();
		this.keyword = keyword;
	}

	public Integer getKeywordId() {
		return keywordId;
	}

	public void setKeywordId(Integer keywordId) {
		this.keywordId = keywordId;
	}

	public String getKeyword() {
		return keyword;
	}

	public void setKeyword(String keyword) {
		this.keyword = keyword;
	}

	public String getKeywordPhoto() {
		return keywordPhoto;
	}

	public void setKeywordPhoto(String keywordPhoto) {
		this.keywordPhoto = keywordPhoto;
	}

	public Set<RecipeKeyword> getRecipeKeyword() {
		return recipeKeyword;
	}

	public void setRecipeKeyword(Set<RecipeKeyword> recipeKeyword) {
		this.recipeKeyword = recipeKeyword;
	}

}
