package com.throne212.info168.web.dao.impl;

import java.util.List;

import com.throne212.info168.web.dao.CateDao;
import com.throne212.info168.web.domain.Category;

public class CateDaoImpl extends BaseDaoImpl implements CateDao {

	public List<Category> getTopCates() {
		String hql = "from Category a where a.parent is null order by grade,id";
		return this.getHibernateTemplate().find(hql);
	}
	
	public List<Category> get2ndCates(Category parent){
		String hql = "from Category a where a.parent =? order by grade,id";
		return this.getHibernateTemplate().find(hql,parent);
	}

}
