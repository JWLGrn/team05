package com.eeit147.groupfive.users.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

import com.fasterxml.jackson.annotation.JsonIgnore;

@Entity
@Table(name="follow")
public class Follow {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name="follow_id")
	private Integer followId;
	
	@JsonIgnore
	@ManyToOne(fetch = FetchType.EAGER)
	@JoinColumn(name = "fk_follow_users")
	private Users users;
	
	@JsonIgnore
	@ManyToOne(fetch = FetchType.EAGER)
	@JoinColumn(name = "fk_follow_track")
	private Users track;
	
	public Follow() {
	}

	public Follow(Integer followId, Users users, Users track) {
		super();
		this.followId = followId;
		this.users = users;
		this.track = track;
	}

	public Follow(Users users, Users track) {
		super();
		this.users = users;
		this.track = track;
	}

	public Integer getFollowId() {
		return followId;
	}

	public void setFollowId(Integer followId) {
		this.followId = followId;
	}

	public Users getUsers() {
		return users;
	}

	public void setUsers(Users users) {
		this.users = users;
	}

	public Users getTrack() {
		return track;
	}

	public void setTrack(Users track) {
		this.track = track;
	}

	@Override
	public String toString() {
		return "Follow [followId=" + followId + ", users=" + users + ", track=" + track + "]";
	}
	public String getUserName() {
		return track.getUserName();
	}
	public String getUserPhoto() {
		return track.getUserPhoto();
	}
	
}
