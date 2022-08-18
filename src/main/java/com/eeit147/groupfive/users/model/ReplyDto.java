package com.eeit147.groupfive.users.model;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;

import com.fasterxml.jackson.annotation.JsonProperty;

public class ReplyDto implements Serializable{
	
	@Autowired
	private UsersDao uDao;
	
	
	@JsonProperty("reply")
	private Integer replykind;//第一個都會讀不到?
	private Integer replytype;
	private Integer replytypeId;
	private Integer replyId;
	private Integer usersId;
	private String finallyPhoto;
	private String message;
	private String userName;
	private String userPhoto;
	

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public String getUserPhoto() {
		return userPhoto;
	}

	public void setUserPhoto(String userPhoto) {
		this.userPhoto = userPhoto;
	}

	public Integer getReplykind() {
		return replykind;
	}

	public void setReplykind(Integer replykind) {
		this.replykind = replykind;
	}
	public Integer getReplytype() {
		return replytype;
	}

	public void setReplytype(Integer replytype) {
		this.replytype = replytype;
	}

	public Integer getReplytypeId() {
		return replytypeId;
	}

	public void setReplytypeId(Integer replytypeId) {
		this.replytypeId = replytypeId;
	}

	public Integer getReplyId() {
		return replyId;
	}

	public void setReplyId(Integer replyId) {
		this.replyId = replyId;
	}

	public Integer getUsersId() {
		return usersId;
	}

	public void setUsersId(Integer usersId) {
		this.usersId = usersId;
	}

	public String getFinallyPhoto() {
		return finallyPhoto;
	}

	public void setFinallyPhoto(String finallyPhoto) {
		this.finallyPhoto = finallyPhoto;
	}

	public String getMessage() {
		return message;
	}

	public void setMessage(String message) {
		this.message = message;
	}

	public ReplyDto() {}
		
	public List<ReplyDto> changeReplyToDto(Iterable<Reply> replys,Integer replytype,Integer replytypeId,Integer userId){
		
		List<ReplyDto> dtolist=new ArrayList<ReplyDto>();
	
		for(Reply r:replys) {
			ReplyDto dto=new ReplyDto();
			dto.setReplytype(replytype);
			dto.setReplytypeId(replytypeId);
			dto.setReplyId(r.getReplyId());
			dto.setFinallyPhoto(r.getFinallyPhoto());
			dto.setMessage(r.getMessage());
			dto.setUsersId(userId);
			Optional<Users> optional = uDao.findById(userId);
			Users user = optional.get();
			dto.setUserName(user.getUserName());
			dto.setUserPhoto(user.getUserPhoto());	
		  System.out.println("!!!!!!!"+replytype);
		}
		return dtolist;
	}
	
}




