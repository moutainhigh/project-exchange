package com.throne212.jianzhi8.dao;

// default package

import java.util.List;

import javax.annotation.Resource;

import org.hibernate.SessionFactory;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.orm.hibernate3.support.HibernateDaoSupport;
import org.springframework.stereotype.Repository;

import com.throne212.jianzhi8.domain.JobType;
import com.throne212.jianzhi8.domain.Type;

/**
 * A data access object (DAO) providing persistence and search support for Type
 * entities. Transaction control of the save(), update() and delete() operations
 * can directly support Spring container-managed transactions or they can be
 * augmented to handle user-managed Spring transactions. Each of these methods
 * provides additional information for how to configure it for the desired type
 * of transaction control.
 * 
 * @see .Type
 * @author MyEclipse Persistence Tools
 */

@Repository("jobTypeDAO")
public class JobTypeDAO extends HibernateDaoSupport {
	private static final Logger log = LoggerFactory.getLogger(JobTypeDAO.class);

	// property constants

	@Resource(name = "sessionFactory")
	public void setBaseDaoSessionFactory(SessionFactory sessionFactory) {
		super.setSessionFactory(sessionFactory);
	}

	protected void initDao() {
		// do nothing
	}

	
	public List<JobType> findAll(){
		log.debug("getting Job Types");
		try {
			return this.getHibernateTemplate().find("from JobType order by typeCode");
		} catch (RuntimeException re) {
			log.error("get failed", re);
			throw re;
		}
	}
	
	public List<JobType> findChilds(String parentTypeCode ){
		log.debug("getting Job Types");
		try {
			return this.getHibernateTemplate().find("from JobType where parentTypeCode=?", parentTypeCode);
		} catch (RuntimeException re) {
			log.error("get failed", re);
			throw re;
		}
	}
	
	public List getTopAll(String typeCode) {
		log.debug("finding top all Type instances");
		try {
			String queryString = "from JobType where parentTypeCode=? order by typeCode";
			return getHibernateTemplate().find(queryString,typeCode);
		} catch (RuntimeException re) {
			log.error("find all failed", re);
			throw re;
		}
	}
	
	public List getTopAll() {
		log.debug("finding top all Type instances");
		try {
			String queryString = "from JobType where parentTypeCode is null order by typeCode";
			return getHibernateTemplate().find(queryString);
		} catch (RuntimeException re) {
			log.error("find all failed", re);
			throw re;
		}
	}
	
	public JobType findByTypeIds(String typeCodes) {
		try {
			if(typeCodes == null)
				return null;
			String typeCode = null;
			if(typeCodes.contains("-")){
				typeCode = typeCodes.split("-")[0];
			}else{
				typeCode = typeCodes;
			}
			
			List<JobType> list = getHibernateTemplate().find("from JobType t where t.typeCode = ?", typeCode);
			if(list != null && list.size() > 0 ){
				return list.get(0);
			}
			return null;
		} catch (RuntimeException re) {
			log.error("get failed", re);
			throw re;
		}
	}
	
}