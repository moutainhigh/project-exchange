package com.throne212.saishi.domain;

//页码内容
public class Content extends MyEntity {
	private String picNews;
	private String picImage;
	private String picNewsUrl;

	private String videoNews;
	private String videoImage;
	private String videoNewsUrl;

	private String adImage;
	private String adUrl;

	public String getPicNews() {
		return picNews;
	}

	public void setPicNews(String picNews) {
		this.picNews = picNews;
	}

	public String getPicImage() {
		return picImage;
	}

	public void setPicImage(String picImage) {
		this.picImage = picImage;
	}

	public String getPicNewsUrl() {
		return picNewsUrl;
	}

	public void setPicNewsUrl(String picNewsUrl) {
		this.picNewsUrl = picNewsUrl;
	}

	public String getVideoNews() {
		return videoNews;
	}

	public void setVideoNews(String videoNews) {
		this.videoNews = videoNews;
	}

	public String getVideoImage() {
		return videoImage;
	}

	public void setVideoImage(String videoImage) {
		this.videoImage = videoImage;
	}

	public String getVideoNewsUrl() {
		return videoNewsUrl;
	}

	public void setVideoNewsUrl(String videoNewsUrl) {
		this.videoNewsUrl = videoNewsUrl;
	}

	public String getAdImage() {
		return adImage;
	}

	public void setAdImage(String adImage) {
		this.adImage = adImage;
	}

	public String getAdUrl() {
		return adUrl;
	}

	public void setAdUrl(String adUrl) {
		this.adUrl = adUrl;
	}

}
