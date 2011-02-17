package com.throne212.oa.domain.report;

import java.util.Date;
//上传的Excel文件
import java.util.Set;
public class ReportFile {
	protected Long id;// 主键
	protected Integer year;// 年份
	protected Integer season;// 季度
	protected Integer month;// 月份
	protected String dateType;// 日期类型
	protected Hospital org;// 机构
	protected String fileName;// 上传文件的名称
	protected Date date;// 上传文件的日期
	protected Set reports;
	
	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public Integer getYear() {
		return year;
	}

	public void setYear(Integer year) {
		this.year = year;
	}

	public Integer getSeason() {
		return season;
	}

	public void setSeason(Integer season) {
		this.season = season;
	}

	public Integer getMonth() {
		return month;
	}

	public void setMonth(Integer month) {
		this.month = month;
	}

	public String getDateType() {
		return dateType;
	}

	public void setDateType(String dateType) {
		this.dateType = dateType;
	}

	public Hospital getOrg() {
		return org;
	}

	public void setOrg(Hospital org) {
		this.org = org;
	}

	public String getFileName() {
		return fileName;
	}

	public void setFileName(String fileName) {
		this.fileName = fileName;
	}

	public Date getDate() {
		return date;
	}

	public void setDate(Date date) {
		this.date = date;
	}

	public Set getReports() {
		return reports;
	}

	public void setReports(Set reports) {
		this.reports = reports;
	}

}
