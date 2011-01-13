package com.throne212.tg.web.dao;

import java.util.List;

import com.throne212.tg.web.common.PageBean;
import com.throne212.tg.web.domain.Teams;

public interface TeamDao extends BaseDao {
	public PageBean<Teams> getAllTeams(int page);
	public List<Teams> getTopNewTeamsByCateAndCity(int num,String cate,String cityName);
	//通过类型id查询所有团购信息列表
	public PageBean<Teams> getAllTeamsByCateId(int page,long id); 
		
	
}
