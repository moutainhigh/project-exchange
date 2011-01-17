package com.throne212.tg.web.dao.impl;

import java.util.List;

import org.hibernate.Session;

import com.throne212.tg.web.common.PageBean;
import com.throne212.tg.web.common.WebConstants;
import com.throne212.tg.web.dao.SiteDao;
import com.throne212.tg.web.domain.City;
import com.throne212.tg.web.domain.Site;

public class SiteDaoImpl extends BaseDaoImpl implements SiteDao {

	public PageBean<Site> getAllSites(int pageIndex) {
		if (pageIndex == 0) {
			pageIndex = 1;
		}
		PageBean<Site> page = new PageBean<Site>();
		int startIndex = (pageIndex - 1) * WebConstants.NUM_PER_BACK_PAGE_SITE;
		String hql = "from Site t order by id desc";
		Long count = (Long) this.getHibernateTemplate().find("select count(*) " + hql).get(0);
		logger.debug("查询总数为：" + count);
		page.setTotalRow(count.intValue());// 总记录数目
		Session s = this.getHibernateTemplate().getSessionFactory().getCurrentSession();
		List<Site> list = s.createQuery(hql).setMaxResults(WebConstants.NUM_PER_BACK_PAGE_SITE).setFirstResult(startIndex).list();
		page.setResultList(list);// 数据列表
		page.setRowPerPage(WebConstants.NUM_PER_BACK_PAGE_SITE);// 每页记录数目
		page.setPageIndex(pageIndex);// 当前页码
		return page; 
	}
	
	public List<Site> getSiteByCity(City city){
		String hql = "from Site s where s.city=? or s.city='全国' order by listOrder asc";
		return this.getHibernateTemplate().find(hql, city.getName());
	}

}
