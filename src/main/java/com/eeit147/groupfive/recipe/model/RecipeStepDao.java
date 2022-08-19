package com.eeit147.groupfive.recipe.model;

import java.util.List;
import java.util.Optional;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;


@Repository
@Transactional
public interface RecipeStepDao extends JpaRepository<RecipeStep, Integer>{
	@Query(value="select * from recipestep ORDER BY recipestep_id DESC", nativeQuery = true)
	public List<RecipeStep> findAlldataorder();
	
	@Query(value="select * from recipestep where fk_recipestep_recipe = :recipeId and step = :step", nativeQuery = true)
	public Optional<RecipeStep> findByRecipeStepId(@Param("recipeId") Integer recipeId,@Param("step") Integer step);
	
	@Query(value="select * from recipestep where fk_recipestep_recipe = :recipeId ORDER BY step ASC", nativeQuery = true)
	public List<RecipeStep> findAllRecipeStepId(@Param("recipeId") Integer recipeId);
	
	public void deleteByRecipe(Recipe recipe);
	
	//計算步驟數
	public Integer countByRecipe(Recipe recipe);
}
