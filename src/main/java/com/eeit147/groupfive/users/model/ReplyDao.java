package com.eeit147.groupfive.users.model;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

@Repository
@Transactional
public interface ReplyDao extends JpaRepository<Reply, Integer> {
	
	@Query(value="select * from reply Where fk_reply_recipe = :recipeId ORDER BY upload_time DESC", nativeQuery = true)
	public List<Reply> findAllByRecipeReplyById(@Param("recipeId")Integer recipeId);
	
	@Query(value="select * from reply Where fk_reply_posts = :postsId ORDER BY upload_time DESC", nativeQuery = true)
	public List<Reply> findAllByPostsReplyById(@Param("postsId")Integer postsId);
	
	
}
