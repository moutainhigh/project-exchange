package com.throne212.oa.domain.doctor;

import java.util.Date;

public class Record {

	private Long id;// ����

	private Date date;//����

	private String content;//���
	
	private Long docId;//ҽ����id
	
	private Integer pOrder;//��ӡ���

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

	public Integer getpOrder() {
		return pOrder;
	}

	public void setpOrder(Integer pOrder) {
		this.pOrder = pOrder;
	}

}
