package com.throne212.fupin.action;

import com.opensymphony.xwork2.ActionContext;
import com.throne212.fupin.biz.AreaWorkOrgBiz;
import com.throne212.fupin.common.PageBean;
import com.throne212.fupin.common.Util;
import com.throne212.fupin.common.WebConstants;
import com.throne212.fupin.domain.Area;
import com.throne212.fupin.domain.AreaWorkOrg;
import com.throne212.fupin.domain.ShiWorkOrg;

public class AreaWorkOrgAction extends BaseAction {
	
	private Integer pageIndex;
	private PageBean<AreaWorkOrg> pageBean;
	private AreaWorkOrg areaWorkOrg;
	private AreaWorkOrgBiz areaWorkOrgBiz;
	 //区县级账号列表
	public String areaWorkOrgList(){
		
		ShiWorkOrg shiWorkOrg=(ShiWorkOrg)ActionContext.getContext().getSession().get(WebConstants.SESS_USER_OBJ);
		pageBean=areaWorkOrgBiz.getAreaWorkOrgBean(pageIndex,shiWorkOrg.getId());
		return "areaWorkOrg_list";
	}
	
	 //区县级账号管理
	public String saveOrUpdateAreaWorkOrg(){
		
		if (areaWorkOrg == null) {
			this.setMsg("保存失败，请检查数据是否录入完整");
			return "areaWorkOrg_edit";
		}
		if (areaWorkOrg != null && !Util.isEmpty(areaWorkOrg.getLoginName())) {// 添加或更新
			if (areaWorkOrg.getArea().getId()==null) {
				this.setMsg("请选择所属区县！");
				return "areaWorkOrg_edit";
			}
			Area area= areaWorkOrgBiz.getEntityById(Area.class, areaWorkOrg.getArea().getId());
			areaWorkOrg.setArea(area);
			areaWorkOrg = areaWorkOrgBiz.saveOrUpdateAreaWorkOrg(areaWorkOrg);
			this.setMsg("保存成功");
			areaWorkOrg = null;
			return areaWorkOrgList();
		} else if (areaWorkOrg != null && areaWorkOrg.getId() != null) {// 查看详情
			areaWorkOrg = areaWorkOrgBiz.getEntityById(AreaWorkOrg.class, areaWorkOrg.getId());
			return "areaWorkOrg_edit";
		}
		return "areaWorkOrg_edit";

	}
	//删除区县级账号
	public String deleteAreaWorkOrg(){
		String[] areaWrokOrgIds = (String[]) ActionContext.getContext().getParameters().get("areaWorkOrg_ids");
		if(areaWrokOrgIds != null && areaWrokOrgIds.length > 0){
			for(String idStr : areaWrokOrgIds){
				Long id = Long.parseLong(idStr);
				areaWorkOrgBiz.deleteEntity(AreaWorkOrg.class, id);
			}
			this.setMsg("删除市级账号成功");
		}
		return areaWorkOrgList();
	}

	public Integer getPageIndex() {
		return pageIndex;
	}

	public void setPageIndex(Integer pageIndex) {
		this.pageIndex = pageIndex;
	}

	public PageBean<AreaWorkOrg> getPageBean() {
		return pageBean;
	}

	public void setPageBean(PageBean<AreaWorkOrg> pageBean) {
		this.pageBean = pageBean;
	}

	public AreaWorkOrg getAreaWorkOrg() {
		return areaWorkOrg;
	}

	public void setAreaWorkOrg(AreaWorkOrg areaWorkOrg) {
		this.areaWorkOrg = areaWorkOrg;
	}

	public AreaWorkOrgBiz getAreaWorkOrgBiz() {
		return areaWorkOrgBiz;
	}

	public void setAreaWorkOrgBiz(AreaWorkOrgBiz areaWorkOrgBiz) {
		this.areaWorkOrgBiz = areaWorkOrgBiz;
	}


	
}
