package com.eeit147.groupfive.recipe.model;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

@Repository
@Transactional
public interface KeywordDao extends JpaRepository<Keyword, Integer> {

	//透過關鍵字查詢關鍵字資料
	public Keyword findByKeyword(String keyword);
	
	//關鍵字模糊查詢
	public List<Keyword> findByKeywordLike(String keyword);
	
	//透過多種關鍵字搜尋
	public List<Keyword> findByKeywordIn(String[] keyword);
}
