package com.throne212.oa.domain.report;

import java.util.Set;

import com.throne212.oa.domain.DropdownList;

public class Hospital extends DropdownList {

	public static String componentName = "ҽ�Ƶ�λ";

	private HospitalType orgType;// ��������


	public HospitalType getOrgType() {
		return orgType;
	}

	public void setOrgType(HospitalType orgType) {
		this.orgType = orgType;
	}
}
