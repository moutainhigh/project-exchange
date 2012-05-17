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
import org.springframework.transaction.annotation.Transactional;

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

@Repository("infoZphDAO")
//@Transactional
public class InfoZphDAO extends HibernateDaoSupport {
	private static final Logger log = LoggerFactory.getLogger(InfoZphDAO.class);
	// property constants
	public static final String ZPH_TITLE = "zphTitle";
	public static final String ZPH_CONTENT = "zphContent";
	public static final String ZPH_PROVINCE = "zphProvince";
	public static final String ZPH_USER_NAME = "zphUserName";
	public static final String ZPH_ISCHECK = "zphIscheck";
	public static final String ZPH_IPADDR = "zphIpaddr";
	public static final String ZPH_STARTDATE = "zphStartdate";
	public static final String ZPH_ENDDATE = "zphEnddate";
	public static final String ZPH_CLICK = "zphClick";
	public static final String ZPH_USER_ID = "zphUserId";

	
	@Resource(name = "sessionFactory")
	public void setBaseDaoSessionFactory(SessionFactory sessionFactory) {
		super.setSessionFactory(sessionFactory);
	}
	
	protected void initDao() {
		// do nothing
	}
	
	public InfoZph getPreZphById(Integer no){
		String hql = "from InfoZph where zphNo<?";
		Session s = null;
		try {
			s = this.getHibernateTemplate().getSessionFactory().openSession();
			return (InfoZph) s.createQuery(hql).setParameter(0, no).setMaxResults(1).uniqueResult();
		} catch (HibernateException e) {
			e.printStackTrace();
		} finally{
			if(s!=null && s.isOpen())
				s.close();
		}
		return null;
	}
	
	public InfoZph getPostZphById(Integer no){
		String hql = "from InfoZph where zphNo>?";
		Session s = null;
		try {
			s = this.getHibernateTemplate().getSessionFactory().openSession();
			return (InfoZph) s.createQuery(hql).setParameter(0, no).setMaxResults(1).uniqueResult();
		} catch (HibernateException e) {
			e.printStackTrace();
		} finally{
			if(s!=null && s.isOpen())
				s.close();
		}
		return null;
	}
	
	public List<InfoZph> getMoreZph(InfoZph z){
		String hql = "from InfoZph where zphNo!=? and zphProvince=? order by zphUpdate desc";
		Session s = null;
		try {
			s = this.getHibernateTemplate().getSessionFactory().openSession();
			List<InfoZph> list = s.createQuery(hql).setParameter(0, z.getZphNo()).setParameter(1, z.getZphProvince()).setMaxResults(6).list();
			return list;
		} catch (HibernateException e) {
			e.printStackTrace();
		} finally{
			if(s!=null && s.isOpen())
				s.close();
		}
		return null;
	}
	

	public void save(InfoZph transientInstance) {
		log.debug("saving InfoZph instance");
		try {
			getHibernateTemplate().save(transientInstance);
			log.debug("save successful");
		} catch (RuntimeException re) {
			log.error("save failed", re);
			throw re;
		}
	}

	public void delete(InfoZph persistentInstance) {
		log.debug("deleting InfoZph instance");
		try {
			getHibernateTemplate().delete(persistentInstance);
			log.debug("delete successful");
		} catch (RuntimeException re) {
			log.error("delete failed", re);
			throw re;
		}
	}

	public InfoZph findById(java.lang.Integer id) {
		log.debug("getting InfoZph instance with id: " + id);
		try {
			InfoZph instance = (InfoZph) getHibernateTemplate().get(InfoZph.class, id);
			return instance;
		} catch (RuntimeException re) {
			log.error("get failed", re);
			throw re;
		}
	}
	
