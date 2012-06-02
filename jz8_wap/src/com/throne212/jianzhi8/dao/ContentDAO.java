package com.throne212.jianzhi8.dao;

// default package

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;

import org.hibernate.HibernateException;
import org.hibernate.LockMode;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.context.ApplicationContext;
import org.springframework.dao.DataAccessException;
import org.springframework.orm.hibernate3.HibernateCallback;
import org.springframework.orm.hibernate3.support.HibernateDaoSupport;
import org.springframework.stereotype.Repository;

import com.throne212.jianzhi8.common.PageBean;
import com.throne212.jianzhi8.common.Util;
import com.throne212.jianzhi8.dataobject.ContentDO;
import com.throne212.jianzhi8.domain.Content;
import com.throne212.jianzhi8.domain.JobType;
import com.throne212.jianzhi8.domain.Type;

/**
 * A data access object (DAO) providing persistence and search support for
 * Content entities. Transaction control of the save(), update() and delete()
 * operations can directly support Spring container-managed transactions or they
 * can be augmented to handle user-managed Spring transactions. Each of these
 * methods provides additional information for how to configure it for the
 * desired type of transaction control.
 * 
 * @see .Content
 * @author MyEclipse Persistence Tools
 */
@Repository("contentDAO")
public class ContentDAO extends HibernateDaoSupport {
	private static final Logger log = LoggerFactory.getLogger(ContentDAO.class);
	// property constants
	public static final String CT_TITLE = "ctTitle";
	public static final String CT_CONTENT = "ctContent";
	public static final String CT_CITY_ID = "ctCityId";
	public static final String CT_CITY_NAME = "ctCityName";
	public static final String CT_USER_ID = "ctUserId";
	public static final String CT_KIND = "ctKind";
	public static final String CT_CLASS = "ctClass";
	public static final String CT_TYPE_ID = "ctTypeId";
	public static final String CT_TYPE_NAME = "ctTypeName";
	public static final String CT_ISCHECK = "ctIscheck";
	public static final String CT_ISCLOSE = "ctIsclose";
	public static final String CT_IPADDR = "ctIpaddr";
	public static final String CT_RENUMBER = "ctRenumber";
	public static final String CT_RE_NEW_NUMBER = "ctReNewNumber";
	public static final String CT_SALARY = "ctSalary";
	public static final String CT_LIMITDATE = "ctLimitdate";
	public static final String CT_UNITTYPE = "ctUnittype";
	public static final String CT_JOBNUM = "ctJobnum";
	public static final String CT_SELSEX = "ctSelsex";
	public static final String CT_DIGREE = "ctDigree";
	public static final String CT_LOOKNUM = "ctLooknum";
	public static final String CT_ISREG = "ctIsreg";
	public static final String CT_EMAIL = "ctEmail";
	public static final String CT_CONTACT = "ctContact";
	public static final String CT_PASSWORD = "ctPassword";
	public static final String CT_ISPAY = "ctIspay";
	public static final String CT_ISHUIYUAN = "ctIshuiyuan";
	public static final String CT_COMPANYNAME = "ctCompanyname";
	public static final String CT_JOBTIME = "ctJobtime";
	public static final String CT_MOBILE = "ctMobile";
	public static final String CT_QQ = "ctQq";
	public static final String CT_PHONE = "ctPhone";
	public static final String CT_USER_NAME = "ctUserName";
	public static final String CT_ISYZ = "ctIsyz";

	@Resource(name = "sessionFactory")
	public void setBaseDaoSessionFactory(SessionFactory sessionFactory) {
		super.setSessionFactory(sessionFactory);
	}

	protected void initDao() {
		// do nothing
	}
	
	public List<Content> findLatestContent(final String cityCode, final String typeCode, final String kind,final String ctClass, final int rows) {
		Session s = null;
		
		try {
			List params = new ArrayList();
			String hql = "from Content c where ctIscheck='1' and ctIsclose='0'";
			if(!Util.isEmpty(cityCode)){
				hql += " and ctCityId=?";
				params.add(cityCode);
			}
			if(!Util.isEmpty(typeCode)){
				hql += " and upper(ctTypeId) like ?";
				params.add("%" + typeCode.toUpperCase() + "%");
			}
			if(!Util.isEmpty(kind)){
				hql += " and ctKind=?";
				params.add(kind);
			}
			if(!Util.isEmpty(ctClass)){
				hql += " and ctClass=?";
				params.add(ctClass);
			}
			hql += " order by ctEnddate desc";

			final String exeHql = hql;
			
			logger.debug("last " + rows + " list hql = " + hql);

			s = this.getHibernateTemplate().getSessionFactory().openSession();
			Query q = s.createQuery(exeHql);
			for(int i=0;i<params.size();i++){
				q.setParameter(i, params.get(i));
			}
			q.setMaxResults(rows);
			List<Content> list = q.list();
			
			//添加类型数据
			for(Content c : list){
				String typeId = c.getCtTypeId();
				hql = "from Type where upper(typeCode)=?";
				List<Type> typeList = this.getHibernateTemplate().find(hql, c.getCtTypeId().toUpperCase());
				if(typeList == null || typeList.size() == 0){
					hql = "from JobType where upper(typeCode)=?";
					List<JobType> jobtypeList = this.getHibernateTemplate().find(hql, c.getCtTypeId().toUpperCase());
					if(jobtypeList != null && jobtypeList.size() > 0)
						c.setType(jobtypeList.get(0));
				}else{
					c.setType(typeList.get(0));
				}
			}
			return list;
		} catch (Exception e) {
			e.printStackTrace();
		} finally{
			if(s != null && s.isOpen())
				s.close();
		}
		return null;
	}
	
