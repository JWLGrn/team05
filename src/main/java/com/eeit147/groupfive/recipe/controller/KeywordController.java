package com.eeit147.groupfive.recipe.controller;

import java.io.File;
import java.io.IOException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.eeit147.groupfive.recipe.model.Keyword;
import com.eeit147.groupfive.recipe.model.KeywordDao;
import com.eeit147.groupfive.recipe.service.KeywordService;

@Controller
public class KeywordController {

	@Autowired
	private KeywordService kService;
	@Autowired
	private KeywordDao kDao;
	
	// 取得全部關鍵字
	@GetMapping("/find/keyword/all")
	public @ResponseBody List<Keyword> findAllKeyword() {
		List<Keyword> kList = kService.findAllKeyword();
		return kList;
	}
	
	//呼叫service存入關鍵字方法
	@PostMapping("/addkeyword")
	public String InsertKeyword(
		@ModelAttribute("addKeywordAttribute")Keyword kw,	
		Model model){
		Keyword k= kService.insertKeyword(kw);
		model.addAttribute("newKeyword", k);
		
		
		
		return "redirect:/showAllKeywords";
		
		}
	//驗證關鍵字是否已存在
	@PostMapping("/keyword/checkkeywordBykeyword")
	public @ResponseBody String checkKeywordExist(@RequestParam("keyword")String keyword) {
		System.out.println("keyword:" + keyword);
		boolean checkKeyword = kService.checkKeywordExist(keyword);
		System.out.println(checkKeyword);
		
		if(checkKeyword) {
		return "0";
		}
		return "1";
			
		}
	
	//編輯關鍵字
	@PostMapping("/editKeyword")
	public String editeditKeyword(@RequestParam("keywordId") Integer keywordId,
								  @RequestParam("keyword") String keyword,
								  @RequestParam("keywordPhoto")MultipartFile word,
								  Model model){
		
		String photopath= "keyword"+keywordId+".jpeg";
		Keyword k = new Keyword();
		k.setKeywordId(keywordId);
		k.setKeyword(keyword);
		k.setKeywordPhoto(photopath);
		
		kService.insertKeyword(k);
		
	//存圖片
		 if(word.isEmpty()) {				 
		 }else {
			try {
				word.transferTo(new File("C:\\Git\\Project\\team05\\src\\main\\webapp\\image\\recipe\\"+ photopath));		
		    } catch (IOException e) {
			  e.printStackTrace();
		    }	
		 } 
		model.addAttribute("allUsers",kDao.findAll() );
		
		return "test/showAllUsers";
	}
}
