package com.throne212.oa.domain.person;

import com.throne212.oa.domain.DropdownList;

public class OrgName extends DropdownList {	
	public static String componentName = "单位名称";
	
	private OrgType orgType;//单位类型

	public OrgType getOrgType() {
		return orgType;
	}

	public void setOrgType(OrgType orgType) {
		this.orgType = orgType;
	}
	
	
	
}