	public PageBean<Content> searchContent(String cityCode, String key, int pageIndex, int rows) {
		PageBean<Content> bean = new PageBean<Content>();
		// 制作参数
		if (pageIndex == 0)
			pageIndex = 1;
		int startIndex = (pageIndex - 1) * rows;
		Session s = null;
		try {
			
			List params = new ArrayList();
			String hql = "from Content c where ctIscheck='1' and ctIsclose='0'";
			if(!Util.isEmpty(cityCode)){
				hql += " and ctCityId=?";
				params.add(cityCode);
			}
			if(!Util.isEmpty(key)){
				hql += " and ctTitle like ?";
				params.add("%" + key + "%");
			}
			hql += " order by ctEnddate desc";

			final String exeHql = hql;
			
			logger.debug("search " + rows + " list hql = " + hql);

			s = this.getHibernateTemplate().getSessionFactory().openSession();
			Query q = s.createQuery(exeHql);
			for(int i=0;i<params.size();i++){
				q.setParameter(i, params.get(i));
			}
			q.setMaxResults(rows);
			q.setFirstResult(startIndex);
			List<Content> list = q.list();
			
			bean.setResultList(list);
			if (list != null) {
				int listcount = list.size();
				if (listcount >= 30) {
					bean.setIsnext(true);
				} else {
					bean.setIsnext(false);
				}
			}
			bean.setPageIndex(pageIndex);
			bean.setRowPerPage(30);
			
			return bean;
		} catch (Exception e) {
			e.printStackTrace();
		} finally{
			if(s != null && s.isOpen())
				s.close();
		}
		return null;
	}
	

	public void save(Content transientInstance) {
		log.debug("saving Content instance");
		try {
			getHibernateTemplate().save(transientInstance);
			log.debug("save successful");
		} catch (RuntimeException re) {
			log.error("save failed", re);
			throw re;
		}
	}

	public void delete(Content persistentInstance) {
		log.debug("deleting Content instance");
		try {
			getHibernateTemplate().delete(persistentInstance);
			log.debug("delete successful");
		} catch (RuntimeException re) {
			log.error("delete failed", re);
			throw re;
		}
	}

	public Content findById(java.lang.Integer id) {
		log.debug("getting Content instance with id: " + id);
		try {
			Content instance = (Content) getHibernateTemplate().get(Content.class.getSimpleName(), id);
			return instance;
		} catch (RuntimeException re) {
			log.error("get failed", re);
			throw re;
		}
	}

	public List findByExample(Content instance) {
		log.debug("finding Content instance by example");
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
		log.debug("finding Content instance with property: " + propertyName + ", value: " + value);
		try {
			String queryString = "from Content as model where model." + propertyName + "= ?";
			return getHibernateTemplate().find(queryString, value);
		} catch (RuntimeException re) {
			log.error("find by property name failed", re);
			throw re;
		}
	}

	public List findByCtTitle(Object ctTitle) {
		return findByProperty(CT_TITLE, ctTitle);
	}

	public List findByCtContent(Object ctContent) {
		return findByProperty(CT_CONTENT, ctContent);
	}

	public List findByCtCityId(Object ctCityId) {
		return findByProperty(CT_CITY_ID, ctCityId);
	}

	public List findByCtCityName(Object ctCityName) {
		return findByProperty(CT_CITY_NAME, ctCityName);
	}

	public List findByCtUserId(Object ctUserId) {
		return findByProperty(CT_USER_ID, ctUserId);
	}

	public List findByCtKind(Object ctKind) {
		return findByProperty(CT_KIND, ctKind);
	}

	public List findByCtClass(Object ctClass) {
		return findByProperty(CT_CLASS, ctClass);
	}

	public List findByCtTypeId(Object ctTypeId) {
		return findByProperty(CT_TYPE_ID, ctTypeId);
	}

