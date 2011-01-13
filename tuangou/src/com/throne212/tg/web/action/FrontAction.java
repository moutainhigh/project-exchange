package com.throne212.tg.web.action;

import java.lang.reflect.Method;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.opensymphony.xwork2.ActionContext;
import com.throne212.tg.web.biz.CommonBiz;
import com.throne212.tg.web.common.PageBean;
import com.throne212.tg.web.common.Util;
import com.throne212.tg.web.common.WebConstants;
import com.throne212.tg.web.domain.City;
import com.throne212.tg.web.domain.Site;
import com.throne212.tg.web.domain.TeamCategory;
import com.throne212.tg.web.domain.Teams;

public class FrontAction extends BaseAction {

	private CommonBiz commonBiz;

	private City city;

	private String method;// 页面参数

	public String execute() {
		if (!Util.isEmpty(method)) {
			Class clazz = this.getClass();
			try {
				Method m = null;
				try {
					m = clazz.getMethod(method);
				} catch (Exception e) {
					//ignore
				}
				if (m != null)
					return (String) m.invoke(this);
			} catch (Exception e) {
				logger.error(e.getMessage(), e);
			}
		}
		return "success";
	}

	public String selectCity() {
		if (city != null && city.getId() != null) {
			city = commonBiz.getEntityById(City.class, city.getId());
			ActionContext.getContext().getSession().put(WebConstants.SESS_CITY, city);
		} else {
			ActionContext.getContext().getSession().put(WebConstants.SESS_CITY, null);
		}
		return "index";
	}
	
	private List<Site> siteList;
	private Map<String, List<Teams>> cateAndTeamsMap;//用于保存首页展示的团购信息，Key 分类名    Value 每类的最新10条团购信息
	private List<TeamCategory> cates;
	public String index() {
		city = (City) ActionContext.getContext().getSession().get(WebConstants.SESS_CITY);
		//获得特定城市的团购网站名称和链接
		siteList = commonBiz.getSiteByCity(city);
		String cityName;
		//获取城市名
		if(null==city){
			cityName=WebConstants.DEFAULT_CITY_NAME;
		}else{
			cityName=city.getName();
		}
		logger.debug("cityName---"+cityName);
		cates = commonBiz.getAll(TeamCategory.class, "orderNum", "asc");
		cateAndTeamsMap=new HashMap<String, List<Teams>>();
		for (TeamCategory teamCategory : cates) {
			cateAndTeamsMap.put(teamCategory.getName(), commonBiz.getTopNewTeamsByCateAndCity(WebConstants.NUM_PER_CATE, teamCategory.getName(), cityName));
	       logger.debug("***********"+teamCategory.getName());
	       logger.debug("size of "+teamCategory.getName()+cateAndTeamsMap.get(teamCategory.getName()).size());
		}
		return "success";
	}
	
	private Teams team;
	private Site site;
	//获取单条团购信息的详情
	public String page() {
		
		team=commonBiz.getEntityById(Teams.class, team.getId());
		//获得此团购消息的来源网的详情
		site=commonBiz.getEntityByUnique(Site.class, "name", team.getSiteName());
		return "success";
	}
	
	//显示某一团购类型的所有团购信息
	private PageBean<Teams> pageBean;
	private Integer pageIndex;
	private TeamCategory teamCate;
	public String list() {
		if (pageIndex == null || pageIndex < 1)
			pageIndex = 1;
		
		pageBean = commonBiz.getAllTeamsByCateId(pageIndex, teamCate.getId());
		teamCate=commonBiz.getEntityById(TeamCategory.class, teamCate.getId());
				logger.debug("size of pageBean.getResultList()==========="+pageBean.getResultList().size());
				return "success";
		
	}
	

	public City getCity() {
		return city;
	}

	public void setCity(City city) {
		this.city = city;
	}

	public CommonBiz getCommonBiz() {
		return commonBiz;
	}

	public void setCommonBiz(CommonBiz commonBiz) {
		this.commonBiz = commonBiz;
	}

	public String getMethod() {
		return method;
	}

	public void setMethod(String method) {
		this.method = method;
	}

	public List<Site> getSiteList() {
		return siteList;
	}

	public void setSiteList(List<Site> siteList) {
		this.siteList = siteList;
	}

	public Map<String, List<Teams>> getCateAndTeamsMap() {
		return cateAndTeamsMap;
	}

	public void setCateAndTeamsMap(Map<String, List<Teams>> cateAndTeamsMap) {
		this.cateAndTeamsMap = cateAndTeamsMap;
	}

	public Teams getTeam() {
		return team;
	}

	public void setTeam(Teams team) {
		this.team = team;
	}

	public Site getSite() {
		return site;
	}

	public void setSite(Site site) {
		this.site = site;
	}

	

	public PageBean<Teams> getPageBean() {
		return pageBean;
	}

	public void setPageBean(PageBean<Teams> pageBean) {
		this.pageBean = pageBean;
	}

	

	public Integer getPageIndex() {
		return pageIndex;
	}

	public void setPageIndex(Integer pageIndex) {
		this.pageIndex = pageIndex;
	}

	public TeamCategory getTeamCate() {
		return teamCate;
	}

	public void setTeamCate(TeamCategory teamCate) {
		this.teamCate = teamCate;
	}

	public List<TeamCategory> getCates() {
		return cates;
	}

	public void setCates(List<TeamCategory> cates) {
		this.cates = cates;
	}

	
}
