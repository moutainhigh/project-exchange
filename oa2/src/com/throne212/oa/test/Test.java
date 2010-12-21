package com.throne212.oa.test;

import java.util.List;

import org.hibernate.Session;

import com.throne212.oa.HibernateSessionFactory;
import com.throne212.oa.domain.report.HospitalType;

public class Test {
	public static void main(String[] args) {
		Session s = HibernateSessionFactory.getSession();
		s.beginTransaction();
		
		List list = s.createQuery("from HospitalType").list();
		System.out.println("size1:" + list.size());
		
		s.getTransaction().commit();
		s.close();
		
		new Thread(new Runnable(){
			public void run() {
				Session s = HibernateSessionFactory.getSession();
				s.beginTransaction();
				
				HospitalType t = new HospitalType();
				t.setName("test001");
				s.saveOrUpdate(t);
				
				s.getTransaction().commit();
				s.close();
				
				try {
					Thread.currentThread().sleep(1000);
				} catch (InterruptedException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
				s = HibernateSessionFactory.getSession();
				s.beginTransaction();
				
				List list = s.createQuery("from HospitalType").list();
				System.out.println("size2:" + list.size());
				
				s.getTransaction().commit();
				s.close();
			}}).start();
		
	}
}
