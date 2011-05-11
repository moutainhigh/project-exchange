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
import com.throne212.oa.domain.birth.Birth;

public class BirthDao {
	public Birth getBirthById(long id) {
		Session s = HibernateSessionFactory.getSession();
		s.beginTransaction();
		Birth birth = (Birth) s.get(Birth.class, Long.valueOf(id));
		s.getTransaction().commit();
		s.close();
		return birth;
	}

	public void addNewBirth(Birth birth) {
		Session s = HibernateSessionFactory.getSession();
		s.beginTransaction();
		s.saveOrUpdate(birth);
		s.getTransaction().commit();
		s.close();
	}

	public void updateBirth(Birth birth) {
		Session s = HibernateSessionFactory.getSession();
		s.beginTransaction();
		s.saveOrUpdate(birth);
		s.getTransaction().commit();
		s.close();
	}

	public int deleteBirth(long id) {
		Session s = HibernateSessionFactory.getSession();
		s.beginTransaction();
		String hql = "delete from Birth d where d.id=?";
		int rst = s.createQuery(hql).setLong(0, id).executeUpdate();
		if (rst > 0) {
			System.out.println("删除人事记录成功");
		}
		s.getTransaction().commit();
		s.close();
		return rst;
	}

	public PageBean findBirths(int currPage, Birth condition, Map other) {
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

	private Object[] buildFilterHQL(Birth condition, Map other) {
		Object[] rst = new Object[2];
		StringBuffer sb = new StringBuffer("from Birth where 1=1");
		List paramValueList = new ArrayList();
		// 构建下拉项的条件
		Field[] fs = Birth.class.getDeclaredFields();
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
		if (!Util.isEmpty(condition.getNo())) {
			sb.append(" and no like '%" + condition.getNo() + "%'");
		}
		if (!Util.isEmpty(condition.getName())) {
			sb.append(" and name like '%" + condition.getName() + "%'");
		}
		if (!Util.isEmpty(condition.getPlace())) {
			sb.append(" and place like '%" + condition.getPlace() + "%'");
		}
		//if (!Util.isEmpty(condition.getIdNo())) {
		//	sb.append(" and idNo like '%" + condition.getIdNo() + "%'");
		//}
		if (!Util.isEmpty(condition.getMother())) {
			sb.append(" and mother like '%" + condition.getMother() + "%'");
		}
		if (!Util.isEmpty(condition.getMotherIdNo())) {
			sb.append(" and motherIdNo like '%" + condition.getMotherIdNo() + "%'");
		}
		if (!Util.isEmpty(condition.getFather())) {
			sb.append(" and father like '%" + condition.getFather() + "%'");
		}
		if (!Util.isEmpty(condition.getFatherIdNo())) {
			sb.append(" and fatherIdNo like '%" + condition.getFatherIdNo() + "%'");
		}
		// 出生日期段
		if (other.get("startBirthday") != null && ((String[]) other.get("startBirthday")).length > 0 && !Util.isEmpty(((String[]) other.get("startBirthday"))[0])) {
			String start = ((String[]) other.get("startBirthday"))[0];
			try {
				paramValueList.add(Util.getDateByTxt(start));
				sb.append(" and birthday>=?");
			} catch (ParseException e) {
				e.printStackTrace();
			}
		}
		if (other.get("endBirthday") != null && ((String[]) other.get("endBirthday")).length > 0 && !Util.isEmpty(((String[]) other.get("endBirthday"))[0])) {
			String end = ((String[]) other.get("endBirthday"))[0];
			try {
				paramValueList.add(Util.getDateByTxt(end));
				sb.append(" and birthday<=?");
			} catch (ParseException e) {
				e.printStackTrace();
			}
		}
		// 签发日期段
		if (other.get("startPiZhunDate") != null && ((String[]) other.get("startPiZhunDate")).length > 0 && !Util.isEmpty(((String[]) other.get("startPiZhunDate"))[0])) {
			String start = ((String[]) other.get("startPiZhunDate"))[0];
			try {
				paramValueList.add(Util.getDateByTxt(start));
				sb.append(" and date>=?");
			} catch (ParseException e) {
				e.printStackTrace();
			}
		}
		if (other.get("endPiZhunDate") != null && ((String[]) other.get("endPiZhunDate")).length > 0 && !Util.isEmpty(((String[]) other.get("endPiZhunDate"))[0])) {
			String end = ((String[]) other.get("endPiZhunDate"))[0];
			try {
				paramValueList.add(Util.getDateByTxt(end));
				sb.append(" and date<=?");
			} catch (ParseException e) {
				e.printStackTrace();
			}
		}
		sb.append(" order by id desc");
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
						&& clazz.getPackage().getName().equals(Birth.class.getPackage().getName())) {
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
		String hql = "from " + Birth.class.getPackage().getName() +className + " order by listorder";
		List list = s.createQuery(hql).list();
		s.close();
		return list;
	}
	public static void main(String[] args) {
		System.out.println(Birth.class.getPackage().getName());
	}

}
