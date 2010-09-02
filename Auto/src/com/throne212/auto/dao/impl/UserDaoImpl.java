package com.throne212.auto.dao.impl;

import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;

import com.throne212.auto.dao.UserDao;
import com.throne212.auto.domain.Sale;
import com.throne212.auto.domain.User;

public class UserDaoImpl extends BaseDaoImpl implements UserDao {

	public User getUserByLoginName(String loginName) {
		return super.getEntityByUniqueColumn(User.class, "loginName", loginName);
	}

	public List<Sale> getSaleList(int first,int max,String key){
		Session s = this.getHibernateTemplate().getSessionFactory().getCurrentSession();
		Query q = s.createQuery("from Sale s where s.fullName like ? order by id asc");
		return q.setParameter(0, "%"+key+"%").setMaxResults(max).setFirstResult(first).list();
	}
	
	public long getSaleListCount(String key){
		Session s = this.getHibernateTemplate().getSessionFactory().getCurrentSession();
		Query q = s.createQuery("select count(*) from Sale s where s.fullName like ? order by id asc");
		return (Long) q.setParameter(0, "%"+key+"%").uniqueResult();
	}
	
}
