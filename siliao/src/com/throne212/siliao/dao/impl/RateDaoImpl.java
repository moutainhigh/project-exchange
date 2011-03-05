package com.throne212.siliao.dao.impl;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;

import com.throne212.siliao.common.PageBean;
import com.throne212.siliao.common.Util;
import com.throne212.siliao.common.WebConstants;
import com.throne212.siliao.dao.RateDao;
import com.throne212.siliao.domain.Rate;

public class RateDaoImpl extends BaseDaoImpl implements RateDao {

	public PageBean<Rate> getRateList(Rate condition,Date fromDate,Date toDate,Date fromDate2,Date toDate2,String rateName,int pageIndex,String orderBy,String orderType,int pageSize) {
		PageBean<Rate> page = new PageBean<Rate>();
		int startIndex = (pageIndex - 1) * (pageSize==0?WebConstants.PAGE_SIZE:pageSize);

		Object[] hqlArr = buildFilterHQL(condition, fromDate, toDate, fromDate2, toDate2, rateName, orderBy, orderType);
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

	private Object[] buildFilterHQL(Rate condition, Date fromDate, Date toDate, Date fromDate2, Date toDate2,String rateName,String orderBy,String orderType) {
		Object[] rst = new Object[2];
		StringBuffer sb = new StringBuffer("from Rate where (enable is null or enable=true)");
		List paramValueList = new ArrayList();
		
		if(!Util.isEmpty(rateName)){
			if(rateName.contains("农场")){
				sb.append(" and farm.name like ?");
				paramValueList.add("%" + rateName + "%");
			}else{
				sb.append(" and provider.name like ?");
				paramValueList.add("%" + rateName + "%");
			}
		}
		
		if (condition != null) {
			// 构建下拉项的条件
			if (!Util.isEmpty(condition.getCreateName())) {
				sb.append(" and createName like ?");
				paramValueList.add("%" + condition.getCreateName() + "%");
			}
			if (!Util.isEmpty(condition.getRemark())) {
				sb.append(" and remark like ?");
				paramValueList.add("%" + condition.getRemark() + "%");
			}
			if(condition.getValue()!=null){
				sb.append(" and value=?");
				paramValueList.add(condition.getValue());
			}
		}
		// 有效时间段
		if (fromDate != null) {
			sb.append(" and fromDate>=?");
			paramValueList.add(fromDate);
		}
		if (toDate != null) {
			sb.append(" and fromDate<?");
			paramValueList.add(Util.getNextDate(toDate));
		}
		// 有效时间段2
		if (fromDate2 != null) {
			sb.append(" and endDate>=?");
			paramValueList.add(fromDate2);
		}
		if (toDate2 != null) {
			sb.append(" and endDate<?");
			paramValueList.add(Util.getNextDate(toDate2));
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

	public List<Rate> getRateList(Rate condition, Date fromDate, Date toDate, Date fromDate2, Date toDate2,String rateName,String orderBy,String orderType) {
		Object[] hqlArr = buildFilterHQL(condition, fromDate, toDate, fromDate2, toDate2, rateName, orderBy, orderType);
		String hql = (String) hqlArr[0];
		List paramList = (List) hqlArr[1];
		Session s = this.getHibernateTemplate().getSessionFactory().getCurrentSession();
		Query q = s.createQuery(hql);
		int i = 0;
		for (Object o : paramList) {
			q.setParameter(i++, o);
		}
		return q.list();
	}
}
