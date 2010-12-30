package com.throne212.info168.web.dao.impl;

import java.util.List;

import org.hibernate.Session;

import com.throne212.info168.web.common.PageBean;
import com.throne212.info168.web.common.WebConstants;
import com.throne212.info168.web.dao.UserDao;
import com.throne212.info168.web.domain.Area;
import com.throne212.info168.web.domain.Category;
import com.throne212.info168.web.domain.Finance;
import com.throne212.info168.web.domain.Info;
import com.throne212.info168.web.domain.User;

public class UserDaoImpl extends BaseDaoImpl implements UserDao {

	public PageBean<User> getAllUsers(int pageIndex) {
		PageBean<User> page = new PageBean<User>();
		int startIndex = (pageIndex - 1) * WebConstants.USER_LIST_ROWS_ADMIN;
		String hql = "from User u order by id desc";
		Long count = (Long) this.getHibernateTemplate().find("select count(*) " + hql).get(0);
		logger.debug("查询总数为：" + count);
		page.setTotalRow(count.intValue());// 总记录数目
		Session s = this.getHibernateTemplate().getSessionFactory().getCurrentSession();
		List<User> list = s.createQuery(hql).setMaxResults(WebConstants.USER_LIST_ROWS_ADMIN).setFirstResult(startIndex).list();
		page.setResultList(list);// 数据列表
		page.setRowPerPage(WebConstants.USER_LIST_ROWS_ADMIN);// 每页记录数目
		page.setPageIndex(pageIndex);// 当前页码
		return page;
	}
	
	public PageBean<User> queryUsersByKey(String key, int pageIndex){
		PageBean<User> page = new PageBean<User>();
		int startIndex = (pageIndex - 1) * WebConstants.USER_LIST_ROWS_ADMIN;
		String hql = "from User u where u.loginName like ? order by id desc";
		Long count = (Long) this.getHibernateTemplate().find("select count(*) " + hql,"%"+key+"%").get(0);
		logger.debug("查询总数为：" + count);
		page.setTotalRow(count.intValue());// 总记录数目
		Session s = this.getHibernateTemplate().getSessionFactory().getCurrentSession();
		List<User> list = s.createQuery(hql).setParameter(0, "%"+key+"%").setMaxResults(WebConstants.USER_LIST_ROWS_ADMIN).setFirstResult(startIndex).list();
		page.setResultList(list);// 数据列表
		page.setRowPerPage(WebConstants.USER_LIST_ROWS_ADMIN);// 每页记录数目
		page.setPageIndex(pageIndex);// 当前页码
		return page;
	}
	
	public PageBean<Finance> getFinanceByUser(Integer pageIndex,User user){
		PageBean<Finance> page = new PageBean<Finance>();
		int startIndex = (pageIndex - 1) * WebConstants.FINANCE_LIST_ROWS_ADMIN;
		String hql = "from Finance f where f.user=? order by id desc";
		Long count = (Long) this.getHibernateTemplate().find("select count(*) " + hql,user).get(0);
		logger.debug("查询总数为：" + count);
		page.setTotalRow(count.intValue());// 总记录数目
		Session s = this.getHibernateTemplate().getSessionFactory().getCurrentSession();
		List<Finance> list = s.createQuery(hql).setParameter(0, user).setMaxResults(WebConstants.FINANCE_LIST_ROWS_ADMIN).setFirstResult(startIndex).list();
		page.setResultList(list);// 数据列表
		page.setRowPerPage(WebConstants.FINANCE_LIST_ROWS_ADMIN);// 每页记录数目
		page.setPageIndex(pageIndex);// 当前页码
		return page;
	}


}
