package com.eeit147.groupfive.admin.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.eeit147.groupfive.recipe.model.Foods;
import com.eeit147.groupfive.recipe.model.FoodsDao;

@Service
@Transactional
public class FoodsService {
	
	@Autowired
	private FoodsDao fDao;
	
	
		//存入食材
		public Foods insertFoods(Foods foods) {
			Foods f = fDao.save(foods);
			return f;
		}
		//驗證食材是否已存在
		public boolean checkFoodsNameExist(String foodsname) {
			List<Foods> check = fDao.findByFoodsNameLike(foodsname);
			if(check.isEmpty()) {
			return true;
		}
		return false;
		}
		
		//食材列表分頁
		public Page<Foods> findByPage(Integer pageNumber){
			Pageable pgb = PageRequest.of(pageNumber-1, 30, Sort.Direction.DESC, "foodsId");
			Page<Foods> page = fDao.findAll(pgb);
			return page;
		}
		
		//刪除食材
		public void deleteFood(Integer FoodsId) {
			fDao.deleteById(FoodsId);
		}
		
		// 取得全部食材
		public List<Foods> findAllFoods() {
			List<Foods> fList = fDao.findAll();
			return fList;
		}
		//驗證食材是否已存在
		public List<Foods> fuzzySearchFinByFoodsName(String foodsname) {
			List<Foods> foodList = fDao.findByFoodsNameLike(foodsname);	
			System.out.println("foodList:"+foodList.toString());
			return foodList;
		}
		//搜尋食材類別
		public List<Foods> findByFoodsType(String foodsType) {
			List<Foods> foodList = fDao.findByFoodsType(foodsType);	
			System.out.println("foodList:"+foodList.toString());
			return foodList;
		}
		
	}
		

		

	

	


