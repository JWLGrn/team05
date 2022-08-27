package com.eeit147.groupfive.recipe.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.eeit147.groupfive.recipe.model.Keyword;
import com.eeit147.groupfive.recipe.model.KeywordDao;
import com.eeit147.groupfive.recipe.model.RecipeKeyword;
import com.eeit147.groupfive.recipe.model.RecipeKeywordDto;

@Service
@Transactional
public class KeywordService {

	@Autowired
	private KeywordDao kDao;
	
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
}
