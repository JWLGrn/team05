package com.eeit147.groupfive.admin.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
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
		

	
//	public Foods lastestFood() {
//	return fDao.findFirstByOrderByAddedDesc();
//}
	

}
