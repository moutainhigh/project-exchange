package com.throne212.tg.web.action;

import java.util.HashSet;
import java.util.Iterator;
import java.util.Set;

import com.opensymphony.xwork2.ActionContext;
import com.throne212.tg.web.biz.CommonBiz;
import com.throne212.tg.web.biz.UserBiz;
import com.throne212.tg.web.common.EncryptUtil;
import com.throne212.tg.web.common.PageBean;
import com.throne212.tg.web.common.Util;
import com.throne212.tg.web.common.WebConstants;
import com.throne212.tg.web.domain.Advert;
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
	
private String location;
private String birthday;
private Boolean gender;
private String qq;
private String tel;
private String email;
	public String changeUserInfo() {
		User userObj=(User)ActionContext.getContext().getSession().get(WebConstants.SESS_USER_OBJ);
		if (userObj==null) {
			this.setMsg("请先登录！");
			return "login";
		}
		if ("".equals(location)||"".equals(birthday)||null==gender) {
			this.setMsg("请填入完整的资料内容！");
			return "showInfoChange";
		}
		if (user!=null&&user.getId()!=null) {
			user=commonBiz.getEntityById(User.class, user.getId());
		}
		user.setLocation(location);
		user.setBirthday(birthday);
		user.setGender(gender);
		user.setQq(qq);
		user.setTel(tel);
		user.setEmail(email);
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

public String showBoughtTeams() {
	
	User user = (User) ActionContext.getContext().getSession().get(
			WebConstants.SESS_USER_OBJ);
	if (user == null) {
		this.setMsg("请先登录后再进行操作！");
		return "login";
	}
	pageBean=commonBiz.getAllBoughtTeamsOfUser(pageIndex, user.getLoginName());
	
	
	return "show_bought_teams";
	
	
	
	
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
		
		logger.debug(collectTeams.size());
		collectTeams=this.removeTeam(collectTeams, team);
		logger.debug(collectTeams.size());
		collectUsers=this.removeUser(collectUsers, user);
		team.setCollectUsers(collectUsers);
		user.setCollectTeams(collectTeams);
//		team.setCollectTimes(team.getCollectTimes()-1);
		
		commonBiz.saveOrUpdateEntity(user);
		commonBiz.saveOrUpdateEntity(team);
		this.setMsg("成功删除收藏！");
		return showCollectTeams();
		
		
	}

	return "show_collect_teams";
}


public String deleteBoughtTeam() {
	
	User user = (User) ActionContext.getContext().getSession().get(
			WebConstants.SESS_USER_OBJ);
	if (user == null) {
		this.setMsg("请先登录后再进行操作！");
		return "login";
	}
	if(team!=null&&team.getId()!=null){
		team=commonBiz.getEntityById(Teams.class, team.getId());
		Set<User> boughtUsers =new HashSet<User>();
		boughtUsers=team.getBuyedUsers();
		Set<Teams> boughtTeams = new HashSet<Teams>();
		boughtTeams=	user.getBuyedTeams();
		
		logger.debug(boughtTeams.size());
		boughtTeams=this.removeTeam(boughtTeams, team);
		logger.debug(boughtTeams.size());
		boughtUsers=this.removeUser(boughtUsers, user);
		team.setBuyedUsers(boughtUsers);
		user.setBuyedTeams(boughtTeams);
	
		
		commonBiz.saveOrUpdateEntity(user);
		commonBiz.saveOrUpdateEntity(team);
		this.setMsg("成功删除已购买记录！");
		return showBoughtTeams();
	}
	return "show_bought_teams";
	
}
public String collectToBought() {
	
	User user = (User) ActionContext.getContext().getSession().get(
			WebConstants.SESS_USER_OBJ);
	if (user == null) {
		this.setMsg("请先登录后再进行操作！");
		return "login";
	}
	if (team != null && team.getId() != null) {
		team = commonBiz.getEntityById(Teams.class, team.getId());
		Set<User> buyedUsers =new HashSet<User>();
		buyedUsers=team.getBuyedUsers();
		Set<Teams> boughtTeams = new HashSet<Teams>();
		boughtTeams=	user.getBuyedTeams();
		if (!checkIfExist(buyedUsers, user.getLoginName())) {
			buyedUsers.add(user);
			team.setBuyedUsers(buyedUsers);
			team.setBuyTimes(team.getBuyTimes()+1);
			commonBiz.saveOrUpdateEntity(team);
			boughtTeams.add(team);
			user.setBuyedTeams(boughtTeams);
			commonBiz.saveOrUpdateEntity(user);
			this.setMsg("成功标记团购消息！");
			
			team=commonBiz.getEntityById(Teams.class, team.getId());
			Set<User> collectUsers =new HashSet<User>();
			collectUsers=team.getCollectUsers();
			Set<Teams> collectTeams = new HashSet<Teams>();
			collectTeams=	user.getCollectTeams();
			collectTeams=this.removeTeam(collectTeams, team);
			collectUsers=this.removeUser(collectUsers, user);
			team.setCollectUsers(collectUsers);
			user.setCollectTeams(collectTeams);
			commonBiz.saveOrUpdateEntity(user);
			commonBiz.saveOrUpdateEntity(team);
			return showCollectTeams();
			
			
			
		} else {

			this.setMsg("你已标注过此团购信息！");
			return "bought";
		}


	}
	
	return "bought";
	

}

