package com.throne212.jianzhi8.dao;

import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;

import org.hibernate.HibernateException;
import org.hibernate.LockMode;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.context.ApplicationContext;
import org.springframework.orm.hibernate3.support.HibernateDaoSupport;
import org.springframework.stereotype.Repository;

import com.throne212.jianzhi8.common.PageBean;
import com.throne212.jianzhi8.common.Util;
import com.throne212.jianzhi8.domain.InfoZph;
import com.throne212.jianzhi8.domain.Qita;

/**
 * A data access object (DAO) providing persistence and search support for
 * InfoZph entities. Transaction control of the save(), update() and delete()
 * operations can directly support Spring container-managed transactions or they
 * can be augmented to handle user-managed Spring transactions. Each of these
 * methods provides additional information for how to configure it for the
 * desired type of transaction control.
 * 
 * @see com.throne212.jz8.domain.InfoZph
 * @author MyEclipse Persistence Tools
 */

@Repository("qitaDAO")
public class QitaDAO extends HibernateDaoSupport {
	private static final Logger log = LoggerFactory.getLogger(QitaDAO.class);
	
	@Resource(name = "sessionFactory")
	public void setBaseDaoSessionFactory(SessionFactory sessionFactory) {
		super.setSessionFactory(sessionFactory);
	}
	
	protected void initDao() {
		// do nothing
	}
	
	public Qita getQitaById(Integer qitaNo){
		return this.getHibernateTemplate().get(Qita.class, qitaNo);
	}
	
	public Qita getPreQitaById(Integer qitaNo){
		String hql = "from Qita where qitaNo<?";
		Session s = null;
		try {
			s = this.getHibernateTemplate().getSessionFactory().openSession();
			return (Qita) s.createQuery(hql).setParameter(0, qitaNo).setMaxResults(1).uniqueResult();
		} catch (HibernateException e) {
			e.printStackTrace();
		} finally{
			if(s!=null && s.isOpen())
				s.close();
		}
		return null;
	}
	
	public Qita getPostQitaById(Integer qitaNo){
		String hql = "from Qita where qitaNo>?";
		Session s = null;
		try {
			s = this.getHibernateTemplate().getSessionFactory().openSession();
			return (Qita) s.createQuery(hql).setParameter(0, qitaNo).setMaxResults(1).uniqueResult();
		} catch (HibernateException e) {
			e.printStackTrace();
		} finally{
			if(s!=null && s.isOpen())
				s.close();
		}
		return null;
	}
	
	public List<Qita> getMoreQita(Qita q){
		String hql = "from Qita where qitaNo!=? and qitaType like ? order by qitaUpdate desc";
		Session s = null;
		try {
			s = this.getHibernateTemplate().getSessionFactory().openSession();
			List<Qita> list = s.createQuery(hql).setParameter(0, q.getQitaNo()).setParameter(1, q.getQitaType() + "%").setMaxResults(6).list();
			return list;
		} catch (HibernateException e) {
			e.printStackTrace();
		} finally{
			if(s!=null && s.isOpen())
				s.close();
		}
		return null;
	}
	
	//获得最新的其他信息
	public List<Qita> getLastQita(int rows, String type){
		Session s = null;
		try {
			String hql = "from Qita where qitaType like ? order by qitaUpdate desc";
			s = this.getHibernateTemplate().getSessionFactory().openSession();
			List<Qita> list = s.createQuery(hql).setMaxResults(rows).setParameter(0, type + "%").list();
			return list;
		} catch (HibernateException e) {
			e.printStackTrace();
		} finally{
			if(s!=null && s.isOpen())
				s.close();
		}
		return null;
	}
	
	public PageBean<Qita> getLastQita(String qitaTypeCode, int pageIndex){
		Session s = null;
		try {
			PageBean<Qita> bean = new PageBean<Qita>();
			// 制作参数
			if (pageIndex == 0)
				pageIndex = 1;
			int startIndex = (pageIndex - 1) * 20;
			//拼接hql
			List params = new ArrayList();
			String hql = "from Qita where 1=1";
			if(!Util.isEmpty(qitaTypeCode)){
				hql += " and qitaType like ?";
				params.add(qitaTypeCode + "%");
			}
			// 首先计算总行数
			s = this.getHibernateTemplate().getSessionFactory().openSession();
			Query q = s.createQuery("select count(*) " + hql);
			int i = 0;
			for(Object param : params)
				q.setParameter(i++, param);
			Long len = (Long) q.uniqueResult();
			bean.setTotalRow(len.intValue());
			//计算结果
			hql += " order by qitaUpdate desc";
			logger.debug("qita hql = " + hql);
			q = s.createQuery(hql);
			i = 0;
			for(Object param : params)
				q.setParameter(i++, param);
			q.setMaxResults(20);
			q.setFirstResult(startIndex);
			List<Qita> rstList = q.list();
			bean.setResultList(rstList);
			bean.setPageIndex(pageIndex);
			bean.setRowPerPage(20);
			return bean;
		} catch (RuntimeException re) {
			log.error("find by example failed", re);
			throw re;
		} finally{
			if(s != null && s.isOpen())
				s.close();
		}
	}

}