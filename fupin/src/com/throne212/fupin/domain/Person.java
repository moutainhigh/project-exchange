package com.throne212.fupin.domain;

import java.util.Date;

public class Person extends MyEntity {

	private String name;
	private String gender;
	private Date birthday;
	private String relate;// 与户主关系
	private String wenhua;
	private String job;
	
	

	public Person() {
		super();
	}

	public Person(String name, String gender, Date birthday, String relate, String wenhua, String job) {
		super();
		this.name = name;
		this.gender = gender;
		this.birthday = birthday;
		this.relate = relate;
		this.wenhua = wenhua;
		this.job = job;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getGender() {
		return gender;
	}

	public void setGender(String gender) {
		this.gender = gender;
	}

	public Date getBirthday() {
		return birthday;
	}

	public void setBirthday(Date birthday) {
		this.birthday = birthday;
	}

	public String getRelate() {
		return relate;
	}

	public void setRelate(String relate) {
		this.relate = relate;
	}

	public String getWenhua() {
		return wenhua;
	}

	public void setWenhua(String wenhua) {
		this.wenhua = wenhua;
	}

	public String getJob() {
		return job;
	}

	public void setJob(String job) {
		this.job = job;
	}

}
