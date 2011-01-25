package com.throne212.tg.web.action;

import java.util.HashSet;
import java.util.Set;

import com.opensymphony.xwork2.ActionContext;
import com.throne212.tg.web.biz.CommonBiz;
import com.throne212.tg.web.biz.UserBiz;
import com.throne212.tg.web.common.EncryptUtil;
import com.throne212.tg.web.common.PageBean;
import com.throne212.tg.web.common.Util;
import com.throne212.tg.web.common.WebConstants;
import com.throne212.tg.web.domain.Teams;
import com.throne212.tg.web.domain.User;

public class UserCenterAction extends BaseAction {
	private CommonBiz commonBiz;
	private UserBiz userBiz;
	private User user;

	public String enter() {
		
	    user=(User)ActionContext.getContext().getSession().get(WebConstants.SESS_USER_OBJ);
		if (user==null) {
			this.setMsg("请先登录！");
			return "login";
		}
		return "entered";
	}
	
	public String showInfoChange() {
		
		 user=(User)ActionContext.getContext().getSession().get(WebConstants.SESS_USER_OBJ);
		if (user==null) {
			this.setMsg("请先登录！");
			return "login";
		}
		return "showInfoChange";
		
	}
	

	public String changeUserInfo() {
		User userObj=(User)ActionContext.getContext().getSession().get(WebConstants.SESS_USER_OBJ);
		if (userObj==null) {
			this.setMsg("请先登录！");
			return "login";
		}
		if ("".equals(user.getLocation())||"".equals(user.getBirthday())||null==user.getGender()) {
			this.setMsg("请填入完整的资料内容！");
			return "showInfoChange";
		}
		user.setLoginName(userObj.getLoginName());

		user.setPassword(userObj.getPassword());
		user.setUserType(userObj.getUserType());
		user.setRegDate(userObj.getRegDate());
	    logger.debug(user.getGender());
	    logger.debug(user.getLoginName());
	    logger.debug(user.getPassword());
		commonBiz.saveOrUpdateEntity(user);
		user=commonBiz.getEntityById(User.class, user.getId());
		ActionContext.getContext().getSession().put(WebConstants.SESS_USER_OBJ, user);
		
		this.setMsg("更新资料成功！");
		return "showInfoChange";
	}
	
	public String showChangePwd() {
		 user=(User)ActionContext.getContext().getSession().get(WebConstants.SESS_USER_OBJ);
			if (user==null) {
				this.setMsg("请先登录！");
				return "login";
			}
			
			return "showChangePwd";
	}
	private String oldpassword;
	private String newpassword;
	private String renewpassword;
	
  
public String changePwd() {
	   user=(User)ActionContext.getContext().getSession().get(WebConstants.SESS_USER_OBJ);
		if (user==null) {
			this.setMsg("请先登录！");
			return "login";
		}
		
		if(oldpassword == null && newpassword == null && renewpassword == null)
			return "showChangePwd";
		if (Util.isEmpty(oldpassword) || Util.isEmpty(newpassword) || Util.isEmpty(renewpassword)) {
			this.setMsg("请完整输入所有密码输入框");
		} else if (newpassword.length() < 6 || renewpassword.length() < 6) {
			this.setMsg("密码长度不小于6");
		} else if (!newpassword.equals(renewpassword)) {
			this.setMsg("两次新密码输入不一致");
		} else {
			User userObj = (User) ActionContext.getContext().getSession().get(WebConstants.SESS_USER_OBJ);
			if (!oldpassword.equals(userObj.getPassword()) && !EncryptUtil.md5Encode(oldpassword).equals(userObj.getPassword())) {
				this.setMsg("原密码错误");
			} else {
				userObj.setPassword(EncryptUtil.md5Encode(newpassword));
				userBiz.saveOrUpdateEntity(userObj);
				ActionContext.getContext().getSession().put(WebConstants.SESS_USER_OBJ, userObj);
				this.setMsg("密码修改成功");
			}
		}
		
		return "showChangePwd";
	
}
	
	
private int pageIndex;
private PageBean<Teams> pageBean;
public String showCollectTeams(){
	User user = (User) ActionContext.getContext().getSession().get(
			WebConstants.SESS_USER_OBJ);
	if (user == null) {
		this.setMsg("请先登录后再进行操作！");
		return "login";
	}
	
	pageBean=commonBiz.getAllCollectTeamsOfUser(pageIndex, user.getLoginName());

	return "show_collect_teams";
	
	
}
private Teams team;
public String deleteCollectTeam(){
	
	User user = (User) ActionContext.getContext().getSession().get(
			WebConstants.SESS_USER_OBJ);
	if (user == null) {
		this.setMsg("请先登录后再进行操作！");
		return "login";
	}
	
	if(team!=null&&team.getId()!=null){
		team=commonBiz.getEntityById(Teams.class, team.getId());
		Set<User> collectUsers =new HashSet<User>();
		collectUsers=team.getCollectUsers();
		Set<Teams> collectTeams = new HashSet<Teams>();
		collectTeams=	user.getCollectTeams();
		collectTeams.remove(team);
		collectUsers.remove(user);
		team.setCollectUsers(collectUsers);
		user.setCollectTeams(collectTeams);
		commonBiz.merge(user);
		commonBiz.merge(team);
		commonBiz.saveOrUpdateEntity(user);
		commonBiz.saveOrUpdateEntity(team);
		this.setMsg("成功删除收藏！");
		return showCollectTeams();
		
		
	}

	return "show_collect_teams";
}


	public CommonBiz getCommonBiz() {
		return commonBiz;
	}

	public void setCommonBiz(CommonBiz commonBiz) {
		this.commonBiz = commonBiz;
	}

	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}

	
	 public String getOldpassword() {
			return oldpassword;
		}

		public void setOldpassword(String oldpassword) {
			this.oldpassword = oldpassword;
		}

		public String getNewpassword() {
			return newpassword;
		}

		public void setNewpassword(String newpassword) {
			this.newpassword = newpassword;
		}

		public String getRenewpassword() {
			return renewpassword;
		}

		public void setRenewpassword(String renewpassword) {
			this.renewpassword = renewpassword;
		}

		public UserBiz getUserBiz() {
			return userBiz;
		}

		public void setUserBiz(UserBiz userBiz) {
			this.userBiz = userBiz;
		}

		public int getPageIndex() {
			return pageIndex;
		}

		public void setPageIndex(int pageIndex) {
			this.pageIndex = pageIndex;
		}

		public PageBean<Teams> getPageBean() {
			return pageBean;
		}

		public void setPageBean(PageBean<Teams> pageBean) {
			this.pageBean = pageBean;
		}

		public Teams getTeam() {
			return team;
		}

		public void setTeam(Teams team) {
			this.team = team;
		}

	


	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}
