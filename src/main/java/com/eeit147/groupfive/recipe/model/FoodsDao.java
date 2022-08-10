package com.eeit147.groupfive.recipe.model;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

@Repository
@Transactional
public interface FoodsDao extends JpaRepository<Foods, Integer> {

	//透過名字找食材
	public Foods findByFoodsName(String foodsName);
	
}
