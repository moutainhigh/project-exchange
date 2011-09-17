package com.throne212.fupin.domain;

import java.util.Date;

public class Record extends MyEntity {
	private String content;//扶持内容
	private String status;//审核状态
	private String reason;//不通过原因
	private Date recordDate;//到户日期
	private Family family;//帮扶农户
	
	private String year;
	private String s1;
	private String s2;
	private String s3;
	private String s4;
	
	public String getShortContent(){
		if(content == null)
			return null;
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
	public Date getRecordDate() {
		return recordDate;
	}
	public void setRecordDate(Date recordDate) {
		this.recordDate = recordDate;
	}
	public Family getFamily() {
		return family;
	}
	public void setFamily(Family family) {
		this.family = family;
	}

	public String getS1() {
		return s1;
	}

	public void setS1(String s1) {
		this.s1 = s1;
	}

	public String getS2() {
		return s2;
	}

	public void setS2(String s2) {
		this.s2 = s2;
	}

	public String getS3() {
		return s3;
	}

	public void setS3(String s3) {
		this.s3 = s3;
	}

	public String getS4() {
		return s4;
	}

	public void setS4(String s4) {
		this.s4 = s4;
	}

	public String getYear() {
		return year;
	}

	public void setYear(String year) {
		this.year = year;
	}
	
}
