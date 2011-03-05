package com.throne212.siliao.dao.impl;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;

import com.throne212.siliao.common.PageBean;
import com.throne212.siliao.common.Util;
import com.throne212.siliao.common.WebConstants;
import com.throne212.siliao.dao.UserDao;
import com.throne212.siliao.domain.Admin;
import com.throne212.siliao.domain.AreaAccount;
import com.throne212.siliao.domain.ManagerAccount;
import com.throne212.siliao.domain.ProviderAccount;
import com.throne212.siliao.domain.User;

public class UserDaoImpl extends BaseDaoImpl implements UserDao {

	public PageBean<User> getUserList(User condition, Date fromDate, Date toDate, int pageIndex,String role,String orderBy,String orderType,int pageSize) {
		PageBean<User> page = new PageBean<User>();
		
		int startIndex = (pageIndex - 1) * (pageSize==0?WebConstants.PAGE_SIZE:pageSize);

		Object[] hqlArr = buildFilterHQL(condition, fromDate, toDate,role,orderBy,orderType);
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

	private Object[] buildFilterHQL(User condition, Date fromDate, Date toDate, String role,String orderBy,String orderType) {
		Object[] rst = new Object[2];
		// 角色
		String className = "User";
		if (!Util.isEmpty(role)) {
			if (WebConstants.USER_NAME_ADMIN.endsWith(role)) {
				className = Admin.class.getSimpleName();
			} else if (WebConstants.USER_NAME_AREA.endsWith(role)) {
				className = AreaAccount.class.getSimpleName();
			} else if (WebConstants.USER_NAME_MANAGER.endsWith(role)) {
				className = ManagerAccount.class.getSimpleName();
			} else if (WebConstants.USER_NAME_PROVIDER.endsWith(role)) {
				className = ProviderAccount.class.getSimpleName();
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
			if (!Util.isEmpty(condition.getTel())) {
				sb.append(" and tel like ?");
				paramValueList.add("%" + condition.getTel() + "%");
			}
			if (!Util.isEmpty(condition.getRemark())) {
				sb.append(" and remark like ?");
				paramValueList.add("%" + condition.getRemark() + "%");
			}
			if (!Util.isEmpty(condition.getEmail())) {
				sb.append(" and email like ?");
				paramValueList.add("%" + condition.getEmail() + "%");
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

	public List<User> getUserList(User condition, Date fromDate, Date toDate, String role,String orderBy,String orderType) {
		Object[] hqlArr = buildFilterHQL(condition, fromDate, toDate, role,orderBy,orderType);
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
