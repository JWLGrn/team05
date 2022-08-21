package com.eeit147.groupfive.recipe.model;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

@Repository
@Transactional
public interface FoodsDao extends JpaRepository<Foods, Integer> {

	//透過名字找食材
	public Foods findByFoodsName(String foodsName);
	
	//透過名字模糊搜尋食材
	public List<Foods> findByFoodsNameLike(String foodsName);
	
	//透過多種類別搜尋食材
	public List<Foods> findByFoodsTypeIn(String[] FoodsType);
	
	//透過單一種類搜尋食材
	public List<Foods> findByFoodsType(String FoodsType);
	
}

