package com.eeit147.groupfive.users.model;

import java.util.List;
import java.util.Optional;
import java.util.Set;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import com.eeit147.groupfive.recipe.model.Recipe;

@Repository
public interface ReplyDao extends JpaRepository<Reply, Integer> {
	

}
