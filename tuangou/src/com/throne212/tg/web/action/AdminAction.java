package com.throne212.tg.web.action;

import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.PrintWriter;
import java.io.Writer;
import java.util.List;
import java.util.Properties;

import com.opensymphony.xwork2.ActionContext;
import com.throne212.tg.web.biz.CommonBiz;
import com.throne212.tg.web.biz.UserBiz;
import com.throne212.tg.web.common.EncryptUtil;
import com.throne212.tg.web.common.PageBean;
import com.throne212.tg.web.common.Util;
import com.throne212.tg.web.common.WebConstants;
import com.throne212.tg.web.domain.Component;
import com.throne212.tg.web.domain.Site;
import com.throne212.tg.web.domain.SiteType;
import com.throne212.tg.web.domain.TeamCategory;
import com.throne212.tg.web.domain.Teams;
import com.throne212.tg.web.domain.User;

public class AdminAction extends BaseAction {

	private CommonBiz commonBiz;
	private UserBiz userBiz;

	public String index() {
		logger.debug("进入管理首页");
		return "index";
	}

	//信息发布
	private Teams team;
	private List<Component> comList;
	public String publish() {
		if (team != null && !Util.isEmpty(team.getTitle())) {
			logger.info("发布新的团购信息。。。");
			// 图片
			String image = (String) ActionContext.getContext().getSession().get(WebConstants.SESS_IMAGE);
			if (image != null) {
				team.setImage(image);
				ActionContext.getContext().getSession().remove(WebConstants.SESS_IMAGE);
			}
			commonBiz.saveOrUpdateEntity(team);
		}
		comList = commonBiz.getComponentList(TeamCategory.class);
		return "publish";
	}

	// 团购信息列表
	private PageBean pageBean;
	private Integer page;

	public String list() {
		if (page == null || page < 1)
			page = 1;
		pageBean = commonBiz.getAllTeams(page);
		return "list";
	}
	
	//团拍网站
	private Site site;
	public String saveSite() {
		if (site != null && !Util.isEmpty(site.getName())) {
			logger.info("保存或编辑团购网站。。。");
			commonBiz.saveOrUpdateEntity(site);
		}
		comList = commonBiz.getComponentList(SiteType.class);
		return "site_edit";
	}
	public String siteList() {
		if (page == null || page < 1)
			page = 1;
		pageBean = commonBiz.getAllSites(page);
		return "site_list";
	}
	
	//用户
	public String userList() {
		if (page == null || page < 1)
			page = 1;
		pageBean = userBiz.getAllUsers(page);
		return "user_list";
	}

	// 修改密码
	private String oldpassword;
	private String newpassword;
	private String renewpassword;

	public String password() {
		if(oldpassword == null && newpassword == null && renewpassword == null)
			return "password";
		if (Util.isEmpty(oldpassword) || Util.isEmpty(newpassword) || Util.isEmpty(renewpassword)) {
			this.setMsg("请完整输入所有密码输入框");
		} else if (newpassword.length() < 6 || renewpassword.length() < 6) {
			this.setMsg("密码长度不小于6");
		} else if (!newpassword.equals(renewpassword)) {
			this.setMsg("两次新密码输入不一致");
		} else {
			User user = (User) ActionContext.getContext().getSession().get(WebConstants.SESS_USER_OBJ);
			if (!oldpassword.equals(user.getPassword()) && !EncryptUtil.md5Encode(oldpassword).equals(user.getPassword())) {
				this.setMsg("原密码错误");
			} else {
				user.setPassword(EncryptUtil.md5Encode(newpassword));
				userBiz.saveOrUpdateEntity(user);
				ActionContext.getContext().getSession().put(WebConstants.SESS_USER_OBJ, user);
				this.setMsg("密码修改成功");
			}
		}
		return "password";
	}
	
	private String title;
	private String keywords;
	private String desc;

	public String siteSetting() {
		if (!Util.isEmpty(title)) {
			String path = Thread.currentThread().getContextClassLoader().getResource("/").getPath();
			path = path + File.separator + "site.properties";
			Writer writer = null;
			try {
				Properties props = new Properties();
				props.put("site_title", title);
				props.put("site_desc", desc);
				props.put("site_keywords", keywords);
				writer = new PrintWriter(new FileOutputStream(path));
				props.store(writer, null);
				ActionContext.getContext().getApplication().put(WebConstants.APP_TITLE, props.get("site_title"));
				ActionContext.getContext().getApplication().put(WebConstants.APP_DESC, props.get("site_desc"));
				ActionContext.getContext().getApplication().put(WebConstants.APP_KEY_WORDS, props.get("site_keywords"));
			} catch (FileNotFoundException e1) {
				e1.printStackTrace();
			} catch (IOException ex) {
				ex.printStackTrace();
			} finally {
				if (writer != null) {
					try {
						writer.close();
					} catch (IOException e1) {
						e1.printStackTrace();
					}
				}
			}
		}
		return "site_setting";
	}
	
	public CommonBiz getCommonBiz() {
		return commonBiz;
	}

	public void setCommonBiz(CommonBiz commonBiz) {
		this.commonBiz = commonBiz;
	}

	public Teams getTeam() {
		return team;
	}

	public void setTeam(Teams team) {
		this.team = team;
	}

	public List<Component> getComList() {
		return comList;
	}

	public void setComList(List<Component> comList) {
		this.comList = comList;
	}

	public PageBean getPageBean() {
		return pageBean;
	}

	public void setPageBean(PageBean pageBean) {
		this.pageBean = pageBean;
	}

	public Integer getPage() {
		return page;
	}

	public void setPage(Integer page) {
		this.page = page;
	}

	public Site getSite() {
		return site;
	}

	public void setSite(Site site) {
		this.site = site;
	}
	public UserBiz getUserBiz() {
		return userBiz;
	}
	public void setUserBiz(UserBiz userBiz) {
		this.userBiz = userBiz;
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
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getKeywords() {
		return keywords;
	}
	public void setKeywords(String keywords) {
		this.keywords = keywords;
	}
	public String getDesc() {
		return desc;
	}
	public void setDesc(String desc) {
		this.desc = desc;
	}

}
