package com.throne212.fupin.domain;

import java.text.DecimalFormat;
import java.util.Date;

//民意调查
public class People extends MyEntity {

	private static DecimalFormat df = new DecimalFormat("0.00");

	private Org org;// 单位
	private Cun cun;// 村
	private Integer year;// 年份
	private Date date;// 调查日期
	private String targetName;// 被调查人
	private Integer targetType;// 调查人的类别，1有劳动力贫困户，2无劳动力贫困户，3非贫困户 
	private String name;// 调查人
	private Integer status;// 调查状态,1草稿，2已提交/保存

	// 项目
	private int item1;
	private int item2;
	private int item3;
	private int item4;

	public Org getOrg() {
		return org;
	}

	public void setOrg(Org org) {
		this.org = org;
	}

	public Cun getCun() {
		return cun;
	}

	public void setCun(Cun cun) {
		this.cun = cun;
	}

	public Integer getYear() {
		return year;
	}

	public void setYear(Integer year) {
		this.year = year;
	}

	public Date getDate() {
		return date;
	}

	public void setDate(Date date) {
		this.date = date;
	}

	public String getTargetName() {
		return targetName;
	}

	public void setTargetName(String targetName) {
		this.targetName = targetName;
	}

	public Integer getTargetType() {
		return targetType;
	}

	public void setTargetType(Integer targetType) {
		this.targetType = targetType;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public Integer getStatus() {
		return status;
	}
	
	public String getStatusTxt() {
		if(status == 1){
			return "草稿";
		}else if(status == 2){
			return "已提交";
		}
		return "";
	}

	public void setStatus(Integer status) {
		this.status = status;
	}

	public int getItem1() {
		return item1;
	}

	public void setItem1(int item1) {
		this.item1 = item1;
	}

	public int getItem2() {
		return item2;
	}

	public void setItem2(int item2) {
		this.item2 = item2;
	}

	public int getItem3() {
		return item3;
	}

	public void setItem3(int item3) {
		this.item3 = item3;
	}

	public int getItem4() {
		return item4;
	}

	public void setItem4(int item4) {
		this.item4 = item4;
	}

}
