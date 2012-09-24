package com.throne212.fupin.dao.impl;

import java.util.ArrayList;
import java.util.List;

import org.hibernate.Session;

import com.opensymphony.xwork2.ActionContext;
import com.throne212.fupin.common.PageBean;
import com.throne212.fupin.common.PeopleSummary;
import com.throne212.fupin.common.WebConstants;
import com.throne212.fupin.dao.PeopleDao;
import com.throne212.fupin.domain.Cun;
import com.throne212.fupin.domain.Org;
import com.throne212.fupin.domain.People;
import com.throne212.fupin.domain.User;

public class PeopleDaoImpl extends BaseDaoImpl implements PeopleDao {

	public PageBean<People> getPeoples(Integer year, Integer pageIndex) {
		User user = (User) ActionContext.getContext().getSession().get(WebConstants.SESS_USER_OBJ);
		if (user instanceof Org) {
			String hql = "from People where org.id=" + user.getId();
			PageBean<People> page = new PageBean<People>();
			if (pageIndex == null)
				pageIndex = 1;
			int startIndex = (pageIndex - 1) * WebConstants.PAGE_SIZE;
			if (year != null)
				hql += " and year=" + year;
			hql += " order by id";
			logger.debug("hql=" + hql);
			Long count = (Long) this.getHibernateTemplate().find("select count(*) " + hql).get(0);
			logger.debug("查询总数为：" + count);
			page.setTotalRow(count.intValue());// 总记录数目
			Session s = this.getHibernateTemplate().getSessionFactory().getCurrentSession();
			List<People> list = s.createQuery(hql).setMaxResults(WebConstants.PAGE_SIZE).setFirstResult(startIndex).list();
			page.setResultList(list);// 数据列表
			page.setRowPerPage(WebConstants.PAGE_SIZE);// 每页记录数目
			page.setPageIndex(pageIndex);// 当前页码

			hql = "select count(*) from People where status=2 and org.id=" + user.getId() + " and year=" + year;
			count = (Long) this.getHibernateTemplate().find(hql).get(0);
			page.setTotal(count);

			return page;
		}
		return null;
	}

	public long getPeopleSubmitCount(Integer year) {
		User user = (User) ActionContext.getContext().getSession().get(WebConstants.SESS_USER_OBJ);
		if (user instanceof Org) {
			String hql = "select count(*) from People where status=2 and org.id=" + user.getId() + " and year=" + year;
			long count = (Long) this.getHibernateTemplate().find(hql).get(0);
			return count;
		}
		return 0;
	}

	public PageBean<PeopleSummary> summary(Integer year, Long areaId, Long zhenId, Long cunId, Integer pageIndex) {

		PageBean<PeopleSummary> page = new PageBean<PeopleSummary>();
		if (pageIndex == null || pageIndex < 1)
			pageIndex = 1;
		int startIndex = (pageIndex - 1) * WebConstants.PAGE_SIZE;

		String hql = "from Cun where 1=1";
		if (cunId != null) {
			hql += " and id=" + cunId;
		} else if (zhenId != null) {
			hql += " and zhen.id=" + zhenId;
		} else if (areaId != null) {
			hql += " and zhen.area.id=" + areaId;
		}
		hql += " order by id";

		logger.debug("hql=" + hql);
		Long count = (Long) this.getHibernateTemplate().find("select count(*) " + hql).get(0);
		logger.debug("查询总数为：" + count);
		page.setTotalRow(count.intValue());// 总记录数目

		Session s = this.getHibernateTemplate().getSessionFactory().getCurrentSession();
		List<Cun> list = s.createQuery(hql).setMaxResults(WebConstants.PAGE_SIZE).setFirstResult(startIndex).list();
		List<PeopleSummary> summList = new ArrayList<PeopleSummary>();
		for (Cun c : list) {
			hql = "select count(*) from People where status=2 and year=" + year + " and cun.id=" + c.getId();
			count = (Long) this.getHibernateTemplate().find(hql).get(0);
			PeopleSummary ps = new PeopleSummary();
			ps.setCun(c);
			ps.setOrg(c.getOrg());
			ps.setSubmit(count.intValue());
			ps.setYear(year);
			summList.add(ps);
		}
		page.setResultList(summList);// 数据列表
		page.setRowPerPage(WebConstants.PAGE_SIZE);// 每页记录数目
		page.setPageIndex(pageIndex);// 当前页码
		return page;
	}

	public PageBean<People> getLockPeoples(Integer year, Integer pageIndex) {
		String hql = "from People where status=3";
		PageBean<People> page = new PageBean<People>();
		if (pageIndex == null || pageIndex < 1)
			pageIndex = 1;
		int startIndex = (pageIndex - 1) * WebConstants.PAGE_SIZE;
		if (year != null)
			hql += " and year=" + year;
		hql += " order by id";
		logger.debug("hql=" + hql);
		Long count = (Long) this.getHibernateTemplate().find("select count(*) " + hql).get(0);
		logger.debug("查询总数为：" + count);
		page.setTotalRow(count.intValue());// 总记录数目
		Session s = this.getHibernateTemplate().getSessionFactory().getCurrentSession();
		List<People> list = s.createQuery(hql).setMaxResults(WebConstants.PAGE_SIZE).setFirstResult(startIndex).list();
		page.setResultList(list);// 数据列表
		page.setRowPerPage(WebConstants.PAGE_SIZE);// 每页记录数目
		page.setPageIndex(pageIndex);// 当前页码
		return page;
	}

}