	public PageBean listZph(String cityCode,Integer pageIndex) {
		Session s = null;
		try {
			PageBean<InfoZph> bean = new PageBean<InfoZph>();
			// 制作参数
			if (pageIndex == 0)
				pageIndex = 1;
			int startIndex = (pageIndex - 1) * 20;
			//拼接hql
			List params = new ArrayList();
			String hql = "from InfoZph where 1=1";
			if(!Util.isEmpty(cityCode)){
				hql += " and zphProvince=?";
				params.add(cityCode);
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
			hql += " order by zphUpdate desc";
			q = s.createQuery(hql);
			i = 0;
			for(Object param : params)
				q.setParameter(i++, param);
			q.setMaxResults(20);
			q.setFirstResult(startIndex);
			List<InfoZph> rstList = q.list();
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

	public List findByExample(InfoZph instance) {
		log.debug("finding InfoZph instance by example");
		try {
			List results = getHibernateTemplate().findByExample(instance);
			log.debug("find by example successful, result size: " + results.size());
			return results;
		} catch (RuntimeException re) {
			log.error("find by example failed", re);
			throw re;
		}
	}

	public List findByProperty(String propertyName, Object value) {
		log.debug("finding InfoZph instance with property: " + propertyName + ", value: " + value);
		try {
			String queryString = "from InfoZph as model where model." + propertyName + "= ?";
			return getHibernateTemplate().find(queryString, value);
		} catch (RuntimeException re) {
			log.error("find by property name failed", re);
			throw re;
		}
	}
	
	public List findNew4ZPH() {
		try {
			String queryString = "from InfoZph as model order by zphUpdate desc";
			Session s = this.getHibernateTemplate().getSessionFactory().getCurrentSession();
			return s.createQuery(queryString).setMaxResults(4).list();
		} catch (RuntimeException re) {
			throw re;
		}
	}
	
	public List findNew6ZPH() {
		try {
			String queryString = "from InfoZph as model order by zphUpdate desc";
			Session s = this.getHibernateTemplate().getSessionFactory().getCurrentSession();
			return s.createQuery(queryString).setMaxResults(6).list();
		} catch (RuntimeException re) {
			throw re;
		}
	}

	public List findByZphTitle(Object zphTitle) {
		return findByProperty(ZPH_TITLE, zphTitle);
	}

	public List findByZphContent(Object zphContent) {
		return findByProperty(ZPH_CONTENT, zphContent);
	}

	public List findByZphProvince(Object zphProvince) {
		return findByProperty(ZPH_PROVINCE, zphProvince);
	}

	public List findByZphUserName(Object zphUserName) {
		return findByProperty(ZPH_USER_NAME, zphUserName);
	}

	public List findByZphIscheck(Object zphIscheck) {
		return findByProperty(ZPH_ISCHECK, zphIscheck);
	}

	public List findByZphIpaddr(Object zphIpaddr) {
		return findByProperty(ZPH_IPADDR, zphIpaddr);
	}

	public List findByZphStartdate(Object zphStartdate) {
		return findByProperty(ZPH_STARTDATE, zphStartdate);
	}

	public List findByZphEnddate(Object zphEnddate) {
		return findByProperty(ZPH_ENDDATE, zphEnddate);
	}

	public List findByZphClick(Object zphClick) {
		return findByProperty(ZPH_CLICK, zphClick);
	}

	public List findByZphUserId(Object zphUserId) {
		return findByProperty(ZPH_USER_ID, zphUserId);
	}

	public List findAll() {
		log.debug("finding all InfoZph instances");
		try {
			String queryString = "from InfoZph";
			return getHibernateTemplate().find(queryString);
		} catch (RuntimeException re) {
			log.error("find all failed", re);
			throw re;
		}
	}

	public InfoZph merge(InfoZph detachedInstance) {
		log.debug("merging InfoZph instance");
		try {
			InfoZph result = (InfoZph) getHibernateTemplate().merge(detachedInstance);
			log.debug("merge successful");
			return result;
		} catch (RuntimeException re) {
			log.error("merge failed", re);
			throw re;
		}
	}

	public void attachDirty(InfoZph instance) {
		log.debug("attaching dirty InfoZph instance");
		try {
			getHibernateTemplate().saveOrUpdate(instance);
			log.debug("attach successful");
		} catch (RuntimeException re) {
			log.error("attach failed", re);
			throw re;
		}
	}

	public void attachClean(InfoZph instance) {
		log.debug("attaching clean InfoZph instance");
		try {
			getHibernateTemplate().lock(instance, LockMode.NONE);
			log.debug("attach successful");
		} catch (RuntimeException re) {
			log.error("attach failed", re);
			throw re;
		}
	}

	public static InfoZphDAO getFromApplicationContext(ApplicationContext ctx) {
		return (InfoZphDAO) ctx.getBean("InfoZphDAO");
	}
}