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

import com.fasterxml.jackson.annotation.JsonFormat;
import com.fasterxml.jackson.annotation.JsonIgnore;

@Entity
@Table(name="posts")
public class Posts {
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "posts_id")
	private Integer postsId;
	
	@Column(name = "title")
	private String title;
	
	@Column(name = "context")
	private String context;
	
	@Column(name = "postphoto")
	private String postphoto;
	
	@Column(name = "outline")
	private String outline;
	
	@JsonFormat(pattern = "yyyy/MM/dd HH:mm:ss",timezone = "Asia/Taipei") //for JSON  需加timezone時區
	@DateTimeFormat(pattern = "yyyy/MM/dd HH:mm:ss") //for SpringMVC
	@Temporal(TemporalType.TIMESTAMP)
	@Column(name = "time")
	private Date time;
	
	@PrePersist //物件轉換成 Persistent(永續) 狀態前要執行的方法
	public void onCreate() {
		//若added為空則放入當下時間
		if(time == null) {
			time = new Date();
		}
	}
	
	@JsonIgnore
	@ManyToOne(fetch = FetchType.EAGER)
	@JoinColumn(name = "fk_posts_users")
	private Users users; 
	
	@OneToMany(fetch = FetchType.LAZY,mappedBy = "posts",cascade = CascadeType.ALL)
	private Set<Reply> reply=new LinkedHashSet<Reply>();
	
	@OneToMany(fetch = FetchType.LAZY,mappedBy = "posts",cascade = CascadeType.ALL)
	private Set<Report> report=new LinkedHashSet<Report>();

	public Posts() {
	}
	
	public Posts(String title, String context, Date time, Users users) {
		super();
		this.title = title;
		this.context = context;
		this.time = time;
		this.users = users;
	}

	public Integer getPostsId() {
		return postsId;
	}

	public void setPostsId(Integer postsId) {
		this.postsId = postsId;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getContext() {
		return context;
	}

	public void setContext(String context) {
		this.context = context;
	}

	public Date getTime() {
		return time;
	}

	public void setTime(Date time) {
		this.time = time;
	}

	public String getPostphoto() {
		return postphoto;
	}

	public void setPostphoto(String postphoto) {
		this.postphoto = postphoto;
	}

	public String getOutline() {
		return outline;
	}

	public void setOutline(String outline) {
		this.outline = outline;
	}

	public Users getUsers() {
		return users;
	}

	public void setUsers(Users users) {
		this.users = users;
	}

	public Set<Reply> getReply() {
		return reply;
	}

	public void setReply(Set<Reply> reply) {
		this.reply = reply;
	}

	public Set<Report> getReport() {
		return report;
	}

	public void setReport(Set<Report> report) {
		this.report = report;
	}

	@Override
	public String toString() {
		return "Posts [title=" + title + ", context=" + context + ", postphoto=" + postphoto + ", outline=" + outline
				+ "]";
	}
	

}
