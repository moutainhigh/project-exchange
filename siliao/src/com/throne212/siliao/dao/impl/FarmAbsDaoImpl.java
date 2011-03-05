package com.throne212.siliao.dao.impl;

import java.util.ArrayList;
import java.util.Collection;
import java.util.Date;
import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;

import com.throne212.siliao.common.PageBean;
import com.throne212.siliao.common.Util;
import com.throne212.siliao.common.WebConstants;
import com.throne212.siliao.dao.FarmAbsDao;
import com.throne212.siliao.domain.Area;
import com.throne212.siliao.domain.Farm;
import com.throne212.siliao.domain.FarmAbs;
import com.throne212.siliao.domain.ManagerAccount;

public class FarmAbsDaoImpl extends BaseDaoImpl implements FarmAbsDao {

	public PageBean<FarmAbs> getFarmAbsList(FarmAbs condition, Date fromDate, Date toDate, Integer pageIndex, String farmType, Long farmId, String accountName,String orderBy,String orderType,int pageSize) {

		PageBean<FarmAbs> page = new PageBean<FarmAbs>();
		int startIndex = (pageIndex - 1) * (pageSize==0?WebConstants.PAGE_SIZE:pageSize);

		Object[] hqlArr = buildFilterHQL(condition, fromDate, toDate, farmType, farmId, accountName, orderBy, orderType);

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

	private Object[] buildFilterHQL(FarmAbs condition, Date fromDate, Date toDate, String farmType, Long farmId, String accountName,String orderBy,String orderType) {
		Object[] rst = new Object[2];
		// 角色
		String className = "FarmAbs";
		if (!Util.isEmpty(farmType)) {
			if (WebConstants.FARM_TYPE_FARM.endsWith(farmType)) {
				className = Farm.class.getSimpleName();
			} else if (WebConstants.FARM_TYPE_AREA.endsWith(farmType)) {
				className = Area.class.getSimpleName();
			}
		}
		StringBuffer sb = new StringBuffer("from " + className + " where (enable is null or enable=true)");
		List paramValueList = new ArrayList();
		if (condition != null) {

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
			sb.append(" and createDate<?");
			paramValueList.add(Util.getNextDate(toDate));
		}

		if (WebConstants.FARM_TYPE_AREA.equals(farmType)) {

			if (!Util.isEmpty(accountName)) {
				sb.append(" and account.name like ? ");
				paramValueList.add("%"+accountName+"%");
			}
			if (farmId != null) {
				sb.append(" and farm.id=?");
				paramValueList.add(farmId);
			}
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

	public List<FarmAbs> getFarmAbsList(FarmAbs condition, Date fromDate, Date toDate, String farmType, Long farmId, String accountName,String orderBy,String orderType) {
		Object[] hqlArr = buildFilterHQL(condition, fromDate, toDate, farmType, farmId, accountName, orderBy, orderType);
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

	public <T> List<T> getEntitiesByIds(Class<T> clazz, Collection<Long> ids) {
		// TODO Auto-generated method stub
		return null;
	}

}
