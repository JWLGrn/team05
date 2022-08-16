package com.eeit147.groupfive.admin.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;

import com.eeit147.groupfive.users.model.Users;
import com.eeit147.groupfive.users.model.UsersDao;

@Service
@Transactional
public class adminUsersService {
	
	@Autowired
	private UsersDao uDao;
	
		public Users insertUser(Users user) {
			Users u = uDao.save(user);
			return u;
		}
	
		//刪除使用者
				public void deleteUser(Integer userId) {
					uDao.deleteById(userId);
				}

}
