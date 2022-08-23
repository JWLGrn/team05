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
	
	//查詢食譜By食譜標題
	public List<Recipe> findByCookTitleLike(String cookTitle);

	//查詢食譜ByUsers
	public Set<Recipe> findByUsersIn(List<Users> users);
	
	//模糊查詢By食材or關鍵字
	public Set<Recipe> findByRecipeFoodsInOrRecipeKeywordIn(List<RecipeFoods> recipeFoods,List<RecipeKeyword> recipeKeyword);
	
	//模糊查詢By 食譜標題&食材 or 食譜標題&關鍵字
	public Set<Recipe> findByRecipeFoodsInAndCookTitleLikeOrRecipeKeywordInAndCookTitleLike(List<RecipeFoods> recipeFoods,String cookTitle1,List<RecipeKeyword> recipeKeyword,String cookTitle2);
	
	//模糊查詢By 作者&食材 or 作者&關鍵字
	public Set<Recipe> findByRecipeFoodsInAndUsersInOrRecipeKeywordInAndUsersIn(List<RecipeFoods> recipeFoods,List<Users> user1,List<RecipeKeyword> recipeKeyword,List<Users> user2);
	
	//查詢收藏排行榜
	@Query(nativeQuery = true, value="SELECT top(:number) c.fk_collect_recipe as recipeId FROM collect AS c GROUP BY c.fk_collect_recipe order by COUNT(c.fk_collect_recipe) DESC")
	public List<Object[]> findCollectRank(@Param("number")Integer number);
	
	//查詢按讚排行榜
	@Query(nativeQuery = true, value="SELECT top(:number) f.fk_favorite_recipe as recipeId FROM favorite AS f GROUP BY f.fk_favorite_recipe order by COUNT(f.fk_favorite_recipe) DESC")
	public List<Object[]> findFavoriteRank(@Param("number")Integer number);

	//查詢食譜 By userId 
	@Query(value="select * from recipe where fk_recipe_users = :userId ORDER BY date DESC", nativeQuery = true)
	public List<Recipe> findAllRecipeByUser(@Param("userId") Integer userId);
	
	public List<Recipe> findAllRecipeByRecipeId(Integer recipeId);
	
	@Query(value = "from Recipe where userId = :userId")
	public List<Recipe> findAllRecipeByUserId(@Param("userId") Integer userId);
	
	public List<Recipe> findByUsers(Users users);
	
	@Query(value="SELECT TOP (:number) * FROM Recipe ORDER BY NEWID()", nativeQuery = true)
	public List<Recipe> findRandomRecipe(@Param("number") Integer number);
}
