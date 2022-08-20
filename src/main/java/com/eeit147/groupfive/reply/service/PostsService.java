package com.eeit147.groupfive.reply.service;

import java.io.File;
import java.io.IOException;
import java.util.Date;
import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

import com.eeit147.groupfive.users.model.Posts;
import com.eeit147.groupfive.users.model.PostsDao;
import com.eeit147.groupfive.users.model.Users;
import com.eeit147.groupfive.users.model.UsersDao;

@Service
@Transactional
public class PostsService {

	@Autowired
	private PostsDao pDao;
	
	@Autowired
	private UsersDao uDao;
	
	// 新增文章
	public Posts addPost(Posts posts,MultipartFile photo) {
		Integer userid=1;
		Optional<Users> op = uDao.findById(userid);
		if(op.isPresent()) {
			Users u = op.get();
			posts.setUsers(u);
		}
		
		Posts post = pDao.save(posts);
		
		Integer postId = post.getPostsId();
		post.setPostphoto("posts"+ postId + ".jpeg");
		
		//儲存圖片
		if(!photo.isEmpty()) {
			try {
				photo.transferTo(new File(
						"C:\\Git\\Project\\team05\\src\\main\\webapp\\image\\posts\\posts" + postId + ".jpeg"));
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
		
		Posts newPost = pDao.save(post);
		return newPost;
	}

	// 查詢文章 by Id
	public Posts findPostById(Integer postsId) {
		Optional<Posts> op = pDao.findById(postsId);
		if(op.isPresent()) {
			Posts post = op.get();
			return post;
		}
		return null;
	}

	// 查詢全部文章(分頁)
	public Page<Posts> findAllByPage(Integer pageNumber){
		PageRequest page = PageRequest.of(pageNumber-1, 4, Sort.Direction.DESC, "time");
		Page<Posts> postPage = pDao.findAll(page);
		return postPage;
	}

	// 刪除文章 by Id
	public void deletePost(Integer postsId) {
		if(postsId != null) {
			pDao.deleteById(postsId);
			
			// 刪除圖片
			try { 
	          File file = new File("C:\\Git\\Project\\team05\\src\\main\\webapp\\image\\posts\\posts" + postsId + ".jpeg");
	          if(file.exists()) {
	        	  file.delete();
	        	  System.out.println("刪除成功:posts"+postsId+ ".jpeg");
	          }
	        }catch(Exception e){
	              System.out.println("刪除失敗 !!");
	          }
		}
		
		
	}

	// 修改文章
	public Posts updatePost(Posts posts,MultipartFile photo) {
		Optional<Posts> op = pDao.findById(posts.getPostsId());
		if(op.isPresent()) {
			Posts updatePost = op.get();
			updatePost.setTitle(posts.getTitle());
			updatePost.setOutline(posts.getOutline());
			updatePost.setContext(posts.getContext());
			updatePost.setTime(new Date());
			
		if(photo!=null) {
			try {
					photo.transferTo(new File(
						"C:\\Git\\Project\\team05\\src\\main\\webapp\\image\\posts\\posts" + updatePost.getPostsId() + ".jpeg"));
				} catch (IOException e) {
					e.printStackTrace();
				}
			}
		
			Posts post = pDao.save(updatePost);
			return post;
		}
		
		return null;
	}
}
