package com.throne212.fupin.action;

import com.throne212.fupin.biz.ZhenBFBiz;
import com.throne212.fupin.common.PageBean;
import com.throne212.fupin.domain.AreaWorkOrg;
import com.throne212.fupin.domain.ShiWorkOrg;
import com.throne212.fupin.domain.User;
import com.throne212.fupin.domain.Zhen;

public class ZhenBFAction extends BaseAction {

	private ZhenBFBiz zhenBFBiz;

	private PageBean pageBean;
	private Integer pageIndex;

	private Long areaId;// 所属区县id

	public String zhenBFList() {
		pageBean = zhenBFBiz.getAllZhen(areaId, pageIndex);
		return "zhen_bf_list";
	}

	private Zhen zhen;

	public String viewZhenOrgMapping() {
		zhen = zhenBFBiz.getEntityById(Zhen.class, zhen.getId());
		return "zhen_org_mapping";
	}
	public String cancelZhenOrgMapping() {
		zhen = zhenBFBiz.getEntityById(Zhen.class, zhen.getId());
		zhen.setShiWorkOrg(null);
		zhen.setAreaWorkOrg(null);
		zhenBFBiz.saveOrUpdateEntity(zhen);
		this.setSucc("Y");
		this.setMsg("撤销指定成功");
		return "zhen_org_mapping";
	}
	

	private Long orgId;

	public String saveZhenOrgMapping() {
		Zhen zhenInDB = zhenBFBiz.getEntityById(Zhen.class, zhen.getId());
		User user = zhenBFBiz.getEntityById(User.class, orgId);
		if (user instanceof ShiWorkOrg) {
			zhenInDB.setShiWorkOrg((ShiWorkOrg) user);
			zhenBFBiz.saveOrUpdateEntity(zhenInDB);
		} else if (user instanceof AreaWorkOrg) {
			zhenInDB.setAreaWorkOrg((AreaWorkOrg) user);
			zhenBFBiz.saveOrUpdateEntity(zhenInDB);
		}
		this.setSucc("Y");
		this.setMsg("指定成功");
		return "zhen_org_mapping";
	}
	
}
