package com.throne212.oa.test;

import org.hibernate.Session;

import com.throne212.oa.HibernateSessionFactory;
import com.throne212.oa.domain.doctor.Doctor;

public class Test {
	public static void main(String[] args) {
		Session s = HibernateSessionFactory.getSession();
		s.beginTransaction();
		
		s.createQuery("from Nation").list();
		
		s.getTransaction().commit();
		s.close();
	}
}
