package com.throne212.jianzhi8.dao;

// default package

import java.util.Collections;
import java.util.Comparator;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.hibernate.LockMode;
import org.hibernate.SessionFactory;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.ApplicationContext;
import org.springframework.orm.hibernate3.HibernateTemplate;
import org.springframework.orm.hibernate3.support.HibernateDaoSupport;
import org.springframework.stereotype.Repository;

import com.throne212.jianzhi8.domain.Type;

/**
 * A data access object (DAO) providing persistence and search support for Type
 * entities. Transaction control of the save(), update() and delete() operations
 * can directly support Spring container-managed transactions or they can be
 * augmented to handle user-managed Spring transactions. Each of these methods
 * provides additional information for how to configure it for the desired type
 * of transaction control.
 * 
 * @see .Type
 * @author MyEclipse Persistence Tools
 */

@Repository("typeDAO")
public class TypeDAO extends HibernateDaoSupport {
	private static final Logger log = LoggerFactory.getLogger(TypeDAO.class);

	// property constants

	@Resource(name = "sessionFactory")
	public void setBaseDaoSessionFactory(SessionFactory sessionFactory) {
		super.setSessionFactory(sessionFactory);
	}

	protected void initDao() {
		// do nothing
	}
	
	private static List<Type> INDEX_TYPE_LIST;
	private static Map<String, Integer> sortMap = new HashMap<String, Integer>();
	static{
		int i = 1;
		sortMap.put("���������", i++);
		sortMap.put("ѧ����ְ", i++);
		sortMap.put("����Ա", i++);
		sortMap.put("����", i++);
		sortMap.put("������", i++);
		sortMap.put("�༭", i++);
		sortMap.put("�ҽ�", i++);
		sortMap.put("����", i++);
		sortMap.put("�ʾ��ɷ�", i++);
		sortMap.put("����", i++);
	}
	public List<Type> getIndexTypes(){
		if(INDEX_TYPE_LIST != null)
			return INDEX_TYPE_LIST;
		try {
			String hql = "from Type where typeName in ('���������','ѧ����ְ','����Ա','����','������','�༭','�ҽ�','����','�ʾ��ɷ�','����')";
			List<Type> list = getHibernateTemplate().find(hql);
			Collections.sort(list, new Comparator<Type>(){
				public int compare(Type t1, Type t2) {
					return sortMap.get(t1.getTypeName()) - sortMap.get(t2.getTypeName());
				}
			});
			for(Type t : list){
				hql = "from Type where parentTypeCode=?";
				List<Type> childTypeList = this.getHibernateTemplate().find(hql,t.getTypeCode());
				t.setChildTypes(childTypeList);
				hql = "select count(*) from Content where ctTypeId=? and ctKind='1' and ctClass='0'";
				List countList = this.getHibernateTemplate().find(hql,t.getTypeCode());
				Long count = (Long) countList.get(0);
				t.setCount(count.intValue());
			}
			INDEX_TYPE_LIST = list;
			return list;
		} catch (RuntimeException re) {
			log.error("get failed", re);
			throw re;
		}
	}
	
	public Type getParentTypeByTypeId(String typeId) {
		try {
			List list = getHibernateTemplate().find("from Type where typeCode=?", typeId);
			if(list != null && list.size() > 0){
				Type t = (Type) list.get(0);
				list = getHibernateTemplate().find("from Type where typeCode=?", t.getParentTypeCode());
				if(list != null && list.size() > 0)
					return (Type) list.get(0);
			}
			return null;
		} catch (RuntimeException re) {
			log.error("get failed", re);
			throw re;
		}
	}

	public void save(Type transientInstance) {
		log.debug("saving Type instance");
		try {
			getHibernateTemplate().save(transientInstance);
			log.debug("save successful");
		} catch (RuntimeException re) {
			log.error("save failed", re);
			throw re;
		}
	}

	@Autowired
	protected HibernateTemplate createHibernateTemplate(SessionFactory sessionFactory) {
		// TODO Auto-generated method stub
		return super.createHibernateTemplate(sessionFactory);
	}

	public void delete(Type persistentInstance) {
		log.debug("deleting Type instance");
		try {
			getHibernateTemplate().delete(persistentInstance);
			log.debug("delete successful");
		} catch (RuntimeException re) {
			log.error("delete failed", re);
			throw re;
		}
	}

