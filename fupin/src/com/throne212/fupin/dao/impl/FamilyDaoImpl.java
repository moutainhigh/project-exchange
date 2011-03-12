package com.throne212.fupin.dao.impl;

import java.util.Date;
import java.util.List;

import org.hibernate.Session;

import com.throne212.fupin.common.PageBean;
import com.throne212.fupin.common.Util;
import com.throne212.fupin.common.WebConstants;
import com.throne212.fupin.dao.FamilyDao;
import com.throne212.fupin.domain.ChengxiaoFamily;
import com.throne212.fupin.domain.CuoshiFamily;
import com.throne212.fupin.domain.Leader;
import com.throne212.fupin.domain.PicFamily;
import com.throne212.fupin.domain.Reason;
import com.throne212.fupin.domain.Record;

public class FamilyDaoImpl extends BaseDaoImpl implements FamilyDao {
//措施
	public PageBean<CuoshiFamily> getAllCuoshiFamily(CuoshiFamily condition,
			Integer pageIndex) {
		if (pageIndex == 0) {
			pageIndex = 1;
		}
		PageBean<CuoshiFamily> page = new PageBean<CuoshiFamily>();
		int startIndex = (pageIndex - 1) * WebConstants.PAGE_SIZE;
		String hql = "from CuoshiFamily t where 1=1";
		if (condition!=null &&condition.getYear()!=null&&!"".equals(condition.getYear())) {
			hql+=" and year='"+condition.getYear()+"'";
		}
		if (condition!=null &&condition.getStatus()!=null&&!"".equals(condition.getStatus())) {
			hql+=" and status='"+condition.getStatus()+"'";
		}
		if (condition!=null &&condition.getFamily()!=null&&condition.getFamily().getName()!=null&&!"".equals(condition.getFamily().getName())) {
			hql+=" and family.name like '%"+condition.getFamily().getName()+"%'";
		}
		hql+=" order by id desc";
		Long count = (Long) this.getHibernateTemplate().find("select count(*) " + hql).get(0);
		logger.debug("查询总数为：" + count);
		page.setTotalRow(count.intValue());// 总记录数目
		Session s = this.getHibernateTemplate().getSessionFactory().getCurrentSession();
		List<CuoshiFamily> list = s.createQuery(hql).setMaxResults(WebConstants.PAGE_SIZE).setFirstResult(startIndex).list();
		//获取干部
		for (CuoshiFamily cuoshiFamily : list) {
			String hqlForLeaders = "from Leader l where l.family=? ";
			List<Leader> listLeader=this.getHibernateTemplate().find(hqlForLeaders, cuoshiFamily.getFamily());
			cuoshiFamily.getFamily().setLeaderList(listLeader);
		}
		page.setResultList(list);// 数据列表
		page.setRowPerPage(WebConstants.PAGE_SIZE);// 每页记录数目
		page.setPageIndex(pageIndex);// 当前页码
		
		
		
//		FOR(){
//		"from Leader l where l.family=?"
//		famliy.setLeaderList();
//		
//		
//	}
		return page;
	}
//成效
	public PageBean<CuoshiFamily> getAllCuoshiFamilyByCunId(
			CuoshiFamily condition, Long cunId, Integer pageIndex) {
		PageBean<CuoshiFamily> page = new PageBean<CuoshiFamily>();
		int startIndex = (pageIndex - 1) * WebConstants.PAGE_SIZE;
		String hql = "from CuoshiFamily t where 1=1";
		if(cunId != null)
			hql += " and family.cun.id="+cunId;
		if (condition!=null &&condition.getYear()!=null&&!"".equals(condition.getYear())) {
			hql+=" and year='"+condition.getYear()+"'";
		}
		if (condition!=null &&condition.getStatus()!=null&&!"".equals(condition.getStatus())) {
			hql+=" and status='"+condition.getStatus()+"'";
		}
		if (condition!=null &&condition.getFamily()!=null&&condition.getFamily().getName()!=null&&!"".equals(condition.getFamily().getName())) {
			hql+=" and family.name like '%"+condition.getFamily().getName()+"%'";
		}
		hql+=" order by id desc";
		logger.debug("hql="+hql);
		Long count = (Long) this.getHibernateTemplate().find("select count(*) " + hql).get(0);
		logger.debug("查询总数为：" + count);
		page.setTotalRow(count.intValue());// 总记录数目
		Session s = this.getHibernateTemplate().getSessionFactory().getCurrentSession();
		List<CuoshiFamily> list = s.createQuery(hql).setMaxResults(WebConstants.PAGE_SIZE).setFirstResult(startIndex).list();
		for (CuoshiFamily cuoshiFamily : list) {
			String hqlForLeaders = "from Leader l where l.family=? ";
			List<Leader> listLeader=this.getHibernateTemplate().find(hqlForLeaders, cuoshiFamily.getFamily());
			cuoshiFamily.getFamily().setLeaderList(listLeader);
		}
		page.setResultList(list);// 数据列表
		page.setRowPerPage(WebConstants.PAGE_SIZE);// 每页记录数目
		page.setPageIndex(pageIndex);// 当前页码
		return page;
	}

