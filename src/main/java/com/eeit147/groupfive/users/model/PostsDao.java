package com.eeit147.groupfive.users.model;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

@Repository
@Transactional
public interface PostsDao extends JpaRepository<Posts, Integer> {

	public List<Posts> findTop4ByOrderByTimeDesc();
	
}
