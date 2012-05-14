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
	
	//获得最新的其他信息
	public List<Qita> getLastQita(int rows, String type){
		String hql = "from Qita where qitaType like ? order by qitaUpdate desc";
		Session s = this.getHibernateTemplate().getSessionFactory().getCurrentSession();
		return s.createQuery(hql).setMaxResults(rows).setParameter(0, type + "%").list();
	}

}