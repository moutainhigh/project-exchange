package com.throne212.oa.dao;

import java.lang.reflect.Field;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import org.hibernate.Query;
import org.hibernate.Session;

import com.throne212.oa.HibernateSessionFactory;
import com.throne212.oa.common.PageBean;
import com.throne212.oa.common.Util;
import com.throne212.oa.domain.doctor.Doctor;
import com.throne212.oa.domain.doctor.DropdownList;

public class DoctorDao {
	public Doctor getDoctorById(long id) {
		Session s = HibernateSessionFactory.getSession();
		s.beginTransaction();
		Doctor doc = (Doctor) s.get(Doctor.class, Long.valueOf(id));
		s.getTransaction().commit();
		s.close();
		return doc;
	}
	public void addNewDoctor(Doctor doc) {
		Session s = HibernateSessionFactory.getSession();
		s.beginTransaction();
		doc.setStatus(new Integer(1));
		s.saveOrUpdate(doc);
		s.getTransaction().commit();
		s.close();
	}

	public PageBean findDoctors(int currPage, Doctor condition, Map other) {
		PageBean page = new PageBean();
		page.setPageIndex(currPage);
		page.setRowPerPage(20);
		
		Session s = HibernateSessionFactory.getSession();

		Object[] hqlObjArr = this.buildFilterHQL(condition, other);
		String hql = (String) hqlObjArr[0];
		List values = (List) hqlObjArr[1];
		
		String countHql = "select count(*) " + hql;
		Query countQuery = s.createQuery(countHql);
		Iterator it = values.iterator();
		for(int i=0;it.hasNext();i++){
			countQuery.setParameter(i, it.next());
		}
		Long count = (Long) countQuery.uniqueResult();
		System.out.println("记录总数为：" + count);
		
		Query query = s.createQuery(hql);
		it = values.iterator();
		for(int i=0;it.hasNext();i++){
			query.setParameter(i, it.next());
		}
		query.setMaxResults(page.getRowPerPage());
		int startIndex = (currPage - 1) * page.getRowPerPage();
		query.setFirstResult(startIndex);
		
		page.setResultList(query.list());
		page.setTotalRow(count.longValue());

		s.close();
		return page;
	}

	private Object[] buildFilterHQL(Doctor condition, Map other) {
		Object[] rst = new Object[2];
		StringBuffer sb = new StringBuffer("from Doctor where 1=1");
		List paramValueList = new ArrayList();
		// 构建下拉项的条件
		Field[] fs = Doctor.class.getDeclaredFields();
		for (int i = 0; i < fs.length; i++) {
			Field f = fs[i];
			if(!f.isAccessible())
				f.setAccessible(true);
			try {
				if (f.get(condition) != null && DropdownList.class.isInstance(f.get(condition))) {
					DropdownList drop = (DropdownList) f.get(condition);
					if (drop.getId() != null) {
						sb.append(" and " + f.getName() + "=?");
						paramValueList.add(drop);
					}
				}
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		if (!Util.isEmpty(condition.getName())) {
			sb.append(" and name like '?'");
			paramValueList.add("%" + condition.getName() + "%");
		}
		if (!Util.isEmpty(condition.getIdNo())) {
			sb.append(" and idNo like '?'");
			paramValueList.add("%" + condition.getIdNo() + "%");
		}
		if (!Util.isEmpty(condition.getZigeNo())) {
			sb.append(" and zigeNo like '?'");
			paramValueList.add("%" + condition.getZigeNo() + "%");
		}
		if (condition.getStatus() != null) {
			sb.append(" and status = ?");
			paramValueList.add(condition.getStatus());
		}
		// 年龄段
		if (!Util.isEmpty((String) other.get("startAge"))) {
			long startAge = Long.parseLong((String) other.get("startAge"));
			Date startDate = new Date(System.currentTimeMillis() - startAge * 365 * 24 * 60 * 60 * 1000);
			sb.append(" and birthday<=?");
			paramValueList.add(startDate);
		}
		if (!Util.isEmpty((String) other.get("endAge"))) {
			long endAge = Long.parseLong((String) other.get("endAge"));
			Date startDate = new Date(System.currentTimeMillis() - endAge * 365 * 24 * 60 * 60 * 1000);
			sb.append(" and birthday>=?");
			paramValueList.add(startDate);
		}
		// 批注日期段
		if (!Util.isEmpty((String) other.get("startPiZhunDate"))) {
			try {
				Date startDate = new SimpleDateFormat("yyyy-MM-dd").parse((String) other.get("startPiZhunDate"));
				sb.append(" and okDate>=?");
				paramValueList.add(startDate);
			} catch (ParseException e) {
				e.printStackTrace();
			}
		}
		if (!Util.isEmpty((String) other.get("endPiZhunDate"))) {
			try {
				Date endDate = new SimpleDateFormat("yyyy-MM-dd").parse((String) other.get("endPiZhunDate"));
				endDate.setTime(endDate.getTime() + 24L * 60 * 60 * 1000);
				sb.append(" and okDate<=?");
				paramValueList.add(endDate);
			} catch (ParseException e) {
				e.printStackTrace();
			}
		}
		sb.append(" order by okDate desc");
		System.out.println("hql=["+sb.toString()+"]");
		rst[0] = sb.toString();
		rst[1] = paramValueList;
		return rst;
	}
	
}
