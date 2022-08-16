package com.eeit147.groupfive.recipe.model;

import java.io.Serializable;

import org.springframework.web.multipart.MultipartFile;

import com.fasterxml.jackson.annotation.JsonProperty;

public class ReplyDto implements Serializable{
	
	@JsonProperty("reply")
	private Integer rtype;
	private Integer replytypeId;
	private Integer replyId;
	private Integer usersId;
	private MultipartFile finallyPhoto;
	private String message;
	private Integer other;

	
	public Integer getOther() {
		return other;
	}

	public void setOther(Integer other) {
		this.other = other;
	}

	public Integer getRtype() {
		return rtype;
	}

	public void setRtype(Integer type) {
		this.rtype = type;
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

	public MultipartFile getFinallyPhoto() {
		return finallyPhoto;
	}

	public void setFinallyPhoto(MultipartFile finallyPhoto) {
		this.finallyPhoto = finallyPhoto;
	}

	public String getMessage() {
		return message;
	}

	public void setMessage(String message) {
		this.message = message;
	}

	public ReplyDto() {}
		
	
	
}




