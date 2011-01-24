package com.throne212.tg.web.action;

import com.opensymphony.xwork2.ActionContext;
import com.throne212.tg.web.biz.CommonBiz;
import com.throne212.tg.web.common.WebConstants;
import com.throne212.tg.web.domain.Teams;
import com.throne212.tg.web.domain.User;

public class commonAction extends BaseAction {
	private CommonBiz commonBiz;
	private Teams team;
	public String collect() {
		User user =(User)ActionContext.getContext().getSession().get(WebConstants.SESS_USER_OBJ);
		if (user==null) {
			this.setMsg("请先登录后再进行操作！");
			return "login";
		} 
		if(team!=null&&team.getId()!=null){
			team=commonBiz.getEntityById(Teams.class, team.getId());
			team.setCollectUser(user);
			team.setCollectTimes(team.getClickTimes()+1);
			commonBiz.saveOrUpdateEntity(team);
		}
	
		
		return "";
	}

	
	

	
	
	
	
	
	
	
	
	
	
	
	public Teams getTeam() {
		return team;
	}
	public void setTeam(Teams team) {
		this.team = team;
	}















	public CommonBiz getCommonBiz() {
		return commonBiz;
	}















	public void setCommonBiz(CommonBiz commonBiz) {
		this.commonBiz = commonBiz;
	}
	
}
