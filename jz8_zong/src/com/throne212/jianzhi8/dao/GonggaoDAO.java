package com.throne212.jianzhi8.dao;
// default package

import java.sql.Timestamp;
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

import com.throne212.jianzhi8.domain.Gonggao;

/**
 	* A data access object (DAO) providing persistence and search support for Gonggao entities.
 			* Transaction control of the save(), update() and delete() operations 
		can directly support Spring container-managed transactions or they can be augmented	to handle user-managed Spring transactions. 
		Each of these methods provides additional information for how to configure it for the desired type of transaction control. 	
	 * @see .Gonggao
  * @author MyEclipse Persistence Tools 
 */
@Repository("gonggaoDAO")
public class GonggaoDAO extends HibernateDaoSupport  {
	     private static final Logger log = LoggerFactory.getLogger(GonggaoDAO.class);
		//property constants
	public static final String GAO_CONTENT = "gaoContent";
	public static final String GAO_IPADDR = "gaoIpaddr";
	public static final String GAO_TITLE = "gaoTitle";
	public static final String GAO_ISCHECK = "gaoIscheck";
	public static final String GAO_URL = "gaoUrl";
	public static final String GAO_QQ = "gaoQq";
	public static final String GAO_COMPANY = "gaoCompany";
	public static final String GAO_PHONE = "gaoPhone";
	public static final String GAO_MOBLIE = "gaoMoblie";
	public static final String GAO_EMAIL = "gaoEmail";
	public static final String GAO_CLICK = "gaoClick";

	@Resource(name = "sessionFactory")
	public void setBaseDaoSessionFactory(SessionFactory sessionFactory) {
		super.setSessionFactory(sessionFactory);
	}

	protected void initDao() {
		//do nothing
	}
    
    public void save(Gonggao transientInstance) {
        log.debug("saving Gonggao instance");
        try {
            getHibernateTemplate().save(transientInstance);
            log.debug("save successful");
        } catch (RuntimeException re) {
            log.error("save failed", re);
            throw re;
        }
    }
    
	public void delete(Gonggao persistentInstance) {
        log.debug("deleting Gonggao instance");
        try {
            getHibernateTemplate().delete(persistentInstance);
            log.debug("delete successful");
        } catch (RuntimeException re) {
            log.error("delete failed", re);
            throw re;
        }
    }
    
    public Gonggao findById( java.lang.Integer id) {
        log.debug("getting Gonggao instance with id: " + id);
        try {
            Gonggao instance = (Gonggao) getHibernateTemplate()
                    .get("Gonggao", id);
            return instance;
        } catch (RuntimeException re) {
            log.error("get failed", re);
            throw re;
        }
    }
    
    public List findNew6Gonggao() {
        try {
        	String queryString = "from Gonggao where gaoIscheck='1' order by gaoDate desc";
            Session s = this.getHibernateTemplate().getSessionFactory().getCurrentSession();
			return s.createQuery(queryString).setMaxResults(6).list();
        } catch (RuntimeException re) {
            throw re;
        }
    }  
    
    
    public List findByExample(Gonggao instance) {
        log.debug("finding Gonggao instance by example");
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
      log.debug("finding Gonggao instance with property: " + propertyName
            + ", value: " + value);
      try {
         String queryString = "from Gonggao as model where model." 
         						+ propertyName + "= ?";
		 return getHibernateTemplate().find(queryString, value);
      } catch (RuntimeException re) {
         log.error("find by property name failed", re);
         throw re;
      }
	}

	public List findByGaoContent(Object gaoContent
	) {
		return findByProperty(GAO_CONTENT, gaoContent
		);
	}
	
	public List findByGaoIpaddr(Object gaoIpaddr
	) {
		return findByProperty(GAO_IPADDR, gaoIpaddr
		);
	}
	
	public List findByGaoTitle(Object gaoTitle
	) {
		return findByProperty(GAO_TITLE, gaoTitle
		);
	}
	
	public List findByGaoIscheck(Object gaoIscheck
	) {
		return findByProperty(GAO_ISCHECK, gaoIscheck
		);
	}
	
	public List findByGaoUrl(Object gaoUrl
	) {
		return findByProperty(GAO_URL, gaoUrl
		);
	}
	
	public List findByGaoQq(Object gaoQq
	) {
		return findByProperty(GAO_QQ, gaoQq
		);
	}
	
	public List findByGaoCompany(Object gaoCompany
	) {
		return findByProperty(GAO_COMPANY, gaoCompany
		);
	}
	
	public List findByGaoPhone(Object gaoPhone
	) {
		return findByProperty(GAO_PHONE, gaoPhone
		);
	}
	
	public List findByGaoMoblie(Object gaoMoblie
	) {
		return findByProperty(GAO_MOBLIE, gaoMoblie
		);
	}
	
	public List findByGaoEmail(Object gaoEmail
	) {
		return findByProperty(GAO_EMAIL, gaoEmail
		);
	}
	
	public List findByGaoClick(Object gaoClick
	) {
		return findByProperty(GAO_CLICK, gaoClick
		);
	}
	

	public List findAll() {
		log.debug("finding all Gonggao instances");
		try {
			String queryString = "from Gonggao";
		 	return getHibernateTemplate().find(queryString);
		} catch (RuntimeException re) {
			log.error("find all failed", re);
			throw re;
		}
	}
	
    public Gonggao merge(Gonggao detachedInstance) {
        log.debug("merging Gonggao instance");
        try {
            Gonggao result = (Gonggao) getHibernateTemplate()
                    .merge(detachedInstance);
            log.debug("merge successful");
            return result;
        } catch (RuntimeException re) {
            log.error("merge failed", re);
            throw re;
        }
    }

    public void attachDirty(Gonggao instance) {
        log.debug("attaching dirty Gonggao instance");
        try {
            getHibernateTemplate().saveOrUpdate(instance);
            log.debug("attach successful");
        } catch (RuntimeException re) {
            log.error("attach failed", re);
            throw re;
        }
    }
    
    public void attachClean(Gonggao instance) {
        log.debug("attaching clean Gonggao instance");
        try {
            getHibernateTemplate().lock(instance, LockMode.NONE);
            log.debug("attach successful");
        } catch (RuntimeException re) {
            log.error("attach failed", re);
            throw re;
        }
    }

	public static GonggaoDAO getFromApplicationContext(ApplicationContext ctx) {
    	return (GonggaoDAO) ctx.getBean("GonggaoDAO");
	}
}