package com.throne212.tg.web.biz.impl;

import java.util.List;

import com.throne212.tg.web.biz.CommonBiz;
import com.throne212.tg.web.common.PageBean;
import com.throne212.tg.web.dao.CommentDao;
import com.throne212.tg.web.dao.NewsDao;
import com.throne212.tg.web.dao.SiteDao;
import com.throne212.tg.web.dao.TeamDao;
import com.throne212.tg.web.domain.City;
import com.throne212.tg.web.domain.Comment;
import com.throne212.tg.web.domain.Component;
import com.throne212.tg.web.domain.News;
import com.throne212.tg.web.domain.Site;
import com.throne212.tg.web.domain.Teams;


public class CommonBizImpl extends BaseBizImpl implements CommonBiz {
	
	private TeamDao teamDao;
	private SiteDao siteDao;
	private CommentDao commentDao;
	private NewsDao newsDao;

	public NewsDao getNewsDao() {
		return newsDao;
	}

	public void setNewsDao(NewsDao newsDao) {
		this.newsDao = newsDao;
	}

	public CommentDao getCommentDao() {
		return commentDao;
	}

	public void setCommentDao(CommentDao commentDao) {
		this.commentDao = commentDao;
	}

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
		if ("全国".equals(cityName)) {
			return teamDao.getTopNewTeamsByCateOfAllCtiy(num, cateName);
			
		} else {
			return teamDao.getTopNewTeamsByCateAndCity(num, cateName, cityName);
		}
		
		
	}

//通过类型Id和城市名查询所有团购信息列表
	public PageBean<Teams> getAllTeamsByCateIdAndCityName(int page,long cateId,String cityName){
	   return teamDao.getAllTeamsByCateIdAndCityName(page, cateId, cityName);
}
	
	//通过类型Id查询所有团购信息列表
	
	public PageBean<Teams> getAllTeamsByCateId(int page,long cateId){
		return teamDao.getAllTeamsByCateId(page, cateId);
	}
	//按关键字搜索团购信息
	public PageBean<Teams> searchTeamsByKeyword(int page,String keyword){
		
		return teamDao.searchTeamsByKeyword(page, keyword);
		
		
	}
	//按团购信息查询评论

	public PageBean<Comment> getAllCommentsByTeamId(int page,long teamId){
		
		return commentDao.getAllCommentsByTeamId(page, teamId);
		
		
		
	}
	//分页获取所有新闻信息
	public PageBean<News> getAllNews(int page){
		
		return newsDao.getAllNews(page);
		
		
	}
	//分页获取所有评论信息
	public PageBean<Comment> getAllComments(int page){
		
		return commentDao.getAllComments(page);
		
	}
	//按团购信息关键字查询类似团购信息
	public List<Teams> getSimilarTeams(int num,String cate,String keywords){
		
		
		return teamDao.getSimilarTeams(num, cate, keywords);
		
		
	}
}
