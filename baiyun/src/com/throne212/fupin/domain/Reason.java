package com.throne212.fupin.domain;

public class Reason extends MyEntity {
	private String content;//原因
	private String status;//审核状态
	private String reason;//不通过原因
	private String year;
	private String cuoshiContent;
	private Family family;
	
	public String getShortContent(){
		String shortContent;
		if (this.getContent().length()>16) {
			shortContent=this.getContent().substring(0, 16);
		}else {
			shortContent=this.getContent();
		}
		return shortContent;
	}
	
	
	public String getContent() {
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
	public String getReason() {
		return reason;
	}
	public void setReason(String reason) {
		this.reason = reason;
	}
	public Family getFamily() {
		return family;
	}
	public void setFamily(Family family) {
		this.family = family;
	}
	public String getYear() {
		return year;
	}
	public void setYear(String year) {
		this.year = year;
	}
	public String getCuoshiContent() {
		return cuoshiContent;
	}
	public void setCuoshiContent(String cuoshiContent) {
		this.cuoshiContent = cuoshiContent;
	}
	
	

}
