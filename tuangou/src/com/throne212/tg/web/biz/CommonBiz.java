package com.throne212.tg.web.biz;

import java.util.List;

import com.throne212.tg.web.common.PageBean;
import com.throne212.tg.web.domain.City;
import com.throne212.tg.web.domain.Comment;
import com.throne212.tg.web.domain.Component;
import com.throne212.tg.web.domain.News;
import com.throne212.tg.web.domain.Site;
import com.throne212.tg.web.domain.Teams;


public interface CommonBiz extends BaseBiz {

	public List<Component> getComponentList(Class<? extends Component> clazz);
	
	public PageBean<Teams> getAllTeams(int page);
	
	public PageBean<Site> getAllSites(int page);
	
	//获取不同城市的团购站点
	public List<Site> getSiteByCity(City city);
	//获取不同城市不同信息类别的最新10条团购信息
	public List<Teams> getTopNewTeamsByCateAndCity(int num,String cateName,String cityName);
	//通过类型ID和城市名查询所有团购信息列表
	public PageBean<Teams> getAllTeamsByCateIdAndCityName(int page,long cateId,String cityName); 
	
	//通过类型ID查询所有团购信息列表
	public PageBean<Teams> getAllTeamsByCateId(int page,long cateId);
	
	//按关键字搜索团购信息
	public PageBean<Teams> searchTeamsByKeyword(int page,String keyword);
	//按团购信息查询评论
	public PageBean<Comment> getAllCommentsByTeamId(int page,long teamId);
	//分页获取所有新闻信息
	public PageBean<News> getAllNews(int page);
	
	//分页获取所有评论信息
	public PageBean<Comment> getAllComments(int page);
	//按团购信息关键字查询类似团购信息
	public List<Teams> getSimilarTeams(int num,String cate,String keywords);
	
	//查询用户收藏的团购信息
	public PageBean<Teams> getAllCollectTeamsOfUser(int pageIndex,String loginName);
	
}
