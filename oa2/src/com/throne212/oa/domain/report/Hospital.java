package com.throne212.oa.domain.report;

import java.util.Set;

import com.throne212.oa.domain.DropdownList;

public class Hospital extends DropdownList {

	public static String componentName = "医疗单位";

	private HospitalType orgType;// 机构类型


	public HospitalType getOrgType() {
		return orgType;
	}

	public void setOrgType(HospitalType orgType) {
		this.orgType = orgType;
	}
}
