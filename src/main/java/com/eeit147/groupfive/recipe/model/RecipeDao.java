package com.eeit147.groupfive.recipe.model;

import java.util.List;
import java.util.Set;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.eeit147.groupfive.users.model.Users;

@Repository
@Transactional
public interface RecipeDao extends JpaRepository<Recipe, Integer> {
	
	@Query(value="select * from recipe ORDER BY recipe_id DESC", nativeQuery = true)
	public List<Recipe> findAlldataorder();
	
	public List<Recipe> findByCookTitleLike(String cookTitle);
	

	public Set<Recipe> findByUsersIn(List<Users> users);
	
	public Set<Recipe> findByRecipeFoodsInOrRecipeKeywordIn(List<RecipeFoods> recipeFoods,List<RecipeKeyword> recipeKeyword);
	
	public Set<Recipe> findByRecipeFoodsInAndCookTitleLikeOrRecipeKeywordInAndCookTitleLike(List<RecipeFoods> recipeFoods,String cookTitle1,List<RecipeKeyword> recipeKeyword,String cookTitle2);
	
	public Set<Recipe> findByRecipeFoodsInAndUsersInOrRecipeKeywordInAndUsersIn(List<RecipeFoods> recipeFoods,List<Users> user1,List<RecipeKeyword> recipeKeyword,List<Users> user2);
}
