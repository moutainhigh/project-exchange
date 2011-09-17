package com.throne212.fupin.dao.impl;

import java.util.List;

import org.hibernate.Session;

import com.throne212.fupin.common.PageBean;
import com.throne212.fupin.common.WebConstants;
import com.throne212.fupin.dao.UserDao;
import com.throne212.fupin.domain.AreaWorkOrg;
import com.throne212.fupin.domain.ShiWorkOrg;
import com.throne212.fupin.domain.ZhenWorkOrg;

public class UserDaoImpl extends BaseDaoImpl implements UserDao {

	public PageBean<ShiWorkOrg> getShiWorkOrgList(int pageIndex) {

		if (pageIndex == 0) {
			pageIndex = 1;
		}
		PageBean<ShiWorkOrg> page = new PageBean<ShiWorkOrg>();
		int startIndex = (pageIndex - 1) * WebConstants.PAGE_SIZE;
		String hql = "from ShiWorkOrg t order by id desc";
		Long count = (Long) this.getHibernateTemplate().find("select count(*) " + hql).get(0);
		logger.debug("查询总数为：" + count);
		page.setTotalRow(count.intValue());// 总记录数目
		Session s = this.getHibernateTemplate().getSessionFactory().getCurrentSession();
		List<ShiWorkOrg> list = s.createQuery(hql).setMaxResults(WebConstants.PAGE_SIZE).setFirstResult(startIndex).list();
		page.setResultList(list);// 数据列表
		page.setRowPerPage(WebConstants.PAGE_SIZE);// 每页记录数目
		page.setPageIndex(pageIndex);// 当前页码
		return page;

	}

	public PageBean<AreaWorkOrg> getAreaWorkOrgList(int pageIndex, Long shiWorkOrgId) {

		if (pageIndex == 0) {
			pageIndex = 1;
		}
		PageBean<AreaWorkOrg> page = new PageBean<AreaWorkOrg>();
		int startIndex = (pageIndex - 1) * WebConstants.PAGE_SIZE;
		String hql = "from AreaWorkOrg  where shiWorkOrg.id=?  order by id desc";
		Long count = (Long) this.getHibernateTemplate().find("select count(*) " + hql, shiWorkOrgId).get(0);
		logger.debug("查询总数为：" + count);
		page.setTotalRow(count.intValue());// 总记录数目
		Session s = this.getHibernateTemplate().getSessionFactory().getCurrentSession();
		List<AreaWorkOrg> list = s.createQuery(hql).setParameter(0, shiWorkOrgId).setMaxResults(WebConstants.PAGE_SIZE).setFirstResult(startIndex).list();
		page.setResultList(list);// 数据列表
		page.setRowPerPage(WebConstants.PAGE_SIZE);// 每页记录数目
		page.setPageIndex(pageIndex);// 当前页码
		return page;
	}

	public PageBean<AreaWorkOrg> getAreaWorkOrgList(int pageIndex) {

		if (pageIndex == 0) {
			pageIndex = 1;
		}
		PageBean<AreaWorkOrg> page = new PageBean<AreaWorkOrg>();
		int startIndex = (pageIndex - 1) * WebConstants.PAGE_SIZE;
		String hql = "from AreaWorkOrg t order by id desc";
		Long count = (Long) this.getHibernateTemplate().find("select count(*) " + hql).get(0);
		logger.debug("查询总数为：" + count);
		page.setTotalRow(count.intValue());// 总记录数目
		Session s = this.getHibernateTemplate().getSessionFactory().getCurrentSession();
		List<AreaWorkOrg> list = s.createQuery(hql).setMaxResults(WebConstants.PAGE_SIZE).setFirstResult(startIndex).list();
		page.setResultList(list);// 数据列表
		page.setRowPerPage(WebConstants.PAGE_SIZE);// 每页记录数目
		page.setPageIndex(pageIndex);// 当前页码
		return page;

	}

	public PageBean<ZhenWorkOrg> getZhenWorkOrgList(int pageIndex, Long areaWorkOrgId) {

		if (pageIndex == 0) {
			pageIndex = 1;
		}
		PageBean<ZhenWorkOrg> page = new PageBean<ZhenWorkOrg>();
		int startIndex = (pageIndex - 1) * WebConstants.PAGE_SIZE;
		String hql = "from ZhenWorkOrg  where areaWorkOrg.id=?  order by id desc";
		Long count = (Long) this.getHibernateTemplate().find("select count(*) " + hql, areaWorkOrgId).get(0);
		logger.debug("查询总数为：" + count);
		page.setTotalRow(count.intValue());// 总记录数目
		Session s = this.getHibernateTemplate().getSessionFactory().getCurrentSession();
		List<ZhenWorkOrg> list = s.createQuery(hql).setParameter(0, areaWorkOrgId).setMaxResults(WebConstants.PAGE_SIZE).setFirstResult(startIndex).list();
		page.setResultList(list);// 数据列表
		page.setRowPerPage(WebConstants.PAGE_SIZE);// 每页记录数目
		page.setPageIndex(pageIndex);// 当前页码
		return page;
	}

	public PageBean<ZhenWorkOrg> getZhenWorkOrgList(int pageIndex) {

		if (pageIndex == 0) {
			pageIndex = 1;
		}
		PageBean<ZhenWorkOrg> page = new PageBean<ZhenWorkOrg>();
		int startIndex = (pageIndex - 1) * WebConstants.PAGE_SIZE;
		String hql = "from ZhenWorkOrg t order by id desc";
		Long count = (Long) this.getHibernateTemplate().find("select count(*) " + hql).get(0);
		logger.debug("查询总数为：" + count);
		page.setTotalRow(count.intValue());// 总记录数目
		Session s = this.getHibernateTemplate().getSessionFactory().getCurrentSession();
		List<ZhenWorkOrg> list = s.createQuery(hql).setMaxResults(WebConstants.PAGE_SIZE).setFirstResult(startIndex).list();
		page.setResultList(list);// 数据列表
		page.setRowPerPage(WebConstants.PAGE_SIZE);// 每页记录数目
		page.setPageIndex(pageIndex);// 当前页码
		return page;

	}

}
