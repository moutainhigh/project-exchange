package com.throne212.info168.web.dao.impl;

import java.util.List;

import org.hibernate.Session;

import com.throne212.info168.web.common.PageBean;
import com.throne212.info168.web.common.WebConstants;
import com.throne212.info168.web.dao.InfoDao;
import com.throne212.info168.web.domain.Area;
import com.throne212.info168.web.domain.Category;
import com.throne212.info168.web.domain.Info;
import com.throne212.info168.web.domain.User;

public class InfoDaoImpl extends BaseDaoImpl implements InfoDao {

	public PageBean<Info> getInfoByCate(Long cateId, int pageIndex) {
		PageBean<Info> page = new PageBean<Info>();
		int startIndex = (pageIndex - 1) * WebConstants.INFO_LIST_ROWS;
		Category cate = this.getEntityById(Category.class, cateId);
		String hql = "from Info i where i.isChecked=true and i.cate=? order by publishDate desc";
		Long count = (Long) this.getHibernateTemplate().find("select count(*) " + hql, cate).get(0);
		logger.debug("查询总数为：" + count);
		page.setTotalRow(count.intValue());// 总记录数目
		Session s = this.getHibernateTemplate().getSessionFactory().getCurrentSession();
		List<Info> list = s.createQuery(hql).setParameter(0, cate).setMaxResults(WebConstants.INFO_LIST_ROWS).setFirstResult(startIndex).list();
		page.setResultList(list);// 数据列表
		page.setRowPerPage(WebConstants.INFO_LIST_ROWS);// 每页记录数目
		page.setPageIndex(pageIndex);// 当前页码
		return page;
	}

	public PageBean<Info> getInfoByCateArea(Long cateId, Long areaId, int pageIndex) {
		if (areaId == null)
			return this.getInfoByCate(cateId, pageIndex);
		PageBean<Info> page = new PageBean<Info>();
		int startIndex = (pageIndex - 1) * WebConstants.INFO_LIST_ROWS;
		Category cate = this.getEntityById(Category.class, cateId);
		Area area = this.getEntityById(Area.class, areaId);
		String hql = "from Info i where i.isChecked=true and i.cate=? and i.area=? order by publishDate desc";
		Long count = (Long) this.getHibernateTemplate().find("select count(*) " + hql, new Object[] { cate, area }).get(0);
		logger.debug("查询总数为：" + count);
		page.setTotalRow(count.intValue());// 总记录数目
		Session s = this.getHibernateTemplate().getSessionFactory().getCurrentSession();
		List<Info> list = s.createQuery(hql).setParameter(0, cate).setParameter(1, area).setMaxResults(WebConstants.INFO_LIST_ROWS).setFirstResult(startIndex).list();
		page.setResultList(list);// 数据列表
		page.setRowPerPage(WebConstants.INFO_LIST_ROWS);// 每页记录数目
		page.setPageIndex(pageIndex);// 当前页码
		return page;
	}

	public PageBean<Info> getInfoByCateAreaKeywords(Long cateId, Long areaId, String keywords, int pageIndex) {
		if (areaId == null)
			return this.getInfoByCateKeywords(cateId, keywords, pageIndex);
		PageBean<Info> page = new PageBean<Info>();
		int startIndex = (pageIndex - 1) * WebConstants.INFO_LIST_ROWS;
		Category cate = this.getEntityById(Category.class, cateId);
		Area area = this.getEntityById(Area.class, areaId);
		String hql = "from Info i where i.isChecked=true and i.cate=? and i.area=? and i.title like ? order by publishDate desc";
		Long count = (Long) this.getHibernateTemplate().find("select count(*) " + hql, cate).get(0);
		page.setTotalRow(count.intValue());// 总记录数目
		Session s = this.getHibernateTemplate().getSessionFactory().getCurrentSession();
		List<Info> list = s.createQuery(hql).setParameter(0, cate).setParameter(1, area).setParameter(2, "%" + keywords + "%").setMaxResults(WebConstants.INFO_LIST_ROWS).setFirstResult(startIndex)
				.list();
		page.setResultList(list);// 数据列表
		page.setRowPerPage(WebConstants.INFO_LIST_ROWS);// 每页记录数目
		page.setPageIndex(pageIndex);// 当前页码
		return page;
	}

	public PageBean<Info> getInfoByCateKeywords(Long cateId, String keywords, int pageIndex) {
		PageBean<Info> page = new PageBean<Info>();
		int startIndex = (pageIndex - 1) * WebConstants.INFO_LIST_ROWS;
		Category cate = this.getEntityById(Category.class, cateId);
		String hql = "from Info i where i.isChecked=true and i.cate.parent=? and i.title like ? order by publishDate desc";
		Long count = (Long) this.getHibernateTemplate().find("select count(*) " + hql, new Object[] { cate, "%" + keywords + "%" }).get(0);
		page.setTotalRow(count.intValue());// 总记录数目
		Session s = this.getHibernateTemplate().getSessionFactory().getCurrentSession();
		List<Info> list = s.createQuery(hql).setParameter(0, cate).setParameter(1, "%" + keywords + "%").setMaxResults(WebConstants.INFO_LIST_ROWS).setFirstResult(startIndex).list();
		page.setResultList(list);// 数据列表
		page.setRowPerPage(WebConstants.INFO_LIST_ROWS);// 每页记录数目
		page.setPageIndex(pageIndex);// 当前页码
		return page;
	}

