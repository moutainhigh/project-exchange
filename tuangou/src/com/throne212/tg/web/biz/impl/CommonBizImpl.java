package com.throne212.tg.web.biz.impl;

import java.util.List;

import com.throne212.tg.web.biz.CommonBiz;
import com.throne212.tg.web.common.PageBean;
import com.throne212.tg.web.dao.SiteDao;
import com.throne212.tg.web.dao.TeamDao;
import com.throne212.tg.web.domain.City;
import com.throne212.tg.web.domain.Component;
import com.throne212.tg.web.domain.Site;
import com.throne212.tg.web.domain.Teams;


public class CommonBizImpl extends BaseBizImpl implements CommonBiz {
	
	private TeamDao teamDao;
	private SiteDao siteDao;

	public SiteDao getSiteDao() {
		return siteDao;
	}

	public void setSiteDao(SiteDao siteDao) {
		this.siteDao = siteDao;
	}

	public TeamDao getTeamDao() {
		return teamDao;
	}

	public void setTeamDao(TeamDao teamDao) {
		this.teamDao = teamDao;
	}

	public List<Component> getComponentList(Class<? extends Component> clazz){
		return (List<Component>) baseDao.getAll(clazz,"orderNum","asc");
	}
	
	public PageBean<Teams> getAllTeams(int page){
		return teamDao.getAllTeams(page);
	}
	
	public PageBean<Site> getAllSites(int page){
		return siteDao.getAllSites(page);
	}
	
	public List<Site> getSiteByCity(City city){
		if(city==null||city.getName().equals("全国"))
			return this.getAll(Site.class, "listOrder", "asc");
		else{
			return siteDao.getSiteByCity(city);
		}
	}
public List<Teams> getTopNewTeamsByCateAndCity(int num,String cateName,String cityName) {
		
		return teamDao.getTopNewTeamsByCateAndCity(num, cateName, cityName);
		
	}

//通过类型Id查询所有团购信息列表
public PageBean<Teams> getAllTeamsByCateId(int page,long id){
	   return teamDao.getAllTeamsByCateId(page, id);
}
}