	public Type findById(String typeCode) {
		log.debug("getting Type instance with id: " + typeCode);
		try {
			Type instance = (Type) getHibernateTemplate().get("Type", typeCode);
			return instance;
		} catch (RuntimeException re) {
			log.error("get failed", re);
			throw re;
		}
	}
	
	public Type findByTypeIds(String typeCodes) {
		try {
			if(typeCodes == null)
				return null;
			String typeCode = null;
			if(typeCodes.contains("-")){
				typeCode = typeCodes.split("-")[0];
			}else{
				typeCode = typeCodes;
			}
			
			List<Type> list = getHibernateTemplate().find("from Type t where t.typeCode = ?", typeCode);
			if(list != null && list.size() > 0 ){
				return list.get(0);
			}
			return null;
		} catch (RuntimeException re) {
			log.error("get failed", re);
			throw re;
		}
	}
	
	public List<Type> findTypesByTypeIds(String typeCodes) {
		try {
			if(typeCodes == null)
				return null;
			String typeCode = null;
			if(typeCodes.contains("-")){
				typeCode = typeCodes.split("-")[0];
			}else{
				typeCode = typeCodes;
			}
			
			List<Type> list = getHibernateTemplate().find("from Type t where t.typeCode = ?", typeCode);
			return list;
		} catch (RuntimeException re) {
			log.error("get failed", re);
			throw re;
		}
	}

	public List findByExample(Type instance) {
		log.debug("finding Type instance by example");
		try {
			List results = getHibernateTemplate().findByExample(instance);
			log.debug("find by example successful, result size: " + results.size());
			return results;
		} catch (RuntimeException re) {
			log.error("find by example failed", re);
			throw re;
		}
	}

	public List findByProperty(String propertyName, Object value) {
		log.debug("finding Type instance with property: " + propertyName + ", value: " + value);
		try {
			String queryString = "from Type as model where model." + propertyName + "= ?";
			return getHibernateTemplate().find(queryString, value);
		} catch (RuntimeException re) {
			log.error("find by property name failed", re);
			throw re;
		}
	}
	
	public List getTopAll(String typeCode) {
		log.debug("finding top all Type instances");
		try {
			String queryString = "from Type where parentTypeCode=? order by id.typeCode";
			return getHibernateTemplate().find(queryString,typeCode);
		} catch (RuntimeException re) {
			log.error("find all failed", re);
			throw re;
		}
	}
	
	public List getTopAll() {
		log.debug("finding top all Type instances");
		try {
			String queryString = "from Type where parentTypeCode is null order by id.typeCode";
			return getHibernateTemplate().find(queryString);
		} catch (RuntimeException re) {
			log.error("find all failed", re);
			throw re;
		}
	}

	public List findAll() {
		log.debug("finding all Type instances");
		try {
			String queryString = "from Type order by id.typeCode";
			return getHibernateTemplate().find(queryString);
		} catch (RuntimeException re) {
			log.error("find all failed", re);
			throw re;
		}
	}
	
	public List getAll() {
		return findAll();
	}

	public Type merge(Type detachedInstance) {
		log.debug("merging Type instance");
		try {
			Type result = (Type) getHibernateTemplate().merge(detachedInstance);
			log.debug("merge successful");
			return result;
		} catch (RuntimeException re) {
			log.error("merge failed", re);
			throw re;
		}
	}

	public void attachDirty(Type instance) {
		log.debug("attaching dirty Type instance");
		try {
			getHibernateTemplate().saveOrUpdate(instance);
			log.debug("attach successful");
		} catch (RuntimeException re) {
			log.error("attach failed", re);
			throw re;
		}
	}

	public void attachClean(Type instance) {
		log.debug("attaching clean Type instance");
		try {
			getHibernateTemplate().lock(instance, LockMode.NONE);
			log.debug("attach successful");
		} catch (RuntimeException re) {
			log.error("attach failed", re);
			throw re;
		}
	}

	public static TypeDAO getFromApplicationContext(ApplicationContext ctx) {
		return (TypeDAO) ctx.getBean("TypeDAO");
	}
}