package com.eeit147.groupfive.recipe.model;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;

import com.fasterxml.jackson.annotation.JsonProperty;

public class EventDto implements Serializable{
	

	@JsonProperty("event")
	private Integer eventTest;//第一個都會讀不到?
	private Integer eventId;
	private String eventTitle;
	private String eventContext;
	private String timeStart;
	private String timeEnd;
	private String eventPhoto;
	
	public EventDto() {
		
	} 
	
	public Integer getEventTest() {
		return eventTest;
	}
	public void setEventTest(Integer eventTest) {
		this.eventTest = eventTest;
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
	
	public String getTimeStart() {
		return timeStart;
	}

	public void setTimeStart(String timeStart) {
		this.timeStart = timeStart;
	}

	public String getTimeEnd() {
		return timeEnd;
	}

	public void setTimeEnd(String timeEnd) {
		this.timeEnd = timeEnd;
	}

	public String getEventPhoto() {
		return eventPhoto;
	}
	public void setEventPhoto(String eventPhoto) {
		this.eventPhoto = eventPhoto;
	}
	
	
}




