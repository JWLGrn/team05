package com.eeit147.groupfive.recipe.model;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

@Repository
@Transactional
public interface KeywordDao extends JpaRepository<Keyword, Integer> {

	//透過食譜類別查詢食譜類別資料
	public Keyword findByKeyword(String keyword);
	
	//食譜類別模糊查詢
	public List<Keyword> findByKeywordLike(String keyword);
	
	//透過多種食譜類別搜尋
	public List<Keyword> findByKeywordIn(String[] keyword);
}
