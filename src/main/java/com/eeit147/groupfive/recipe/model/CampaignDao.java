package com.eeit147.groupfive.recipe.model;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.eeit147.groupfive.users.model.Users;

@Repository
@Transactional
public interface CampaignDao extends JpaRepository<Campaign, Integer> {
	//查詢是否有該關聯
	public Boolean existsByEventAndRecipe(Event event,Recipe recipe);
		
	@Query(value="select * from campaign where fk_campaign_event = :eventId", nativeQuery = true)
	public List<Campaign> findAllRecipeByEventId(Integer eventId);
	
	@Query(value="select count(*) from favorite where fk_favorite_recipe = :recipeId", nativeQuery = true)
	public Integer findFavoriteByRecipeId(Integer recipeId);
	
}