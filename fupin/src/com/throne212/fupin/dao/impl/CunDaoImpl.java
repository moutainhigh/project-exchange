package com.throne212.fupin.dao.impl;

import java.util.Collection;
import java.util.List;

import org.hibernate.Session;

import com.opensymphony.xwork2.ActionContext;
import com.throne212.fupin.common.PageBean;
import com.throne212.fupin.common.WebConstants;
import com.throne212.fupin.dao.CunDao;
import com.throne212.fupin.domain.ChengxiaoCun;
import com.throne212.fupin.domain.ChengxiaoZhen;
import com.throne212.fupin.domain.CuoshiCun;
import com.throne212.fupin.domain.CuoshiZhen;
import com.throne212.fupin.domain.PicCun;
import com.throne212.fupin.domain.PicZhen;
import com.throne212.fupin.domain.User;
import com.throne212.fupin.domain.ZhenWorkOrg;

public class CunDaoImpl extends BaseDaoImpl implements CunDao {

	public PageBean<ChengxiaoCun> getAllChengxiaoCun(ChengxiaoCun condition, Integer pageIndex) {
		if (pageIndex == 0) {
			pageIndex = 1;
		}
		PageBean<ChengxiaoCun> page = new PageBean<ChengxiaoCun>();
		int startIndex = (pageIndex - 1) * WebConstants.PAGE_SIZE;
		String hql = "from ChengxiaoCun t ";
		if (condition!=null&&condition.getStatus()!=null&&!"".equals(condition.getStatus())) {
			hql+=" where status='"+condition.getStatus()+"'";
		}
		hql+=" order by id desc";
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

	public PageBean<ChengxiaoCun> getAllChengxiaoCunByCunId(ChengxiaoCun condition, Long cunId, Integer pageIndex) {
		PageBean<ChengxiaoCun> page = new PageBean<ChengxiaoCun>();
		int startIndex = (pageIndex - 1) * WebConstants.PAGE_SIZE;
		String hql = "from ChengxiaoCun t";
		if(cunId != null)
			hql += " where cun.id="+cunId;
		if (condition!= null && condition.getStatus()!=null&&!"".equals(condition.getStatus())) {
			hql+=" and status='"+condition.getStatus()+"'";
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

	public PageBean<CuoshiCun> getAllCuoshiCun(CuoshiCun condition, Integer pageIndex) {
		if (pageIndex == 0) {
			pageIndex = 1;
		}
		PageBean<CuoshiCun> page = new PageBean<CuoshiCun>();
		int startIndex = (pageIndex - 1) * WebConstants.PAGE_SIZE;
		String hql = "from CuoshiCun t ";
		if (condition!=null &&condition.getType()!=null&&!"".equals(condition.getType())) {
			hql+=" where type='"+condition.getType()+"'";
		}
		if (condition!=null &&condition.getStatus()!=null&&!"".equals(condition.getStatus())) {
			hql+=" and status='"+condition.getStatus()+"'";
		}
		hql+=" order by id desc";
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

	public PageBean<CuoshiCun> getAllCuoshiCunByCunId(CuoshiCun condition, Long cunId, Integer pageIndex) {
		PageBean<CuoshiCun> page = new PageBean<CuoshiCun>();
		int startIndex = (pageIndex - 1) * WebConstants.PAGE_SIZE;
		String hql = "from CuoshiCun t";
		if(cunId != null)
			hql += " where cun.id="+cunId;
		if (condition!=null && condition.getType()!=null&&!"".equals(condition.getType())) {
			hql+=" and type='"+condition.getType()+"'";
		}
		if (condition!=null && condition.getStatus()!=null&&!"".equals(condition.getStatus())) {
			hql+=" and status='"+condition.getStatus()+"'";
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

	public PageBean<PicCun> getAllPicCun(PicCun condition, Integer pageIndex) {
		if (pageIndex == 0) {
			pageIndex = 1;
		}
		PageBean<PicCun> page = new PageBean<PicCun>();
		int startIndex = (pageIndex - 1) * WebConstants.PAGE_SIZE;
		String hql = "from PicCun t ";
		if (condition!=null&&condition.getStatus()!=null&&!"".equals(condition.getStatus())) {
			hql+=" where status='"+condition.getStatus()+"'";
		}
		if (condition!=null&&condition.getType()!=null&&!"".equals(condition.getType())) {
			hql+=" and type='"+condition.getType()+"'";
		}
		hql+=" order by id desc";
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

	public PageBean<PicCun> getAllPicCunByCunId(PicCun condition, Long cunId, Integer pageIndex) {
		PageBean<PicCun> page = new PageBean<PicCun>();
		int startIndex = (pageIndex - 1) * WebConstants.PAGE_SIZE;
		String hql = "from PicCun t";
		if(cunId != null)
			hql += " where cun.id="+cunId;
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
		List<PicCun> list = s.createQuery(hql).setMaxResults(WebConstants.PAGE_SIZE).setFirstResult(startIndex).list();
		page.setResultList(list);// 数据列表
		page.setRowPerPage(WebConstants.PAGE_SIZE);// 每页记录数目
		page.setPageIndex(pageIndex);// 当前页码
		return page;
	}
	
	public PageBean<CuoshiCun> getAllCuoshiCun(CuoshiCun condition,Long areaId ,Long zhenId, Long cunId, Integer pageIndex) {
		if (pageIndex == 0) {
			pageIndex = 1;
		}
		PageBean<CuoshiCun> page = new PageBean<CuoshiCun>();
		int startIndex = (pageIndex - 1) * WebConstants.PAGE_SIZE;
		String hql = "from CuoshiCun t where 1=1";
		if (condition!=null &&condition.getType()!=null&&!"".equals(condition.getType())) {
			hql+=" and type='"+condition.getType()+"'";
		}
		if (condition!=null &&condition.getStatus()!=null&&!"".equals(condition.getStatus())) {
			hql+=" and status='"+condition.getStatus()+"'";
		}
		
		//如果是镇管理员
		User user = (User) ActionContext.getContext().getSession().get(WebConstants.SESS_USER_OBJ);
		if(user instanceof ZhenWorkOrg){
			ZhenWorkOrg z = (ZhenWorkOrg) user;
			hql += " and cun.zhen.id=" + z.getZhen().getId();
		}
		
		if(cunId != null){
			hql += " and cun.id=" + cunId;
		}else if(zhenId != null){
			hql += " and cun.zhen.id=" + zhenId;
		}else if(areaId != null){
			hql += " and cun.zhen.area.id=" + areaId;
		}
		
		hql+=" order by id desc";
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
	
	public PageBean<ChengxiaoCun> getAllChengxiaoCun(ChengxiaoCun condition,Long areaId ,Long zhenId, Long cunId, Integer pageIndex) {
		if (pageIndex == 0) {
			pageIndex = 1;
		}
		PageBean<ChengxiaoCun> page = new PageBean<ChengxiaoCun>();
		int startIndex = (pageIndex - 1) * WebConstants.PAGE_SIZE;
		String hql = "from ChengxiaoCun t where 1=1";
		if (condition!=null &&condition.getStatus()!=null&&!"".equals(condition.getStatus())) {
			hql+=" and status='"+condition.getStatus()+"'";
		}
		
		//如果是镇管理员
		User user = (User) ActionContext.getContext().getSession().get(WebConstants.SESS_USER_OBJ);
		if(user instanceof ZhenWorkOrg){
			ZhenWorkOrg z = (ZhenWorkOrg) user;
			hql += " and cun.zhen.id=" + z.getZhen().getId();
		}
		
		if(cunId != null){
			hql += " and cun.id=" + cunId;
		}else if(zhenId != null){
			hql += " and cun.zhen.id=" + zhenId;
		}else if(areaId != null){
			hql += " and cun.zhen.area.id=" + areaId;
		}
		
		hql+=" order by id desc";
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
	
	public PageBean<PicCun> getAllPicCun(PicCun condition,Long areaId ,Long zhenId, Long cunId, Integer pageIndex) {
		if (pageIndex == 0) {
			pageIndex = 1;
		}
		PageBean<PicCun> page = new PageBean<PicCun>();
		int startIndex = (pageIndex - 1) * WebConstants.PAGE_SIZE;
		String hql = "from PicCun t where 1=1";
		if (condition!=null &&condition.getStatus()!=null&&!"".equals(condition.getStatus())) {
			hql+=" and status='"+condition.getStatus()+"'";
		}
		
		//如果是镇管理员
		User user = (User) ActionContext.getContext().getSession().get(WebConstants.SESS_USER_OBJ);
		if(user instanceof ZhenWorkOrg){
			ZhenWorkOrg z = (ZhenWorkOrg) user;
			hql += " and cun.zhen.id=" + z.getZhen().getId();
		}
		
		if(cunId != null){
			hql += " and cun.id=" + cunId;
		}else if(zhenId != null){
			hql += " and cun.zhen.id=" + zhenId;
		}else if(areaId != null){
			hql += " and cun.zhen.area.id=" + areaId;
		}
		
		hql+=" order by id desc";
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

}
