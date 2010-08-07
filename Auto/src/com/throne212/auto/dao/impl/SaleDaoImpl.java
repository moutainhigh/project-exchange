package com.throne212.auto.dao.impl;

import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;

import com.throne212.auto.dao.SaleDao;
import com.throne212.auto.domain.Sale;

public class SaleDaoImpl extends BaseDaoImpl implements SaleDao{

	public List<Sale> getSaleList(int first, int max) {
		Session s = this.getHibernateTemplate().getSessionFactory().getCurrentSession();
		Query q = s.createQuery("from Sale order by id desc");
		return q.setMaxResults(max).setFirstResult(first).list();
	}
	public long getSaleListCount(){
		return (Long) this.getHibernateTemplate().find("select count(*) from Sale").get(0);
	}
}

