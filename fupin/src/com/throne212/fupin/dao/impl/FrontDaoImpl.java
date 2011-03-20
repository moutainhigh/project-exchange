package com.throne212.fupin.dao.impl;

import java.util.ArrayList;
import java.util.List;

import org.hibernate.Session;

import com.throne212.fupin.common.PageBean;
import com.throne212.fupin.common.WebConstants;
import com.throne212.fupin.dao.FrontDao;
import com.throne212.fupin.domain.Area;
import com.throne212.fupin.domain.Cun;
import com.throne212.fupin.domain.Family;
import com.throne212.fupin.domain.Record;
import com.throne212.fupin.domain.Shi;
import com.throne212.fupin.domain.Zhen;

public class FrontDaoImpl extends BaseDaoImpl implements FrontDao {

	public PageBean<Family> getAllFamilyByCunId(Long cunId, Integer pageIndex) {
		PageBean<Family> page = new PageBean<Family>();
		int startIndex = (pageIndex - 1) * WebConstants.PAGE_SIZE;
		String hql = "from Family t";
		if (cunId != null)
			hql += " where cun.id=" + cunId;

		hql += " order by id desc";
		logger.debug("hql=" + hql);
		Long count = (Long) this.getHibernateTemplate().find("select count(*) " + hql).get(0);
		logger.debug("查询总数为：" + count);
		page.setTotalRow(count.intValue());// 总记录数目
		Session s = this.getHibernateTemplate().getSessionFactory().getCurrentSession();
		List<Family> list = s.createQuery(hql).setMaxResults(WebConstants.PAGE_SIZE).setFirstResult(startIndex).list();
		page.setResultList(list);// 数据列表
		page.setRowPerPage(WebConstants.PAGE_SIZE);// 每页记录数目
		page.setPageIndex(pageIndex);// 当前页码
		return page;
	}
	public PageBean<Record> getAllRecordByFamilyId(Long familyId,Integer pageIndex){
		PageBean<Record> page = new PageBean<Record>();
		int startIndex = (pageIndex - 1) * WebConstants.PAGE_SIZE;
		String hql = "from Record t";
		if (familyId != null)
			hql += " where family.id=" + familyId;

		hql += " order by id desc";
		logger.debug("hql=" + hql);
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
	public PageBean<Cun> getAllCunUnderShi(Long shiId, Integer pageIndex) {
		PageBean<Cun> page = new PageBean<Cun>();
		int startIndex = (pageIndex - 1) * WebConstants.PAGE_SIZE;
		String hql = "from Cun t";
		if (shiId != null)
			hql += " where zhen.area.shi.id=" + shiId;
		hql += " order by id desc";
		logger.debug("hql=" + hql);
		Long count = (Long) this.getHibernateTemplate().find("select count(*) " + hql).get(0);
		logger.debug("查询总数为：" + count);
		page.setTotalRow(count.intValue());// 总记录数目
		Session s = this.getHibernateTemplate().getSessionFactory().getCurrentSession();
		List<Cun> list = s.createQuery(hql).setMaxResults(WebConstants.PAGE_SIZE).setFirstResult(startIndex).list();
		page.setResultList(list);// 数据列表
		page.setRowPerPage(WebConstants.PAGE_SIZE);// 每页记录数目
		page.setPageIndex(pageIndex);// 当前页码
		return page;
	}

	public PageBean<Cun> getAllCunUnderArea(Long areaId, Integer pageIndex) {
		PageBean<Cun> page = new PageBean<Cun>();
		int startIndex = (pageIndex - 1) * WebConstants.PAGE_SIZE;
		String hql = "from Cun t";
		if (areaId != null)
			hql += " where zhen.area.id=" + areaId;
		hql += " order by id desc";
		logger.debug("hql=" + hql);
		Long count = (Long) this.getHibernateTemplate().find("select count(*) " + hql).get(0);
		logger.debug("查询总数为：" + count);
		page.setTotalRow(count.intValue());// 总记录数目
		Session s = this.getHibernateTemplate().getSessionFactory().getCurrentSession();
		List<Cun> list = s.createQuery(hql).setMaxResults(WebConstants.PAGE_SIZE).setFirstResult(startIndex).list();
		page.setResultList(list);// 数据列表
		page.setRowPerPage(WebConstants.PAGE_SIZE);// 每页记录数目
		page.setPageIndex(pageIndex);// 当前页码
		return page;
	}

	public PageBean<Cun> getAllCunUnderZhen(Long zhenId, Integer pageIndex) {
		PageBean<Cun> page = new PageBean<Cun>();
		int startIndex = (pageIndex - 1) * WebConstants.PAGE_SIZE;
		String hql = "from Cun t";
		if (zhenId != null)
			hql += " where zhen.id=" + zhenId;
		hql += " order by id desc";
		logger.debug("hql=" + hql);
		Long count = (Long) this.getHibernateTemplate().find("select count(*) " + hql).get(0);
		logger.debug("查询总数为：" + count);
		page.setTotalRow(count.intValue());// 总记录数目
		Session s = this.getHibernateTemplate().getSessionFactory().getCurrentSession();
		List<Cun> list = s.createQuery(hql).setMaxResults(WebConstants.PAGE_SIZE).setFirstResult(startIndex).list();
		page.setResultList(list);// 数据列表
		page.setRowPerPage(WebConstants.PAGE_SIZE);// 每页记录数目
		page.setPageIndex(pageIndex);// 当前页码
		return page;
	}

	public Long getMappingCunSum(Shi shi) {
		String hql = "select count(*) from Cun where zhen.area.shi=? and org is not null";
		return (Long) this.getHibernateTemplate().find(hql, shi).get(0);
	}

	public Long getNotMappingCunSum(Shi shi) {
		String hql = "select count(*) from Cun where zhen.area.shi=? and org is null";
		return (Long) this.getHibernateTemplate().find(hql, shi).get(0);
	}

	public Long getMappingFamilySum(Shi shi) {
		String hql = "select count(*) from Family f where f.cun.zhen.area.shi=? and (select count(*) from Leader where family=f)>0";
		return (Long) this.getHibernateTemplate().find(hql, shi).get(0);
	}

	public Long getNotMappingFamilySum(Shi shi) {
		String hql = "select count(*) from Family f where f.cun.zhen.area.shi=? and (select count(*) from Leader where family=f)=0";
		return (Long) this.getHibernateTemplate().find(hql, shi).get(0);
	}
	public Long getOrgSumInArea(Area z){
		String hql = "select count(*) from Org o where o.cun.zhen.area=?";
		return (Long) this.getHibernateTemplate().find(hql, z).get(0);
	}
	

	public Long getMappingCunSum(Area area) {
		String hql = "select count(*) from Cun where zhen.area=? and org is not null";
		return (Long) this.getHibernateTemplate().find(hql, area).get(0);
	}

	public Long getNotMappingCunSum(Area area) {
		String hql = "select count(*) from Cun where zhen.area=? and org is null";
		return (Long) this.getHibernateTemplate().find(hql, area).get(0);
	}

	public Long getMappingFamilySum(Area area) {
		String hql = "select count(*) from Family f where f.cun.zhen.area=? and (select count(*) from Leader where family=f)>0";
		return (Long) this.getHibernateTemplate().find(hql, area).get(0);
	}

	public Long getNotMappingFamilySum(Area area) {
		String hql = "select count(*) from Family f where f.cun.zhen.area=? and (select count(*) from Leader where family=f)=0";
		return (Long) this.getHibernateTemplate().find(hql, area).get(0);
	}

	public Long getOrgSumInZhen(Zhen z) {
		String hql = "select count(*) from Org o where o.cun.zhen=?";
		return (Long) this.getHibernateTemplate().find(hql, z).get(0);
	}

	public Long getMappingCunSum(Zhen area) {
		String hql = "select count(*) from Cun where zhen=? and org is not null";
		return (Long) this.getHibernateTemplate().find(hql, area).get(0);
	}

	public Long getNotMappingCunSum(Zhen area) {
		String hql = "select count(*) from Cun where zhen=? and org is null";
		return (Long) this.getHibernateTemplate().find(hql, area).get(0);
	}

	public Long getMappingFamilySum(Zhen area) {
		String hql = "select count(*) from Family f where f.cun.zhen=? and (select count(*) from Leader where family=f)>0";
		return (Long) this.getHibernateTemplate().find(hql, area).get(0);
	}

	public Long getNotMappingFamilySum(Zhen area) {
		String hql = "select count(*) from Family f where f.cun.zhen=? and (select count(*) from Leader where family=f)=0";
		return (Long) this.getHibernateTemplate().find(hql, area).get(0);
	}

	public Long getOrgSumInCun(Cun c) {
		String hql = "select count(*) from Org o where o.cun=?";
		return (Long) this.getHibernateTemplate().find(hql, c).get(0);
	}
	
	//获取只有贫困村的区县
	public List<Area> getAreaWithPoor(){
		List<Area> list = this.getHibernateTemplate().find("from Area");
		List<Area> list2 = new ArrayList<Area>();
		for(Area a : list){
			String hql = "select count(*) from Family f where f.cun.zhen.area=?";
			Long count = (Long) this.getHibernateTemplate().find(hql, a).get(0);
			if(count>0)
				list2.add(a);
		}
		return list2;
	}
	public List<Zhen> getZhenWithPoor(Area area){
		List<Zhen> list = this.getHibernateTemplate().find("from Zhen where area=?",area);
		List<Zhen> list2 = new ArrayList<Zhen>();
		for(Zhen a : list){
			String hql = "select count(*) from Family f where f.cun.zhen=?";
			Long count = (Long) this.getHibernateTemplate().find(hql, a).get(0);
			if(count>0)
				list2.add(a);
		}
		return list2;
	}
	public List<Cun> getCunWithPoor(Zhen zhen){
		List<Cun> list = this.getHibernateTemplate().find("from Cun where zhen=?",zhen);
		List<Cun> list2 = new ArrayList<Cun>();
		for(Cun a : list){
			String hql = "select count(*) from Family f where f.cun=?";
			Long count = (Long) this.getHibernateTemplate().find(hql, a).get(0);
			if(count>0)
				list2.add(a);
		}
		return list2;
	}
	public List<Cun> getCunWithPoor(){
		List<Cun> list = this.getHibernateTemplate().find("from Cun");
		List<Cun> list2 = new ArrayList<Cun>();
		for(Cun a : list){
			String hql = "select count(*) from Family f where f.cun=?";
			Long count = (Long) this.getHibernateTemplate().find(hql, a).get(0);
			if(count>0)
				list2.add(a);
		}
		return list2;
	}

}
