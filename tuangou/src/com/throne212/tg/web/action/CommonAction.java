package com.throne212.tg.web.action;

import java.util.HashSet;
import java.util.Iterator;
import java.util.Set;

import com.opensymphony.xwork2.ActionContext;
import com.throne212.tg.web.biz.CommonBiz;
import com.throne212.tg.web.common.WebConstants;
import com.throne212.tg.web.domain.Teams;
import com.throne212.tg.web.domain.User;

public class CommonAction extends BaseAction {
	private CommonBiz commonBiz;
	private Teams team;
	public String collect() {
		User user = (User) ActionContext.getContext().getSession().get(
				WebConstants.SESS_USER_OBJ);
		if (user == null) {
			this.setMsg("请先登录后再进行操作！");
			return "login";
		}
		if (team != null && team.getId() != null) {
			team = commonBiz.getEntityById(Teams.class, team.getId());
			Set<User> collectUsers =new HashSet<User>();
			collectUsers=team.getCollectUsers();
			Set<Teams> collectTeams = new HashSet<Teams>();
			collectTeams=	user.getCollectTeams();
			if (!checkIfCollected(collectUsers, user.getLoginName())) {
				collectUsers.add(user);
				team.setCollectUsers(collectUsers);
				team.setCollectTimes(team.getClickTimes() + 1);
				commonBiz.saveOrUpdateEntity(team);
				
				collectTeams.add(team);
				user.setCollectTeams(collectTeams);
				commonBiz.saveOrUpdateEntity(user);
				this.setAnotherMsg("成功收藏此团购消息！");
				
			} else {

				this.setAnotherMsg("你已收藏过此团购信息！");
				return "collect";
			}
//			if (!collectTeams.contains(team)) {
//				collectTeams.add(team);
//				user.setCollectTeams(collectTeams);
//				commonBiz.saveOrUpdateEntity(user);
//			}else {
//				this.setMsg("你已收藏过此团购信息！");
//				return "collect";
//			}

		}

		return "collect";
	}

	  private boolean checkIfCollected(Set<User> users, String customer) {
		boolean isExist = false;
		for (Iterator<User> iterator = users.iterator(); iterator.hasNext();) {
			User user = (User) iterator.next();
			if (user.getLoginName().equals(customer)) {
				isExist = true;
			}
		}
		return isExist;

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
