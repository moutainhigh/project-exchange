package com.throne212.fupin.dao.impl;

import java.util.List;

import org.hibernate.Session;

import com.throne212.fupin.common.PageBean;
import com.throne212.fupin.common.WebConstants;
import com.throne212.fupin.dao.ZhenDao;
import com.throne212.fupin.domain.Area;
import com.throne212.fupin.domain.ChengxiaoZhen;
import com.throne212.fupin.domain.CuoshiZhen;
import com.throne212.fupin.domain.PicZhen;
import com.throne212.fupin.domain.ShiWorkOrg;
import com.throne212.fupin.domain.Zhen;


public class ZhenDaoImpl extends BaseDaoImpl implements ZhenDao {

	public PageBean<Zhen> getAllZhen(Area area,Integer pageIndex){
		PageBean<Zhen> page = new PageBean<Zhen>();
		int startIndex = (pageIndex - 1) * WebConstants.PAGE_SIZE;
		String hql = "from Zhen t";
		if(area != null)
			hql += " where area.id="+area.getId();
		logger.debug("hql="+hql);
		Long count = (Long) this.getHibernateTemplate().find("select count(*) " + hql).get(0);
		logger.debug("查询总数为：" + count);
		page.setTotalRow(count.intValue());// 总记录数目
		Session s = this.getHibernateTemplate().getSessionFactory().getCurrentSession();
		List<Zhen> list = s.createQuery(hql).setMaxResults(WebConstants.PAGE_SIZE).setFirstResult(startIndex).list();
		page.setResultList(list);// 数据列表
		page.setRowPerPage(WebConstants.PAGE_SIZE);// 每页记录数目
		page.setPageIndex(pageIndex);// 当前页码
		return page;
	}
	
	//镇帮扶措施
	public PageBean<CuoshiZhen> getAllCuoshiZhenByZhenId(CuoshiZhen condition,Long zhenId,Integer pageIndex){
		PageBean<CuoshiZhen> page = new PageBean<CuoshiZhen>();
		int startIndex = (pageIndex - 1) * WebConstants.PAGE_SIZE;
		String hql = "from CuoshiZhen t";
		if(zhenId != null)
			hql += " where zhen.id="+zhenId;
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
		List<CuoshiZhen> list = s.createQuery(hql).setMaxResults(WebConstants.PAGE_SIZE).setFirstResult(startIndex).list();
		page.setResultList(list);// 数据列表
		page.setRowPerPage(WebConstants.PAGE_SIZE);// 每页记录数目
		page.setPageIndex(pageIndex);// 当前页码
		return page;
	}
	
	public PageBean<CuoshiZhen> getAllCuoshiZhen(CuoshiZhen condition,Integer pageIndex){
		
		if (pageIndex == 0) {
			pageIndex = 1;
		}
		PageBean<CuoshiZhen> page = new PageBean<CuoshiZhen>();
		int startIndex = (pageIndex - 1) * WebConstants.PAGE_SIZE;
		String hql = "from CuoshiZhen t ";
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
		List<CuoshiZhen> list = s.createQuery(hql).setMaxResults(WebConstants.PAGE_SIZE).setFirstResult(startIndex).list();
		page.setResultList(list);// 数据列表
		page.setRowPerPage(WebConstants.PAGE_SIZE);// 每页记录数目
		page.setPageIndex(pageIndex);// 当前页码
		return page;
	
	}
	
	
	//镇帮扶成效
	public PageBean<ChengxiaoZhen> getAllChengxiaoZhenByZhenId(ChengxiaoZhen condition,Long zhenId,Integer pageIndex){
		
		PageBean<ChengxiaoZhen> page = new PageBean<ChengxiaoZhen>();
		int startIndex = (pageIndex - 1) * WebConstants.PAGE_SIZE;
		String hql = "from ChengxiaoZhen t";
		if(zhenId != null)
			hql += " where zhen.id="+zhenId;
		if (condition!= null && condition.getStatus()!=null&&!"".equals(condition.getStatus())) {
			hql+=" and status='"+condition.getStatus()+"'";
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
	
	public PageBean<ChengxiaoZhen> getAllChengxiaoZhen(ChengxiaoZhen condition,Integer pageIndex){
		if (pageIndex == 0) {
			pageIndex = 1;
		}
		PageBean<ChengxiaoZhen> page = new PageBean<ChengxiaoZhen>();
		int startIndex = (pageIndex - 1) * WebConstants.PAGE_SIZE;
		String hql = "from ChengxiaoZhen t ";
		if (condition!=null&&condition.getStatus()!=null&&!"".equals(condition.getStatus())) {
			hql+=" where status='"+condition.getStatus()+"'";
		}
		hql+=" order by id desc";
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
	
	//镇帮扶图片
	public PageBean<PicZhen> getAllPicZhenByZhenId(PicZhen condition,Long zhenId,Integer pageIndex){
		PageBean<PicZhen> page = new PageBean<PicZhen>();
		int startIndex = (pageIndex - 1) * WebConstants.PAGE_SIZE;
		String hql = "from PicZhen t";
		if(zhenId != null)
			hql += " where zhen.id="+zhenId;
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
		List<PicZhen> list = s.createQuery(hql).setMaxResults(WebConstants.PAGE_SIZE).setFirstResult(startIndex).list();
		page.setResultList(list);// 数据列表
		page.setRowPerPage(WebConstants.PAGE_SIZE);// 每页记录数目
		page.setPageIndex(pageIndex);// 当前页码
		return page;
		
	}
	public PageBean<PicZhen> getAllPicZhen(PicZhen condition,Integer pageIndex){
		if (pageIndex == 0) {
			pageIndex = 1;
		}
		PageBean<PicZhen> page = new PageBean<PicZhen>();
		int startIndex = (pageIndex - 1) * WebConstants.PAGE_SIZE;
		String hql = "from PicZhen t ";
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
		List<PicZhen> list = s.createQuery(hql).setMaxResults(WebConstants.PAGE_SIZE).setFirstResult(startIndex).list();
		page.setResultList(list);// 数据列表
		page.setRowPerPage(WebConstants.PAGE_SIZE);// 每页记录数目
		page.setPageIndex(pageIndex);// 当前页码
		return page;
		
		
		
	}
}