	public PageBean<ChengxiaoFamily> getAllChengxiaoFamily(
			ChengxiaoFamily condition, Integer pageIndex) {
		if (pageIndex == 0) {
			pageIndex = 1;
		}
		PageBean<ChengxiaoFamily> page = new PageBean<ChengxiaoFamily>();
		int startIndex = (pageIndex - 1) * WebConstants.PAGE_SIZE;
		String hql = "from ChengxiaoFamily t where 1=1";
		if (condition!=null &&condition.getYear()!=null&&!"".equals(condition.getYear())) {
			hql+=" and year='"+condition.getYear()+"'";
		}
		if (condition!=null &&condition.getStatus()!=null&&!"".equals(condition.getStatus())) {
			hql+=" and status='"+condition.getStatus()+"'";
		}
		if (condition!=null &&condition.getFamily()!=null&&condition.getFamily().getName()!=null&&!"".equals(condition.getFamily().getName())) {
			hql+=" and family.name like '%"+condition.getFamily().getName()+"%'";
		}
		hql+=" order by id desc";
		Long count = (Long) this.getHibernateTemplate().find("select count(*) " + hql).get(0);
		logger.debug("查询总数为：" + count);
		page.setTotalRow(count.intValue());// 总记录数目
		Session s = this.getHibernateTemplate().getSessionFactory().getCurrentSession();
		List<ChengxiaoFamily> list = s.createQuery(hql).setMaxResults(WebConstants.PAGE_SIZE).setFirstResult(startIndex).list();
		for (ChengxiaoFamily chengxiaoFamily : list) {
			String hqlForLeaders = "from Leader l where l.family=? ";
			List<Leader> listLeader=this.getHibernateTemplate().find(hqlForLeaders, chengxiaoFamily.getFamily());
			chengxiaoFamily.getFamily().setLeaderList(listLeader);
		}
		page.setResultList(list);// 数据列表
		page.setRowPerPage(WebConstants.PAGE_SIZE);// 每页记录数目
		page.setPageIndex(pageIndex);// 当前页码
		return page;
	}

