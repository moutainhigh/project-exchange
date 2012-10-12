package com.throne212.tui5.dao.impl;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Collection;
import java.util.List;

import javax.annotation.Resource;

import org.apache.log4j.Logger;
import org.hibernate.HibernateException;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.criterion.DetachedCriteria;
import org.hibernate.criterion.Restrictions;
import org.springframework.dao.DataAccessException;
import org.springframework.orm.hibernate3.HibernateCallback;
import org.springframework.orm.hibernate3.support.HibernateDaoSupport;
import org.springframework.stereotype.Repository;

import com.throne212.tui5.dao.BaseDao;


@Repository("baseDao")
public class BaseDaoImpl extends HibernateDaoSupport implements BaseDao {

	protected Logger logger = Logger.getLogger(this.getClass());
	
	@Resource(name = "sessionFactory")
	public void setBaseDaoSessionFactory(SessionFactory sessionFactory) {
		super.setSessionFactory(sessionFactory);
	}

	public <T> void delete(T entity) {
		this.getHibernateTemplate().delete(entity);
	}

	public <T> void deleteById(Class<T> clazz, Long id) {
		T e = this.getEntityById(clazz, id);
		if (e != null)
			this.getHibernateTemplate().delete(e);
	}

	public <T> List<T> getEntitiesByColumn(Class<T> clazz, String colName, Object value) {
		String hql = "from " + clazz.getSimpleName() + " e where e." + colName + "=?";
		return this.getHibernateTemplate().find(hql, value);
	}

	public <T> List<T> getEntitiesByTwoColumn(Class<T> clazz, String colOneName, Object oneValue, String colTwoName, Object twoValue) {
		String hql = "from " + clazz.getSimpleName() + " e where e." + colOneName + "=? and e." + colTwoName + "=? order by e.id desc";
		List paramValueList = new ArrayList();
		paramValueList.add(oneValue);
		paramValueList.add(twoValue);
		return this.getHibernateTemplate().find(hql, paramValueList.toArray());
	}

	public <T> T getEntityById(Class<T> clazz, Long id) {
		if (id == null)
			return null;
		return (T) this.getHibernateTemplate().get(clazz, id);
	}

	public <T> T getEntityByUniqueColumn(Class<T> clazz, String colName, Object value) {
		String hql = "from " + clazz.getSimpleName() + " e where e." + colName + "=?";
		List<T> list = this.getHibernateTemplate().find(hql, value);
		if (list != null && list.size() > 0)
			return list.get(0);
		else
			return null;
	}

	public <T> void saveOrUpdate(T entity) {
		this.getHibernateTemplate().saveOrUpdate(entity);
	}

	public <T> void merge(T entity) {
		this.getHibernateTemplate().merge(entity);
	}

	public <T> List<T> getAll(Class<T> clazz) {
		return this.getHibernateTemplate().find("from " + clazz.getSimpleName());
	}

	public <T> List<T> getEntitiesByIds(Class<T> clazz, Long[] ids) {
		if (ids == null)
			return new ArrayList<T>();
		List<Long> list = new ArrayList<Long>();
		for (long id : ids) {
			list.add(id);
		}
		return this.getEntitiesByIds(clazz, list);
	}

	public <T> List<T> getEntitiesByIds(Class<T> clazz, Collection<Long> ids) {
		DetachedCriteria dc = DetachedCriteria.forClass(clazz);
		dc.add(Restrictions.in("id", ids));
		return this.getHibernateTemplate().findByCriteria(dc);
	}

	public int loadRecordCount(final String hql, final Object[] cols) {
		Object resObj = this.getHibernateTemplate().execute(new HibernateCallback() {
			public Object doInHibernate(Session session) throws HibernateException {
				Query query = session.createQuery(hql);
				if (null != cols) {
					for (int i = 0; cols != null && i < cols.length; i++) {
						query.setParameter(i, cols[i]);
					}
				}

				return query.uniqueResult();
			}
		});

		Integer i = 0;
		if (resObj instanceof Long) {
			String ss = String.valueOf(resObj);
			i = Integer.parseInt(ss);
		}
		return i;
	}

	public void clear() {
		// TODO Auto-generated method stub
		this.getHibernateTemplate().clear();
	}

	public void commit() {
		// TODO Auto-generated method stub
		this.getHibernateTemplate().flush();
	}

	public void fluch() {
		// TODO Auto-generated method stub
		this.getHibernateTemplate().flush();
	}

	public <T> List<T> getAll(Class<T> clazz, String orderBy, String style) {
		String hql = "from " + clazz.getName() + " order by " + orderBy + " " + style;
		return this.getHibernateTemplate().find(hql);
	}

	public <T> List<T> getAll(final Class<T> clazz, final String orderBy, final String style, final int startIndex, final int length) {
		List<T> list = null;
		list = this.getHibernateTemplate().executeFind(new HibernateCallback() {
			public Object doInHibernate(Session s) throws HibernateException, SQLException {
				String hql = "from " + clazz.getName() + " where (enable is null or enable=true) order by " + orderBy + " " + style;
				Query q = s.createQuery(hql);
				q.setFirstResult(startIndex);
				q.setMaxResults(length);
				return q.list();
			}
		});
		return list;
	}

	public <T> List<T> getEntitiesOrderByColumns(Class<T> clazz, String orderType, String... colNames) {
		if (colNames == null || colNames.length == 0) {
			return this.getAll(clazz);
		}
		String hql = "from " + clazz.getName() + " o order by";
		for (String col : colNames) {
			hql += (" o." + col);
		}
		hql += " " + orderType;
		logger.debug("hql:" + hql);
		return this.getHibernateTemplate().find(hql);
	}

	public <T> long getEntitySum(Class<T> clazz) {
		String hql = "select count(*) from " + clazz.getName();
		Long rst = (Long) this.getHibernateTemplate().find(hql).get(0);
		if (rst == null || rst < 0) {
			return -1;
		} else {
			return rst;
		}
	}

	public <T> long getEntitySum(Class<T> clazz, String colName, Object value) {
		String hql = "select count(*) from " + clazz.getName() + " where " + colName + "=?";
		Long rst = (Long) this.getHibernateTemplate().find(hql, value).get(0);
		if (rst == null || rst < 0) {
			return -1;
		} else {
			return rst;
		}
	}

	public <T> List<T> getAllLike(Class<T> clazz, String colName, String likeValue) {
		String hql = "from " + clazz.getName() + " where " + colName + " like ? ";
		return this.getHibernateTemplate().find(hql, "%" + likeValue + "%");
	}

	public <T> List<T> getEntitiesSecondColIsNull(Class<T> clazz, String colOneName, Object oneValue, String colTwoName) {
		String hql = "from " + clazz.getSimpleName() + " e where e." + colOneName + "=? and e." + colTwoName + " is null order by e.id desc";
		List paramValueList = new ArrayList();
		paramValueList.add(oneValue);

		return this.getHibernateTemplate().find(hql, paramValueList.toArray());
	}

	// public <T extends Log> List<T> getLogList(MyEntity entity,String
	// refName){
	// String entityName = entity.getClass().getSimpleName()+"Log";
	// if(entity instanceof User){
	// entityName = "UserLog";
	// }
	// String hql =
	// "from "+entityName+" l where l."+refName+"=? order by logTime asc";
	// return this.getHibernateTemplate().find(hql, entity);
	// }
}
