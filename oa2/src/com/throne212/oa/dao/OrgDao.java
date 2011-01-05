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
import com.throne212.oa.domain.muyingorg.Org;


public class OrgDao {
	public Org getOrgById(long id) {
		Session s = HibernateSessionFactory.getSession();
		s.beginTransaction();
		Org doc = (Org) s.get(Org.class, Long.valueOf(id));
		s.getTransaction().commit();
		s.close();
		return doc;
	}

	public void addNewOrg(Org doc) {
		Session s = HibernateSessionFactory.getSession();
		s.beginTransaction();
		s.saveOrUpdate(doc);
		s.getTransaction().commit();
		s.close();
	}

	public void updateOrg(Org doc) {
		Session s = HibernateSessionFactory.getSession();
		s.beginTransaction();
		s.saveOrUpdate(doc);
		s.getTransaction().commit();
		s.close();
	}

	public int deleteOrg(long id) {
		Session s = HibernateSessionFactory.getSession();
		s.beginTransaction();
		String hql = "delete from Org d where d.id=?";
		int rst = s.createQuery(hql).setLong(0, id).executeUpdate();
		if (rst > 0) {
			System.out.println("删除医生注册成功");
		}
		s.getTransaction().commit();
		s.close();
		return rst;
	}

	public PageBean findOrgs(int currPage, Org condition, Map other) {
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

	private Object[] buildFilterHQL(Org condition, Map other) {
		Object[] rst = new Object[2];
		StringBuffer sb = new StringBuffer("from Org where 1=1");
		List paramValueList = new ArrayList();
		// 构建下拉项的条件
		Field[] fs = Org.class.getDeclaredFields();
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
				}else if(f.get(condition) != null && f.getType().getName().equals(String.class.getName())){//字符串
					String value = (String) f.get(condition);
					if(!Util.isEmpty(value)){
						sb.append(" and " + f.getName() + " like ?");
						paramValueList.add("%"+value+"%");
					}
				}
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		// 发证日期段
		if (other.get("startPiZhunDate") != null && ((String[]) other.get("startPiZhunDate")).length > 0
				&& !Util.isEmpty(((String[]) other.get("startPiZhunDate"))[0])) {
			try {
				Date startDate = new SimpleDateFormat("yyyy-MM-dd").parse(((String[]) other.get("startPiZhunDate"))[0]);
				sb.append(" and publishDate>=?");
				paramValueList.add(startDate);
			} catch (ParseException e) {
				e.printStackTrace();
			}
		}
		if (other.get("endPiZhunDate") != null && ((String[]) other.get("endPiZhunDate")).length > 0
				&& !Util.isEmpty(((String[]) other.get("endPiZhunDate"))[0])) {
			try {
				Date endDate = new SimpleDateFormat("yyyy-MM-dd").parse(((String[]) other.get("endPiZhunDate"))[0]);
				endDate.setTime(endDate.getTime() + 24L * 60 * 60 * 1000);
				sb.append(" and publishDate<=?");
				paramValueList.add(endDate);
			} catch (ParseException e) {
				e.printStackTrace();
			}
		}
		// 有效日期段
		if (other.get("startValidDate") != null && ((String[]) other.get("startValidDate")).length > 0
				&& !Util.isEmpty(((String[]) other.get("startValidDate"))[0])) {
			try {
				Date startDate = new SimpleDateFormat("yyyy-MM-dd").parse(((String[]) other.get("startValidDate"))[0]);
				sb.append(" and validDate>=?");
				paramValueList.add(startDate);
			} catch (ParseException e) {
				e.printStackTrace();
			}
		}
		if (other.get("endValidDate") != null && ((String[]) other.get("endValidDate")).length > 0
				&& !Util.isEmpty(((String[]) other.get("endValidDate"))[0])) {
			try {
				Date endDate = new SimpleDateFormat("yyyy-MM-dd").parse(((String[]) other.get("endValidDate"))[0]);
				endDate.setTime(endDate.getTime() + 24L * 60 * 60 * 1000);
				sb.append(" and validDate<=?");
				paramValueList.add(endDate);
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
						&& clazz.getPackage().getName().equals(Org.class.getPackage().getName())) {
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

}
