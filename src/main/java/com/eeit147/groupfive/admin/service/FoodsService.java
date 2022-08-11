package com.eeit147.groupfive.admin.service;

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
	
	public void insertFood(Foods fd) {
		fDao.save(fd);
	}
	
//	public Foods lastestFood() {
//		return fDao.findFirstByOrderByAddedDesc();
//	}

}
