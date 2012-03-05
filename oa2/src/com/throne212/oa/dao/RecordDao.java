package com.throne212.oa.dao;

import java.util.List;

import org.hibernate.Session;

import com.throne212.oa.HibernateSessionFactory;
import com.throne212.oa.domain.doctor.Record;


public class RecordDao {

	public Record getRecordById(Long id){
		Record r = null;
		
		Session s = HibernateSessionFactory.getSession();
		s.beginTransaction();
		
		r = (Record) s.get(Record.class, id);
		
		s.getTransaction().commit();
		s.close();
		
		return r;
	}
	
	public void saveRecord(Record r){
		Session s = HibernateSessionFactory.getSession();
		s.beginTransaction();
		
		s.saveOrUpdate(r);
		
		s.getTransaction().commit();
		s.close();
	}
	
	public List getRecords(Class clazz, Long docId){
		List list = null;
		
		Session s = HibernateSessionFactory.getSession();
		s.beginTransaction();
		
		list = s.createQuery("from " + clazz.getName() + " where docId=?").setParameter(0, docId).list();
		
		s.getTransaction().commit();
		s.close();
		
		return list;
	}
	
	public List getRecords(Class clazz, Long docId, int len){
		List list = null;
		
		Session s = HibernateSessionFactory.getSession();
		s.beginTransaction();
		
		list = s.createQuery("from " + clazz.getName() + " where docId=? order by date").setParameter(0, docId).setMaxResults(len).list();
		
		s.getTransaction().commit();
		s.close();
		
		return list;
	}
	
	public int deleteRecordById(Long id){
		int rst = -1;
		Session s = HibernateSessionFactory.getSession();
		s.beginTransaction();
		
		Record r = (Record) s.get(Record.class, id);
		if(r != null){
			s.delete(r);
			rst = 1;
		}
		
		s.getTransaction().commit();
		s.close();
		return rst;
	}
	
	public Record getLastRecord(Class clazz, Long docId){
		Record r = null;
		
		Session s = HibernateSessionFactory.getSession();
		s.beginTransaction();
		
		r = (Record) s.createQuery("from " + clazz.getName() + " where docId=? order by id desc").setParameter(0, docId).setMaxResults(1).uniqueResult();
		
		s.getTransaction().commit();
		s.close();
		
		return r;
	}
	
}
