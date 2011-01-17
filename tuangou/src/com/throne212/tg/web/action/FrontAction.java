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
import com.throne212.tg.web.domain.Comment;
import com.throne212.tg.web.domain.News;
import com.throne212.tg.web.domain.Site;
import com.throne212.tg.web.domain.TeamCategory;
import com.throne212.tg.web.domain.Teams;
import com.throne212.tg.web.domain.User;

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
			siteList=commonBiz.getSiteByCity(city);
			ActionContext.getContext().getSession().put(WebConstants.SESS_CITY, city);
		} else {
			ActionContext.getContext().getSession().put(WebConstants.SESS_CITY, null);
		}
		return "index";
	}
	private List<Comment> threeNewCommentsList;//获取最新的3条团购信息评论
	private List<Teams> fiveMostClickList;//获取点击次数最多的前5条团购信息
	private List<News> newsList;//获取新发布的6条新闻信息（按orderNum升序）
	private List<Site> siteList;
	private Map<String, List<Teams>> cateAndTeamsMap;//用于保存首页展示的团购信息，Key 分类名    Value 每类的最新10条团购信息
	private long allCount;//保存所有团购信息数
	private Map<String, Long> cateAndCountMap=new HashMap<String, Long>();//保存各类的团购信息数
	private List<TeamCategory> actionCates;
	public String index() {
		city = (City) ActionContext.getContext().getSession().get(WebConstants.SESS_CITY);
		//获得特定城市的团购网站名称和链接
		siteList = commonBiz.getSiteByCity(city);
		//获取新发布的6条新闻信息（按orderNum升序）
		newsList=commonBiz.getAll(News.class, "orderNum", "asc", 0, 6);
		ActionContext.getContext().getSession().put(WebConstants.SESS_NEWS_LIST, newsList);
		logger.debug("size of newsList-----"+newsList.size());
		//获取点击次数最多的前5条团购信息
		fiveMostClickList=commonBiz.getAll(Teams.class, "clickTimes", "desc", 0, 5);
		ActionContext.getContext().getSession().put(WebConstants.SESS_MOST_CLICK_TEAMS, fiveMostClickList);
		logger.debug("size of fiveMostClickList----"+fiveMostClickList.size());
		//获取最新的3条团购信息评论
		threeNewCommentsList=commonBiz.getAll(Comment.class, "lastModifyDate", "desc", 0, 3);
		ActionContext.getContext().getSession().put(WebConstants.SESS_THREE_COMMENTS,threeNewCommentsList);
		logger.debug("size of threeNewCommentsList -----"+threeNewCommentsList.size());
		
		
		String cityName;
		//获取城市名
		if(null==city){
			city=commonBiz.getAll(City.class).get(0);
			cityName=city.getName();
			ActionContext.getContext().getSession().put(WebConstants.SESS_CITY, city);
		}else{
			cityName=city.getName();
		}
		logger.debug("cityName---"+cityName);
		actionCates = commonBiz.getAll(TeamCategory.class, "orderNum", "asc");
		allCount=commonBiz.getEntitySum(Teams.class);		
       logger.debug(allCount);
       ActionContext.getContext().getSession().put(WebConstants.SESS_ALL_COUNT, allCount);
       cateAndTeamsMap=new HashMap<String, List<Teams>>();
		for (TeamCategory teamCategory : actionCates) {
			cateAndTeamsMap.put(teamCategory.getName(), commonBiz.getTopNewTeamsByCateAndCity(WebConstants.NUM_PER_CATE, teamCategory.getName(), cityName));
	        cateAndCountMap.put(teamCategory.getName(), commonBiz.getEntitySumByColsValue(Teams.class, "cate", "name", teamCategory.getName()));
	        ActionContext.getContext().getSession().put(WebConstants.SESS_CATE_COUNT, cateAndCountMap);
	        logger.debug("***********"+teamCategory.getName());
	        logger.debug("size of "+teamCategory.getName()+cateAndTeamsMap.get(teamCategory.getName()).size());
		}
		return "success";
	}
	
	private Teams team;
	private Site site;
	private PageBean<Comment> commentsPageBean;
	

	//获取单条团购信息的详情
	public String page() {
		logger.debug(team.getId());
		team=commonBiz.getEntityById(Teams.class, team.getId());
		//获得此团购消息的来源网的详情
		site=commonBiz.getEntityByUnique(Site.class, "name", team.getSiteName());
		logger.debug(team.getId());
		logger.debug(pageIndex);
		//根据团购信息ID获取此团购的评论信息
		commentsPageBean=commonBiz.getAllCommentsByTeamId(pageIndex, team.getId());
		logger.debug("size of commentsPageBean===="+commentsPageBean.getResultList().size());
		team.setClickTimes(team.getClickTimes()+1);//点击次数加1
		commonBiz.saveOrUpdateEntity(team);
		return "success";
	}
	


	
	//显示某一团购类型的所有团购信息
	private PageBean<Teams> pageBean;
	private Integer pageIndex=0;
	private TeamCategory teamCate;
	public String list() {
		if (pageIndex == null || pageIndex < 1)
			pageIndex = 1;
		city=commonBiz.getEntityById(City.class, city.getId());
		pageBean = commonBiz.getAllTeamsByCateIdAndCityName(pageIndex, teamCate.getId(), city.getName());
		teamCate=commonBiz.getEntityById(TeamCategory.class, teamCate.getId());
				logger.debug("size of pageBean.getResultList()==========="+pageBean.getResultList().size());
				return "success";
		
	}
	
	public String listCate() {
		
		
		if (pageIndex == null || pageIndex < 1)
			pageIndex = 1;
//		city=commonBiz.getEntityById(City.class, city.getId());
		pageBean = commonBiz.getAllTeamsByCateId(pageIndex, teamCate.getId());
		logger.debug(pageBean.getResultList().size());
		teamCate=commonBiz.getEntityById(TeamCategory.class, teamCate.getId());
		logger.debug(teamCate.getName());
		
		
		return "success";
		
	}
	
	private String searchKeyword;
	public String search() {
		if (pageIndex == null || pageIndex < 1)
			pageIndex = 1;
		pageBean = commonBiz.searchTeamsByKeyword(pageIndex, searchKeyword);
        ActionContext.getContext().getSession().put("keyword", searchKeyword);

		logger.debug(pageBean.getResultList().size());
//		teamCate=commonBiz.getEntityById(TeamCategory.class, teamCate.getId());
//		logger.debug(teamCate.getName());
		
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



	public long getAllCount() {
		return allCount;
	}

	public void setAllCount(long allCount) {
		this.allCount = allCount;
	}

	public Map<String, Long> getCateAndCountMap() {
		return cateAndCountMap;
	}

	public void setCateAndCountMap(Map<String, Long> cateAndCountMap) {
		this.cateAndCountMap = cateAndCountMap;
	}

	public String getSearchKeyword() {
		return searchKeyword;
	}

	public void setSearchKeyword(String searchKeyword) {
		this.searchKeyword = searchKeyword;
	}
	public PageBean<Comment> getCommentsPageBean() {
		return commentsPageBean;
	}

	public void setCommentsPageBean(PageBean<Comment> commentsPageBean) {
		this.commentsPageBean = commentsPageBean;
	}

	public List<News> getNewsList() {
		return newsList;
	}

	public void setNewsList(List<News> newsList) {
		this.newsList = newsList;
	}

	public List<Teams> getFiveMostClickList() {
		return fiveMostClickList;
	}

	public void setFiveMostClickList(List<Teams> fiveMostClickList) {
		this.fiveMostClickList = fiveMostClickList;
	}

	public List<Comment> getThreeNewCommentsList() {
		return threeNewCommentsList;
	}

	public void setThreeNewCommentsList(List<Comment> threeNewCommentsList) {
		this.threeNewCommentsList = threeNewCommentsList;
	}

	
	
}
