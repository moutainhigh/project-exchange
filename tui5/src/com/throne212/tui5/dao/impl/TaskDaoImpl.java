package com.throne212.tui5.dao.impl;

import java.util.ArrayList;
import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.springframework.stereotype.Repository;

import com.throne212.tui5.common.Const;
import com.throne212.tui5.common.PageBean;
import com.throne212.tui5.dao.TaskDao;
import com.throne212.tui5.domain.Task;
import com.throne212.tui5.domain.User;

@Repository("taskDao")
public class TaskDaoImpl extends BaseDaoImpl implements TaskDao {

	public PageBean<Task> getTaskList(Integer pageIndex, Integer status, User user) {
		PageBean<Task> page = new PageBean<Task>();
		List params = new ArrayList();
		int startIndex = (pageIndex - 1) * Const.MEMBER_PAGE_SIZE;
		String hql = "from Task where 1=1";
		if (status != null) {
			hql += " and status=?";
			params.add(status);
		}
		if (user != null) {
			hql += " and publisher=?";
			params.add(user);
		}
		hql += " order by publishDate desc";
		Long count = (Long) this.getHibernateTemplate().find("select count(*) " + hql, params.toArray()).get(0);
		page.setTotalRow(count.intValue());// 总记录数目
		Session s = this.getHibernateTemplate().getSessionFactory().openSession();
		Query q = s.createQuery(hql);
		for (int i = 0; i < params.size(); i++) {
			q.setParameter(i, params.get(i));
		}
		List<Task> list = q.setMaxResults(Const.MEMBER_PAGE_SIZE).setFirstResult(startIndex).list();
		page.setResultList(list);// 数据列表
		page.setRowPerPage(Const.MEMBER_PAGE_SIZE);// 每页记录数目
		page.setPageIndex(pageIndex);// 当前页码
		s.close();
		return page;
	}

}
