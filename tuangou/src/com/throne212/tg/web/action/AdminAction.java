package com.throne212.tg.web.action;

import java.util.List;

import com.opensymphony.xwork2.ActionContext;
import com.throne212.tg.web.biz.CommonBiz;
import com.throne212.tg.web.common.PageBean;
import com.throne212.tg.web.common.Util;
import com.throne212.tg.web.common.WebConstants;
import com.throne212.tg.web.domain.Component;
import com.throne212.tg.web.domain.Site;
import com.throne212.tg.web.domain.TeamCategory;
import com.throne212.tg.web.domain.Teams;

public class AdminAction extends BaseAction {

	private CommonBiz commonBiz;

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
		return "site_edit";
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

}
