package com.throne212.oa.domain.report;

import java.util.Date;

import com.throne212.oa.domain.DropdownList;

public class Hospital extends DropdownList {

	public static String componentName = "ҽ�Ƶ�λ";

	private HospitalType orgType;// ��������

	private Date date;// ¼��ʱ��

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
