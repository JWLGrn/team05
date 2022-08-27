package com.eeit147.groupfive.recipe.controller;

import java.io.File;
import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.eeit147.groupfive.recipe.model.Keyword;
import com.eeit147.groupfive.recipe.model.KeywordDao;
import com.eeit147.groupfive.recipe.service.KeywordService;
import com.eeit147.groupfive.users.model.Users;

@Controller
public class KeywordController {

	@Autowired
	private KeywordService kService;
	@Autowired
	private KeywordDao kDao;
	
	// 取得全部食譜類別
	@GetMapping("/find/keyword/all")
	public @ResponseBody List<Keyword> findAllKeyword() {
		List<Keyword> kList = kService.findAllKeyword();
		return kList;
	}
	
	//呼叫service存入食譜類別方法
	@PostMapping("/addkeyword")
	public String InsertKeyword(
			@RequestParam("keyword") String keyword,
			 @RequestParam("keywordPhoto") MultipartFile file, 
			 Model model,HttpSession session){
		Keyword newkeyword = new Keyword();
		newkeyword.setKeyword(keyword);
		Keyword akeyword = kService.insertKeyword(newkeyword);
		// 取得註冊User的id 將User上傳的圖片命名成
		Integer keywordId = akeyword.getKeywordId();
		akeyword.setKeywordPhoto(keywordId + ".jpeg");
		Keyword result = kService.insertKeyword(akeyword);
		System.out.println(result);
		try {
			//上傳照片到指定路徑 並取名為userid.jpeg
			file.transferTo(new File("C:\\Git\\Project\\team05\\src\\main\\webapp\\image\\category\\" + keywordId + ".jpeg"));
				} catch (Exception e) {
					e.printStackTrace();
				}
		
		return "redirect:/showAllKeywords";
		
		}
	//驗證食譜類別是否已存在
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
	
	//編輯食譜類別
	@PostMapping("/editKeyword")
	public String editeditKeyword(@RequestParam("keywordId") Integer keywordId,
								  @RequestParam("keyword") String keyword,
								  @RequestParam("keywordPhoto")MultipartFile word,
								  Model model){
		
		String photopath= keywordId+".jpeg";
		Keyword k = new Keyword();
		k.setKeywordId(keywordId);
		k.setKeyword(keyword);
		k.setKeywordPhoto(photopath);
		
		kService.insertKeyword(k);
		
	//存圖片
		 if(word.isEmpty()) {				 
		 }else {
			try {
				word.transferTo(new File("C:\\Git\\Project\\team05\\src\\main\\webapp\\image\\category\\"+ photopath));		
		    } catch (IOException e) {
			  e.printStackTrace();
		    }	
		 } 
		model.addAttribute("allKeywords",kDao.findAll() );
		
		return "showAllKeywords";
	}
	
	//刪除食譜類別
		@GetMapping("/deleteKeyword/{keywordId}")
		public String deleteKeyword(@PathVariable Integer keywordId) {
			kService.deleteKeyword(keywordId);
			return "redirect:/showAllKeywords";
		}
}
