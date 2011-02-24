package com.throne212.siliao.dao.impl;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;

import com.throne212.siliao.common.PageBean;
import com.throne212.siliao.common.Util;
import com.throne212.siliao.common.WebConstants;
import com.throne212.siliao.dao.BillDao;
import com.throne212.siliao.domain.Bill;
import com.throne212.siliao.domain.Factory;
import com.throne212.siliao.domain.Provider;

public class BillDaoImpl extends BaseDaoImpl implements BillDao {
	
	
	public PageBean<Bill> getBillList(Bill condition, Date fromDate, Date toDate, Integer pageIndex){
		
		PageBean<Bill> page = new PageBean<Bill>();
		int startIndex = (pageIndex - 1) * WebConstants.PAGE_SIZE;

		Object[] hqlArr = buildFilterHQL(condition, fromDate, toDate);
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
		q.setMaxResults(WebConstants.PAGE_SIZE);
		q.setFirstResult(startIndex);
		page.setResultList(q.list());// 数据列表
		page.setRowPerPage(WebConstants.PAGE_SIZE);// 每页记录数目
		page.setPageIndex(pageIndex);// 当前页码
		return page;

	}
	
	private Object[] buildFilterHQL(Bill condition, Date fromDate, Date toDate) {
		Object[] rst = new Object[2];
		StringBuffer sb = new StringBuffer("from Bill where (enable is null or enable=true)");
		List paramValueList = new ArrayList();
		if (condition != null) {
			// 构建下拉项的条件
			if (condition.getFactory() != null && condition.getFactory().getId() != null) {
				Factory factory = (Factory) this.getHibernateTemplate().get(Factory.class, condition.getFactory().getId());
				sb.append(" and factory=?");
				paramValueList.add(factory);
			}
			if (condition.getProvider() != null && condition.getProvider().getId() != null) {
				Provider provider = (Provider) this.getHibernateTemplate().get(Provider.class, condition.getProvider().getId());
				sb.append(" and provider=?");
				paramValueList.add(provider);
			}
			
			if (!Util.isEmpty(condition.getOrderId())) {
				sb.append(" and orderId like ?");
				paramValueList.add("%" + condition.getOrderId() + "%");
			}
			//保留当前处理人条件
//			if (!Util.isEmpty(condition.getHandlePerson())) {
//				sb.append(" and handlePerson like ?");
//				paramValueList.add("%" + condition.getHandlePerson() + "%");
//			}
			
			if (!Util.isEmpty(condition.getSize())) {
				sb.append(" and size like ?");
				paramValueList.add("%" + condition.getSize() + "%");
			}
			if (!Util.isEmpty(condition.getModel())) {
				sb.append(" and model like ?");
				paramValueList.add("%" + condition.getModel() + "%");
			}
			if (!Util.isEmpty(condition.getAmount().toString())) {
				sb.append(" and amount like ?");
				paramValueList.add("%" + condition.getAmount() + "%");
			}
		}
		// 创建时间段
		if (fromDate != null) {
			sb.append(" and createDate>=?");
			paramValueList.add(fromDate);
		}
		if (toDate != null) {
			sb.append(" and createDate<=?");
			paramValueList.add(toDate);
		}
		sb.append(" order by createDate desc,id asc");
		logger.debug("hql=[" + sb.toString() + "]");
		rst[0] = sb.toString();
		rst[1] = paramValueList;
		return rst;
	}
	public List<Bill> getBillList(Bill condition,Date fromDate,Date toDate){

		Object[] hqlArr = buildFilterHQL(condition, fromDate, toDate);
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
