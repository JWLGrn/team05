package com.eeit147.groupfive.users.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.eeit147.groupfive.recipe.model.Recipe;
import com.eeit147.groupfive.users.model.Favorite;
import com.eeit147.groupfive.users.model.Follow;
import com.eeit147.groupfive.users.model.FollowDao;
import com.eeit147.groupfive.users.model.FollowDto;
import com.eeit147.groupfive.users.model.Users;

@Service
@Transactional
public class FollowService {
	
	@Autowired
	private FollowDao flDao;
	//關聯
	public boolean existsByUsersAndTrack(Users users,Users track) {
		
		Boolean isExists = flDao.existsByUsersAndTrack(users, track);
		if(isExists) {
			return true;	
		}
		System.out.println("isExists:"+isExists);
		return false;
	}
	//刪除
	public void deleteByUsersAndTrack(Users users,Users track) {
		flDao.deleteByUsersAndTrack(users, track);
	}
	//新增
	public Follow saveUserandTrack(Follow follow) {
		return flDao.save(follow);
	}
	//追蹤頁面以及查詢追蹤人的回傳資料
	public List<FollowDto> findByUsers(Users users){
		List<Follow> follow = flDao.findByUsers(users);
		List<FollowDto> list = new ArrayList<FollowDto>();
		//把使用者追蹤的人 一個個拿出來
		 for(Follow element : follow) {
			 int followCount = 0;
			 int recipeCount = 0;
			 int favoriteCount = 0;
			 //先把我追蹤的人 他追蹤的人 計算出來
			 for(Follow e1 : element.getTrack().getTrack()) {
				 followCount ++;
			 }
			 //先把我追蹤人的食譜給抓出來 並統計出來總共有幾筆食譜
			 for(Recipe e2 : element.getTrack().getRecipe()) {
				 System.out.println(e2.getRecipeId());
				 recipeCount ++;
			 }
			 //先把我追蹤人的食譜一個一個抓出來
			 for(Recipe e3 : element.getTrack().getRecipe()) {
				 //再將一筆一筆食譜的按讚數給統計出來
				 favoriteCount += e3.getFavorite().size();
			 }
			 list.add(new FollowDto(element.getUserName(), element.getUserPhoto(),followCount, recipeCount, favoriteCount,element.getTrack().getUserId()));
		 }
//		m.addAttribute("follow", follow);
		return list;
		
	}
}
