package com.throne212.fupin.action;

import com.opensymphony.xwork2.ActionContext;
import com.throne212.fupin.biz.OrgBiz;
import com.throne212.fupin.common.PageBean;
import com.throne212.fupin.domain.Family;
import com.throne212.fupin.domain.Person;

public class FamilyAction extends BaseAction {

	private PageBean pageBean;
	private Integer pageIndex;
	private String queryKey;

	private OrgBiz orgBiz;

	public String familyList() {
		pageBean = orgBiz.getAllFamily(queryKey, pageIndex);
		return "family_list";
	}

	private Family family;

	public String viewFamily() {
		family = orgBiz.getEntityById(Family.class, family.getId());
		return "family_view";
	}

	public String editFamily() {
		family = orgBiz.getEntityById(Family.class, family.getId());
		return "family_edit";
	}
	
	public String saveFamily() {
		orgBiz.saveOrUpdateEntity(family);
		this.setSucc("Y");
		this.setMsg("贫困户保存成功");
		return "family_edit";
	}

	// 删除
	public String deleteFamily() {
		String[] shiWrokOrgIds = (String[]) ActionContext.getContext().getParameters().get("ids");
		if (shiWrokOrgIds != null && shiWrokOrgIds.length > 0) {
			for (String idStr : shiWrokOrgIds) {
				Long id = Long.parseLong(idStr);
				orgBiz.deleteEntity(Family.class, id);
			}
			this.setMsg("删除贫困户成功");
		}
		return familyList();
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

	public OrgBiz getOrgBiz() {
		return orgBiz;
	}

	public void setOrgBiz(OrgBiz orgBiz) {
		this.orgBiz = orgBiz;
	}

	public String getQueryKey() {
		return queryKey;
	}

	public void setQueryKey(String queryKey) {
		this.queryKey = queryKey;
	}

	public Family getFamily() {
		return family;
	}

	public void setFamily(Family family) {
		this.family = family;
	}



}
