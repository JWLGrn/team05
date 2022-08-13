package com.eeit147.groupfive.users.model;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.eeit147.groupfive.recipe.model.Recipe;

@Repository
@Transactional
public interface FavoriteDao extends JpaRepository<Favorite, Integer> {

	//查詢是否有該關聯
	public Boolean existsByUsersAndRecipe(Users users,Recipe recipe);
	
	//刪除 by users & recipe
	public void deleteByUsersAndRecipe(Users users,Recipe recipe);
	
}
