package com.throne212.fupin.dao.impl;

import java.util.List;

import org.hibernate.Session;

import com.opensymphony.xwork2.ActionContext;
import com.throne212.fupin.common.PageBean;
import com.throne212.fupin.common.Util;
import com.throne212.fupin.common.WebConstants;
import com.throne212.fupin.dao.ShenHeDao;
import com.throne212.fupin.domain.Admin;
import com.throne212.fupin.domain.AreaWorkOrg;
import com.throne212.fupin.domain.ChengxiaoCun;
import com.throne212.fupin.domain.ChengxiaoFamily;
import com.throne212.fupin.domain.ChengxiaoZhen;
import com.throne212.fupin.domain.CuoshiCun;
import com.throne212.fupin.domain.CuoshiFamily;
import com.throne212.fupin.domain.CuoshiZhen;
import com.throne212.fupin.domain.Org;
import com.throne212.fupin.domain.PicCun;
import com.throne212.fupin.domain.PicFamily;
import com.throne212.fupin.domain.PicZhen;
import com.throne212.fupin.domain.Reason;
import com.throne212.fupin.domain.Recheck;
import com.throne212.fupin.domain.Record;
import com.throne212.fupin.domain.ShiWorkOrg;
import com.throne212.fupin.domain.User;

public class ShenHeDaoImpl extends BaseDaoImpl implements ShenHeDao {
	
	public String getUserLimit(String type){
		User user = (User) ActionContext.getContext().getSession().get(WebConstants.SESS_USER_OBJ);
		if(user instanceof ShiWorkOrg){
			ShiWorkOrg shiWorkOrg = (ShiWorkOrg) user;
			if(type.equals("zhen")){
				return "zhen.area.shi.id="+shiWorkOrg.getShi().getId();
			}else if(type.equals("cun")){
				return "cun.zhen.area.shi.id="+shiWorkOrg.getShi().getId();
			}else if(type.equals("family")){
				return "family.cun.zhen.area.shi.id="+shiWorkOrg.getShi().getId();
			}
		}else if(user instanceof AreaWorkOrg){
			AreaWorkOrg areaWorkOrg = (AreaWorkOrg) user;
			if(type.equals("zhen")){
				return "zhen.area.id="+areaWorkOrg.getArea().getId();
			}else if(type.equals("cun")){
				return "cun.zhen.area.id="+areaWorkOrg.getArea().getId();
			}else if(type.equals("family")){
				return "family.cun.zhen.area.id="+areaWorkOrg.getArea().getId();
			}
		}
		return "1=1";
	}

	public PageBean<ChengxiaoCun> getAllChengxiaoCunByStatus(String status,Integer pageIndex) {
		PageBean<ChengxiaoCun> page = new PageBean<ChengxiaoCun>();
		int startIndex = (pageIndex - 1) * WebConstants.PAGE_SIZE;
		String hql = "from ChengxiaoCun t where "+getUserLimit("cun");
		if (status!=null&&!"".equals(status)) {
			hql+=" and status='"+status+"'";
		}
		hql+=" order by id desc";
		logger.debug("hql="+hql);
		Long count = (Long) this.getHibernateTemplate().find("select count(*) " + hql).get(0);
		logger.debug("查询总数为：" + count);
		page.setTotalRow(count.intValue());// 总记录数目
		Session s = this.getHibernateTemplate().getSessionFactory().getCurrentSession();
		List<ChengxiaoCun> list = s.createQuery(hql).setMaxResults(WebConstants.PAGE_SIZE).setFirstResult(startIndex).list();
		page.setResultList(list);// 数据列表
		page.setRowPerPage(WebConstants.PAGE_SIZE);// 每页记录数目
		page.setPageIndex(pageIndex);// 当前页码
		return page;
	}

