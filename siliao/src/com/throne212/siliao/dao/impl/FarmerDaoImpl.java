package com.throne212.siliao.dao.impl;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;

import com.opensymphony.xwork2.ActionContext;
import com.throne212.siliao.common.PageBean;
import com.throne212.siliao.common.Util;
import com.throne212.siliao.common.WebConstants;
import com.throne212.siliao.dao.FarmerDao;
import com.throne212.siliao.domain.Area;
import com.throne212.siliao.domain.AreaAccount;
import com.throne212.siliao.domain.Farm;
import com.throne212.siliao.domain.Farmer;
import com.throne212.siliao.domain.ManagerAccount;
import com.throne212.siliao.domain.User;

public class FarmerDaoImpl extends BaseDaoImpl implements FarmerDao {

	public PageBean<Farmer> getFarmerList(Farmer condition, Date fromDate, Date toDate, int pageIndex,String orderBy,String orderType,int pageSize) {
		PageBean<Farmer> page = new PageBean<Farmer>();
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

	private Object[] buildFilterHQL(Farmer condition, Date fromDate, Date toDate,String orderBy,String orderType) {
		Object[] rst = new Object[2];
		StringBuffer sb = new StringBuffer("from Farmer where (enable is null or enable=true)");
		List paramValueList = new ArrayList();
		if (condition != null) {
			// 构建下拉项的条件
			if (condition.getArea() != null && condition.getArea().getId() != null) {
				Area area = (Area) this.getHibernateTemplate().get(Area.class, condition.getArea().getId());
				sb.append(" and area=?");
				paramValueList.add(area);
			}
			if (!Util.isEmpty(condition.getName())) {
				sb.append(" and name like ?");
				paramValueList.add("%" + condition.getName() + "%");
			}
			if (!Util.isEmpty(condition.getTel())) {
				sb.append(" and tel like ?");
				paramValueList.add("%" + condition.getTel() + "%");
			}
			if (!Util.isEmpty(condition.getRemark())) {
				sb.append(" and remark like ?");
				paramValueList.add("%" + condition.getRemark() + "%");
			}
			if (!Util.isEmpty(condition.getNo())) {
				sb.append(" and no like ?");
				paramValueList.add("%" + condition.getNo() + "%");
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
		//管区或饲料经理
		User userInsess =(User) ActionContext.getContext().getSession().get(WebConstants.SESS_USER_OBJ);
		if (userInsess instanceof AreaAccount) {
			sb.append(" and area.account=?");
			paramValueList.add(userInsess);
		}else if (userInsess instanceof ManagerAccount) {
			sb.append(" and area.farm.manager=?");
			paramValueList.add(userInsess);
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

	public List<Farmer> getFarmerList(Farmer condition, Date fromDate, Date toDate,String orderBy,String orderType) {
		Object[] hqlArr = buildFilterHQL(condition, fromDate, toDate, orderBy, orderType);
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
