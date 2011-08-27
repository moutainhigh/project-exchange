package com.throne212.fupin.action;

import com.opensymphony.xwork2.ActionContext;
import com.throne212.fupin.biz.ProjectBiz;
import com.throne212.fupin.common.PageBean;
import com.throne212.fupin.domain.Project;
import com.throne212.fupin.domain.ProjectCun;

public class ProjectAction extends BaseAction {

	// 村项目管理
	private ProjectCun proCun;
	
	private PageBean<? extends Project> pageBean;
	
	private Integer pageIndex;
	
	private ProjectBiz projectBiz;

	public String proCunList() {
		pageBean = projectBiz.getProjectCunList(pageIndex);
		return "pro_cun_list";
	}
	
	public String editCunPro(){
		proCun = projectBiz.getEntityById(ProjectCun.class, proCun.getId());
		return "pro_cun_edit";
	}
	
	public String saveProCun() {
		if(proCun == null)
			return "pro_cun_edit";
		
		if(proCun.getId() == null){//新建
			projectBiz.saveOrUpdateEntity(proCun);
			this.setMsg("保存成功");
			this.setSucc("Y");
		}else if(proCun.getId() != null){
			projectBiz.saveOrUpdateEntity(proCun);
			this.setMsg("保存成功");
			this.setSucc("Y");
		}
		
		return "pro_cun_edit";
	}
	
	public String deleteCunProjects(){
		String[] ids = (String[]) ActionContext.getContext().getParameters().get("ids");
		if(ids != null && ids.length>0){
			for(String id : ids){
				projectBiz.deleteEntity(ProjectCun.class, Long.parseLong(id));
			}
			this.setMsg("删除村项目成功:" + ids.length);
		}
		return this.proCunList();
	}

	public ProjectCun getProCun() {
		return proCun;
	}

	public void setProCun(ProjectCun proCun) {
		this.proCun = proCun;
	}

	public PageBean<? extends Project> getPageBean() {
		return pageBean;
	}

	public void setPageBean(PageBean<? extends Project> pageBean) {
		this.pageBean = pageBean;
	}

	public Integer getPageIndex() {
		return pageIndex;
	}

	public void setPageIndex(Integer pageIndex) {
		this.pageIndex = pageIndex;
	}

	public ProjectBiz getProjectBiz() {
		return projectBiz;
	}

	public void setProjectBiz(ProjectBiz projectBiz) {
		this.projectBiz = projectBiz;
	}

}
