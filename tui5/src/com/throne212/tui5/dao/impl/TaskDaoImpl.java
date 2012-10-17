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
		List params = new ArrayList();
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

}
