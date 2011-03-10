package com.throne212.fupin.action;

import com.opensymphony.xwork2.ActionContext;
import com.throne212.fupin.biz.OrgBiz;
import com.throne212.fupin.common.PageBean;
import com.throne212.fupin.common.WebConstants;
import com.throne212.fupin.domain.Leader;
import com.throne212.fupin.domain.Org;
import com.throne212.fupin.domain.User;

public class OrgAction extends BaseAction {

	private Org org;
	private OrgBiz orgBiz;
	
	private PageBean pageBean;
	private Integer pageIndex;
	private String queryKey;

	public String saveOrg() {
		Org orgInDB = orgBiz.getEntityById(Org.class, org.getId());
		org.setLoginName(orgInDB.getLoginName());
		org.setPassword(orgInDB.getPassword());
		org.setRemark(orgInDB.getRemark());
		org = orgBiz.saveOrUpdateOrg(org);
		this.setMsg("扶贫单位【" + org.getOrgName() + "】保存成功");
		return "org_edit";
	}
	
	public String editOrg(){
		User user = (User) ActionContext.getContext().getSession().get(WebConstants.SESS_USER_OBJ);
		if(user instanceof Org){
			org = orgBiz.getEntityById(Org.class, user.getId());
		}
		return "org_edit";
	}
	
	public String leaderList(){
		User user = (User) ActionContext.getContext().getSession().get(WebConstants.SESS_USER_OBJ);
		if(user instanceof Org){
			org = orgBiz.getEntityById(Org.class, user.getId());
			pageBean = orgBiz.getAllLeader(org, queryKey, pageIndex);
		}
		return "leader_list";
	}
	
	private Leader leader;
	
	public String viewLeader(){
		leader = orgBiz.getEntityById(Leader.class, leader.getId());
		return "leader_edit";
	}
	
	public String saveLeader(){
		if(leader.getId() == null){
			User user = (User) ActionContext.getContext().getSession().get(WebConstants.SESS_USER_OBJ);
			if(user instanceof Org){
				org = orgBiz.getEntityById(Org.class, user.getId());
				leader.setOrg(org);
				orgBiz.saveOrUpdateEntity(leader);
				this.setSucc("Y");
				this.setMsg("创建干部成功");
			}
		}else{
			User user = (User) ActionContext.getContext().getSession().get(WebConstants.SESS_USER_OBJ);
			if(user instanceof Org){
				org = orgBiz.getEntityById(Org.class, user.getId());
				leader.setOrg(org);
				orgBiz.saveOrUpdateEntity(leader);
				this.setSucc("Y");
				this.setMsg("修改干部成功");
			}
		}
		return "leader_edit";
	}
	
	public String deleteLeader() {
		String[] shiWrokOrgIds = (String[]) ActionContext.getContext().getParameters().get("ids");
		if (shiWrokOrgIds != null && shiWrokOrgIds.length > 0) {
			for (String idStr : shiWrokOrgIds) {
				Long id = Long.parseLong(idStr);
				orgBiz.deleteEntity(Leader.class, id);
			}
			this.setMsg("删除干部成功");
		}
		return leaderList();
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

	public String getQueryKey() {
		return queryKey;
	}

	public void setQueryKey(String queryKey) {
		this.queryKey = queryKey;
	}

	public Leader getLeader() {
		return leader;
	}

	public void setLeader(Leader leader) {
		this.leader = leader;
	}

}