	public PageBean<ChengxiaoZhen> getAllChengxiaoZhenByStatus(String status,Integer pageIndex) {
		PageBean<ChengxiaoZhen> page = new PageBean<ChengxiaoZhen>();
		int startIndex = (pageIndex - 1) * WebConstants.PAGE_SIZE;
		String hql = "from ChengxiaoZhen t where "+getUserLimit("zhen");
		if (status!=null&&!"".equals(status)) {
			hql+=" and status='"+status+"'";
		}
		hql+=" order by id desc";
		logger.debug("hql="+hql);
		Long count = (Long) this.getHibernateTemplate().find("select count(*) " + hql).get(0);
		logger.debug("查询总数为：" + count);
		page.setTotalRow(count.intValue());// 总记录数目
		Session s = this.getHibernateTemplate().getSessionFactory().getCurrentSession();
		List<ChengxiaoZhen> list = s.createQuery(hql).setMaxResults(WebConstants.PAGE_SIZE).setFirstResult(startIndex).list();
		page.setResultList(list);// 数据列表
		page.setRowPerPage(WebConstants.PAGE_SIZE);// 每页记录数目
		page.setPageIndex(pageIndex);// 当前页码
		return page;
	}

	public PageBean<CuoshiCun> getAllCuoshiCunByStatus(String status,Integer pageIndex) {
		PageBean<CuoshiCun> page = new PageBean<CuoshiCun>();
		int startIndex = (pageIndex - 1) * WebConstants.PAGE_SIZE;
		String hql = "from CuoshiCun t where "+getUserLimit("cun");
		if (status!=null&&!"".equals(status)) {
			hql+=" and status='"+status+"'";
		}
		hql+=" order by id desc";
		logger.debug("hql="+hql);
		Long count = (Long) this.getHibernateTemplate().find("select count(*) " + hql).get(0);
		logger.debug("查询总数为：" + count);
		page.setTotalRow(count.intValue());// 总记录数目
		Session s = this.getHibernateTemplate().getSessionFactory().getCurrentSession();
		List<CuoshiCun> list = s.createQuery(hql).setMaxResults(WebConstants.PAGE_SIZE).setFirstResult(startIndex).list();
		page.setResultList(list);// 数据列表
		page.setRowPerPage(WebConstants.PAGE_SIZE);// 每页记录数目
		page.setPageIndex(pageIndex);// 当前页码
		return page;
	}

	public PageBean<CuoshiZhen> getAllCuoshiZhenByStatus(String status,Integer pageIndex) {
		PageBean<CuoshiZhen> page = new PageBean<CuoshiZhen>();
		int startIndex = (pageIndex - 1) * WebConstants.PAGE_SIZE;
		String hql = "from CuoshiZhen t where "+getUserLimit("zhen");
		if (status!=null&&!"".equals(status)) {
			hql+=" and status='"+status+"'";
		}
		hql+=" order by id desc";
		logger.debug("hql="+hql);
		Long count = (Long) this.getHibernateTemplate().find("select count(*) " + hql).get(0);
		logger.debug("查询总数为：" + count);
		page.setTotalRow(count.intValue());// 总记录数目
		Session s = this.getHibernateTemplate().getSessionFactory().getCurrentSession();
		List<CuoshiZhen> list = s.createQuery(hql).setMaxResults(WebConstants.PAGE_SIZE).setFirstResult(startIndex).list();
		page.setResultList(list);// 数据列表
		page.setRowPerPage(WebConstants.PAGE_SIZE);// 每页记录数目
		page.setPageIndex(pageIndex);// 当前页码
		return page;
	}

	public PageBean<PicCun> getAllPicCunByStatus(String status,Integer pageIndex) {
		PageBean<PicCun> page = new PageBean<PicCun>();
		int startIndex = (pageIndex - 1) * WebConstants.PAGE_SIZE;
		String hql = "from PicCun t where "+getUserLimit("cun");
		if (status!=null&&!"".equals(status)) {
			hql+=" and status='"+status+"'";
		}
		hql+=" order by id desc";
		logger.debug("hql="+hql);
		Long count = (Long) this.getHibernateTemplate().find("select count(*) " + hql).get(0);
		logger.debug("查询总数为：" + count);
		page.setTotalRow(count.intValue());// 总记录数目
		Session s = this.getHibernateTemplate().getSessionFactory().getCurrentSession();
		List<PicCun> list = s.createQuery(hql).setMaxResults(WebConstants.PAGE_SIZE).setFirstResult(startIndex).list();
		page.setResultList(list);// 数据列表
		page.setRowPerPage(WebConstants.PAGE_SIZE);// 每页记录数目
		page.setPageIndex(pageIndex);// 当前页码
		return page;
	}

