package com.throne212.oa.dao;

import java.util.List;

import org.hibernate.Session;

import com.throne212.oa.HibernateSessionFactory;
import com.throne212.oa.domain.DropdownList;

public class DropdownListDao {

	public List getDropdownList(String clazzName){
		String hql = "from " + clazzName + " order by listorder asc";
		Session s = HibernateSessionFactory.getSession();
		List list = s.createQuery(hql).list();
		s.close();
		return list;
	}
	
	public DropdownList getDropdownListById(Long id){
		Session s = HibernateSessionFactory.getSession();
		DropdownList dic = (DropdownList) s.get(DropdownList.class, id);
		s.close();
		return dic;
	}
	
	public void updateDic(DropdownList dic){
		Session s = HibernateSessionFactory.getSession();
		s.beginTransaction();
		s.saveOrUpdate(dic);
		s.getTransaction().commit();
		s.close();
	}
	
}
