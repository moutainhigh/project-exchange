package com.throne212.oa.domain.muyingworker;

import java.util.Date;


public class Worker {
	
	private Long id;//主键
	private WorkOrg workOrg;//单位
	private String name;
	private Boolean gender;//性别
	private Date birthday;
	private Integer age;
	private Special special;//技术专科
	private Title title;//技术职称
	private String no;//考核字
	private Date date;//发证日期
	
	private CheckItem item1;//考核项目1
	private CheckItem item2;//考核项目2
	private CheckItem item3;//考核项目3
	private CheckItem item4;//考核项目4
	private CheckItem item5;//考核项目5
	
	private Date checkDate;//考核日期
	private String checkSummary;//考核结论
	private String comments;//备注
	
	private Date checkDate2;//考核日期
	private String checkSummary2;//考核结论
	private String comments2;//备注
	
	private Date checkDate3;//考核日期
	private String checkSummary3;//考核结论
	private String comments3;//备注
	
	private Date checkDate4;//考核日期
	private String checkSummary4;//考核结论
	private String comments4;//备注
	
	private Date checkDate5;//考核日期
	private String checkSummary5;//考核结论
	private String comments5;//备注
	
	private Integer checkNum;//考核次数
	
	private String image;//照片
	
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
	public Date getCheckDate2() {
		return checkDate2;
	}
	public void setCheckDate2(Date checkDate2) {
		this.checkDate2 = checkDate2;
	}
	public String getCheckSummary2() {
		return checkSummary2;
	}
	public void setCheckSummary2(String checkSummary2) {
		this.checkSummary2 = checkSummary2;
	}
	public String getComments2() {
		return comments2;
	}
	public void setComments2(String comments2) {
		this.comments2 = comments2;
	}
	public Date getCheckDate3() {
		return checkDate3;
	}
	public void setCheckDate3(Date checkDate3) {
		this.checkDate3 = checkDate3;
	}
	public String getCheckSummary3() {
		return checkSummary3;
	}
	public void setCheckSummary3(String checkSummary3) {
		this.checkSummary3 = checkSummary3;
	}
	public String getComments3() {
		return comments3;
	}
	public void setComments3(String comments3) {
		this.comments3 = comments3;
	}
	public Date getCheckDate4() {
		return checkDate4;
	}
	public void setCheckDate4(Date checkDate4) {
		this.checkDate4 = checkDate4;
	}
	public String getCheckSummary4() {
		return checkSummary4;
	}
	public void setCheckSummary4(String checkSummary4) {
		this.checkSummary4 = checkSummary4;
	}
	public String getComments4() {
		return comments4;
	}
	public void setComments4(String comments4) {
		this.comments4 = comments4;
	}
	public Date getCheckDate5() {
		return checkDate5;
	}
	public void setCheckDate5(Date checkDate5) {
		this.checkDate5 = checkDate5;
	}
	public String getCheckSummary5() {
		return checkSummary5;
	}
	public void setCheckSummary5(String checkSummary5) {
		this.checkSummary5 = checkSummary5;
	}
	public String getComments5() {
		return comments5;
	}
	public void setComments5(String comments5) {
		this.comments5 = comments5;
	}
	public Integer getCheckNum() {
		return checkNum;
	}
	public void setCheckNum(Integer checkNum) {
		this.checkNum = checkNum;
	}
	
}
