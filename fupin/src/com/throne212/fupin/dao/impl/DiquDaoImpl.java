package com.throne212.fupin.dao.impl;

import java.math.BigInteger;
import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;

import com.opensymphony.xwork2.ActionContext;
import com.throne212.fupin.common.PageBean;
import com.throne212.fupin.common.WebConstants;
import com.throne212.fupin.dao.DiquDao;
import com.throne212.fupin.domain.AreaWorkOrg;
import com.throne212.fupin.domain.Diqu;
import com.throne212.fupin.domain.User;


public class DiquDaoImpl extends BaseDaoImpl implements DiquDao {
	
	private PageBean buildPageBeanForBaiyun(PageBean page,String sql,int startIndex,int pageIndex,Object... param){
		Session s = this.getHibernateTemplate().getSessionFactory().getCurrentSession();
		
		Query q = s.createSQLQuery("select count(*) " + sql);
		for(int i=0;param!=null && i<param.length;i++){
			q.setParameter(i, param[i]);
		}
		BigInteger  count = (BigInteger ) q.uniqueResult();
		page.setTotalRow(count.intValue());// 总记录数目
		
		q = s.createSQLQuery("select * "+sql).addEntity(Diqu.class);
		for(int i=0;param!=null && i<param.length;i++){
			q.setParameter(i, param[i]);
		}
		q.setMaxResults(WebConstants.PAGE_SIZE).setFirstResult(startIndex);
		List<Diqu> list = q.list();
		page.setResultList(list);// 数据列表
		page.setRowPerPage(WebConstants.PAGE_SIZE);// 每页记录数目
		page.setPageIndex(pageIndex);// 当前页码
		return page;
	}
	
	public PageBean getAllDiqu(Integer pageIndex){
		PageBean<Diqu> page = new PageBean<Diqu>();
		int startIndex = (pageIndex - 1) * WebConstants.PAGE_SIZE;
		String hql = "from Diqu t order by id";
		
		User user = (User) ActionContext.getContext().getSession().get(WebConstants.SESS_USER_OBJ);
		if(user instanceof AreaWorkOrg){
			AreaWorkOrg a = (AreaWorkOrg) user;
			if("Y".equals(a.getIsDiv())){
				String sql = "from fp_diqu " +
						"where (diqu_type='Zhen' and area_id="+a.getArea().getId()+") " +
						"or (diqu_type='Cun' and " +
							"zhen_id in (select id from fp_diqu where diqu_type='Zhen' and area_id="+a.getArea().getId()+"))";
				return buildPageBeanForBaiyun(page,sql,startIndex,pageIndex);
			}
		}
		
		Long count = (Long) this.getHibernateTemplate().find("select count(*) " + hql).get(0);
		logger.debug("查询总数为：" + count);
		page.setTotalRow(count.intValue());// 总记录数目
		Session s = this.getHibernateTemplate().getSessionFactory().getCurrentSession();
		List<Diqu> list = s.createQuery(hql).setMaxResults(WebConstants.PAGE_SIZE).setFirstResult(startIndex).list();
		page.setResultList(list);// 数据列表
		page.setRowPerPage(WebConstants.PAGE_SIZE);// 每页记录数目
		page.setPageIndex(pageIndex);// 当前页码
		return page;
	}
	
	public PageBean getAllDiqu(String type, Integer pageIndex) {
		PageBean<Diqu> page = new PageBean<Diqu>();
		int startIndex = (pageIndex - 1) * WebConstants.PAGE_SIZE;
		String hql = "from "+type+" t where 1=1";
		
		User user = (User) ActionContext.getContext().getSession().get(WebConstants.SESS_USER_OBJ);
		if(user instanceof AreaWorkOrg){
			AreaWorkOrg a = (AreaWorkOrg) user;
			if("Y".equals(a.getIsDiv())){
				if("Zhen".equalsIgnoreCase(type)){
					String sql = "from fp_diqu " +
					"where diqu_type='Zhen' and area_id="+a.getArea().getId()+"";
					return buildPageBeanForBaiyun(page,sql,startIndex,pageIndex);
				}
				else if("Cun".equalsIgnoreCase(type)){
					String sql = "from fp_diqu " +
					"where diqu_type='Cun' and " +
						"zhen_id in (select id from fp_diqu where diqu_type='Zhen' and area_id="+a.getArea().getId()+")";
					return buildPageBeanForBaiyun(page,sql,startIndex,pageIndex);
				}
			}
		}
		
		Long count = (Long) this.getHibernateTemplate().find("select count(*) " + hql).get(0);
		logger.debug("查询总数为：" + count);
		page.setTotalRow(count.intValue());// 总记录数目
		Session s = this.getHibernateTemplate().getSessionFactory().getCurrentSession();
		List<Diqu> list = s.createQuery(hql).setMaxResults(WebConstants.PAGE_SIZE).setFirstResult(startIndex).list();
		page.setResultList(list);// 数据列表
		page.setRowPerPage(WebConstants.PAGE_SIZE);// 每页记录数目
		page.setPageIndex(pageIndex);// 当前页码
		return page;
	}

