package com.eeit147.groupfive.admin.controller;

import java.util.LinkedHashSet;
import java.util.List;
import java.util.Set;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.eeit147.groupfive.admin.service.FoodsService;
import com.eeit147.groupfive.recipe.model.Foods;
import com.eeit147.groupfive.recipe.model.FoodsDao;


@Controller
public class FoodsController {
	

	//呼叫service存入食材方法
	@Autowired
	private FoodsService fService;
	@Autowired
	FoodsDao fDao;
	@PostMapping("/addfoods")
	public String InsertFoods(
		@ModelAttribute("addfoodsAttribute")Foods fd,	
		Model model){
		Foods f = fService.insertFoods(fd);
		model.addAttribute("newFoods", f);
		return "redirect:/showAllFoods123";
	}
	//驗證食材是否已存在
	@PostMapping("/foodname/checkFoodsByName")
	public @ResponseBody String checkFoodsNameExist(@RequestParam("foodname")String foodname) {
		System.out.println("foodname:" + foodname);
		boolean checkFoodsName = fService.checkFoodsNameExist(foodname);
		if(checkFoodsName) {
			return "0";
		}
		return "1";
		
	}

	//編輯食材
	@PostMapping("/editFoods")
	public String editFoods(
		@RequestParam("foodsId") Integer foods_id, @RequestParam("foodsName") String foods_name, @RequestParam("foodsType") String foods_type,
		@RequestParam("calorie") Integer calorie, Model model){
		Foods ifd = new Foods();
		ifd.setFoodsId(foods_id);
		ifd.setFoodsName(foods_name);
		ifd.setFoodsType(foods_type);
		ifd.setCalorie(calorie);
		fDao.save(ifd);
		Set<String> data = new LinkedHashSet<String>(); 
		 List<Foods> foods=fDao.findAll();
		for(Foods food : foods ) { 
		 data.add(food.getFoodsType()); 
		}
		model.addAttribute("allFoods",fDao.findAll() );
		model.addAttribute("option", data);
		

		return "redirect:/showAllFoods123";
		
	}
	
	//食材篩選結果編輯傳值
		@GetMapping("/editFoods/{foodsId}/{foodsName}/{foodsType}/{calorie}")
		public String editFoodsget(
			@PathVariable("foodsId") Integer foods_id, @PathVariable("foodsName") String foods_name, @PathVariable("foodsType") String foods_type,
			@PathVariable("calorie") Integer calorie, Model model){
			Foods ifd = new Foods();
			ifd.setFoodsId(foods_id);
			ifd.setFoodsName(foods_name);
			ifd.setFoodsType(foods_type);
			ifd.setCalorie(calorie);
			System.out.println("ifd"+ifd.toString());
			fDao.save(ifd);
			Set<String> data = new LinkedHashSet<String>(); 
			 List<Foods> foods=fDao.findAll();
			for(Foods food : foods ) { 
			 data.add(food.getFoodsType()); 
			}
			model.addAttribute("allFoods",fDao.findAll() );
			model.addAttribute("option", data);
			

			return "redirect:/showAllFoods123";
			
		}
	
	
	//刪除食材
	@GetMapping("/deleteFood/{foodsId}")
	public String deleteFood(@PathVariable Integer foodsId) {
		fService.deleteFood(foodsId);
		return "redirect:/showAllFoods123";
	}
		
	// 取得全部食材
	@GetMapping("/find/foods/all")
	public @ResponseBody List<Foods> findAllFoods() {
		List<Foods> fList = fService.findAllFoods();
		return fList;
	}

	// 模糊搜尋食物名稱
	@GetMapping("/find/searchFoods/{foodsName}")
	public @ResponseBody List<Foods> fuzzySearchFinByFoodsName(@PathVariable String foodsName) {
		System.out.println("foodsName:"+foodsName);
		List<Foods> fList = fService.fuzzySearchFinByFoodsName("%"+foodsName+"%");
		return fList;
	}
	
	// 依照食材類別搜尋食材名稱
	@GetMapping("/find/searchFoodsByfoodsType/{foodsType}")
	public @ResponseBody List<Foods> searchFoodsByfoodsType(@PathVariable String foodsType) {
		System.out.println("foodsType:"+foodsType);
		List<Foods> fList = fService.findByFoodsType(foodsType);
		return fList;
	}
		
				
		
}


