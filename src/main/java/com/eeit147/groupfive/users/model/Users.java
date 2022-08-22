package com.eeit147.groupfive.users.model;

import java.util.LinkedHashSet;
import java.util.Set;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;

import com.eeit147.groupfive.recipe.model.Recipe;
import com.fasterxml.jackson.annotation.JsonIgnore;
import com.fasterxml.jackson.annotation.JsonIgnoreProperties;


@Entity
@Table(name="users")
@JsonIgnoreProperties({"email","password"})
public class Users {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name="user_id")
	private Integer userId;
	
	@Column(name="email")
	private String email;
	
	@Column(name="password")
	private String password;
	
	@Column(name="user_name")
	private String userName;
	
	@Column(name="user_photo")
	private String userPhoto;
	
	@Column(name="permission")
	private Integer permission;
	
	@OneToMany(fetch = FetchType.LAZY,mappedBy = "users",cascade = CascadeType.ALL)
	private Set<Recipe> recipe= new LinkedHashSet<Recipe>();
	
	@OneToMany(fetch = FetchType.LAZY,mappedBy = "users",cascade = CascadeType.ALL)
	private Set<Donation> donation= new LinkedHashSet<Donation>();
	
	@OneToMany(fetch = FetchType.LAZY,mappedBy = "users",cascade = CascadeType.ALL)
	private Set<Favorite> favorite= new LinkedHashSet<Favorite>();
	
	@OneToMany(fetch = FetchType.LAZY,mappedBy = "users",cascade = CascadeType.ALL)
	private Set<Collect> collect= new LinkedHashSet<Collect>();
	
	@OneToMany(fetch = FetchType.LAZY,mappedBy = "users",cascade = CascadeType.ALL)
	private Set<Follow> follow= new LinkedHashSet<Follow>();
	
	@OneToMany(fetch = FetchType.LAZY,mappedBy = "track",cascade = CascadeType.ALL)
	private Set<Follow> track= new LinkedHashSet<Follow>();
	
	@OneToMany(fetch = FetchType.LAZY,mappedBy = "users",cascade = CascadeType.ALL)
	private Set<Posts> posts= new LinkedHashSet<Posts>();
	
	@OneToMany(fetch = FetchType.LAZY,mappedBy = "users",cascade = CascadeType.ALL)
	private Set<Report> report= new LinkedHashSet<Report>();
	
	@OneToMany(fetch = FetchType.LAZY,mappedBy = "users",cascade = CascadeType.ALL)
	private Set<Reply> reply= new LinkedHashSet<Reply>();

	public Users() {
	}

	public Users(String email, String password, String userName, String userPhoto, Integer permission) {
		super();
		this.email = email;
		this.password = password;
		this.userName = userName;
		this.userPhoto = userPhoto;
		this.permission = permission;
	}

	public Integer getUserId() {
		return userId;
	}

	public void setUserId(Integer userId) {
		this.userId = userId;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

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

	public Integer getPermission() {
		return permission;
	}

	public void setPermission(Integer permission) {
		this.permission = permission;
	}

	public Set<Recipe> getRecipe() {
		return recipe;
	}

	public void setRecipe(Set<Recipe> recipe) {
		this.recipe = recipe;
	}

	public Set<Donation> getDonation() {
		return donation;
	}

	public void setDonation(Set<Donation> donation) {
		this.donation = donation;
	}

	public Set<Favorite> getFavorite() {
		return favorite;
	}

	public void setFavorite(Set<Favorite> favorite) {
		this.favorite = favorite;
	}

	public Set<Collect> getCollect() {
		return collect;
	}

	public void setCollect(Set<Collect> collect) {
		this.collect = collect;
	}

	public Set<Follow> getFollow() {
		return follow;
	}

	public void setFollow(Set<Follow> follow) {
		this.follow = follow;
	}

	public Set<Follow> getTrack() {
		return track;
	}

	public void setTrack(Set<Follow> track) {
		this.track = track;
	}

	public Set<Posts> getPosts() {
		return posts;
	}

	public void setPosts(Set<Posts> posts) {
		this.posts = posts;
	}

	public Set<Report> getReport() {
		return report;
	}

	public void setReport(Set<Report> report) {
		this.report = report;
	}

	public Set<Reply> getReply() {
		return reply;
	}

	public void setReply(Set<Reply> reply) {
		this.reply = reply;
	}

	@Override
	public String toString() {
		StringBuilder builder = new StringBuilder();
		builder.append("Users [user_id=");
		builder.append(userId);
		builder.append(", email=");
		builder.append(email);
		builder.append(", password=");
		builder.append(password);
		builder.append(", userName=");
		builder.append(userName);
		builder.append(", userPhoto=");
		builder.append(userPhoto);
		builder.append(", permission=");
		builder.append(permission);
		builder.append("]");
		return builder.toString();
	}
	
}
