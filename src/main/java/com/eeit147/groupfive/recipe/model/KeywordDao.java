package com.eeit147.groupfive.recipe.model;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

@Repository
@Transactional
public interface KeywordDao extends JpaRepository<Keyword, Integer> {

	//透過關鍵字查詢關鍵字資料
	public Keyword findByKeyword(String keyword);
	
}
