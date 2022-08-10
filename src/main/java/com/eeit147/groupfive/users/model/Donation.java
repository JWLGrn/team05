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
@Table(name="donation")
public class Donation {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name="donation_id")
	private Integer donationId;
	
	@Column(name="price")
	private Integer price;
	
	@Column(name="donate_date")
	private Date donateDate;
	
	@ManyToOne(fetch = FetchType.EAGER)
	@JoinColumn(name = "fk_donation_users")
	private Users users;

	public Donation() {
	}

	public Donation(Integer donationId, Integer price, Date donateDate, Users users) {
		super();
		this.donationId = donationId;
		this.price = price;
		this.donateDate = donateDate;
		this.users = users;
	}

	public Integer getDonationId() {
		return donationId;
	}

	public void setDonationId(Integer donationId) {
		this.donationId = donationId;
	}

	public Integer getPrice() {
		return price;
	}

	public void setPrice(Integer price) {
		this.price = price;
	}

	public Date getDonateDate() {
		return donateDate;
	}

	public void setDonateDate(Date donateDate) {
		this.donateDate = donateDate;
	}

	public Users getUsers() {
		return users;
	}

	public void setUsers(Users users) {
		this.users = users;
	}
	
}
