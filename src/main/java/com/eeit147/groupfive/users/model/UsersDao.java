package com.eeit147.groupfive.users.model;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

@Repository
@Transactional
public interface UsersDao extends JpaRepository<Users, Integer> {
	
	

}
