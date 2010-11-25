package com.throne212.oa.dao;

import java.lang.reflect.Field;
import java.text.Collator;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Comparator;
import java.util.Date;
import java.util.Iterator;
import java.util.List;
import java.util.Locale;
import java.util.Map;
import java.util.TreeMap;

import org.hibernate.Query;
import org.hibernate.Session;

import com.throne212.oa.HibernateSessionFactory;
import com.throne212.oa.common.PageBean;
import com.throne212.oa.common.Util;
import com.throne212.oa.domain.DropdownList;
import com.throne212.oa.domain.report.Hospital;
import com.throne212.oa.domain.report.HospitalType;
import com.throne212.oa.domain.report.WorkReport;
import com.throne212.oa.domain.report.Year;

public class ReportDao {
	
	public List getAllYears(){
		Session s = HibernateSessionFactory.getSession();
		List list = s.createQuery("from Year order by value desc").list();
		s.close();
		return list;
	}
	
	public List getHospitalByType(Long typeId){
		Session s = HibernateSessionFactory.getSession();
		HospitalType type = (HospitalType) s.get(HospitalType.class, typeId);
		List list = s.createQuery("from Hospital h where h.orgType=?").setParameter(0, type).list();
		s.close();
		return list;
	}
	
	public void addOrgInType(Long hosId,Long typeId){
		Session s = HibernateSessionFactory.getSession();
		s.beginTransaction();
		Hospital hos = (Hospital) s.get(Hospital.class, hosId);
		HospitalType type = (HospitalType) s.get(HospitalType.class, typeId);
		hos.setOrgType(type);
		//hos.setDate(new Date());
		s.saveOrUpdate(hos);
		s.getTransaction().commit();
		s.close();
	}
	
	public void removeOrgInType(Long hosId){
		Session s = HibernateSessionFactory.getSession();
		s.beginTransaction();
		Hospital hos = (Hospital) s.get(Hospital.class, hosId);
		hos.setOrgType(null);
		s.saveOrUpdate(hos);
		s.getTransaction().commit();
		s.close();
	}
	
	public WorkReport getWorkReportById(long id) {
		Session s = HibernateSessionFactory.getSession();
		WorkReport doc = (WorkReport) s.get(WorkReport.class, Long.valueOf(id));
		s.close();
		return doc;
	}
	
	public Hospital getOrgById(long id) {
		Session s = HibernateSessionFactory.getSession();
		Hospital h = (Hospital) s.get(Hospital.class, Long.valueOf(id));
		s.close();
		return h;
	}
	
	public Year getYear(int year) {
		Session s = HibernateSessionFactory.getSession();
		String hql = "from Year y where y.value=?";
		Year y = (Year) s.createQuery(hql).setParameter(0, Integer.valueOf(year)).uniqueResult();
		s.close();
		return y;
	}

	public void addNewYear(int year) {
		Session s = HibernateSessionFactory.getSession();
		s.beginTransaction();
		String hql = "select count(*) from Year y where y.value=?";
		Long count = (Long) s.createQuery(hql).setParameter(0, Integer.valueOf(year)).uniqueResult();
		if(count.intValue() > 0){
			s.close();
			throw new RuntimeException("年份已经存在");
		}else{
			Year y = new Year();
			y.setValue(Integer.valueOf(year));
			s.save(y);
			s.getTransaction().commit();
		}
		s.close();
	}

	public void saveOrUpdateHospital(Hospital hos) {
		Session s = HibernateSessionFactory.getSession();
		s.beginTransaction();
		s.saveOrUpdate(hos);
		s.getTransaction().commit();
		s.close();
	}

	public int deleteYear(int year) {
		Session s = HibernateSessionFactory.getSession();
		s.beginTransaction();
		
		String hql = "select count(*) from WorkReport r where r.year.value=?";
		Long count = (Long) s.createQuery(hql).setInteger(0, year).uniqueResult();
		if(count.intValue() > 0){
			s.close();
			throw new RuntimeException("年份已经包含了报表数据，不能删除已有报表数据的年份");
		}
		
		hql = "delete from Year d where d.value=?";
		int rst = s.createQuery(hql).setInteger(0, year).executeUpdate();
		if (rst > 0) {
			System.out.println("删除报表年份成功");
		}
		s.getTransaction().commit();
		s.close();
		return rst;
	}

	public PageBean findWorkReports(int currPage, WorkReport condition, Map other) {
		PageBean page = new PageBean();
		page.setPageIndex(currPage);
		page.setRowPerPage(20);

		Session s = HibernateSessionFactory.getSession();

		Object[] hqlObjArr = this.buildFilterHQL(condition, other);
		String hql = (String) hqlObjArr[0];
		List values = (List) hqlObjArr[1];

		String countHql = "select count(*) " + hql;
		Query countQuery = s.createQuery(countHql);
		for (int i = 0; i < values.size(); i++) {
			countQuery.setParameter(i, values.get(i));
		}
		Long count = (Long) countQuery.uniqueResult();
		System.out.println("记录总数为：" + count);

		if (count.longValue() > 0) {
			Query query = s.createQuery(hql);
			for (int i = 0; i < values.size(); i++) {
				query.setParameter(i, values.get(i));
			}
			query.setMaxResults(page.getRowPerPage());
			int startIndex = (currPage - 1) * page.getRowPerPage();
			query.setFirstResult(startIndex);
			page.setResultList(query.list());
		}

		page.setTotalRow(count.longValue());
		s.close();
		return page;
	}

