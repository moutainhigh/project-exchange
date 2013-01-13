package com.throne212.fupin.dao.impl;

import java.util.List;

import org.hibernate.Session;

import com.throne212.fupin.common.PageBean;
import com.throne212.fupin.common.WebConstants;
import com.throne212.fupin.dao.ZijinDao;
import com.throne212.fupin.domain.Zijin;

public class ZijinDaoImpl extends BaseDaoImpl implements ZijinDao {
	
	public PageBean<Zijin> listZijin(Long areaId, Long zhenId, Long cunId, Integer pageIndex, int type, int year, int month) {
		PageBean<Zijin> page = new PageBean<Zijin>();
		int startIndex = (pageIndex - 1) * WebConstants.PAGE_SIZE;
		String hql = "from Zijin q where 1=1";
		if(type > 0)
			hql += " and type=" + type;
		if(year > 0)
			hql += " and year=" + year;
		if(month > 0)
			hql += " and month=" + month;

		if (cunId != null) {
			hql += " and cun.id=" + cunId;
		} else if (zhenId != null) {
			hql += " and cun.zhen.id=" + zhenId;
		} else if (areaId != null) {
			hql += " and cun.zhen.area.id=" + areaId;
		}

		hql += " order by id desc";
		logger.debug("hql=" + hql);
		Long count = (Long) this.getHibernateTemplate().find("select count(*) " + hql).get(0);
		logger.debug("查询总数为：" + count);
		page.setTotalRow(count.intValue());// 总记录数目
		Session s = this.getHibernateTemplate().getSessionFactory().getCurrentSession();
		List<Zijin> list = s.createQuery(hql).setMaxResults(WebConstants.PAGE_SIZE).setFirstResult(startIndex).list();
		page.setResultList(list);// 数据列表
		page.setRowPerPage(WebConstants.PAGE_SIZE);// 每页记录数目
		page.setPageIndex(pageIndex);// 当前页码
		return page;
	}

	public PageBean<Zijin> listZijin(Long areaId, Long zhenId, Long cunId, Integer pageIndex, int type, Integer year, Integer month) {
		PageBean<Zijin> page = new PageBean<Zijin>();
		if(pageIndex == null || pageIndex < 1)
			pageIndex = 1;
		int startIndex = (pageIndex - 1) * WebConstants.PAGE_SIZE;
		String hql = "from Zijin q where 1=1";
		if(type > 0)
			hql += " and type=" + type;
		if(year != null && year > 0)
			hql += " and year=" + year;
		if(month != null && month > 0)
			hql += " and month=" + month;

		if (cunId != null) {
			hql += " and cun.id=" + cunId;
		} else if (zhenId != null) {
			hql += " and cun.zhen.id=" + zhenId;
		} else if (areaId != null) {
			hql += " and cun.zhen.area.id=" + areaId;
		}

		hql += " order by id desc";
		logger.debug("hql=" + hql);
		Long count = (Long) this.getHibernateTemplate().find("select count(*) " + hql).get(0);
		logger.debug("查询总数为：" + count);
		page.setTotalRow(count.intValue());// 总记录数目
		Session s = this.getHibernateTemplate().getSessionFactory().getCurrentSession();
		List<Zijin> list = s.createQuery(hql).setMaxResults(WebConstants.PAGE_SIZE).setFirstResult(startIndex).list();
		page.setResultList(list);// 数据列表
		page.setRowPerPage(WebConstants.PAGE_SIZE);// 每页记录数目
		page.setPageIndex(pageIndex);// 当前页码
		return page;
	}
}
