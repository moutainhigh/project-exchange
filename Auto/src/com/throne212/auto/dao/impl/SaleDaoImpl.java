package com.throne212.auto.dao.impl;

import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;

import com.throne212.auto.dao.SaleDao;
import com.throne212.auto.domain.Brand;
import com.throne212.auto.domain.Car;
import com.throne212.auto.domain.Sale;
import com.throne212.auto.domain.Special;

public class SaleDaoImpl extends BaseDaoImpl implements SaleDao{

	public List<Sale> getSaleList(int first, int max) {
		Session s = this.getHibernateTemplate().getSessionFactory().getCurrentSession();
		Query q = s.createQuery("from Sale order by id desc");
		return q.setMaxResults(max).setFirstResult(first).list();
	}
	public long getSaleListCount(){
		return (Long) this.getHibernateTemplate().find("select count(*) from Sale").get(0);
	}
	
	//car
	public List<Car> getSaleCarList(int first, int max) {
		Session s = this.getHibernateTemplate().getSessionFactory().getCurrentSession();
		Query q = s.createQuery("from Car order by id desc");
		return q.setMaxResults(max).setFirstResult(first).list();
	}
	public long getSaleCarListCount(){
		return (Long) this.getHibernateTemplate().find("select count(*) from Car").get(0);
	}
	public List<Car> getSaleCarList(Sale sale,int first, int max) {
		Session s = this.getHibernateTemplate().getSessionFactory().getCurrentSession();
		Query q = s.createQuery("from Car where sale=? order by id desc");
		return q.setParameter(0, sale).setMaxResults(max).setFirstResult(first).list();
	}
	public List<Car> getSaleCarList(Sale sale,Brand brand,int first, int max) {
		Session s = this.getHibernateTemplate().getSessionFactory().getCurrentSession();
		Query q = s.createQuery("from Car c where c.sale=? and (c.brand=? or c.brand.parentBrand=?) order by id desc");
		return q.setParameter(0, sale).setParameter(1, brand).setParameter(2, brand).setMaxResults(max).setFirstResult(first).list();
	}
	public long getSaleCarListCount(Sale sale){
		return (Long) this.getHibernateTemplate().find("select count(*) from Car where sale=?",sale).get(0);
	}
	
	//special
	public List<Special> getSaleSpecialList(int first, int max) {
		Session s = this.getHibernateTemplate().getSessionFactory().getCurrentSession();
		Query q = s.createQuery("from Special order by id desc");
		return q.setMaxResults(max).setFirstResult(first).list();
	}
	public long getSaleSpecialListCount(){
		return (Long) this.getHibernateTemplate().find("select count(*) from Special").get(0);
	}
	public List<Special> getSaleSpecialList(Sale sale,int first, int max) {
		Session s = this.getHibernateTemplate().getSessionFactory().getCurrentSession();
		Query q = s.createQuery("from Special where sale=? order by id desc");
		return q.setParameter(0, sale).setMaxResults(max).setFirstResult(first).list();
	}
	public long getSaleSpecialListCount(Sale sale){
		return (Long) this.getHibernateTemplate().find("select count(*) from Special where sale=?",sale).get(0);
	}
}

