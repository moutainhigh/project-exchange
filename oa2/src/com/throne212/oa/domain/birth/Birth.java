package com.throne212.oa.domain.birth;

import java.util.Date;

public class Birth {

	private Long id;// 主键
	private String no;// 编号
	private String name;// 姓名
	private Date birthday;// 生日
	private String weeks;// 孕周
	private Health health;// 健康状态
	private String weight;// 体重
	private String height;// 身长
	private String place;// 出生地
	private JieShengOrg org;// 接生结构
	private String person;// 接生人

	private String mother;// 母亲
	private Date motherBirthday;// 母亲生日
	private String motherCountry;// 母亲国籍
	private BirthNation motherNation;// 民族
	private String motherIdNo;// 身份证号码

	private String father;// 父亲
	private Date fatherBirthday;// 父亲生日
	private String fatherCountry;// 父亲国籍
	private BirthNation fatherNation;// 民族
	private String fatherIdNo;// 身份证号码

	private String address;// 家庭住址
	private Date date;// 签发日期
	private String bufa;// 补发与否

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public String getNo() {
		return no;
	}

	public void setNo(String no) {
		this.no = no;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public Date getBirthday() {
		return birthday;
	}

	public void setBirthday(Date birthday) {
		this.birthday = birthday;
	}

	public String getWeeks() {
		return weeks;
	}

	public void setWeeks(String weeks) {
		this.weeks = weeks;
	}

	public Health getHealth() {
		return health;
	}

	public void setHealth(Health health) {
		this.health = health;
	}

	public String getWeight() {
		return weight;
	}

	public void setWeight(String weight) {
		this.weight = weight;
	}

	public String getHeight() {
		return height;
	}

	public void setHeight(String height) {
		this.height = height;
	}

	public String getPlace() {
		return place;
	}

	public void setPlace(String place) {
		this.place = place;
	}

	public JieShengOrg getOrg() {
		return org;
	}

	public void setOrg(JieShengOrg org) {
		this.org = org;
	}

	public String getPerson() {
		return person;
	}

	public void setPerson(String person) {
		this.person = person;
	}

	public String getMother() {
		return mother;
	}

	public void setMother(String mother) {
		this.mother = mother;
	}

	public Date getMotherBirthday() {
		return motherBirthday;
	}

	public void setMotherBirthday(Date motherBirthday) {
		this.motherBirthday = motherBirthday;
	}

	public String getMotherCountry() {
		return motherCountry;
	}

	public void setMotherCountry(String motherCountry) {
		this.motherCountry = motherCountry;
	}

	public BirthNation getMotherNation() {
		return motherNation;
	}

	public void setMotherNation(BirthNation motherNation) {
		this.motherNation = motherNation;
	}

	public String getMotherIdNo() {
		return motherIdNo;
	}

	public void setMotherIdNo(String motherIdNo) {
		this.motherIdNo = motherIdNo;
	}

	public String getFather() {
		return father;
	}

	public void setFather(String father) {
		this.father = father;
	}

	public Date getFatherBirthday() {
		return fatherBirthday;
	}

	public void setFatherBirthday(Date fatherBirthday) {
		this.fatherBirthday = fatherBirthday;
	}

	public String getFatherCountry() {
		return fatherCountry;
	}

	public void setFatherCountry(String fatherCountry) {
		this.fatherCountry = fatherCountry;
	}

	public BirthNation getFatherNation() {
		return fatherNation;
	}

	public void setFatherNation(BirthNation fatherNation) {
		this.fatherNation = fatherNation;
	}

	public String getFatherIdNo() {
		return fatherIdNo;
	}

	public void setFatherIdNo(String fatherIdNo) {
		this.fatherIdNo = fatherIdNo;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public Date getDate() {
		return date;
	}

	public void setDate(Date date) {
		this.date = date;
	}

	public String getBufa() {
		return bufa;
	}

	public void setBufa(String bufa) {
		this.bufa = bufa;
	}

}
