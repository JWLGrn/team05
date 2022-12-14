package com.eeit147.groupfive.recipe.model;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

@Repository
@Transactional
public interface RecipeFoodsDao extends JpaRepository<RecipeFoods, Integer> {

	//透過recipeId刪除關聯食材
	public void deleteByRecipe(Recipe recipe);
	
	//找關聯By Foods
	public List<RecipeFoods> findByFoodsIn(List<Foods> foods);
	
	//找食材by食譜
	public List<RecipeFoods> findByRecipe(Recipe recipe);
}
