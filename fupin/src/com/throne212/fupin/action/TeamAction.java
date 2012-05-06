package com.throne212.fupin.action;

import java.util.List;

import com.opensymphony.xwork2.ActionContext;
import com.throne212.fupin.biz.AdminBiz;
import com.throne212.fupin.common.PageBean;
import com.throne212.fupin.domain.Cun;
import com.throne212.fupin.domain.WorkTeam;

public class TeamAction extends BaseAction {
	private AdminBiz adminBiz;
	private Integer pageIndex;
	private PageBean pageBean;
	private List<WorkTeam> teamList;
	
	public String teamList(){
		teamList = adminBiz.getAll(WorkTeam.class);
		for(WorkTeam team : teamList){
			List<Cun> cunList = adminBiz.getEntitiesByColumn(Cun.class, "team", team);
			team.setCunList(cunList);
		}		
		return "team_list";
	}
	
	private WorkTeam team;
	public String viewTeam(){
		if(team != null && team.getId() != null){
			team = adminBiz.getEntityById(WorkTeam.class, team.getId());
			List<Cun> cunList = adminBiz.getEntitiesByColumn(Cun.class, "team", team);
			team.setCunList(cunList);
		}
		return "team_edit";
	}
	
	public String saveOrUpdateTeam(){
		try {
			if(team != null && team.getId() != null){
				WorkTeam teamInDB = adminBiz.getEntityById(WorkTeam.class, team.getId());
				teamInDB.setRemark(team.getRemark());
				teamInDB.setSegment1(team.getSegment1());
				teamInDB.setPassword(team.getPassword());
				adminBiz.saveOrUpdateEntity(teamInDB);
				team = teamInDB;
			}else if(team != null && team.getId() == null){//新建
				adminBiz.saveOrUpdateEntity(team);
			}
			String[] cunIds = (String[]) ActionContext.getContext().getParameters().get("cunIds");
			if(cunIds != null && cunIds.length > 0){
				for(String id : cunIds){
					Cun c = adminBiz.getEntityById(Cun.class, Long.valueOf(id));
					c.setTeam(team);
					adminBiz.saveOrUpdateEntity(c);
				}
			}
			this.setMsg("保存成功");
			this.setSucc("Y");
		} catch (RuntimeException e) {
			e.printStackTrace();
			this.setMsg("保存失败，请确保数据准确");
			this.setSucc("N");
		}
		return "team_edit";
	}
	
	public String deleteTeams(){
		String[] ids = (String[]) ActionContext.getContext().getParameters().get("ids");
		if(ids != null && ids.length > 0){
			try {
				for(String idStr : ids){
					Long id = Long.parseLong(idStr);
					adminBiz.deleteTeam(id);
				}
				this.setMsg("删除成功，删除记录数:" + ids.length);
			} catch (Exception e) {
				e.printStackTrace();
				this.setMsg("删除失败，请联系管理员");
			}
		}
		return teamList();
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

	public PageBean getPageBean() {
		return pageBean;
	}

	public void setPageBean(PageBean pageBean) {
		this.pageBean = pageBean;
	}

	public List<WorkTeam> getTeamList() {
		return teamList;
	}

	public void setTeamList(List<WorkTeam> teamList) {
		this.teamList = teamList;
	}

	public WorkTeam getTeam() {
		return team;
	}

	public void setTeam(WorkTeam team) {
		this.team = team;
	}
}
