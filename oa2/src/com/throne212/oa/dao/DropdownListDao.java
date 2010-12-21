package com.throne212.oa.dao;

import java.util.List;

import org.hibernate.Session;

import com.throne212.oa.HibernateSessionFactory;
import com.throne212.oa.domain.DropdownList;
import com.throne212.oa.domain.report.Hospital;
import com.throne212.oa.domain.report.HospitalType;

public class DropdownListDao {

	public List getDropdownList(String clazzName) {
		String hql = "from " + clazzName + " order by listorder asc";
		Session s = HibernateSessionFactory.getSession();
		List list = s.createQuery(hql).list();
		s.close();
		return list;
	}

	public DropdownList getDropdownListById(Long id) {
		Session s = HibernateSessionFactory.getSession();
		DropdownList dic = (DropdownList) s.get(DropdownList.class, id);
		s.close();
		return dic;
	}

	public void updateDic(DropdownList dic) {
		Session s = HibernateSessionFactory.getSession();
		s.beginTransaction();
		s.saveOrUpdate(dic);
		s.getTransaction().commit();
		s.close();
	}

	public void addDic(String dicName, String name, Integer listOrder) {
		Session s = HibernateSessionFactory.getSession();
		s.beginTransaction();
		try {
			DropdownList drop = (DropdownList) Class.forName(dicName).newInstance();
			drop.setName(name);
			drop.setListorder(listOrder);
			s.save(drop);
		} catch (Exception e) {
			e.printStackTrace();
		} 
		s.getTransaction().commit();
		s.close();
	}
	public void addHospital(String name, Integer listOrder,Long hosTypeId ) {
		Session s = HibernateSessionFactory.getSession();
		s.beginTransaction();
		try {
			HospitalType type = (HospitalType) s.get(HospitalType.class, hosTypeId);
			//DropdownList drop = (DropdownList) Class.forName(dicName).newInstance();
			Hospital hos = new Hospital();
			hos.setOrgType(type);
			hos.setName(name);
			hos.setListorder(listOrder);
			s.save(hos);
		} catch (Exception e) {
			e.printStackTrace();
		} 
		s.getTransaction().commit();
		s.close();
	}
	
	public int deleteDic(String dicName, Long id) {
		Session s = HibernateSessionFactory.getSession();
		s.beginTransaction();
		try {
			String hql = "delete from " + dicName + " where id=?";
			int rst = s.createQuery(hql).setParameter(0, id).executeUpdate();
			if(rst > 0){
				System.out.println("É¾³ý×ÖµäÏî³É¹¦");
			}
			s.getTransaction().commit();
			return rst;
		} catch (Exception e) {
			e.printStackTrace();
		} finally{
			s.close();
		}
		return -1;
	}

}