	public PageBean<PicZhen> getAllPicZhenByStatus(String status,Integer pageIndex) {
		PageBean<PicZhen> page = new PageBean<PicZhen>();
		int startIndex = (pageIndex - 1) * WebConstants.PAGE_SIZE;
		String hql = "from PicZhen t where "+getUserLimit("zhen");
		if (status!=null&&!"".equals(status)) {
			hql+=" and status='"+status+"'";
		}
		hql+=" order by id desc";
		logger.debug("hql="+hql);
		Long count = (Long) this.getHibernateTemplate().find("select count(*) " + hql).get(0);
		logger.debug("查询总数为：" + count);
		page.setTotalRow(count.intValue());// 总记录数目
		Session s = this.getHibernateTemplate().getSessionFactory().getCurrentSession();
		List<PicZhen> list = s.createQuery(hql).setMaxResults(WebConstants.PAGE_SIZE).setFirstResult(startIndex).list();
		page.setResultList(list);// 数据列表
		page.setRowPerPage(WebConstants.PAGE_SIZE);// 每页记录数目
		page.setPageIndex(pageIndex);// 当前页码
		return page;
	}

	public PageBean<ChengxiaoFamily> getAllChengxiaoFamilyByStatus(String status, Integer pageIndex) {
		PageBean<ChengxiaoFamily> page = new PageBean<ChengxiaoFamily>();
		int startIndex = (pageIndex - 1) * WebConstants.PAGE_SIZE;
		String hql = "from ChengxiaoFamily t where "+getUserLimit("family");
		if (status!=null&&!"".equals(status)) {
			hql+=" and status='"+status+"'";
		}
		hql+=" order by id desc";
		logger.debug("hql="+hql);
		Long count = (Long) this.getHibernateTemplate().find("select count(*) " + hql).get(0);
		logger.debug("查询总数为：" + count);
		page.setTotalRow(count.intValue());// 总记录数目
		Session s = this.getHibernateTemplate().getSessionFactory().getCurrentSession();
		List<ChengxiaoFamily> list = s.createQuery(hql).setMaxResults(WebConstants.PAGE_SIZE).setFirstResult(startIndex).list();
		page.setResultList(list);// 数据列表
		page.setRowPerPage(WebConstants.PAGE_SIZE);// 每页记录数目
		page.setPageIndex(pageIndex);// 当前页码
		return page;
	}

	public PageBean<CuoshiFamily> getAllCuoshiFamilyByStatus(String status, Integer pageIndex) {
		PageBean<CuoshiFamily> page = new PageBean<CuoshiFamily>();
		int startIndex = (pageIndex - 1) * WebConstants.PAGE_SIZE;
		String hql = "from CuoshiFamily t where "+getUserLimit("family");
		if (status!=null&&!"".equals(status)) {
			hql+=" and status='"+status+"'";
		}
		hql+=" order by id desc";
		logger.debug("hql="+hql);
		Long count = (Long) this.getHibernateTemplate().find("select count(*) " + hql).get(0);
		logger.debug("查询总数为：" + count);
		page.setTotalRow(count.intValue());// 总记录数目
		Session s = this.getHibernateTemplate().getSessionFactory().getCurrentSession();
		List<CuoshiFamily> list = s.createQuery(hql).setMaxResults(WebConstants.PAGE_SIZE).setFirstResult(startIndex).list();
		page.setResultList(list);// 数据列表
		page.setRowPerPage(WebConstants.PAGE_SIZE);// 每页记录数目
		page.setPageIndex(pageIndex);// 当前页码
		return page;
	}

