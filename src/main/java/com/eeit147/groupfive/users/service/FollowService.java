package com.eeit147.groupfive.users.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.eeit147.groupfive.users.model.Follow;
import com.eeit147.groupfive.users.model.FollowDao;
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
	
	public List<Follow> findByUsers(Users users){
		return flDao.findByUsers(users);
	}
}
