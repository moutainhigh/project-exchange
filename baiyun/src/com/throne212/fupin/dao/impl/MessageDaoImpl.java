package com.throne212.fupin.dao.impl;

import java.util.Collection;
import java.util.List;

import org.hibernate.Session;

import com.throne212.fupin.common.PageBean;
import com.throne212.fupin.common.WebConstants;
import com.throne212.fupin.dao.MessageDao;
import com.throne212.fupin.domain.Message;
import com.throne212.fupin.domain.SMS;
import com.throne212.fupin.domain.Zixun;

public class MessageDaoImpl extends BaseDaoImpl implements MessageDao {

	public PageBean<Message> getAllMessageToUser(Integer pageIndex,
			String loginName) {
		PageBean<Message> page = new PageBean<Message>();
		int startIndex = (pageIndex - 1) * WebConstants.PAGE_SIZE_FRONT;
		String hql = "from Message m  where 1=1";
			if (loginName!=null) {
				hql+=" and m.reciever.loginName='"+loginName+"'";
			}
			hql+=" order by createDate desc";
		Long count = (Long) this.getHibernateTemplate().find("select count(*) " + hql).get(0);
		logger.debug("查询总数为：" + count);
		page.setTotalRow(count.intValue());// 总记录数目
		Session s = this.getHibernateTemplate().getSessionFactory().getCurrentSession();
		List<Message> list = s.createQuery(hql).setMaxResults(WebConstants.PAGE_SIZE_FRONT).setFirstResult(startIndex).list();
		page.setResultList(list);// 数据列表
		page.setRowPerPage(WebConstants.PAGE_SIZE);// 每页记录数目
		page.setPageIndex(pageIndex);// 当前页码
		return page;
	}

	public PageBean<SMS> getAllSMS(Integer pageIndex,String loginName){
		PageBean<SMS> page = new PageBean<SMS>();
		int startIndex = (pageIndex - 1) * WebConstants.PAGE_SIZE_FRONT;
		String hql = "from SMS m where 1=1";
		if (loginName!=null && !loginName.equals("sa")) {
			hql+=" and m.smsUserName='"+loginName+"'";
		}
		hql+=" order by date desc";
		Long count = (Long) this.getHibernateTemplate().find("select count(*) " + hql).get(0);
		logger.debug("查询总数为：" + count);
		page.setTotalRow(count.intValue());// 总记录数目
		Session s = this.getHibernateTemplate().getSessionFactory().getCurrentSession();
		List<SMS> list = s.createQuery(hql).setMaxResults(WebConstants.PAGE_SIZE_FRONT).setFirstResult(startIndex).list();
		page.setResultList(list);// 数据列表
		page.setRowPerPage(WebConstants.PAGE_SIZE);// 每页记录数目
		page.setPageIndex(pageIndex);// 当前页码
		return page;
	}

}
