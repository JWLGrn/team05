package com.eeit147.groupfive.recipe.model;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

@Repository
@Transactional
public interface RecipeDao extends JpaRepository<Recipe, Integer> {
	@Query(value="select * from recipe ORDER BY recipe_id DESC", nativeQuery = true)
	public List<Recipe> findAlldataorder();
}
