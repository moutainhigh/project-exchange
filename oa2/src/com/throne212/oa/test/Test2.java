package com.throne212.oa.test;

import java.util.List;

import org.hibernate.Session;

import com.throne212.oa.HibernateSessionFactory;

public class Test2 {
	public static void main(String[] args) throws Exception {
		
		
		while(1==1){
			Thread.currentThread().sleep(1000);
			test();
		}
			
		
	}
	
	static void test(){
		Session s = HibernateSessionFactory.getSession();
		s.beginTransaction();
		
		List list = s.createQuery("from HospitalType").list();
		System.out.println("size:" + list.size());
		
		s.getTransaction().commit();
		s.close();
	}
}
