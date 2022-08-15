package com.eeit147.groupfive.reply.service;

import org.springframework.transaction.annotation.Transactional;


import com.eeit147.groupfive.recipe.model.Recipe;
import com.eeit147.groupfive.recipe.model.RecipeDao;
import com.eeit147.groupfive.users.model.Reply;
import com.eeit147.groupfive.users.model.ReplyDao;
import com.eeit147.groupfive.users.model.Users;
import com.eeit147.groupfive.users.model.UsersDao;

import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
@Transactional
public class ReplyService {
	@Autowired
	private ReplyDao replyDao;
	
//食譜類	
	public Reply insertReply(Reply reply) {
		return replyDao.save(reply);
	}
	
}
