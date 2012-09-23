package com.throne212.fupin.dao.impl;

import java.util.List;

import org.hibernate.Session;

import com.throne212.fupin.common.PageBean;
import com.throne212.fupin.common.WebConstants;
import com.throne212.fupin.dao.ContactDao;
import com.throne212.fupin.domain.Contact;

public class ContactDaoImpl extends BaseDaoImpl implements ContactDao {

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


}
