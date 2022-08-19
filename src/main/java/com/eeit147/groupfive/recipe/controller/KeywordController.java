package com.eeit147.groupfive.recipe.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.eeit147.groupfive.recipe.model.Keyword;
import com.eeit147.groupfive.recipe.service.KeywordService;

@Controller
public class KeywordController {

	@Autowired
	private KeywordService kService;
	
	// 取得全部關鍵字
	@GetMapping("/find/keyword/all")
	public @ResponseBody List<Keyword> findAllKeyword() {
		List<Keyword> kList = kService.findAllKeyword();
		return kList;
	}
}
