package com.eeit147.groupfive.users.model;

import java.util.Optional;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

@Repository
public interface UsersDao extends JpaRepository<Users, Integer> {
	
	//查詢帳號密碼的語句
	@Query(value = "from Users where email = :email and password = :password ")
	public Optional<Users> findUsersByEmailandPassWord(@Param("email")String email,@Param("password")String password);
}
