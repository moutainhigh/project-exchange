package com.throne212.jianzhi8.dao;

import java.util.List;

import javax.annotation.Resource;

import org.hibernate.LockMode;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.context.ApplicationContext;
import org.springframework.orm.hibernate3.support.HibernateDaoSupport;
import org.springframework.stereotype.Repository;

import com.throne212.jianzhi8.domain.InfoZph;

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
			InfoZph instance = (InfoZph) getHibernateTemplate().get("com.throne212.jz8.domain.InfoZph", id);
			return instance;
		} catch (RuntimeException re) {
			log.error("get failed", re);
			throw re;
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