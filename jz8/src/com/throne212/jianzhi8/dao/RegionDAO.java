package com.throne212.jianzhi8.dao;
// default package

import java.util.List;

import javax.annotation.Resource;

import org.hibernate.LockMode;
import org.hibernate.SessionFactory;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.ApplicationContext;
import org.springframework.orm.hibernate3.HibernateTemplate;
import org.springframework.orm.hibernate3.support.HibernateDaoSupport;
import org.springframework.stereotype.Repository;

import com.throne212.jianzhi8.domain.Region;

/**
 	* A data access object (DAO) providing persistence and search support for Region entities.
 			* Transaction control of the save(), update() and delete() operations 
		can directly support Spring container-managed transactions or they can be augmented	to handle user-managed Spring transactions. 
		Each of these methods provides additional information for how to configure it for the desired type of transaction control. 	
	 * @see .Region
  * @author MyEclipse Persistence Tools 
 */

@Repository("regionDAO")
public class RegionDAO extends HibernateDaoSupport  {
	     private static final Logger log = LoggerFactory.getLogger(RegionDAO.class);
		//property constants
	public static final String CITY_CODE = "cityCode";
	public static final String CITY_NAME = "cityName";

	@Resource(name = "sessionFactory")
	public void setBaseDaoSessionFactory(SessionFactory sessionFactory) {
		super.setSessionFactory(sessionFactory);
	}
	
	public List<Region> getCityListByProvince(Region pro){
		String hql = "from Region c where c.cityCode like ? and c.cityId!=?";
		return this.getHibernateTemplate().find(hql, new Object[]{pro.getCityCode().subSequence(0, 2) + "%", pro.getCityId()});
	}

	protected void initDao() {
		//do nothing
	}
    
    public void save(Region transientInstance) {
        log.debug("saving Region instance");
        try {
            getHibernateTemplate().save(transientInstance);
            log.debug("save successful");
        } catch (RuntimeException re) {
            log.error("save failed", re);
            throw re;
        }
    }
    
	public void delete(Region persistentInstance) {
        log.debug("deleting Region instance");
        try {
            getHibernateTemplate().delete(persistentInstance);
            log.debug("delete successful");
        } catch (RuntimeException re) {
            log.error("delete failed", re);
            throw re;
        }
    }
    
    public Region findById( java.lang.String id) {
        log.debug("getting Region instance with id: " + id);
        try {
            Region instance = (Region) getHibernateTemplate()
                    .get("Region", id);
            return instance;
        } catch (RuntimeException re) {
            log.error("get failed", re);
            throw re;
        }
    }
    
    
    public List findByExample(Region instance) {
        log.debug("finding Region instance by example");
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
      log.debug("finding Region instance with property: " + propertyName
            + ", value: " + value);
      try {
         String queryString = "from Region as model where model." 
         						+ propertyName + "= ?";
		 return getHibernateTemplate().find(queryString, value);
      } catch (RuntimeException re) {
         log.error("find by property name failed", re);
         throw re;
      }
	}

	public List findByCityCode(Object cityCode
	) {
		return findByProperty(CITY_CODE, cityCode
		);
	}
	
	public List findByCityName(Object cityName
	) {
		return findByProperty(CITY_NAME, cityName
		);
	}
	

	public List findAll() {
		log.debug("finding all Region instances");
		try {
			String queryString = "from Region";
		 	return getHibernateTemplate().find(queryString);
		} catch (RuntimeException re) {
			log.error("find all failed", re);
			throw re;
		}
	}
	
    public Region merge(Region detachedInstance) {
        log.debug("merging Region instance");
        try {
            Region result = (Region) getHibernateTemplate()
                    .merge(detachedInstance);
            log.debug("merge successful");
            return result;
        } catch (RuntimeException re) {
            log.error("merge failed", re);
            throw re;
        }
    }

    public void attachDirty(Region instance) {
        log.debug("attaching dirty Region instance");
        try {
            getHibernateTemplate().saveOrUpdate(instance);
            log.debug("attach successful");
        } catch (RuntimeException re) {
            log.error("attach failed", re);
            throw re;
        }
    }
    
    public void attachClean(Region instance) {
        log.debug("attaching clean Region instance");
        try {
            getHibernateTemplate().lock(instance, LockMode.NONE);
            log.debug("attach successful");
        } catch (RuntimeException re) {
            log.error("attach failed", re);
            throw re;
        }
    }

	public static RegionDAO getFromApplicationContext(ApplicationContext ctx) {
    	return (RegionDAO) ctx.getBean("RegionDAO");
	}
}