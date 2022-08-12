package com.eeit147.groupfive.users.model;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.PrePersist;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

import org.springframework.format.annotation.DateTimeFormat;

import com.fasterxml.jackson.annotation.JsonFormat;
import com.fasterxml.jackson.annotation.JsonIgnore;

@Entity
@Table(name="report")
public class Report {
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name="report_id")
	private int reportId;
	
	@Column(name="report_context")
	private String reportContext;
	
	@JsonFormat(pattern = "yyyy/MM/dd HH:mm:ss",timezone = "Asia/Taipei") //for JSON  需加timezone時區
	@DateTimeFormat(pattern = "yyyy/MM/dd HH:mm:ss") //for SpringMVC
	@Temporal(TemporalType.TIMESTAMP)
	@Column(name="report_time")
	private Date reportTime;
	
	@PrePersist //物件轉換成 Persistent(永續) 狀態前要執行的方法
	public void onCreate() {
		//若added為空則放入當下時間
		if(reportTime == null) {
			reportTime = new Date();
		}
	}
	
	@Column(name="report_type")
	private String reportType;
	
	@JsonIgnore
	@ManyToOne(fetch = FetchType.EAGER)
	@JoinColumn(name = "fk_report_users")
	private Users users;
	
	@JsonIgnore
	@ManyToOne(fetch = FetchType.EAGER)
	@JoinColumn(name = "fk_report_reply")
	private Reply reply;
	
	@JsonIgnore
	@ManyToOne(fetch = FetchType.EAGER)
	@JoinColumn(name = "fk_report_posts")
	private Posts posts;

	public Report() {
	}
	
	public Report(int reportId, String reportContext, Date reportTime, String reportType, Users users, Reply reply,
			Posts posts) {
		super();
		this.reportId = reportId;
		this.reportContext = reportContext;
		this.reportTime = reportTime;
		this.reportType = reportType;
		this.users = users;
		this.reply = reply;
		this.posts = posts;
	}

	public Users getUsers() {
		return users;
	}

	public void setUsers(Users users) {
		this.users = users;
	}

	public Reply getReply() {
		return reply;
	}

	public void setReply(Reply reply) {
		this.reply = reply;
	}

	public Posts getPosts() {
		return posts;
	}

	public void setPosts(Posts posts) {
		this.posts = posts;
	}
	
	

}
