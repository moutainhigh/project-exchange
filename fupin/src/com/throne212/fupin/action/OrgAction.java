package com.throne212.fupin.action;

import com.throne212.fupin.biz.OrgBiz;
import com.throne212.fupin.common.Util;
import com.throne212.fupin.domain.Org;


public class OrgAction extends BaseAction {
	
	private Org org;
	private OrgBiz orgBiz;
	public String saveOrUpdateOrg(){
		
		if (org == null) {
			this.setMsg("单位保存失败，请检查数据是否录入完整");
			return "org_edit";
		}
		if (org != null && !Util.isEmpty(org.getOrgName())) {// 添加或更新扶贫单位信息
			org = orgBiz.saveOrUpdateOrg(org);
			this.setMsg("扶贫单位【" + org.getOrgName() + "】保存成功");
			org = null;
			//return farmerList();
		} else if (org != null && org.getId() != null) {// 查看扶贫单位详情
			org = orgBiz.getEntityById(Org.class, org.getId());
			return "org_edit";
		}
		return "org_edit";

	}
	public Org getOrg() {
		return org;
	}
	public void setOrg(Org org) {
		this.org = org;
	}
	public OrgBiz getOrgBiz() {
		return orgBiz;
	}
	public void setOrgBiz(OrgBiz orgBiz) {
		this.orgBiz = orgBiz;
	}
	
	

}
