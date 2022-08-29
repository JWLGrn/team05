package com.eeit147.groupfive.users.model;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.eeit147.groupfive.recipe.model.Recipe;

@Repository
@Transactional
public interface PostsDao extends JpaRepository<Posts, Integer> {

	public List<Posts> findTop4ByOrderByTimeDesc();
	
	@Query(value="SELECT TOP (:number) * FROM Posts ORDER BY NEWID()", nativeQuery = true)
	public List<Posts> findRandomPosts(@Param("number") Integer number);
	
}
