package com.throne212.auto.dao.impl;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Collection;
import java.util.List;

import org.apache.log4j.Logger;
import org.hibernate.HibernateException;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.criterion.DetachedCriteria;
import org.hibernate.criterion.Restrictions;
import org.springframework.dao.DataAccessException;
import org.springframework.orm.hibernate3.HibernateCallback;
import org.springframework.orm.hibernate3.support.HibernateDaoSupport;

import com.throne212.auto.dao.BaseDao;


public class BaseDaoImpl extends HibernateDaoSupport implements BaseDao {

	protected Logger logger = Logger.getLogger(this.getClass());

	public <T> void delete(T entity) {
		this.getHibernateTemplate().delete(entity);
	}

	public <T> void deleteById(Class<T> clazz, Long id) {
		T e = this.getEntityById(clazz, id);
		if(e != null)
			this.getHibernateTemplate().delete(e);
	}

	public <T> List<T> getEntitiesByColumn(Class<T> clazz, String colName, Object value) {
		String hql = "from " + clazz.getSimpleName() + " e where e." + colName + "=?";
		return this.getHibernateTemplate().find(hql, value);
	}

	public <T> T getEntityById(Class<T> clazz, Long id) {
		if(id == null)
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
		try {
			this.getHibernateTemplate().saveOrUpdate(entity);
		} catch (DataAccessException e) {
			this.getHibernateTemplate().merge(entity);
		}
	}

	public <T> void merge(T entity) {
		this.getHibernateTemplate().merge(entity);
	}
	
	public <T> List<T> getAll(Class<T> clazz) {
		return this.getHibernateTemplate().find("from " + clazz.getSimpleName());
	}
	
	public <T> List<T> getEntitiesByIds(Class<T> clazz, Long[] ids){
		if(ids == null)
			return new ArrayList<T>();
		List<Long> list = new ArrayList<Long>();
		for(long id : ids){
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
		String hql = "from " + clazz.getName()+ " order by " + orderBy +" " + style;
		return this.getHibernateTemplate().find(hql);
	}
	
	public <T> List<T> getAll(final Class<T> clazz, final String orderBy, final String style,final int startIndex,final int length) {
		List<T> list = null;
		list = this.getHibernateTemplate().executeFind(new HibernateCallback(){
			public Object doInHibernate(Session s) throws HibernateException, SQLException {
				String hql = "from " + clazz.getName()+" order by " + orderBy + " " + style;
				Query q = s.createQuery(hql);
				q.setFirstResult(startIndex);
				q.setMaxResults(length);
				return q.list();
			}
		});
		return list;
	}

	public <T> List<T> getEntitiesOrderByColumns(Class<T> clazz, String orderType, String... colNames) {
		if(colNames == null || colNames.length == 0){
			return this.getAll(clazz);
		}
		String hql = "from " + clazz.getName() + " o order by";
		for(String col : colNames){
			hql += (" o." + col);
		}
		hql += " "+orderType;
		logger.debug("hql:" + hql);
		return this.getHibernateTemplate().find(hql);
	}
	
	public <T> long getEntitySum(Class<T> clazz){
		String hql = "select count(*) from " + clazz.getName();
		Long rst = (Long) this.getHibernateTemplate().find(hql).get(0);
		if(rst == null || rst < 0){
			return -1;
		}else{
			return rst;
		}
	}

}
