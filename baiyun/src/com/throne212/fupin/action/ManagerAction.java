package com.throne212.fupin.action;

import java.util.Date;
import java.util.List;

import com.opensymphony.xwork2.ActionContext;
import com.throne212.fupin.biz.OrgBiz;
import com.throne212.fupin.common.PageBean;
import com.throne212.fupin.common.PinyinToolkit;
import com.throne212.fupin.common.Util;
import com.throne212.fupin.domain.Cun;
import com.throne212.fupin.domain.Org;

public class ManagerAction extends BaseAction {

	private PageBean pageBean;
	private Integer pageIndex;
	private String queryKey;

	private OrgBiz orgBiz;

	public String managerList() {
		pageBean = orgBiz.getAllOrg(queryKey, pageIndex);
		return "manager_list";
	}

	private Org org;

	public String viewManager() {
		org = orgBiz.getEntityById(Org.class, org.getId());
		return "manager_edit";
	}

	public String saveManager() {
		if (org.getId() == null) {
			org.setCreateDate(new Date());
			if(!Util.isEmpty(org.getOrgName())){
				org.setPinyin(PinyinToolkit.cn2Pinyin(org.getOrgName()));
			}
			orgBiz.saveOrUpdateEntity(org);
			this.setSucc("Y");
			this.setMsg("管理员账号创建成功");
		} else {
			Org orgInDB = orgBiz.getEntityById(Org.class, org.getId());
			orgInDB.setPassword(org.getPassword());
			orgInDB.setRemark(org.getRemark());
			orgInDB.setOrgName(org.getOrgName());
			if(org.getArea()!=null && org.getArea().getId()!=null)
				orgInDB.setArea(org.getArea());
			if(!Util.isEmpty(org.getOrgName())){
				orgInDB.setPinyin(PinyinToolkit.cn2Pinyin(org.getOrgName()));
			}
			orgBiz.saveOrUpdateEntity(orgInDB);
			this.setSucc("Y");
			this.setMsg("管理员账号修改成功");
		}
		return "manager_edit";
	}

	// 删除管理员账号
	public String deleteManager() {
		String[] shiWrokOrgIds = (String[]) ActionContext.getContext().getParameters().get("ids");
		if (shiWrokOrgIds != null && shiWrokOrgIds.length > 0) {
			for (String idStr : shiWrokOrgIds) {
				Long id = Long.parseLong(idStr);
				orgBiz.deleteEntity(Org.class, id);
			}
			this.setMsg("删除市级账号成功");
		}
		return managerList();
	}
	
	public String managerMappingList(){
		pageBean = orgBiz.getAllCun(queryKey, pageIndex);
		return "manager_mapping";
	}
	private Cun cun;
	public String viewMapping(){
		cun = orgBiz.getEntityById(Cun.class, cun.getId());
		return "manager_cun_mapping";
	}
	public String cancelMapping(){
		cun = orgBiz.getEntityById(Cun.class, cun.getId());
		if(cun == null){
			this.setMsg("撤销指定失败");
			return managerMappingList();
		}
		//把其他的帮扶这个村的机构也撤销了
		List<Org> list = orgBiz.getEntitiesByColumn(Org.class, "cun.id", cun.getId());
		for(Org o : list){
			o.setCun(null);
			orgBiz.saveOrUpdateEntity(o);
		}
		cun.setOrg(null);
		orgBiz.saveOrUpdateEntity(cun);
		this.setMsg("撤销指定成功");
		return managerMappingList();
	}
	
	private Long orgId;
	public String saveManagerMapping(){
		cun = orgBiz.getEntityById(Cun.class, cun.getId());
		Org org = orgBiz.getEntityById(Org.class, orgId);
		cun.setOrg(org);
		orgBiz.saveOrUpdateEntity(cun);
		org.setCun(cun);
		orgBiz.saveOrUpdateEntity(org);
		this.setSucc("Y");
		this.setMsg("指定扶贫单位成功");
		return "manager_cun_mapping"; 
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

	public Org getOrg() {
		return org;
	}

	public void setOrg(Org org) {
		this.org = org;
	}

	public Cun getCun() {
		return cun;
	}

	public void setCun(Cun cun) {
		this.cun = cun;
	}

	public Long getOrgId() {
		return orgId;
	}

	public void setOrgId(Long orgId) {
		this.orgId = orgId;
	}

}