	public PageBean<ChengxiaoFamily> getAllChengxiaoFamilyByCunId(
			ChengxiaoFamily condition, Long cunId, Integer pageIndex) {
		PageBean<ChengxiaoFamily> page = new PageBean<ChengxiaoFamily>();
		int startIndex = (pageIndex - 1) * WebConstants.PAGE_SIZE;
		String hql = "from ChengxiaoFamily t where 1=1";
		if(cunId != null)
			hql += " and family.cun.id="+cunId;
		if (condition!=null &&condition.getYear()!=null&&!"".equals(condition.getYear())) {
			hql+=" and year='"+condition.getYear()+"'";
		}
		if (condition!=null &&condition.getStatus()!=null&&!"".equals(condition.getStatus())) {
			hql+=" and status='"+condition.getStatus()+"'";
		}
		if (condition!=null &&condition.getFamily()!=null&&condition.getFamily().getName()!=null&&!"".equals(condition.getFamily().getName())) {
			hql+=" and family.name like '%"+condition.getFamily().getName()+"%'";
		}
		hql+=" order by id desc";
		logger.debug("hql="+hql);
		Long count = (Long) this.getHibernateTemplate().find("select count(*) " + hql).get(0);
		logger.debug("查询总数为：" + count);
		page.setTotalRow(count.intValue());// 总记录数目
		Session s = this.getHibernateTemplate().getSessionFactory().getCurrentSession();
		List<ChengxiaoFamily> list = s.createQuery(hql).setMaxResults(WebConstants.PAGE_SIZE).setFirstResult(startIndex).list();
		for (ChengxiaoFamily chengxiaoFamily : list) {
			String hqlForLeaders = "from Leader l where l.family=? ";
			List<Leader> listLeader=this.getHibernateTemplate().find(hqlForLeaders, chengxiaoFamily.getFamily());
			chengxiaoFamily.getFamily().setLeaderList(listLeader);
		}
		page.setResultList(list);// 数据列表
		page.setRowPerPage(WebConstants.PAGE_SIZE);// 每页记录数目
		page.setPageIndex(pageIndex);// 当前页码
		return page;
	}

	
	
	public PageBean<Reason> getAllReason(Reason condition, Integer pageIndex) {
		if (pageIndex == 0) {
			pageIndex = 1;
		}
		PageBean<Reason> page = new PageBean<Reason>();
		int startIndex = (pageIndex - 1) * WebConstants.PAGE_SIZE;
		String hql = "from Reason t where 1=1";
		
		if (condition!=null &&condition.getStatus()!=null&&!"".equals(condition.getStatus())) {
			hql+=" and status='"+condition.getStatus()+"'";
		}
		if (condition!=null &&condition.getFamily()!=null&&condition.getFamily().getName()!=null&&!"".equals(condition.getFamily().getName())) {
			hql+=" and family.name like '%"+condition.getFamily().getName()+"%'";
		}
		hql+=" order by id desc";
		Long count = (Long) this.getHibernateTemplate().find("select count(*) " + hql).get(0);
		logger.debug("查询总数为：" + count);
		page.setTotalRow(count.intValue());// 总记录数目
		Session s = this.getHibernateTemplate().getSessionFactory().getCurrentSession();
		List<Reason> list = s.createQuery(hql).setMaxResults(WebConstants.PAGE_SIZE).setFirstResult(startIndex).list();
		for (Reason reason : list) {
			String hqlForLeaders = "from Leader l where l.family=? ";
			List<Leader> listLeader=this.getHibernateTemplate().find(hqlForLeaders, reason.getFamily());
			reason.getFamily().setLeaderList(listLeader);
		}
		page.setResultList(list);// 数据列表
		page.setRowPerPage(WebConstants.PAGE_SIZE);// 每页记录数目
		page.setPageIndex(pageIndex);// 当前页码
		return page;
	}
	public PageBean<Reason> getAllReasonByCunId(Reason condition, Long cunId,
			Integer pageIndex) {
		PageBean<Reason> page = new PageBean<Reason>();
		int startIndex = (pageIndex - 1) * WebConstants.PAGE_SIZE;
		String hql = "from Reason t where 1=1";
		if(cunId != null)
			hql += " and family.cun.id="+cunId;
		
		if (condition!=null &&condition.getStatus()!=null&&!"".equals(condition.getStatus())) {
			hql+=" and status='"+condition.getStatus()+"'";
		}
		if (condition!=null &&condition.getFamily()!=null&&condition.getFamily().getName()!=null&&!"".equals(condition.getFamily().getName())) {
			hql+=" and family.name like '%"+condition.getFamily().getName()+"%'";
		}
		hql+=" order by id desc";
		logger.debug("hql="+hql);
		Long count = (Long) this.getHibernateTemplate().find("select count(*) " + hql).get(0);
		logger.debug("查询总数为：" + count);
		page.setTotalRow(count.intValue());// 总记录数目
		Session s = this.getHibernateTemplate().getSessionFactory().getCurrentSession();
		List<Reason> list = s.createQuery(hql).setMaxResults(WebConstants.PAGE_SIZE).setFirstResult(startIndex).list();
		for (Reason reason : list) {
			String hqlForLeaders = "from Leader l where l.family=? ";
			List<Leader> listLeader=this.getHibernateTemplate().find(hqlForLeaders, reason.getFamily());
			reason.getFamily().setLeaderList(listLeader);
		}
		page.setResultList(list);// 数据列表
		page.setRowPerPage(WebConstants.PAGE_SIZE);// 每页记录数目
		page.setPageIndex(pageIndex);// 当前页码
		return page;
	}
	
