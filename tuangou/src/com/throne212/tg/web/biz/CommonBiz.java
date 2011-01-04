package com.throne212.tg.web.biz;

import java.util.List;

import com.throne212.tg.web.common.PageBean;
import com.throne212.tg.web.domain.City;
import com.throne212.tg.web.domain.Component;
import com.throne212.tg.web.domain.Site;
import com.throne212.tg.web.domain.Teams;


public interface CommonBiz extends BaseBiz {

	public List<Component> getComponentList(Class<? extends Component> clazz);
	
	public PageBean<Teams> getAllTeams(int page);
	
	public PageBean<Site> getAllSites(int page);
	
	//获取不同城市的团购站点
	public List<Site> getSiteByCity(City city);
	
}
