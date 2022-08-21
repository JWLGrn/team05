package com.eeit147.groupfive.admin.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.eeit147.groupfive.recipe.model.Foods;
import com.eeit147.groupfive.users.model.Users;
import com.eeit147.groupfive.users.model.UsersDao;

@Service
@Transactional
public class adminUsersService {
	
	@Autowired
	private UsersDao uDao;
	
	//加入使用者
	public Users insertUser(Users user) {
		Users u = uDao.save(user);
		return u;
		}
	
	//刪除使用者
	public void deleteUser(Integer userId) {
		uDao.deleteById(userId);
		}
	
	//驗證使用者是否已存在
	public List<Users> findByUserNameLike(String username) {
		List<Users> userList = uDao.findByUserNameLike(username);	
		System.out.println("userList:"+userList.toString());
		return userList;
	}
}
