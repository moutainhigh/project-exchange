package com.throne212.fupin.domain;

import java.io.Serializable;
import java.util.Date;

//����ʵ��ĳ�����
public abstract class MyEntity implements Serializable{
	protected Long id;//
	protected Date createDate;// ��������
	protected String createName;// ���������
	protected String segment1;//�Զ���1
	protected String segment2;//�Զ���2
	protected String segment3;//�Զ���3
	protected String segment4;//�Զ���4
	protected String segment5;//�Զ���5
	
	//getter and setter

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public Date getCreateDate() {
		return createDate;
	}

	public void setCreateDate(Date createDate) {
		this.createDate = createDate;
	}

	public String getCreateName() {
		return createName;
	}

	public void setCreateName(String createName) {
		this.createName = createName;
	}



	public String getSegment1() {
		return segment1;
	}

	public void setSegment1(String segment1) {
		this.segment1 = segment1;
	}

	public String getSegment2() {
		return segment2;
	}

	public void setSegment2(String segment2) {
		this.segment2 = segment2;
	}

	public String getSegment3() {
		return segment3;
	}

	public void setSegment3(String segment3) {
		this.segment3 = segment3;
	}

	public String getSegment4() {
		return segment4;
	}

	public void setSegment4(String segment4) {
		this.segment4 = segment4;
	}

	public String getSegment5() {
		return segment5;
	}

	public void setSegment5(String segment5) {
		this.segment5 = segment5;
	}

}
