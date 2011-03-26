package com.throne212.saishi.dao.impl;

import java.util.ArrayList;
import java.util.Collection;
import java.util.Date;
import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;

import com.throne212.saishi.common.PageBean;
import com.throne212.saishi.common.Util;
import com.throne212.saishi.common.WebConstants;
import com.throne212.saishi.dao.NewsDao;
import com.throne212.saishi.domain.Game;
import com.throne212.saishi.domain.News;

public class NewsDaoImpl extends BaseDaoImpl implements NewsDao {

	public PageBean<News> getNewsList(News condition, Date fromDate, Date toDate, int pageIndex, String orderBy, String orderType, int pageSize) {
		PageBean<News> page = new PageBean<News>();
		int startIndex = (pageIndex - 1) * (pageSize==0?WebConstants.PAGE_SIZE:pageSize);

		Object[] hqlArr = buildFilterHQL(condition, fromDate, toDate, orderBy, orderType);
		String hql = (String) hqlArr[0];
		List paramList = (List) hqlArr[1];

		Long count = (Long) this.getHibernateTemplate().find("select count(*) " + hql, paramList.toArray()).get(0);
		logger.debug("查询总数为：" + count);
		page.setTotalRow(count.intValue());// 总记录数目

		Session s = this.getHibernateTemplate().getSessionFactory().getCurrentSession();
		Query q = s.createQuery(hql);
		int i = 0;
		for (Object o : paramList) {
			q.setParameter(i++, o);
		}
		q.setMaxResults(pageSize==0?WebConstants.PAGE_SIZE:pageSize);
		q.setFirstResult(startIndex);
		page.setResultList(q.list());// 数据列表
		page.setRowPerPage(pageSize==0?WebConstants.PAGE_SIZE:pageSize);// 每页记录数目
		page.setPageIndex(pageIndex);// 当前页码
		return page;
	}

	private Object[] buildFilterHQL(News condition, Date fromDate, Date toDate,String orderBy,String orderType) {
		Object[] rst = new Object[2];
		StringBuffer sb = new StringBuffer("from News where 1=1");
		List paramValueList = new ArrayList();
		if (condition != null) {
		
			if (!Util.isEmpty(condition.getTitle())) {
				sb.append(" and title like ?");
				paramValueList.add("%" + condition.getTitle() + "%");
			}
			if (!Util.isEmpty(condition.getContent())) {
				sb.append(" and content like ?");
				paramValueList.add("%" + condition.getContent() + "%");
			}
			if (!Util.isEmpty(condition.getAuthor())) {
				sb.append(" and author like ?");
				paramValueList.add("%" + condition.getAuthor() + "%");
			}
		}
		// 创建时间段
		if (fromDate != null) {
			sb.append(" and createDate>=?");
			paramValueList.add(fromDate);
		}
		if (toDate != null) {
			sb.append(" and createDate<?");
			paramValueList.add(Util.getNextDay(toDate));
		}
		//排序
		if(!Util.isEmpty(orderBy)){
			sb.append(" order by " + orderBy + " " + orderType);
		}else{
			sb.append(" order by id");
		}		
		logger.debug("hql=[" + sb.toString() + "]");
		rst[0] = sb.toString();
		rst[1] = paramValueList;
		return rst;
	}

}
