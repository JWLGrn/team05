package com.eeit147.groupfive.recipe.service;

import java.util.ArrayList;
import java.util.Collections;
import java.util.Comparator;
import java.util.LinkedList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.eeit147.groupfive.recipe.model.Keyword;
import com.eeit147.groupfive.recipe.model.KeywordDao;
import com.eeit147.groupfive.recipe.model.Recipe;
import com.eeit147.groupfive.recipe.model.RecipeDao;
import com.eeit147.groupfive.recipe.model.RecipeKeyword;
import com.eeit147.groupfive.recipe.model.RecipeKeywordDto;

@Service
@Transactional
public class KeywordService {

	@Autowired
	private KeywordDao kDao;
	
	@Autowired
	private RecipeDao rDao;
	
	//取得所有食譜類別
	public List<Keyword> findAllKeyword() {
		List<Keyword> kList = kDao.findAll();
		return kList;
	}
	
	// Keyword List 轉 Dto List
	public List<RecipeKeywordDto> changeKeywordToDto(Iterable<RecipeKeyword> recipekeywords){
		List<RecipeKeywordDto> dtoList=new ArrayList<RecipeKeywordDto>();
		for(RecipeKeyword rk : recipekeywords) {
			RecipeKeywordDto dto = new RecipeKeywordDto();
			dto.setRecipekeywordId(rk.getRecipekeywordId());
			dto.setKeyword(rk.getKeyword().getKeyword());
			dtoList.add(dto);
		}
		return dtoList;
	}
	
	//存入食譜類別
	public Keyword insertKeyword(Keyword keyword) {
			Keyword k = kDao.save(keyword);
		return k;
	}
	//驗證食譜類別是否已存在
	public boolean checkKeywordExist(String keyword) {
			List<Keyword> check = kDao.findByKeywordLike(keyword);
			if(check.isEmpty()) {
				return true;
			}
			return false;
			}
	
	//刪除食譜類別
	public void deleteKeyword(Integer keywordId) {
			kDao.deleteById(keywordId);
		
		
	}
	
	// 查詢收藏數前幾名
		public List<Keyword> categoryRank(Integer rank){

			 // 取得前五名收藏的類別id + 收藏數
			 List<Object[]> list = rDao.findCategoryRank(rank);
			 
			 // 取得類別ID的List
			 List<Integer> ids = new LinkedList<Integer>();
			 for(Object[] id : list) {
				 ids.add((Integer)id[0]);
			 }
			 
			 // 取得類別
			 List<Keyword> keyword = kDao.findByKeywordIdIn(ids);
			 
			 // 對食譜做排序
			 Collections.sort(keyword, new Comparator<Keyword>() {
		            @Override
		            public int compare(Keyword o1, Keyword o2) {
		                return o2.getRecipeKeyword().size() - o1.getRecipeKeyword().size();
		            }
		        });

			return keyword;
		}
}
