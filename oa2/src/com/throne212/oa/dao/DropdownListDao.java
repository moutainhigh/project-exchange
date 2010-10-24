package com.throne212.oa.dao;

import java.util.List;

import org.hibernate.Session;

import com.throne212.oa.HibernateSessionFactory;

public class DropdownListDao {

	public List getDropdownList(String clazzName){
		String hql = "from " + clazzName + " order by listorder asc";
		Session s = HibernateSessionFactory.getSession();
		List list = s.createQuery(hql).list();
		s.close();
		return list;
	}
	
}
