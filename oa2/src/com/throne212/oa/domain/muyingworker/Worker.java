package com.throne212.oa.domain.muyingworker;

import java.util.Date;


public class Worker {
	
	private Long id;//����
	private WorkOrg workOrg;//��λ
	private String name;
	private Boolean gender;//�Ա�
	private Date birthday;
	private Integer age;
	private Special special;//����ר��
	private Title title;//����ְ��
	private String no;//������
	private Date date;//��֤����
	
	private CheckItem item1;//������Ŀ1
	private CheckItem item2;//������Ŀ2
	private CheckItem item3;//������Ŀ3
	private CheckItem item4;//������Ŀ4
	private CheckItem item5;//������Ŀ5
	
	private Date checkDate;//��������
	private String checkSummary;//���˽���
	private String comments;//��ע
	
	private String image;//��Ƭ
	
	public Long getId() {
		return id;
	}
	public void setId(Long id) {
		this.id = id;
	}
	public WorkOrg getWorkOrg() {
		return workOrg;
	}
	public void setWorkOrg(WorkOrg workOrg) {
		this.workOrg = workOrg;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public Boolean getGender() {
		return gender;
	}
	public void setGender(Boolean gender) {
		this.gender = gender;
	}
	public Date getBirthday() {
		return birthday;
	}
	public void setBirthday(Date birthday) {
		this.birthday = birthday;
	}
	public Integer getAge() {
		return age;
	}
	public void setAge(Integer age) {
		this.age = age;
	}
	public Special getSpecial() {
		return special;
	}
	public void setSpecial(Special special) {
		this.special = special;
	}
	public Title getTitle() {
		return title;
	}
	public void setTitle(Title title) {
		this.title = title;
	}
	public String getNo() {
		return no;
	}
	public void setNo(String no) {
		this.no = no;
	}
	public Date getDate() {
		return date;
	}
	public void setDate(Date date) {
		this.date = date;
	}
	public CheckItem getItem1() {
		return item1;
	}
	public void setItem1(CheckItem item1) {
		this.item1 = item1;
	}
	public CheckItem getItem2() {
		return item2;
	}
	public void setItem2(CheckItem item2) {
		this.item2 = item2;
	}
	public CheckItem getItem3() {
		return item3;
	}
	public void setItem3(CheckItem item3) {
		this.item3 = item3;
	}
	public CheckItem getItem4() {
		return item4;
	}
	public void setItem4(CheckItem item4) {
		this.item4 = item4;
	}
	public CheckItem getItem5() {
		return item5;
	}
	public void setItem5(CheckItem item5) {
		this.item5 = item5;
	}
	public Date getCheckDate() {
		return checkDate;
	}
	public void setCheckDate(Date checkDate) {
		this.checkDate = checkDate;
	}
	public String getCheckSummary() {
		return checkSummary;
	}
	public void setCheckSummary(String checkSummary) {
		this.checkSummary = checkSummary;
	}
	public String getComments() {
		return comments;
	}
	public void setComments(String comments) {
		this.comments = comments;
	}
	public String getImage() {
		return image;
	}
	public void setImage(String image) {
		this.image = image;
	}
	
}
