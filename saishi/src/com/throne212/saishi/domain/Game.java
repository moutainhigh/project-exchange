package com.throne212.saishi.domain;

import java.util.Date;



public class Game extends MyEntity {
	private Date startDate;
	private String hour;
	private String minute;
	private String intro;
	private String player;
	private String type;
	private String duration;
	private String url;
	
	public String getShortIntro(){
		String shortIntro;
		if (this.getIntro().length()>16) {
			shortIntro=this.getIntro().substring(0, 16)+"...";
		}else {
			shortIntro=this.getIntro();
		}
		return shortIntro;
	}
	public Date getStartDate() {
		return startDate;
	}
	public void setStartDate(Date startDate) {
		this.startDate = startDate;
	}
	public String getPlayer() {
		return player;
	}
	public void setPlayer(String player) {
		this.player = player;
	}
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}
	public String getDuration() {
		return duration;
	}
	public void setDuration(String duration) {
		this.duration = duration;
	}
	public String getIntro() {
		return intro;
	}
	public void setIntro(String intro) {
		this.intro = intro;
	}
	public String getHour() {
		return hour;
	}
	public void setHour(String hour) {
		this.hour = hour;
	}
	public String getMinute() {
		return minute;
	}
	public void setMinute(String minute) {
		this.minute = minute;
	}
	public String getUrl() {
		return url;
	}
	public void setUrl(String url) {
		this.url = url;
	}

}
