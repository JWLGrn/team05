package com.eeit147.groupfive.reply.service;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.eeit147.groupfive.users.model.Posts;
import com.eeit147.groupfive.users.model.PostsDao;
import com.eeit147.groupfive.users.model.Reply;
import com.eeit147.groupfive.users.model.ReplyDao;

@Service
@Transactional
public class ReplyService {
	@Autowired
	private ReplyDao replyDao;
	
	@Autowired
	private PostsDao pDao;
	
//食譜類	
	public Reply insertReply(Reply reply) {
		return replyDao.save(reply);
	}
	
	// 文章留言
	public List<Reply> findPostAllReply(Integer postId){
		Optional<Posts> op = pDao.findById(postId);
		if(op.isPresent()) {
			Posts post = op.get();
			List<Reply> replys = replyDao.findByPostsOrderByUploadTimeAsc(post);
			return replys;
		}
		
		return null;
	}
	
}
