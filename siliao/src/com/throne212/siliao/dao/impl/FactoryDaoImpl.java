package com.throne212.siliao.dao.impl;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;

import com.throne212.siliao.common.PageBean;
import com.throne212.siliao.common.Util;
import com.throne212.siliao.common.WebConstants;
import com.throne212.siliao.dao.FactoryDao;
import com.throne212.siliao.domain.Factory;
import com.throne212.siliao.domain.FactoryAbs;
import com.throne212.siliao.domain.Provider;

public class FactoryDaoImpl extends BaseDaoImpl implements FactoryDao {

	public PageBean<FactoryAbs> getFactoryAbsList(FactoryAbs condition, Date fromDate, Date toDate, Integer pageIndex, String type, Long factoryId,
			String accountName,String orderBy,String orderType) {
		PageBean<FactoryAbs> page = new PageBean<FactoryAbs>();
		int startIndex = (pageIndex - 1) * WebConstants.PAGE_SIZE;

		Object[] hqlArr = buildFilterHQL(condition, fromDate, toDate, type, factoryId, accountName, orderBy, orderType);
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

	private Object[] buildFilterHQL(FactoryAbs condition, Date fromDate, Date toDate, String type, Long factoryId, String accountName,String orderBy,String orderType) {
		Object[] rst = new Object[2];
		// 角色
		String className = "FactoryAbs";
		if (!Util.isEmpty(type)) {
			if (WebConstants.FACTORY_TYPE_FACTORY.equals(type)) {
				className = Factory.class.getSimpleName();
			} else if (WebConstants.FACTORY_TYPE_PROVIDER.equals(type)) {
				className = Provider.class.getSimpleName();
			}
		}
		StringBuffer sb = new StringBuffer("from " + className + " where (enable is null or enable=true)");
		List paramValueList = new ArrayList();
		if (condition != null) {
			// 构建下拉项的条件
			if (!Util.isEmpty(condition.getName())) {
				sb.append(" and name like ?");
				paramValueList.add("%" + condition.getName() + "%");
			}
			if (!Util.isEmpty(condition.getRemark())) {
				sb.append(" and remark like ?");
				paramValueList.add("%" + condition.getRemark() + "%");
			}
			if (!Util.isEmpty(condition.getCreateName())) {
				sb.append(" and createName like ?");
				paramValueList.add("%" + condition.getCreateName() + "%");
			}

		}
		// 创建时间段
		if (fromDate != null) {
			sb.append(" and createDate>=?");
			paramValueList.add(fromDate);
		}
		if (toDate != null) {
			sb.append(" and createDate<=?");
			paramValueList.add(Util.getNextDate(toDate));
		}
		if (WebConstants.FACTORY_TYPE_PROVIDER.equals(type) && !Util.isEmpty(accountName)) {
			sb.append(" and account.name like ?");
			paramValueList.add("%" + accountName + "%");
		}
		if (WebConstants.FACTORY_TYPE_FACTORY.equals(type) && null != factoryId) {
			sb.append(" and factory.id=?");
			paramValueList.add(factoryId);
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

	public List<FactoryAbs> getFactoryList(FactoryAbs condition, Date fromDate, Date toDate, String type, Long factoryId, String accountName,String orderBy,String orderType) {
		Object[] hqlArr = buildFilterHQL(condition, fromDate, toDate, type, factoryId, accountName,orderBy, orderType);
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
