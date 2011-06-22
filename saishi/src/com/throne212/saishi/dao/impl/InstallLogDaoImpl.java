package com.throne212.saishi.dao.impl;

import org.hibernate.Query;
import org.hibernate.Session;

import com.throne212.saishi.common.PageBean;
import com.throne212.saishi.common.WebConstants;
import com.throne212.saishi.dao.InstallLogDao;
import com.throne212.saishi.domain.InstallLog;

public class InstallLogDaoImpl extends BaseDaoImpl implements InstallLogDao {

	public PageBean<InstallLog> getInstallLog(Integer pageIndex) {
		PageBean<InstallLog> page = new PageBean<InstallLog>();
		int startIndex = (pageIndex - 1) * WebConstants.PAGE_SIZE;

		String hql = "from InstallLog l where l.type='安装' order by date desc";
		Long count = (Long) this.getHibernateTemplate().find("select count(*) " + hql).get(0);
		logger.debug("查询总数为：" + count);
		page.setTotalRow(count.intValue());// 总记录数目

		Session s = this.getHibernateTemplate().getSessionFactory().getCurrentSession();
		Query q = s.createQuery(hql);
		q.setMaxResults(WebConstants.PAGE_SIZE);
		q.setFirstResult(startIndex);
		page.setResultList(q.list());// 数据列表
		page.setRowPerPage(WebConstants.PAGE_SIZE);// 每页记录数目
		page.setPageIndex(pageIndex);// 当前页码
		return page;
	}

	public PageBean<InstallLog> getUninstallLog(Integer pageIndex) {
		PageBean<InstallLog> page = new PageBean<InstallLog>();
		int startIndex = (pageIndex - 1) * WebConstants.PAGE_SIZE;

		String hql = "from InstallLog l where l.type='卸载' order by date desc";
		Long count = (Long) this.getHibernateTemplate().find("select count(*) " + hql).get(0);
		logger.debug("查询总数为：" + count);
		page.setTotalRow(count.intValue());// 总记录数目

		Session s = this.getHibernateTemplate().getSessionFactory().getCurrentSession();
		Query q = s.createQuery(hql);
		q.setMaxResults(WebConstants.PAGE_SIZE);
		q.setFirstResult(startIndex);
		page.setResultList(q.list());// 数据列表
		page.setRowPerPage(WebConstants.PAGE_SIZE);// 每页记录数目
		page.setPageIndex(pageIndex);// 当前页码
		return page;
	}

}
