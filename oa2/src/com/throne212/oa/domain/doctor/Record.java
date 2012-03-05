package com.throne212.oa.domain.doctor;

import java.util.Date;

public class Record {

	private Long id;// 主键

	private Date date;//日期

	private String content;//情况
	
	private Long docId;//医生的id

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public Date getDate() {
		return date;
	}

	public void setDate(Date date) {
		this.date = date;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public Long getDocId() {
		return docId;
	}

	public void setDocId(Long docId) {
		this.docId = docId;
	}

}
