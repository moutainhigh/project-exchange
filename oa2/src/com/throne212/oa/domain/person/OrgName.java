package com.throne212.oa.domain.person;

import com.throne212.oa.domain.DropdownList;

public class OrgName extends DropdownList {	
	public static String componentName = "��λ����";
	
	private OrgType orgType;//��λ����

	public OrgType getOrgType() {
		return orgType;
	}

	public void setOrgType(OrgType orgType) {
		this.orgType = orgType;
	}
	
	
	
}