	public PageBean<PicFamily> getAllPicFamily(PicFamily condition, Integer pageIndex) {
		if (pageIndex == 0) {
			pageIndex = 1;
		}
		PageBean<PicFamily> page = new PageBean<PicFamily>();
		int startIndex = (pageIndex - 1) * WebConstants.PAGE_SIZE;
		String hql = "from PicFamily t where 1=1";
		if (condition!=null&&condition.getStatus()!=null&&!"".equals(condition.getStatus())) {
			hql+=" and status='"+condition.getStatus()+"'";
		}
		if (condition!=null&&condition.getType()!=null&&!"".equals(condition.getType())) {
			hql+=" and type='"+condition.getType()+"'";
		}
		hql+=" order by id desc";
		Long count = (Long) this.getHibernateTemplate().find("select count(*) " + hql).get(0);
		logger.debug("查询总数为：" + count);
		page.setTotalRow(count.intValue());// 总记录数目
		Session s = this.getHibernateTemplate().getSessionFactory().getCurrentSession();
		List<PicFamily> list = s.createQuery(hql).setMaxResults(WebConstants.PAGE_SIZE).setFirstResult(startIndex).list();
		page.setResultList(list);// 数据列表
		page.setRowPerPage(WebConstants.PAGE_SIZE);// 每页记录数目
		page.setPageIndex(pageIndex);// 当前页码
		return page;
		
		
	}