	public PageBean<PicFamily> getAllPicFamilyByStatus(String status, Integer pageIndex) {
		PageBean<PicFamily> page = new PageBean<PicFamily>();
		int startIndex = (pageIndex - 1) * WebConstants.PAGE_SIZE;
		String hql = "from PicFamily t where "+getUserLimit("family");
		if (status!=null&&!"".equals(status)) {
			hql+=" and status='"+status+"'";
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

	public PageBean<Reason> getAllReasonByStatus(String status, Integer pageIndex) {
		PageBean<Reason> page = new PageBean<Reason>();
		int startIndex = (pageIndex - 1) * WebConstants.PAGE_SIZE;
		String hql = "from Reason t where "+getUserLimit("family");
		if (status!=null&&!"".equals(status)) {
			hql+=" and status='"+status+"'";
		}
		hql+=" order by id desc";
		logger.debug("hql="+hql);
		Long count = (Long) this.getHibernateTemplate().find("select count(*) " + hql).get(0);
		logger.debug("查询总数为：" + count);
		page.setTotalRow(count.intValue());// 总记录数目
		Session s = this.getHibernateTemplate().getSessionFactory().getCurrentSession();
		List<Reason> list = s.createQuery(hql).setMaxResults(WebConstants.PAGE_SIZE).setFirstResult(startIndex).list();
		page.setResultList(list);// 数据列表
		page.setRowPerPage(WebConstants.PAGE_SIZE);// 每页记录数目
		page.setPageIndex(pageIndex);// 当前页码
		return page;
	}

	public PageBean<Record> getAllRecordByStatus(String status, Integer pageIndex) {
		PageBean<Record> page = new PageBean<Record>();
		int startIndex = (pageIndex - 1) * WebConstants.PAGE_SIZE;
		String hql = "from Record t where "+getUserLimit("family");
		if (status!=null&&!"".equals(status)) {
			hql+=" and status='"+status+"'";
		}
		hql+=" order by id desc";
		logger.debug("hql="+hql);
		Long count = (Long) this.getHibernateTemplate().find("select count(*) " + hql).get(0);
		logger.debug("查询总数为：" + count);
		page.setTotalRow(count.intValue());// 总记录数目
		Session s = this.getHibernateTemplate().getSessionFactory().getCurrentSession();
		List<Record> list = s.createQuery(hql).setMaxResults(WebConstants.PAGE_SIZE).setFirstResult(startIndex).list();
		page.setResultList(list);// 数据列表
		page.setRowPerPage(WebConstants.PAGE_SIZE);// 每页记录数目
		page.setPageIndex(pageIndex);// 当前页码
		return page;
	}

	public PageBean<Recheck> getAllRecheck(String module,String state,Integer pageIndex){
		PageBean<Recheck> page = new PageBean<Recheck>();
		int startIndex = (pageIndex - 1) * WebConstants.PAGE_SIZE;
		Org org = (Org) ActionContext.getContext().getSession().get(WebConstants.SESS_USER_OBJ);
		String hql = "from Recheck t where org.id="+org.getId();
		if (!Util.isEmpty(module)) {
			hql+=" and module='"+module+"'";
		}
		if (!Util.isEmpty(state)) {
			hql+=" and state='"+state+"'";
		}
		hql+=" order by id desc";
		logger.debug("hql="+hql);
		Long count = (Long) this.getHibernateTemplate().find("select count(*) " + hql).get(0);
		logger.debug("查询总数为：" + count);
		page.setTotalRow(count.intValue());// 总记录数目
		Session s = this.getHibernateTemplate().getSessionFactory().getCurrentSession();
		List<Recheck> list = s.createQuery(hql).setMaxResults(WebConstants.PAGE_SIZE).setFirstResult(startIndex).list();
		page.setResultList(list);// 数据列表
		page.setRowPerPage(WebConstants.PAGE_SIZE);// 每页记录数目
		page.setPageIndex(pageIndex);// 当前页码
		return page;
	}
	
	public PageBean<Recheck> getAllRecheck(Long recordId,Integer pageIndex){
		PageBean<Recheck> page = new PageBean<Recheck>();
		int startIndex = (pageIndex - 1) * WebConstants.PAGE_SIZE;
		String hql = "from Recheck t where 1=1";
		if (recordId!=null) {
			hql+=" and recordId="+recordId;
		}
		hql+=" order by id desc";
		logger.debug("hql="+hql);
		Long count = (Long) this.getHibernateTemplate().find("select count(*) " + hql).get(0);
		logger.debug("查询总数为：" + count);
		page.setTotalRow(count.intValue());// 总记录数目
		Session s = this.getHibernateTemplate().getSessionFactory().getCurrentSession();
		List<Recheck> list = s.createQuery(hql).setMaxResults(WebConstants.PAGE_SIZE).setFirstResult(startIndex).list();
		page.setResultList(list);// 数据列表
		page.setRowPerPage(WebConstants.PAGE_SIZE);// 每页记录数目
		page.setPageIndex(pageIndex);// 当前页码
		return page;
	}

}
