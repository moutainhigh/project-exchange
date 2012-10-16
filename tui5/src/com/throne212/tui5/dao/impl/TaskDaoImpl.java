package com.throne212.tui5.dao.impl;

import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.springframework.stereotype.Repository;

import com.throne212.tui5.common.Const;
import com.throne212.tui5.common.PageBean;
import com.throne212.tui5.dao.TaskDao;
import com.throne212.tui5.domain.Task;

@Repository("taskDao")
public class TaskDaoImpl extends BaseDaoImpl implements TaskDao {

	public PageBean<Task> getTaskList(Integer pageIndex, Integer status) {
		PageBean<Task> page = new PageBean<Task>();
		Object[] params = {};
		int startIndex = (pageIndex - 1) * Const.MEMBER_PAGE_SIZE;
		String hql = "from Task where 1=1";
		if (status != null) {
			hql += " and status=?";
			params = new Object[] { status };
		}
		hql += " order by publishDate desc";
		Long count = (Long) this.getHibernateTemplate().find("select count(*) " + hql, params).get(0);
		page.setTotalRow(count.intValue());// �ܼ�¼��Ŀ
		Session s = this.getHibernateTemplate().getSessionFactory().openSession();
		Query q = s.createQuery(hql);
		for (int i = 0; i < params.length; i++) {
			q.setParameter(i, params[i]);
		}
		List<Task> list = q.setMaxResults(Const.MEMBER_PAGE_SIZE).setFirstResult(startIndex).list();
		page.setResultList(list);// �����б�
		page.setRowPerPage(Const.MEMBER_PAGE_SIZE);// ÿҳ��¼��Ŀ
		page.setPageIndex(pageIndex);// ��ǰҳ��
		s.close();
		return page;
	}

}
