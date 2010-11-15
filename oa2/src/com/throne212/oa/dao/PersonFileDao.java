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
import com.throne212.oa.domain.file.PersonFile;

public class PersonFileDao {
	public PersonFile getPersonFileById(long id) {
		Session s = HibernateSessionFactory.getSession();
		s.beginTransaction();
		PersonFile file = (PersonFile) s.get(PersonFile.class, Long.valueOf(id));
		s.getTransaction().commit();
		s.close();
		return file;
	}

	public void addNewPersonFile(PersonFile file) {
		Session s = HibernateSessionFactory.getSession();
		s.beginTransaction();
		s.saveOrUpdate(file);
		s.getTransaction().commit();
		s.close();
	}

	public void updatePersonFile(PersonFile file) {
		Session s = HibernateSessionFactory.getSession();
		s.beginTransaction();
		s.saveOrUpdate(file);
		s.getTransaction().commit();
		s.close();
	}

	public int deletePersonFile(long id) {
		Session s = HibernateSessionFactory.getSession();
		s.beginTransaction();
		String hql = "delete from PersonFile d where d.id=?";
		int rst = s.createQuery(hql).setLong(0, id).executeUpdate();
		if (rst > 0) {
			System.out.println("删除人事文件成功");
		}
		s.getTransaction().commit();
		s.close();
		return rst;
	}

	public PageBean findPersonFiles(int currPage, PersonFile condition, Map other) {
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

	private Object[] buildFilterHQL(PersonFile condition, Map other) {
		Object[] rst = new Object[2];
		StringBuffer sb = new StringBuffer("from PersonFile where 1=1");
		List paramValueList = new ArrayList();
		// 构建下拉项的条件
		Field[] fs = PersonFile.class.getDeclaredFields();
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
		if (!Util.isEmpty(condition.getTitle())) {
			sb.append(" and title like '%" + condition.getTitle() + "%'");
		}
		if (!Util.isEmpty(condition.getFileNo())) {
			sb.append(" and fileNo like '%" + condition.getFileNo() + "%'");
		}
		if (!Util.isEmpty(condition.getOrg())) {
			sb.append(" and org like '%" + condition.getOrg() + "%'");
		}
		if (!Util.isEmpty(condition.getMainWords())) {
			sb.append(" and mainWords like '%" + condition.getMainWords() + "%'");
		}
		// 时间段
		if (other.get("startDate") != null && ((String[]) other.get("startDate")).length > 0 && !Util.isEmpty(((String[]) other.get("startDate"))[0])) {
			SimpleDateFormat fmt = new SimpleDateFormat("yyyy-MM-dd");
			try {
				paramValueList.add(fmt.parse(((String[]) other.get("startDate"))[0]));
				sb.append(" and date>=?");
			} catch (ParseException e) {
				e.printStackTrace();
			}
		}
		if (other.get("endDate") != null && ((String[]) other.get("endDate")).length > 0 && !Util.isEmpty(((String[]) other.get("endDate"))[0])) {
			SimpleDateFormat fmt = new SimpleDateFormat("yyyy-MM-dd");
			try {
				Date d = new Date(fmt.parse(((String[]) other.get("endDate"))[0]).getTime() + 24*60*60*1000 - 1);
				paramValueList.add(d);
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
						&& clazz.getPackage().getName().equals(PersonFile.class.getPackage().getName())) {
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
		String hql = "from " + PersonFile.class.getPackage().getName() +className + " order by listorder";
		List list = s.createQuery(hql).list();
		s.close();
		return list;
	}
	public static void main(String[] args) {
		System.out.println(PersonFile.class.getPackage().getName());
	}

}
