package com.throne212.auto.dao.impl;

import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;

import com.throne212.auto.dao.NewsDao;
import com.throne212.auto.domain.News;

public class NewsDaoImpl extends BaseDaoImpl implements NewsDao {

	public List<News> getNewsList(int first, int max) {
		Session s = this.getHibernateTemplate().getSessionFactory().getCurrentSession();
		Query q = s.createQuery("from News n where n.category!=null order by publishDate desc");
		return q.setMaxResults(max).setFirstResult(first).list();
	}
	public List<News> getNewsList(int first, int max,int type) {
		Session s = this.getHibernateTemplate().getSessionFactory().getCurrentSession();
		Query q = s.createQuery("from News n where n.category.id=? order by publishDate desc");
		return q.setParameter(0, (long)type).setMaxResults(max).setFirstResult(first).list();
	}
	public long getNewsListCount(){
		return (Long) this.getHibernateTemplate().find("select count(*) from News").get(0);
	}

}
