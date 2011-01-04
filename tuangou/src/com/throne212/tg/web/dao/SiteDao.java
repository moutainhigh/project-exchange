package com.throne212.tg.web.dao;

import java.util.List;

import com.throne212.tg.web.common.PageBean;
import com.throne212.tg.web.domain.City;
import com.throne212.tg.web.domain.Site;

public interface SiteDao extends BaseDao {
	public PageBean<Site> getAllSites(int page);
	public List<Site> getSiteByCity(City city);
}
