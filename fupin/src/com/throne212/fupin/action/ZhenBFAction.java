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
		return zhenBFList();
	}
	

	private Long orgId;

	public String saveZhenOrgMapping() {
		Zhen zhenInDB = zhenBFBiz.getEntityById(Zhen.class, zhen.getId());
		User user = zhenBFBiz.getEntityById(User.class, orgId);
		if (user instanceof ShiWorkOrg) {
			zhenInDB.setShiWorkOrg((ShiWorkOrg) user);
			zhenInDB.setAreaWorkOrg(null);
			zhenBFBiz.saveOrUpdateEntity(zhenInDB);
		} else if (user instanceof AreaWorkOrg) {
			zhenInDB.setShiWorkOrg(null);
			zhenInDB.setAreaWorkOrg((AreaWorkOrg) user);
			zhenBFBiz.saveOrUpdateEntity(zhenInDB);
		}
		this.setSucc("Y");
		this.setMsg("指定成功");
		return "zhen_org_mapping";
	}
	public ZhenBFBiz getZhenBFBiz() {
		return zhenBFBiz;
	}
	public void setZhenBFBiz(ZhenBFBiz zhenBFBiz) {
		this.zhenBFBiz = zhenBFBiz;
	}
	public PageBean getPageBean() {
		return pageBean;
	}
	public void setPageBean(PageBean pageBean) {
		this.pageBean = pageBean;
	}
	public Integer getPageIndex() {
		return pageIndex;
	}
	public void setPageIndex(Integer pageIndex) {
		this.pageIndex = pageIndex;
	}
	public Long getAreaId() {
		return areaId;
	}
	public void setAreaId(Long areaId) {
		this.areaId = areaId;
	}
	public Zhen getZhen() {
		return zhen;
	}
	public void setZhen(Zhen zhen) {
		this.zhen = zhen;
	}
	public Long getOrgId() {
		return orgId;
	}
	public void setOrgId(Long orgId) {
		this.orgId = orgId;
	}
	
}
