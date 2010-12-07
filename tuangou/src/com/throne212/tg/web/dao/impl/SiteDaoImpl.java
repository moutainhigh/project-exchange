package com.throne212.tg.web.dao.impl;

import java.util.List;

import org.hibernate.Session;

import com.throne212.tg.web.common.PageBean;
import com.throne212.tg.web.dao.SiteDao;
import com.throne212.tg.web.domain.Site;

public class SiteDaoImpl extends BaseDaoImpl implements SiteDao {

	public PageBean<Site> getAllSites(int pageIndex) {
		PageBean<Site> page = new PageBean<Site>();
		int startIndex = (pageIndex - 1) * 20;
		String hql = "from Site t order by id desc";
		Long count = (Long) this.getHibernateTemplate().find("select count(*) " + hql).get(0);
		logger.debug("查询总数为：" + count);
		page.setTotalRow(count.intValue());// 总记录数目
		Session s = this.getHibernateTemplate().getSessionFactory().getCurrentSession();
		List<Site> list = s.createQuery(hql).setMaxResults(20).setFirstResult(startIndex).list();
		page.setResultList(list);// 数据列表
		page.setRowPerPage(20);// 每页记录数目
		page.setPageIndex(pageIndex);// 当前页码
		return page; 
	}

}