private boolean checkIfExist(Set<User> users, String customer) {
	boolean isExist = false;
	for (Iterator<User> iterator = users.iterator(); iterator.hasNext();) {
		User user = (User) iterator.next();
		if (user.getLoginName().equals(customer)) {
			isExist = true;
		}
	}
	return isExist;

}


public String showChangePhoto() {
	User user = (User) ActionContext.getContext().getSession().get(
			WebConstants.SESS_USER_OBJ);
	if (user == null) {
		this.setMsg("请先登录后再进行操作！");
		return "login";
	}
	return "showChangePhoto";
	
	
}
public String changePhoto() {
	User user = (User) ActionContext.getContext().getSession().get(
			WebConstants.SESS_USER_OBJ);
	if (user == null) {
		this.setMsg("请先登录后再进行操作！");
		return "login";
	}
	String photo = (String) ActionContext.getContext().getSession().get(WebConstants.SESS_IMAGE);
	if (photo != null) {
		user.setPhoto(photo);
		ActionContext.getContext().getSession().remove(WebConstants.SESS_IMAGE);
	}
	commonBiz.saveOrUpdateEntity(user);
	this.setMsg("设置成功！");
	return "showChangePhoto";
}


private Set<User> removeUser(Set<User> set,User u) {
	User userToRmv=new User();
	for (Iterator iterator = set.iterator(); iterator.hasNext();) {
		User name = (User) iterator.next();
		if (name.getId().equals(u.getId())) {
			logger.debug(">>>>>>>>>>>>>>"+name.getId()+"equals"+u.getId());
			userToRmv=name;
			
			
		}
	}
	set.remove(userToRmv);
	return set;
}

private Set<Teams> removeTeam(Set<Teams> set,Teams team) {
	Teams teamToRmv=new Teams();
	for (Iterator iterator = set.iterator(); iterator.hasNext();) {
		Teams name = (Teams) iterator.next();
		if (name.getId().equals(team.getId())) {
			logger.debug(">>>>>>>>>>>>>>"+name.getId()+"equals"+team.getId());
			teamToRmv=name;
		}
	}
	set.remove(teamToRmv);
	return set;
	
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

		public String getLocation() {
			return location;
		}

		public void setLocation(String location) {
			this.location = location;
		}

		public String getBirthday() {
			return birthday;
		}

		public void setBirthday(String birthday) {
			this.birthday = birthday;
		}

		public Boolean getGender() {
			return gender;
		}

		public void setGender(Boolean gender) {
			this.gender = gender;
		}

		public String getQq() {
			return qq;
		}

		public void setQq(String qq) {
			this.qq = qq;
		}

		public String getTel() {
			return tel;
		}

		public void setTel(String tel) {
			this.tel = tel;
		}

		public String getEmail() {
			return email;
		}

		public void setEmail(String email) {
			this.email = email;
		}

	


	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}
