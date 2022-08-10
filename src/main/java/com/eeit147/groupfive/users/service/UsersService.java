package com.eeit147.groupfive.users.service;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.eeit147.groupfive.users.model.Users;
import com.eeit147.groupfive.users.model.UsersDao;

@Service
@Transactional
public class UsersService {
	
	@Autowired
	private UsersDao uDao;
	
	
	//新增一位會員
	public Users insertUser(Users user) {
		
		return uDao.save(user);
	}
	
	//利用ID查詢會員資料
	public List<Users> findUsersById(Integer id){
		Optional<Users> Optional = uDao.findById(id);
		if(Optional !=null) {
			Optional.get();
		}
		return null;
	}
	//查詢所有會員
	public List<Users> findAllUsers(){
		return uDao.findAll();
	}
	
112

}
