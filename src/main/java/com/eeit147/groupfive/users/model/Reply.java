package com.eeit147.groupfive.users.model;

import java.util.Date;
import java.util.LinkedHashSet;
import java.util.Set;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.PrePersist;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

import org.springframework.format.annotation.DateTimeFormat;

import com.eeit147.groupfive.recipe.model.Recipe;
import com.fasterxml.jackson.annotation.JsonFormat;
import com.fasterxml.jackson.annotation.JsonIgnore;

@Entity
@Table(name="reply")
public class Reply {
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name="reply_id")
	private Integer replyId;
	
	@Column(name="message")
	private String message;
	
	@Column(name="finally_photo")
	private String finallyPhoto;
	
	@JsonFormat(pattern = "yyyy/MM/dd HH:mm:ss",timezone = "Asia/Taipei") //for JSON  需加timezone時區
	@DateTimeFormat(pattern = "yyyy/MM/dd HH:mm:ss") //for SpringMVC
	@Temporal(TemporalType.TIMESTAMP)
	@Column(name="upload_time")
	private Date uploadTime;
	
	@PrePersist //物件轉換成 Persistent(永續) 狀態前要執行的方法
	public void onCreate() {
		//若added為空則放入當下時間
		if(uploadTime == null) {
			uploadTime = new Date();
		}
	}
	
	@JsonIgnore
	@ManyToOne(fetch = FetchType.EAGER)
	@JoinColumn(name = "fk_reply_users")
	private Users users;
	
	@JsonIgnore
	@ManyToOne(fetch = FetchType.EAGER)
	@JoinColumn(name = "fk_reply_recipe")
	private Recipe recipe;
	
	@JsonIgnore
	@ManyToOne(fetch = FetchType.EAGER)
	@JoinColumn(name = "fk_reply_posts")
	private Posts posts;
	
	@OneToMany(fetch = FetchType.LAZY,mappedBy = "reply",cascade = CascadeType.ALL)
	private Set<Report> report= new LinkedHashSet<Report>();

	public Reply() {
	}

	public Reply(Integer replyId, String message, String finallyPhoto, Date uploadTime) {
		super();
		this.replyId = replyId;
		this.message = message;
		this.finallyPhoto = finallyPhoto;
		this.uploadTime = uploadTime;
	}

	public Integer getReplyId() {
		return replyId;
	}

	public void setReplyId(Integer replyId) {
		this.replyId = replyId;
	}

	public String getMessage() {
		return message;
	}

	public void setMessage(String message) {
		this.message = message;
	}

	public String getFinallyPhoto() {
		return finallyPhoto;
	}

	public void setFinallyPhoto(String finallyPhoto) {
		this.finallyPhoto = finallyPhoto;
	}

	public Date getUploadTime() {
		return uploadTime;
	}

	public void setUploadTime(Date uploadTime) {
		this.uploadTime = uploadTime;
	}

	public Users getUsers() {
		return users;
	}

	public void setUsers(Users users) {
		this.users = users;
	}

	public Recipe getRecipe() {
		return recipe;
	}

	public void setRecipe(Recipe recipe) {
		this.recipe = recipe;
	}

	public Posts getPosts() {
		return posts;
	}

	public void setPosts(Posts posts) {
		this.posts = posts;
	}

	public Set<Report> getReport() {
		return report;
	}

	public void setReport(Set<Report> report) {
		this.report = report;
	}
//------------------------------------------------------------	
	
	
	public String getUserName() {
		return users.getUserName();
	}
	public String getUserPhoto() {
		return users.getUserPhoto();
	}

	public Integer getUserId() {
		return users.getUserId();
	}
	
}
