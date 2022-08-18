package com.eeit147.groupfive.users.service;

import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.eeit147.groupfive.recipe.model.Recipe;
import com.eeit147.groupfive.recipe.model.RecipeDao;
import com.eeit147.groupfive.users.model.Collect;
import com.eeit147.groupfive.users.model.CollectDao;
import com.eeit147.groupfive.users.model.Users;
import com.eeit147.groupfive.users.model.UsersDao;

@Service
@Transactional
public class CollectService {
	@Autowired
	private CollectDao cDao;
	@Autowired
	private UsersDao uDao;
	@Autowired
	private RecipeDao rDao;
	
	//取得Users 的id
	public Users findByUserId(Integer id){
		Optional<Users> optional = uDao.findById(id);
		return optional.get();
	}
	//取得Recipe 的id
	public Recipe findByRecipeId(Integer id) {
		Optional<Recipe> optional = rDao.findById(id);
		return optional.get();
	}	
	//取消收藏
	public void deleteByUserAndRecipe(Users users, Recipe recipe) {
		cDao.deleteByUsersAndRecipe(users, recipe);
	}
	//判斷是否存在關聯
	public Boolean exisitByUsersAndRecipe(Users users, Recipe recipe) {
		Boolean isExisit = cDao.existsByUsersAndRecipe(users, recipe);
		if(isExisit) {
			//true為已有關聯 -->  
			return true;
		}
		return false;
	}
	//新增為收藏
	public Collect saveUserandRecipe(Collect collect) {
		return cDao.save(collect);
	}
}