	public PageBean<PicFamily> getAllPicFamilyByCunId(PicFamily condition, Long cunId, Integer pageIndex) {
		PageBean<PicFamily> page = new PageBean<PicFamily>();
		int startIndex = (pageIndex - 1) * WebConstants.PAGE_SIZE;
		String hql = "from PicFamily t where 1=1";
		if(cunId != null)
			hql += " and family.cun.id="+cunId;
		if (condition!= null &&condition.getStatus()!=null&& !"".equals(condition.getStatus())) {
			hql+=" and status='"+condition.getStatus()+"'";
		}
		if (condition!= null &&condition.getType()!=null&& !"".equals(condition.getType())) {
			hql+=" and type='"+condition.getType()+"'";
		}
		hql+=" order by id desc";
		logger.debug("hql="+hql);
		Long count = (Long) this.getHibernateTemplate().find("select count(*) " + hql).get(0);
		logger.debug("查询总数为：" + count);
		page.setTotalRow(count.intValue());// 总记录数目
		Session s = this.getHibernateTemplate().getSessionFactory().getCurrentSession();
		List<PicFamily> list = s.createQuery(hql).setMaxResults(WebConstants.PAGE_SIZE).setFirstResult(startIndex).list();
		page.setResultList(list);// 数据列表
		page.setRowPerPage(WebConstants.PAGE_SIZE);// 每页记录数目
		page.setPageIndex(pageIndex);// 当前页码
		return page;
	}
	public PageBean<Record> getAllRecord(Record condition, Integer pageIndex,Date fromDate,Date toDate) {
		if (pageIndex == 0) {
			pageIndex = 1;
		}
		PageBean<Record> page = new PageBean<Record>();
		int startIndex = (pageIndex - 1) * WebConstants.PAGE_SIZE;
		String hql = "from Record t where 1=1";
		
		if (condition!=null &&condition.getStatus()!=null&&!"".equals(condition.getStatus())) {
			hql+=" and status='"+condition.getStatus()+"'";
		}
		if (condition!=null &&condition.getFamily()!=null&&condition.getFamily().getName()!=null&&!"".equals(condition.getFamily().getName())) {
			hql+=" and family.name like '%"+condition.getFamily().getName()+"%'";
		}
		if (fromDate!=null) {
			hql+=" and recordDate >= "+fromDate;
		}
		if (toDate!=null) {
			hql+=" and recordDate < "+Util.getNextDate(toDate);
		}
		
		hql+=" order by id desc";
		Long count = (Long) this.getHibernateTemplate().find("select count(*) " + hql).get(0);
		logger.debug("查询总数为：" + count);
		page.setTotalRow(count.intValue());// 总记录数目
		Session s = this.getHibernateTemplate().getSessionFactory().getCurrentSession();
		List<Record> list = s.createQuery(hql).setMaxResults(WebConstants.PAGE_SIZE).setFirstResult(startIndex).list();
		for (Record record : list) {
			String hqlForLeaders = "from Leader l where l.family=? ";
			List<Leader> listLeader=this.getHibernateTemplate().find(hqlForLeaders, record.getFamily());
			record.getFamily().setLeaderList(listLeader);
		}
		page.setResultList(list);// 数据列表
		page.setRowPerPage(WebConstants.PAGE_SIZE);// 每页记录数目
		page.setPageIndex(pageIndex);// 当前页码
		return page;
	}
	public PageBean<Record> getAllRecordByCunId(Record condition, Long cunId,
			Integer pageIndex,Date fromDate,Date toDate) {
		PageBean<Record> page = new PageBean<Record>();
		int startIndex = (pageIndex - 1) * WebConstants.PAGE_SIZE;
		String hql = "from Record t where 1=1";
		if(cunId != null)
			hql += " and family.cun.id="+cunId;
		
		if (condition!=null &&condition.getStatus()!=null&&!"".equals(condition.getStatus())) {
			hql+=" and status='"+condition.getStatus()+"'";
		}
		if (condition!=null &&condition.getFamily()!=null&&condition.getFamily().getName()!=null&&!"".equals(condition.getFamily().getName())) {
			hql+=" and family.name like '%"+condition.getFamily().getName()+"%'";
		}
		if (fromDate!=null) {
			hql+=" and recordDate >= "+fromDate;
		}
		if (toDate!=null) {
			hql+=" and recordDate < "+Util.getNextDate(toDate);
		}
		hql+=" order by id desc";
		logger.debug("hql="+hql);
		Long count = (Long) this.getHibernateTemplate().find("select count(*) " + hql).get(0);
		logger.debug("查询总数为：" + count);
		page.setTotalRow(count.intValue());// 总记录数目
		Session s = this.getHibernateTemplate().getSessionFactory().getCurrentSession();
		List<Record> list = s.createQuery(hql).setMaxResults(WebConstants.PAGE_SIZE).setFirstResult(startIndex).list();
		for (Record record : list) {
			String hqlForLeaders = "from Leader l where l.family=? ";
			List<Leader> listLeader=this.getHibernateTemplate().find(hqlForLeaders, record.getFamily());
			record.getFamily().setLeaderList(listLeader);
		}
		page.setResultList(list);// 数据列表
		page.setRowPerPage(WebConstants.PAGE_SIZE);// 每页记录数目
		page.setPageIndex(pageIndex);// 当前页码
		return page;
	}

}
