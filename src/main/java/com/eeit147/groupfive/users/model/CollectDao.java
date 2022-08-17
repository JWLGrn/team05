package com.eeit147.groupfive.users.model;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.eeit147.groupfive.recipe.model.Recipe;
@Repository
@Transactional
public interface CollectDao extends JpaRepository<Collect, Integer> {
	//判斷users and track是否存在著關聯
	public Boolean existsByUsersAndRecipe(Users users,Recipe recipe);
	//刪除users and track的關聯
	public void deleteByUsersAndRecipe(Users users,Recipe recipe);
}