	public PageBean getAllDiquByName(String name, Integer pageIndex) {
		PageBean<Diqu> page = new PageBean<Diqu>();
		int startIndex = (pageIndex - 1) * WebConstants.PAGE_SIZE;
		String hql = "from Diqu t where name like ? order by id";
		
		User user = (User) ActionContext.getContext().getSession().get(WebConstants.SESS_USER_OBJ);
		if(user instanceof AreaWorkOrg){
			AreaWorkOrg a = (AreaWorkOrg) user;
			if("Y".equals(a.getIsDiv())){
				String sql = "from fp_diqu " +
				"where (name like ?) and ((diqu_type='Zhen' and area_id="+a.getArea().getId()+") " +
				"or (diqu_type='Cun' and " +
					"zhen_id in (select id from fp_diqu where diqu_type='Zhen' and area_id="+a.getArea().getId()+")))";
				return buildPageBeanForBaiyun(page,sql,startIndex,pageIndex,"%"+name+"%");
			}
		}
		
		Long count = (Long) this.getHibernateTemplate().find("select count(*) " + hql,"%"+name+"%").get(0);
		logger.debug("查询总数为：" + count);
		page.setTotalRow(count.intValue());// 总记录数目
		Session s = this.getHibernateTemplate().getSessionFactory().getCurrentSession();
		List<Diqu> list = s.createQuery(hql).setParameter(0, "%"+name+"%").setMaxResults(WebConstants.PAGE_SIZE).setFirstResult(startIndex).list();
		page.setResultList(list);// 数据列表
		page.setRowPerPage(WebConstants.PAGE_SIZE);// 每页记录数目
		page.setPageIndex(pageIndex);// 当前页码
		return page;
	}

	public PageBean getAllDiquByTypeAndName(String type,String name,Integer pageIndex){
		PageBean<Diqu> page = new PageBean<Diqu>();
		int startIndex = (pageIndex - 1) * WebConstants.PAGE_SIZE;
		String hql = "from "+type+" t where name like ? order by id";
		
		User user = (User) ActionContext.getContext().getSession().get(WebConstants.SESS_USER_OBJ);
		if(user instanceof AreaWorkOrg){
			AreaWorkOrg a = (AreaWorkOrg) user;
			if("Y".equals(a.getIsDiv())){
				if("Zhen".equalsIgnoreCase(type)){
					String sql = "from fp_diqu " +
					"where diqu_type='Zhen' and area_id="+a.getArea().getId()+" and name like ?";
					return buildPageBeanForBaiyun(page,sql,startIndex,pageIndex,"%"+name+"%");
				}
				else if("Cun".equalsIgnoreCase(type)){
					String sql = "from fp_diqu " +
					"where diqu_type='Cun' and " +
						"zhen_id in (select id from fp_diqu where diqu_type='Zhen' and area_id="+a.getArea().getId()+") and name like ?";
					return buildPageBeanForBaiyun(page,sql,startIndex,pageIndex,"%"+name+"%");
				}
			}
		}
		
		Long count = (Long) this.getHibernateTemplate().find("select count(*) " + hql,"%"+name+"%").get(0);
		logger.debug("查询总数为：" + count);
		page.setTotalRow(count.intValue());// 总记录数目
		Session s = this.getHibernateTemplate().getSessionFactory().getCurrentSession();
		List<Diqu> list = s.createQuery(hql).setParameter(0, "%"+name+"%").setMaxResults(WebConstants.PAGE_SIZE).setFirstResult(startIndex).list();
		page.setResultList(list);// 数据列表
		page.setRowPerPage(WebConstants.PAGE_SIZE);// 每页记录数目
		page.setPageIndex(pageIndex);// 当前页码
		return page;
	}
}
