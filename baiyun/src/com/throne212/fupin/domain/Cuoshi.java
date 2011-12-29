package com.throne212.fupin.domain;

public class Cuoshi extends MyEntity {
	
	private String year;//年度
	private String season;//季度
	private String content;//措施内容
	private String status;//审核状态
	private String type;//措施类型
	private String reason;//原因
	
	public String getShortContent(){
		String shortContent;
		if(this.getContent() == null){
			return "";
		}else if (content.length()>16) {
			shortContent=content.substring(0, 16);
		}else {
			shortContent=content;
		}
		return shortContent;
	}
	public String getYear() {
		return year;
	}
	public void setYear(String year) {
		this.year = year;
	}

	public String getSeason() {
		return season;
	}
	public void setSeason(String season) {
		this.season = season;
	}
	public String getContent() {
		//整理content
		if(content==null){
			content = this.segment3;
			if(content == null){
				content = this.segment4;
			}
		}
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}
	public String getReason() {
		return reason;
	}
	public void setReason(String reason) {
		this.reason = reason;
	}
	
	

}
