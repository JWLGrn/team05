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
@Table(name = "donation")
public class Donation {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "donation_id")
	private Integer donationId;

	@Column(name = "price")
	private Integer price;

	@JsonFormat(pattern = "yyyy/MM/dd", timezone = "Asia/Taipei") // for JSON 需加timezone時區
	@DateTimeFormat(pattern = "yyyy/MM/dd") // for SpringMVC
	@Temporal(TemporalType.DATE)
	@Column(name = "donate_date")
	private Date donateDate;

	@Column(name = "phone")
	private Integer phone;

	@Column(name = "address")
	private String address;

	@Column(name = "tradeno")
	private String tradeno;

	@PrePersist // 物件轉換成 Persistent(永續) 狀態前要執行的方法
	public void onCreate() {
		// 若added為空則放入當下時間
		if (donateDate == null) {
			donateDate = new Date();
		}
	}

	@JsonIgnore
	@ManyToOne(fetch = FetchType.EAGER)
	@JoinColumn(name = "fk_donation_users")
	private Users users;

	public Donation() {
	}

	public Donation(Integer donationId, Integer price, Date donateDate, Integer phone, String address, String tradeno,
			Users users) {
		super();
		this.donationId = donationId;
		this.price = price;
		this.donateDate = donateDate;
		this.phone = phone;
		this.address = address;
		this.tradeno = tradeno;
		this.users = users;
	}

	public Integer getPhone() {
		return phone;
	}

	public void setPhone(Integer phone) {
		this.phone = phone;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
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

	public String getTradeno() {
		return tradeno;
	}

	public void setTradeno(String tradeno) {
		this.tradeno = tradeno;
	}

}
