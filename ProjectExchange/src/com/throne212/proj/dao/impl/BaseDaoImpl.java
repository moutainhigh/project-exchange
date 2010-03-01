package com.throne212.proj.dao.impl;

import java.util.Collection;
import java.util.List;

import org.apache.log4j.Logger;
import org.hibernate.HibernateException;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.criterion.DetachedCriteria;
import org.hibernate.criterion.Restrictions;
import org.springframework.orm.hibernate3.HibernateCallback;
import org.springframework.orm.hibernate3.support.HibernateDaoSupport;

import com.throne212.proj.dao.BaseDao;

//基础DAO实现对象
public class BaseDaoImpl extends HibernateDaoSupport implements BaseDao {

	// 日志，提供给子类继承的
	protected Logger logger = Logger.getLogger(this.getClass());

	public <T> void delete(T entity) {
		this.getHibernateTemplate().delete(entity);
	}

	public <T> void deleteById(Class<T> clazz, Long id) {
		String hql = "delete from " + clazz.getSimpleName() + " e where e.id=?";
		this.getHibernateTemplate().find(hql, id);
	}

	public <T> List<T> getEntitiesByColumn(Class<T> clazz, String colName, Object value) {
		String hql = "from " + clazz.getSimpleName() + " e where e." + colName + "=?";
		return this.getHibernateTemplate().find(hql, value);
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
		this.getHibernateTemplate().clear();
	}

	public void commit() {
		this.getHibernateTemplate().flush();
	}

	public void fluch() {
		this.getHibernateTemplate().flush();
	}

	public <T> List<T> getAll(Class<T> clazz, String orderBy, String style) {
		String hql = "from " + clazz.getName() + " order by " + orderBy + " " + style;
		return this.getHibernateTemplate().find(hql);
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

}
