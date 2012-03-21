package com.throne212.fupin.dao.impl;

import java.util.List;

import org.hibernate.Session;

import com.throne212.fupin.common.PageBean;
import com.throne212.fupin.common.Util;
import com.throne212.fupin.common.WebConstants;
import com.throne212.fupin.dao.QuestionDao;
import com.throne212.fupin.domain.Contact;
import com.throne212.fupin.domain.Question1;
import com.throne212.fupin.domain.Question2;

public class QuestionDaoImpl extends BaseDaoImpl implements QuestionDao {
	
	public PageBean<Contact> getContactOfUser(Contact condition, String userName, Integer pageIndex) {
		PageBean<Contact> page = new PageBean<Contact>();
		int startIndex = (pageIndex - 1) * WebConstants.PAGE_SIZE;
		String hql = "from Contact t";
		if(userName != null&&!"".equals(userName))
			hql += " where t.owner='"+userName+"'";
		if (condition!=null && condition.getOrgName()!=null&&!"".equals(condition.getOrgName())) {
			hql+=" and t.orgName like '%"+condition.getOrgName()+"%'";
		}
		if (condition!=null && condition.getContactName()!=null&&!"".equals(condition.getContactName())) {
			hql+=" and t.contactName like '%"+condition.getContactName()+"%'";
		}
		if (condition!=null && condition.getDuty()!=null&&!"".equals(condition.getDuty())) {
			hql+=" and t.duty like '%"+condition.getDuty()+"%'";
		}
		if (condition!=null && condition.getGroup()!=null&&condition.getGroup().getId()!=null&&!"".equals(condition.getGroup().getId())) {
			hql+=" and t.group.id ='"+condition.getGroup().getId()+"'";
		}
		hql+=" order by id desc";
		logger.debug("hql="+hql);
		Long count = (Long) this.getHibernateTemplate().find("select count(*) " + hql).get(0);
		logger.debug("查询总数为：" + count);
		page.setTotalRow(count.intValue());// 总记录数目
		Session s = this.getHibernateTemplate().getSessionFactory().getCurrentSession();
		List<Contact> list = s.createQuery(hql).setMaxResults(WebConstants.PAGE_SIZE).setFirstResult(startIndex).list();
		page.setResultList(list);// 数据列表
		page.setRowPerPage(WebConstants.PAGE_SIZE);// 每页记录数目
		page.setPageIndex(pageIndex);// 当前页码
		return page;
	}

	public PageBean<Question1> listQuestion1(Long areaId, Long zhenId, Long cunId, Integer pageIndex) {
		PageBean<Question1> page = new PageBean<Question1>();
		int startIndex = (pageIndex - 1) * WebConstants.PAGE_SIZE;
		String hql = "from Question1 q where 1=1";
		
		if(cunId != null){
			hql += " and cun.id=" + cunId;
		}else if(zhenId != null){
			hql += " and cun.zhen.id=" + zhenId;
		}else if(areaId != null){
			hql += " and cun.zhen.area.id=" + areaId;
		}
		
		hql+=" order by id desc";
		logger.debug("hql="+hql);
		Long count = (Long) this.getHibernateTemplate().find("select count(*) " + hql).get(0);
		logger.debug("查询总数为：" + count);
		page.setTotalRow(count.intValue());// 总记录数目
		Session s = this.getHibernateTemplate().getSessionFactory().getCurrentSession();
		List<Question1> list = s.createQuery(hql).setMaxResults(WebConstants.PAGE_SIZE).setFirstResult(startIndex).list();
		page.setResultList(list);// 数据列表
		page.setRowPerPage(WebConstants.PAGE_SIZE);// 每页记录数目
		page.setPageIndex(pageIndex);// 当前页码
		return page;
	}

	public PageBean<Question2> listQuestion2(Long areaId, Long zhenId, Long cunId, String familyName, Integer pageIndex) {
		PageBean<Question2> page = new PageBean<Question2>();
		int startIndex = (pageIndex - 1) * WebConstants.PAGE_SIZE;
		String hql = "from Question2 q where 1=1";
		
		if(cunId != null){
			hql += " and cun.id=" + cunId;
		}else if(zhenId != null){
			hql += " and cun.zhen.id=" + zhenId;
		}else if(areaId != null){
			hql += " and cun.zhen.area.id=" + areaId;
		}
		
		Object[] params = new Object[]{};
		if(!Util.isEmpty(familyName)){
			hql += " and family.name like ?";
			params = new Object[]{"%"+familyName+"%"};
		}
		
		hql+=" order by id desc";
		logger.debug("hql="+hql);
		Long count = (Long) this.getHibernateTemplate().find("select count(*) " + hql).get(0);
		logger.debug("查询总数为：" + count);
		page.setTotalRow(count.intValue());// 总记录数目
		Session s = this.getHibernateTemplate().getSessionFactory().getCurrentSession();
		List<Question2> list = s.createQuery(hql).setMaxResults(WebConstants.PAGE_SIZE).setFirstResult(startIndex).list();
		page.setResultList(list);// 数据列表
		page.setRowPerPage(WebConstants.PAGE_SIZE);// 每页记录数目
		page.setPageIndex(pageIndex);// 当前页码
		return page;
	}

}