	public List findByCtTypeName(Object ctTypeName) {
		return findByProperty(CT_TYPE_NAME, ctTypeName);
	}

	public List findByCtIscheck(Object ctIscheck) {
		return findByProperty(CT_ISCHECK, ctIscheck);
	}

	public List findByCtIsclose(Object ctIsclose) {
		return findByProperty(CT_ISCLOSE, ctIsclose);
	}

	public List findByCtIpaddr(Object ctIpaddr) {
		return findByProperty(CT_IPADDR, ctIpaddr);
	}

	public List findByCtRenumber(Object ctRenumber) {
		return findByProperty(CT_RENUMBER, ctRenumber);
	}

	public List findByCtReNewNumber(Object ctReNewNumber) {
		return findByProperty(CT_RE_NEW_NUMBER, ctReNewNumber);
	}

	public List findByCtSalary(Object ctSalary) {
		return findByProperty(CT_SALARY, ctSalary);
	}

	public List findByCtLimitdate(Object ctLimitdate) {
		return findByProperty(CT_LIMITDATE, ctLimitdate);
	}

	public List findByCtUnittype(Object ctUnittype) {
		return findByProperty(CT_UNITTYPE, ctUnittype);
	}

	public List findByCtJobnum(Object ctJobnum) {
		return findByProperty(CT_JOBNUM, ctJobnum);
	}

	public List findByCtSelsex(Object ctSelsex) {
		return findByProperty(CT_SELSEX, ctSelsex);
	}

	public List findByCtDigree(Object ctDigree) {
		return findByProperty(CT_DIGREE, ctDigree);
	}

	public List findByCtLooknum(Object ctLooknum) {
		return findByProperty(CT_LOOKNUM, ctLooknum);
	}

	public List findByCtIsreg(Object ctIsreg) {
		return findByProperty(CT_ISREG, ctIsreg);
	}

	public List findByCtEmail(Object ctEmail) {
		return findByProperty(CT_EMAIL, ctEmail);
	}

	public List findByCtContact(Object ctContact) {
		return findByProperty(CT_CONTACT, ctContact);
	}

	public List findByCtPassword(Object ctPassword) {
		return findByProperty(CT_PASSWORD, ctPassword);
	}

	public List findByCtIspay(Object ctIspay) {
		return findByProperty(CT_ISPAY, ctIspay);
	}

	public List findByCtIshuiyuan(Object ctIshuiyuan) {
		return findByProperty(CT_ISHUIYUAN, ctIshuiyuan);
	}

	public List findByCtCompanyname(Object ctCompanyname) {
		return findByProperty(CT_COMPANYNAME, ctCompanyname);
	}

	public List findByCtJobtime(Object ctJobtime) {
		return findByProperty(CT_JOBTIME, ctJobtime);
	}

	public List findByCtMobile(Object ctMobile) {
		return findByProperty(CT_MOBILE, ctMobile);
	}

	public List findByCtQq(Object ctQq) {
		return findByProperty(CT_QQ, ctQq);
	}

	public List findByCtPhone(Object ctPhone) {
		return findByProperty(CT_PHONE, ctPhone);
	}

	public List findByCtUserName(Object ctUserName) {
		return findByProperty(CT_USER_NAME, ctUserName);
	}

	public List findByCtIsyz(Object ctIsyz) {
		return findByProperty(CT_ISYZ, ctIsyz);
	}

	public List findAll() {
		log.debug("finding all Content instances");
		try {
			String queryString = "from Content";
			return getHibernateTemplate().find(queryString);
		} catch (RuntimeException re) {
			log.error("find all failed", re);
			throw re;
		}
	}

	public Content merge(Content detachedInstance) {
		log.debug("merging Content instance");
		try {
			Content result = (Content) getHibernateTemplate().merge(detachedInstance);
			log.debug("merge successful");
			return result;
		} catch (RuntimeException re) {
			log.error("merge failed", re);
			throw re;
		}
	}

	public void attachDirty(Content instance) {
		log.debug("attaching dirty Content instance");
		try {
			getHibernateTemplate().saveOrUpdate(instance);
			log.debug("attach successful");
		} catch (RuntimeException re) {
			log.error("attach failed", re);
			throw re;
		}
	}

	public void attachClean(Content instance) {
		log.debug("attaching clean Content instance");
		try {
			getHibernateTemplate().lock(instance, LockMode.NONE);
			log.debug("attach successful");
		} catch (RuntimeException re) {
			log.error("attach failed", re);
			throw re;
		}
	}

	public static ContentDAO getFromApplicationContext(ApplicationContext ctx) {
		return (ContentDAO) ctx.getBean("ContentDAO");
	}
}