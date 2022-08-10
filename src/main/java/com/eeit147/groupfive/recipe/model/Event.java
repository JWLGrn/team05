package com.eeit147.groupfive.recipe.model;

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
import javax.persistence.OneToMany;
import javax.persistence.Table;

@Entity
@Table(name="event")
public class Event {
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name="event_id")
	private Integer eventId;
	
	@Column(name="event_title")
	private String eventTitle;
	
	@Column(name="event_context")
	private String eventContext;
	
	@Column(name="time_start")
	private Date timeStart;
	
	@Column(name="time_end")
	private Date timeEnd;
	
	@Column(name="event_photo")
	private String eventPhoto;
	
	@OneToMany(fetch = FetchType.LAZY,mappedBy = "event",cascade = CascadeType.ALL)
	private Set<Campaign> campaign= new LinkedHashSet<Campaign>();

	public Event() {
	}

	public Event(Integer eventId, String eventTitle, String eventContext, Date timeStart, Date timeEnd,
			String eventPhoto) {
		super();
		this.eventId = eventId;
		this.eventTitle = eventTitle;
		this.eventContext = eventContext;
		this.timeStart = timeStart;
		this.timeEnd = timeEnd;
		this.eventPhoto = eventPhoto;
	}

	public Integer getEventId() {
		return eventId;
	}

	public void setEventId(Integer eventId) {
		this.eventId = eventId;
	}

	public String getEventTitle() {
		return eventTitle;
	}

	public void setEventTitle(String eventTitle) {
		this.eventTitle = eventTitle;
	}

	public String getEventContext() {
		return eventContext;
	}

	public void setEventContext(String eventContext) {
		this.eventContext = eventContext;
	}

	public Date getTimeStart() {
		return timeStart;
	}

	public void setTimeStart(Date timeStart) {
		this.timeStart = timeStart;
	}

	public Date getTimeEnd() {
		return timeEnd;
	}

	public void setTimeEnd(Date timeEnd) {
		this.timeEnd = timeEnd;
	}

	public String getEventPhoto() {
		return eventPhoto;
	}

	public void setEventPhoto(String eventPhoto) {
		this.eventPhoto = eventPhoto;
	}

	public Set<Campaign> getCampaign() {
		return campaign;
	}

	public void setCampaign(Set<Campaign> campaign) {
		this.campaign = campaign;
	}

}
