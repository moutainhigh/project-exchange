package com.throne212.fupin.domain;

import java.util.Date;

public class Person extends MyEntity {

	private String name;
	private String gender;
	private Date birthday;
	private String relate;// 与户主关系
	private String wenhua;
	private String job;
	//新的字段,测试10
	//工资性收入    （元）		农业经营收入（元）	低保收入（元）	粮补补贴和租地收入（元）	是否购买合作医疗	是否购买养老保险	学生每学年费用（元）	备注（家有重病或教育负担重）

	private String gongziIncome;
	private String nongyeIncome;
	private String dibaoIncome;
	private String otherIncome;
	private String hezuoYiliao;
	private String yanglao;
	private String stuCost;
	private String remark;

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
	

	public Person(String name, String gender, Date birthday, String relate, String wenhua, String job, String gongziIncome, String nongyeIncome, String dibaoIncome, String otherIncome,
			String hezuoYiliao, String yanglao, String stuCost, String remark) {
		super();
		this.name = name;
		this.gender = gender;
		this.birthday = birthday;
		this.relate = relate;
		this.wenhua = wenhua;
		this.job = job;
		this.gongziIncome = gongziIncome;
		this.nongyeIncome = nongyeIncome;
		this.dibaoIncome = dibaoIncome;
		this.otherIncome = otherIncome;
		this.hezuoYiliao = hezuoYiliao;
		this.yanglao = yanglao;
		this.stuCost = stuCost;
		this.remark = remark;
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

	public String getGongziIncome() {
		return gongziIncome;
	}

	public void setGongziIncome(String gongziIncome) {
		this.gongziIncome = gongziIncome;
	}

	public String getNongyeIncome() {
		return nongyeIncome;
	}

	public void setNongyeIncome(String nongyeIncome) {
		this.nongyeIncome = nongyeIncome;
	}

	public String getDibaoIncome() {
		return dibaoIncome;
	}

	public void setDibaoIncome(String dibaoIncome) {
		this.dibaoIncome = dibaoIncome;
	}

	public String getOtherIncome() {
		return otherIncome;
	}

	public void setOtherIncome(String otherIncome) {
		this.otherIncome = otherIncome;
	}

	public String getHezuoYiliao() {
		return hezuoYiliao;
	}

	public void setHezuoYiliao(String hezuoYiliao) {
		this.hezuoYiliao = hezuoYiliao;
	}

	public String getYanglao() {
		return yanglao;
	}

	public void setYanglao(String yanglao) {
		this.yanglao = yanglao;
	}

	public String getStuCost() {
		return stuCost;
	}

	public void setStuCost(String stuCost) {
		this.stuCost = stuCost;
	}

	public String getRemark() {
		return remark;
	}

	public void setRemark(String remark) {
		this.remark = remark;
	}

}
