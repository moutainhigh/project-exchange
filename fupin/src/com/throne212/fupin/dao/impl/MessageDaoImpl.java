package com.throne212.fupin.dao.impl;

import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

import org.hibernate.Session;

import com.throne212.fupin.common.PageBean;
import com.throne212.fupin.common.WebConstants;
import com.throne212.fupin.dao.MessageDao;
import com.throne212.fupin.domain.Area;
import com.throne212.fupin.domain.BatchSMS;
import com.throne212.fupin.domain.Leader;
import com.throne212.fupin.domain.Message;
import com.throne212.fupin.domain.SMS;
import com.throne212.fupin.domain.UserContact;

public class MessageDaoImpl extends BaseDaoImpl implements MessageDao {

	public PageBean<Message> getAllMessageToUser(Integer pageIndex, String loginName) {
		PageBean<Message> page = new PageBean<Message>();
		int startIndex = (pageIndex - 1) * WebConstants.PAGE_SIZE_FRONT;
		String hql = "from Message m  where 1=1";
		if (loginName != null) {
			hql += " and m.reciever.loginName='" + loginName + "'";
		}
		hql += " order by createDate desc";
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

	public PageBean<SMS> getAllSMS(Integer pageIndex, String loginName) {
		PageBean<SMS> page = new PageBean<SMS>();
		int startIndex = (pageIndex - 1) * WebConstants.PAGE_SIZE_FRONT;
		String hql = "from SMS m where 1=1";
		if (loginName != null && !loginName.equals("sa")) {
			hql += " and m.smsUserName='" + loginName + "'";
		}
		hql += " order by date desc";
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

	public PageBean<BatchSMS> getAllBatchSMS(Integer pageIndex) {
		PageBean<BatchSMS> page = new PageBean<BatchSMS>();
		if (pageIndex == null)
			pageIndex = 1;
		int startIndex = (pageIndex - 1) * WebConstants.PAGE_SIZE_FRONT;
		String hql = "from BatchSMS m order by date desc";
		Long count = (Long) this.getHibernateTemplate().find("select count(*) " + hql).get(0);
		page.setTotalRow(count.intValue());// 总记录数目
		Session s = this.getHibernateTemplate().getSessionFactory().getCurrentSession();
		List<BatchSMS> list = s.createQuery(hql).setMaxResults(WebConstants.PAGE_SIZE_FRONT).setFirstResult(startIndex).list();

		// for(BatchSMS bs : list){
		// Set<String> set = new HashSet<String>();
		// String receiver = bs.getReceiver();
		// String[] arr = receiver.split(",");
		// for(String r : arr){
		// if(r.contains("area_")){
		// String[] a = r.split("_");
		// if(a != null && a.length >= 2){
		// Long id = Long.parseLong(a[1]);
		// Area area = this.getEntityById(Area.class, id);
		// if(area != null)
		// set.add(area.getName());
		// }
		// }
		// }
		// if(set.size() == 0){
		// for(String r : arr){
		// if(r.contains("leader_")){
		// String[] a = r.split("_");
		// if(a != null && a.length >= 2){
		// Long id = Long.parseLong(a[1]);
		// Leader leader = this.getEntityById(Leader.class, id);
		// if(leader != null)
		// set.add(leader.getOrg().getOrgName());
		// }
		// }
		// }
		// }
		// bs.setReceiver(set.size()==0?"":set.toString());
		// }

		page.setResultList(list);// 数据列表
		page.setRowPerPage(WebConstants.PAGE_SIZE);// 每页记录数目
		page.setPageIndex(pageIndex);// 当前页码
		return page;
	}
}