	public PageBean<Info> getInfoByUser(Long userId, int pageIndex) {
		PageBean<Info> page = new PageBean<Info>();
		int startIndex = (pageIndex - 1) * WebConstants.INFO_LIST_ROWS;
		User user = this.getEntityById(User.class, userId);
		String hql = "from Info i where i.user=? order by publishDate desc";
		Long count = (Long) this.getHibernateTemplate().find("select count(*) " + hql, user).get(0);
		page.setTotalRow(count.intValue());// 总记录数目
		Session s = this.getHibernateTemplate().getSessionFactory().getCurrentSession();
		List<Info> list = s.createQuery(hql).setParameter(0, user).setMaxResults(WebConstants.INFO_LIST_ROWS).setFirstResult(startIndex).list();
		page.setResultList(list);// 数据列表
		page.setRowPerPage(WebConstants.INFO_LIST_ROWS);// 每页记录数目
		page.setPageIndex(pageIndex);// 当前页码
		return page;
	}

	public PageBean<Info> getAllInfo(int pageIndex) {
		PageBean<Info> page = new PageBean<Info>();
		int startIndex = (pageIndex - 1) * WebConstants.INFO_LIST_ROWS_ADMIN;
		String hql = "from Info i order by publishDate desc";
		Long count = (Long) this.getHibernateTemplate().find("select count(*) " + hql).get(0);
		page.setTotalRow(count.intValue());// 总记录数目
		Session s = this.getHibernateTemplate().getSessionFactory().getCurrentSession();
		List<Info> list = s.createQuery(hql).setMaxResults(WebConstants.INFO_LIST_ROWS_ADMIN).setFirstResult(startIndex).list();
		page.setResultList(list);// 数据列表
		page.setRowPerPage(WebConstants.INFO_LIST_ROWS_ADMIN);// 每页记录数目
		page.setPageIndex(pageIndex);// 当前页码
		return page;
	}

	public PageBean<Info> getAllUncheckInfo(int pageIndex) {
		PageBean<Info> page = new PageBean<Info>();
		int startIndex = (pageIndex - 1) * WebConstants.INFO_LIST_ROWS_ADMIN;
		String hql = "from Info i where isChecked is null or isChecked=false order by publishDate desc";
		Long count = (Long) this.getHibernateTemplate().find("select count(*) " + hql).get(0);
		page.setTotalRow(count.intValue());// 总记录数目
		Session s = this.getHibernateTemplate().getSessionFactory().getCurrentSession();
		List<Info> list = s.createQuery(hql).setMaxResults(WebConstants.INFO_LIST_ROWS_ADMIN).setFirstResult(startIndex).list();
		page.setResultList(list);// 数据列表
		page.setRowPerPage(WebConstants.INFO_LIST_ROWS_ADMIN);// 每页记录数目
		page.setPageIndex(pageIndex);// 当前页码
		return page;
	}

	public PageBean<Info> getInfoByKey(String keywords, int pageIndex) {
		PageBean<Info> page = new PageBean<Info>();
		int startIndex = (pageIndex - 1) * WebConstants.INFO_LIST_ROWS_SEARCH;
		String hql = "from Info i where i.isChecked=true and i.title like ? order by publishDate desc";
		Long count = (Long) this.getHibernateTemplate().find("select count(*) " + hql, "%" + keywords + "%").get(0);
		logger.info("搜索结果记录数：" + count);
		page.setTotalRow(count.intValue());// 总记录数目
		Session s = this.getHibernateTemplate().getSessionFactory().getCurrentSession();
		List<Info> list = s.createQuery(hql).setParameter(0, "%" + keywords + "%").setMaxResults(WebConstants.INFO_LIST_ROWS_SEARCH).setFirstResult(startIndex).list();
		page.setResultList(list);// 数据列表
		page.setRowPerPage(WebConstants.INFO_LIST_ROWS_SEARCH);// 每页记录数目
		page.setPageIndex(pageIndex);// 当前页码
		return page;
	}
	
	public List<Info> getTop10RecommendInfo(){
		String hql = "from Info i where i.recommend is not null and i.recommend=true order by i.publishDate desc";
		Session s = this.getHibernateTemplate().getSessionFactory().getCurrentSession();
		List<Info> list = s.createQuery(hql).setMaxResults(10).list();
		return list;
	}

}
