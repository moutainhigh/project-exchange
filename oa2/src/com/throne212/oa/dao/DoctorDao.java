package com.throne212.oa.dao;

import org.hibernate.Session;

import com.throne212.oa.HibernateSessionFactory;
import com.throne212.oa.domain.doctor.Doctor;

public class DoctorDao {
	public void addNewDoctor(Doctor doc){
		Session s = HibernateSessionFactory.getSession();
		s.beginTransaction();
		s.saveOrUpdate(doc);
		s.getTransaction().commit();
		s.close();
	}
}