	private Object[] buildFilterHQL(WorkReport condition, Map other) {
		Object[] rst = new Object[2];
		StringBuffer sb = new StringBuffer("from WorkReport where 1=1");
		List paramValueList = new ArrayList();
		// 构建下拉项的条件
		Field[] fs = WorkReport.class.getDeclaredFields();
		for (int i = 0; i < fs.length; i++) {
			Field f = fs[i];
			if (!f.isAccessible())
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
//		if (!Util.isEmpty(condition.getName())) {
//			sb.append(" and name like '%" + condition.getName() + "%'");
//		}
//		if (!Util.isEmpty(condition.getIdNo())) {
//			sb.append(" and idNo like '%" + condition.getIdNo() + "%'");
//		}
//		if (!Util.isEmpty(condition.getZigeNo())) {
//			sb.append(" and zigeNo like '%" + condition.getZigeNo() + "%'");
//		}
//		if (condition.getStatus() != null) {
//			sb.append(" and status=?");
//			paramValueList.add(condition.getStatus());
//		}
		// 年龄段
		if (other.get("startAge") != null && ((String[]) other.get("startAge")).length > 0 && !Util.isEmpty(((String[]) other.get("startAge"))[0])) {
			long startAge = Long.parseLong(((String[]) other.get("startAge"))[0]);
			Date startDate = new Date(System.currentTimeMillis() - startAge * 365 * 24 * 60 * 60 * 1000);
			sb.append(" and birthday<=?");
			paramValueList.add(startDate);
		}
		if (other.get("endAge") != null && ((String[]) other.get("endAge")).length > 0 && !Util.isEmpty(((String[]) other.get("endAge"))[0])) {
			// if (!Util.isEmpty((String) other.get("endAge"))) {
			long endAge = Long.parseLong(((String[]) other.get("endAge"))[0]);
			Date startDate = new Date(System.currentTimeMillis() - endAge * 365 * 24 * 60 * 60 * 1000);
			sb.append(" and birthday>=?");
			paramValueList.add(startDate);
		}
		// 批注日期段
		if (other.get("startPiZhunDate") != null && ((String[]) other.get("startPiZhunDate")).length > 0
				&& !Util.isEmpty(((String[]) other.get("startPiZhunDate"))[0])) {
			// if (!Util.isEmpty((String) other.get("startPiZhunDate"))) {
			try {
				Date startDate = new SimpleDateFormat("yyyy-MM-dd").parse(((String[]) other.get("startPiZhunDate"))[0]);
				sb.append(" and okDate>=?");
				paramValueList.add(startDate);
			} catch (ParseException e) {
				e.printStackTrace();
			}
		}
		if (other.get("endPiZhunDate") != null && ((String[]) other.get("endPiZhunDate")).length > 0
				&& !Util.isEmpty(((String[]) other.get("endPiZhunDate"))[0])) {
			// if (!Util.isEmpty((String) other.get("endPiZhunDate"))) {
			try {
				Date endDate = new SimpleDateFormat("yyyy-MM-dd").parse(((String[]) other.get("endPiZhunDate"))[0]);
				endDate.setTime(endDate.getTime() + 24L * 60 * 60 * 1000);
				sb.append(" and okDate<=?");
				paramValueList.add(endDate);
			} catch (ParseException e) {
				e.printStackTrace();
			}
		}
		sb.append(" order by okDate desc,id desc");
		System.out.println("hql=[" + sb.toString() + "]");
		rst[0] = sb.toString();
		rst[1] = paramValueList;
		return rst;
	}

	// 数组字典
	public Map getAllDic() {
		Map rst = new TreeMap(new Comparator() {
			public int compare(Object o1, Object o2) {
				return Collator.getInstance(Locale.CHINESE).compare(o1, o2);
			}
		});
		Map entities = HibernateSessionFactory.getSessionFactory().getAllClassMetadata();
		for (Iterator it = entities.keySet().iterator(); it.hasNext();) {
			String eName = (String) it.next();
			try {
				Class clazz = Class.forName(eName);
				if (DropdownList.class.isInstance(clazz.newInstance()) && !clazz.getName().equals(DropdownList.class.getName())
						&& clazz.getPackage().getName().equals(WorkReport.class.getPackage().getName())) {
					Field f = clazz.getDeclaredField("componentName");
					String name = (String) f.get(clazz.newInstance());
					rst.put(clazz.getSimpleName(), name);
				}
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		return rst;
	}

	public List getDicValueList(String className) {
		Session s = HibernateSessionFactory.getSession();
		String hql = "from " + className + " order by listorder";
		List list = s.createQuery(hql).list();
		s.close();
		return list;
	}
	
	public WorkReport getExistReport(Class reportClass,Hospital hos,Year y,String dateType,Integer season,Integer month) throws Exception{
		List params = new ArrayList();
		params.add(hos);
		params.add(y);
		params.add(dateType);
		String hql = "from "+reportClass.getName()+" r where r.org=? and year=? and dateType=?";
		if(season != null){
			hql = hql + " and season=?";
			params.add(season);
		}else if(month != null){
			hql = hql + " and month=?";
			params.add(month);
		}
		
		Session s = HibernateSessionFactory.getSession();
		Query q = s.createQuery(hql);
		for(int i=0;i<params.size();i++){
			q.setParameter(i, params.get(i));
		}
		List list = q.list();
		if(list != null && list.size() > 0){
			return (WorkReport) list.get(0);
		}
		
		s.close();
		
		return (WorkReport) reportClass.newInstance();
	}
	
	public void saveOrUpdateReport(WorkReport report){
		Session s = HibernateSessionFactory.getSession();
		s.beginTransaction();
		s.saveOrUpdate(report);
		s.getTransaction().commit();
		s.close();
	}
	
}
