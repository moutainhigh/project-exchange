package com.throne212.tg.web.dao.impl;

import java.util.List;

import org.hibernate.Session;

import com.throne212.tg.web.common.PageBean;
import com.throne212.tg.web.common.WebConstants;
import com.throne212.tg.web.dao.UserDao;
import com.throne212.tg.web.domain.User;

public class UserDaoImpl extends BaseDaoImpl implements UserDao {

	public PageBean<User> getAllUsers(int pageIndex) {
		PageBean<User> page = new PageBean<User>();
		int startIndex = (pageIndex - 1) * WebConstants.NUM_PER_BACK_PAGE_USER;
		String hql = "from User u order by id desc";
		Long count = (Long) this.getHibernateTemplate().find("select count(*) " + hql).get(0);
		logger.debug("查询总数为：" + count);
		page.setTotalRow(count.intValue());// 总记录数目
		Session s = this.getHibernateTemplate().getSessionFactory().getCurrentSession();
		List<User> list = s.createQuery(hql).setMaxResults(WebConstants.NUM_PER_BACK_PAGE_USER).setFirstResult(startIndex).list();
		page.setResultList(list);// 数据列表
		page.setRowPerPage(WebConstants.NUM_PER_BACK_PAGE_USER);// 每页记录数目
		page.setPageIndex(pageIndex);// 当前页码
		return page;
	}
	
	public PageBean<User> queryUsersByKey(String key, int pageIndex){
		PageBean<User> page = new PageBean<User>();
		int startIndex = (pageIndex - 1) * WebConstants.NUM_PER_BACK_PAGE_USER;
		String hql = "from User u where u.loginName like ? order by id desc";
		Long count = (Long) this.getHibernateTemplate().find("select count(*) " + hql,"%"+key+"%").get(0);
		logger.debug("查询总数为：" + count);
		page.setTotalRow(count.intValue());// 总记录数目
		Session s = this.getHibernateTemplate().getSessionFactory().getCurrentSession();
		List<User> list = s.createQuery(hql).setParameter(0, "%"+key+"%").setMaxResults(WebConstants.NUM_PER_BACK_PAGE_USER).setFirstResult(startIndex).list();
		page.setResultList(list);// 数据列表
		page.setRowPerPage(WebConstants.NUM_PER_BACK_PAGE_USER);// 每页记录数目
		page.setPageIndex(pageIndex);// 当前页码
		return page;
	}


}
