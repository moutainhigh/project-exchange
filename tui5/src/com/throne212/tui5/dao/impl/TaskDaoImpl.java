package com.throne212.tui5.dao.impl;

import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

import org.springframework.stereotype.Repository;

import com.throne212.tui5.common.Const;
import com.throne212.tui5.common.PageBean;
import com.throne212.tui5.dao.TaskDao;
import com.throne212.tui5.domain.Gaojian;
import com.throne212.tui5.domain.Task;
import com.throne212.tui5.domain.Type;
import com.throne212.tui5.domain.User;

@Repository("taskDao")
public class TaskDaoImpl extends BaseDaoImpl implements TaskDao {

	public PageBean<Task> getTaskList(Integer pageIndex, Integer status, User publisher) {
		List params = new ArrayList();
		String hql = "from Task where 1=1";
		if (status != null) {
			hql += " and status=?";
			params.add(status);
		}
		if (publisher != null) {
			hql += " and publisher=?";
			params.add(publisher);
		}
		hql += " order by publishDate desc";
		return buildBean(pageIndex, Const.MEMBER_PAGE_SIZE, hql, params);
	}

	public PageBean<Task> getMyTaskList(Integer pageIndex, User user) {
		List params = new ArrayList();
		String hql = "from Task where id in (select distinct task.id from Gaojian where user=?)";
		hql += " order by publishDate desc";
		params.add(user);
		return buildBean(pageIndex, Const.MEMBER_PAGE_SIZE, hql, params);
	}

	public PageBean<Task> getTaskList(Integer pageIndex, Integer... status) {
		List params = new ArrayList();
		String hql = "from Task where 1=1";
		if (status != null && status.length > 0) {
			hql += " and (1!=1";
			for (int i = 0; i < status.length; i++) {
				hql += " or status=?";
				params.add(status[i]);
			}
			hql += ")";
		}
		hql += " order by publishDate desc";
		return buildBean(pageIndex, Const.FRONT_PAGE_SIZE, hql, params);
	}

	public PageBean<Task> getTaskList(Integer pageIndex, Type t, Integer... status) {
		List params = new ArrayList();
		String hql = "from Task where 1=1 and type=?";
		params.add(t);
		if (status != null && status.length > 0) {
			hql += " and (1!=1";
			for (int i = 0; i < status.length; i++) {
				hql += " or status=?";
				params.add(status[i]);
			}
			hql += ")";
		}
		hql += " order by publishDate desc";
		return buildBean(pageIndex, Const.FRONT_PAGE_SIZE, hql, params);
	}

	public List<Task> getEndingTask(int min) {
		String hql = "from Task t where t.status=" + Const.TASK_STATUS_PUBLISHED + " and t.endDate>=? and t.endDate<=?";
		long now = System.currentTimeMillis();
		long smaller = now - min * 60 * 1000;
		Calendar c = Calendar.getInstance();
		c.setTimeInMillis(smaller);
		return this.getHibernateTemplate().find(hql, new Object[] { c.getTime(), new Date() });
	}

	public long getUserCountInTask(Task t) {
		String hql = "select count(distinct user) from Gaojian where task=?";
		return (Long) this.getHibernateTemplate().find(hql, t).get(0);
	}

	public List<Task> getRelateTask(Task t) {
		String hql = "from Task t where t.type=? and status=? order by publishDate desc";
		List params = new ArrayList();
		params.add(t.getType());
		params.add(Const.TASK_STATUS_PUBLISHED);
		return buildBean(1, 15, hql, params).getResultList();
	}

	public PageBean<Gaojian> getGaojianList(Integer pageIndex, Task task) {
		List params = new ArrayList();
		String hql = "from Gaojian where task=?";
		params.add(task);
		hql += " order by checkDate desc,submitDate desc";
		return buildBean(pageIndex, Const.FRONT_GAOJIAN_PAGE_SIZE, hql, params);
	}

	public PageBean<Gaojian> getGaojianList(Integer pageIndex, User user) {
		List params = new ArrayList();
		String hql = "from Gaojian where user=?";
		params.add(user);
		hql += " order by checkDate desc,submitDate desc";
		return buildBean(pageIndex, Const.MEMBER_PAGE_SIZE, hql, params);
	}

	public List<Task> getTaskTop(int top, User user) {
		List params = new ArrayList();
		String hql = "from Task where publisher=? order by publishDate desc";
		params.add(user);
		return buildBean(1, top, hql, params).getResultList();
	}

	public List<Gaojian> getGaojianTop(int top, User user){
		List params = new ArrayList();
		String hql = "from Gaojian where user=? order by checkDate desc,submitDate desc";
		params.add(user);
		return buildBean(1, top, hql, params).getResultList();
	
	}

}
