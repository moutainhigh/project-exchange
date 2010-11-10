package com.throne212.info168.web.dao.impl;

import java.util.List;

import com.throne212.info168.web.dao.AreaDao;
import com.throne212.info168.web.domain.Area;

public class AreaDaoImpl extends BaseDaoImpl implements AreaDao {

	public List<Area> getTopAreas() {
		String hql = "from Area a where a.parent is null order by grade,id";
		return this.getHibernateTemplate().find(hql);
	}

	public List<Area> get2ndAreas(Area parent) {
		String hql = "from Area a where a.parent =? order by grade,id";
		return this.getHibernateTemplate().find(hql, parent);
	}

	public List<Area> getAllCities() {
		String hql = "from Area a where a.parent!=null and a.parent.parent is null order by pinyin";
		return this.getHibernateTemplate().find(hql);
	}

	public List<Area> getSuggCities(String key){
		String hql = "from Area a where a.parent!=null and a.parent.parent is null and a.name like ? order by pinyin";
		return this.getHibernateTemplate().find(hql, "%"+key+"%");
	}
	
}
