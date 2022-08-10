package com.eeit147.groupfive.recipe.model;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.eeit147.groupfive.recipe.model.RecipeStep;


@Repository
@Transactional
public interface RecipeStepDao extends JpaRepository<RecipeStep, Integer>{
	@Query(value="select * from recipestep ORDER BY recipestep_id DESC", nativeQuery = true)
	public List<RecipeStep> findAlldataorder();
}
