package com.throne212.auto.dao.impl;

import java.util.ArrayList;
import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;

import com.throne212.auto.dao.SaleDao;
import com.throne212.auto.domain.Sale;

public class SaleDaoImpl extends BaseDaoImpl implements SaleDao{

	public Sale getSaleByLoginName(String loginName) {
		return super.getEntityByUniqueColumn(Sale.class, "loginName", loginName);
	}
	
	public boolean insertSale(Sale sale){
		this.getHibernateTemplate().save(sale);
		return true;
	}
	
	public boolean deleteSale(Long saleId){
		this.getHibernateTemplate().delete(saleId);
		return true;
	}

	public boolean updateSale(Sale sale){
		this.getHibernateTemplate().update(sale);
		return true;
	}
	
	@SuppressWarnings("unchecked")
	public List searchSale(Long saleId){
		List list = new ArrayList(); 
		System.out.println("before hibernate");
		list = this.getHibernateTemplate().find("select * from auto_sale where auto_sale.id=:saleId",saleId);
/*		Session s = this.getHibernateTemplate().getSessionFactory().getCurrentSession();
		Query q = s.createQuery("");
		q.setParameter(0, saleId);
		q.list();*/
		System.out.print("end hibernate");
		return list;
	}
}

