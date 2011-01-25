package com.throne212.tg.web.dao;

import java.util.List;

import com.throne212.tg.web.common.PageBean;
import com.throne212.tg.web.domain.Teams;

public interface TeamDao extends BaseDao {
	public PageBean<Teams> getAllTeams(int page);
	public List<Teams> getTopNewTeamsByCateAndCity(int num,String cate,String cityName);
	public List<Teams> getTopNewTeamsByCateOfAllCtiy(int num,String cate);
	//通过类型id和城市名查询所有团购信息列表
	public PageBean<Teams> getAllTeamsByCateIdAndCityName(int page,long cateId,String cityName); 
	public PageBean<Teams> getAllTeamsByCateId(int page,long cateId);
	//按关键字搜索团购信息
	public PageBean<Teams> searchTeamsByKeyword(int page,String keyword);
	
	//按团购信息关键字查询类似团购信息
	public List<Teams> getSimilarTeams(int num,String cate,String keywords);
	
	//查询用户收藏的团购信息
	public PageBean<Teams> getAllCollectTeamsOfUser(int pageIndex,String loginName);
	
	
}
