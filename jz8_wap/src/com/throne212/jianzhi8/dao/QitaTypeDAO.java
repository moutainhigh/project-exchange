package com.throne212.jianzhi8.dao;

// default package

import java.util.List;

import javax.annotation.Resource;

import org.hibernate.SessionFactory;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.orm.hibernate3.support.HibernateDaoSupport;
import org.springframework.stereotype.Repository;

import com.throne212.jianzhi8.domain.QitaType;

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

@Repository("qitaTypeDAO")
public class QitaTypeDAO extends HibernateDaoSupport {
	private static final Logger log = LoggerFactory.getLogger(QitaTypeDAO.class);

	// property constants

	@Resource(name = "sessionFactory")
	public void setBaseDaoSessionFactory(SessionFactory sessionFactory) {
		super.setSessionFactory(sessionFactory);
	}

	protected void initDao() {
		// do nothing
	}
	
	public List<QitaType> findAll(){
		log.debug("getting Job Types");
		try {
			return this.getHibernateTemplate().find("from QitaType order by typeCode");
		} catch (RuntimeException re) {
			log.error("get failed", re);
			throw re;
		}
	}
	
	
}