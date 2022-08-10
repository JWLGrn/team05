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
	private UsersDao UDao;
	
	
	//新增一位會員
	public Users insertUser(Users user) {
		
		return UDao.save(user);
	}
	
	//利用ID查詢會員資料
	public List<Users> findUsersById(Integer id){
		Optional<Users> Optional = UDao.findById(id);
		if(Optional !=null) {
			Optional.get();
		}
		return null;
	}
	public Users findByIdOneUsers(Integer id) {
		Optional<Users> optional = UDao.findById(id);
		if(optional != null) {
			optional.get();
		}
		return null;
	}
	//查詢所有會員
	public List<Users> findAllUsers(){
		return UDao.findAll();
	}
	
	//利用ID刪除會員資料
	public void deleteById(Integer id) {
		UDao.deleteById(id);
	}
	//登入
	public Users findUsersByEmailandPassword(String email,String password){
		Optional<Users> optional = UDao.findUsersByEmailandPassWord(email, password);
		
		if(optional.isPresent()) {
			return optional.get();
		}
		return null;
	}
//<<<<<<< HEAD
//=======
//
//>>>>>>> team05/master

}
