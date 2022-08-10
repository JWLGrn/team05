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
import javax.persistence.Table;

@Entity
@Table(name="report")
public class Report {
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name="report_id")
	private int reportId;
	
	@Column(name="report_context")
	private String reportContext;
	
	@Column(name="report_time")
	private Date reportTime;
	
	@Column(name="report_type")
	private String reportType;
	
	@ManyToOne(fetch = FetchType.EAGER)
	@JoinColumn(name = "fk_report_users")
	private Users users;
	
	@ManyToOne(fetch = FetchType.EAGER)
	@JoinColumn(name = "fk_report_reply")
	private Reply reply;
	
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
