package com.throne212.fupin.action;

import com.opensymphony.xwork2.ActionContext;
import com.throne212.fupin.biz.AdminBiz;
import com.throne212.fupin.common.PageBean;
import com.throne212.fupin.common.Util;
import com.throne212.fupin.domain.Shi;
import com.throne212.fupin.domain.ShiWorkOrg;


public class AdminAction extends BaseAction {
	private AdminBiz adminBiz;
	//市级账号列表
	private Integer pageIndex;
	private PageBean<ShiWorkOrg> pageBean;
	public String shiWorkOrgList(){
		pageBean=adminBiz.getShiWorkOrgBean(pageIndex);
		return "shiWorkOrg_list";
	}
	//添加或修改市级账号
	private ShiWorkOrg shiWorkOrg;
	public String saveOrUpdateShiWorkOrg(){
		
		if (shiWorkOrg == null) {
			this.setMsg("保存失败，请检查数据是否录入完整");
			return "shiWorkOrg_edit";
		}
		if (shiWorkOrg != null && !Util.isEmpty(shiWorkOrg.getLoginName())) {// 添加或更新市扶贫单位信息
			if (shiWorkOrg.getShi().getId()==null) {
				this.setMsg("请选择所属市！");
				return "shiWorkOrg_edit";
			}
			Shi shi= adminBiz.getEntityById(Shi.class, shiWorkOrg.getShi().getId());
			shiWorkOrg.setShi(shi);
			shiWorkOrg = adminBiz.saveOrUpdateShiWorkOrg(shiWorkOrg);
			this.setMsg("保存成功");
			shiWorkOrg = null;
			return shiWorkOrgList();
		} else if (shiWorkOrg != null && shiWorkOrg.getId() != null) {// 查看扶贫单位详情
			shiWorkOrg = adminBiz.getEntityById(ShiWorkOrg.class, shiWorkOrg.getId());
			return "shiWorkOrg_edit";
		}
		return "shiWorkOrg_edit";

	}
	//删除市级账号
	public String deleteShiWorkOrg(){
		String[] shiWrokOrgIds = (String[]) ActionContext.getContext().getParameters().get("shiWorkOrg_ids");
		if(shiWrokOrgIds != null && shiWrokOrgIds.length > 0){
			for(String idStr : shiWrokOrgIds){
				Long id = Long.parseLong(idStr);
				adminBiz.deleteEntity(ShiWorkOrg.class, id);
			}
			this.setMsg("删除市级账号成功");
		}
		return shiWorkOrgList();
	}
	
	 
	
	
	public AdminBiz getAdminBiz() {
		return adminBiz;
	}

	public void setAdminBiz(AdminBiz adminBiz) {
		this.adminBiz = adminBiz;
	}

	

	public Integer getPageIndex() {
		return pageIndex;
	}

	public void setPageIndex(Integer pageIndex) {
		this.pageIndex = pageIndex;
	}

	public ShiWorkOrg getShiWorkOrg() {
		return shiWorkOrg;
	}

	public void setShiWorkOrg(ShiWorkOrg shiWorkOrg) {
		this.shiWorkOrg = shiWorkOrg;
	}

	public PageBean<ShiWorkOrg> getPageBean() {
		return pageBean;
	}

	public void setPageBean(PageBean<ShiWorkOrg> pageBean) {
		this.pageBean = pageBean;
	}
	

}
