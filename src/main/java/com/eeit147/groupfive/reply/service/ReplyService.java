package com.eeit147.groupfive.reply.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.eeit147.groupfive.users.model.Reply;
import com.eeit147.groupfive.users.model.ReplyDao;

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
