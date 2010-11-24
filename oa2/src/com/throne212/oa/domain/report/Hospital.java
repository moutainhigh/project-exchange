package com.throne212.oa.domain.report;

import java.util.Date;

import com.throne212.oa.domain.DropdownList;

public class Hospital extends DropdownList {

	public static String componentName = "医疗单位";

	private HospitalType orgType;// 机构类型

	private Date date;// 录入时间

	public HospitalType getOrgType() {
		return orgType;
	}

	public void setOrgType(HospitalType orgType) {
		this.orgType = orgType;
	}

	public Date getDate() {
		return date;
	}

	public void setDate(Date date) {
		this.date = date;
	}

}
