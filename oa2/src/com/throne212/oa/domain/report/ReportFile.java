package com.throne212.oa.domain.report;

import java.util.Date;
//�ϴ���Excel�ļ�
import java.util.Set;
public class ReportFile {
	protected Long id;// ����
	protected Integer year;// ���
	protected Integer season;// ����
	protected Integer month;// �·�
	protected String dateType;// ��������
	protected Hospital org;// ����
	protected String fileName;// �ϴ��ļ�������
	protected Date date;// �ϴ��ļ�������
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
