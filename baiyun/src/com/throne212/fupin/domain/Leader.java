package com.throne212.fupin.domain;

import java.util.Date;

import com.throne212.fupin.common.Util;

public class Leader extends MyEntity implements Comparable<Leader>{
	
	private Org org;
	private Family family;
	private String leaderName;
	private String gender;
	private Integer age;
	private String position;
	private String email;
	private String tel;
	private Date startDate;
	
	public Org getOrg() {
		return org;
	}
	public void setOrg(Org org) {
		this.org = org;
	}
	public Family getFamily() {
		return family;
	}
	public void setFamily(Family family) {
		this.family = family;
	}
	public String getLeaderName() {
		return leaderName;
	}
	public void setLeaderName(String leaderName) {
		this.leaderName = leaderName;
	}
	public String getGender() {
		return gender;
	}
	public void setGender(String gender) {
		this.gender = gender;
	}
	public Integer getAge() {
		return age;
	}
	public void setAge(Integer age) {
		this.age = age;
	}
	public String getPosition() {
		return position;
	}
	public void setPosition(String position) {
		this.position = position;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getTel() {
		return tel;
	}
	public void setTel(String tel) {
		this.tel = tel;
	}
	public int compareTo(Leader o) {
		if(this == null && o == null)
			return 0;
		if(o==null )
			return 1;
		return (int) (this.getId()-o.getId());
	}
	public Date getStartDate() {
		return startDate;
	}
	public void setStartDate(Date startDate) {
		this.startDate = startDate;
	}
	public String getStartDateTxt() {
		if(startDate != null){
			return Util.getDate(startDate);
		}
		return null;
	}
}
