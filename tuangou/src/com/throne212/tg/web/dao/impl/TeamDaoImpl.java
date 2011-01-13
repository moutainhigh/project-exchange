package com.throne212.tg.web.dao.impl;

import java.util.List;

import org.hibernate.Session;

import com.throne212.tg.web.common.PageBean;
import com.throne212.tg.web.common.WebConstants;
import com.throne212.tg.web.dao.TeamDao;
import com.throne212.tg.web.domain.Teams;

public class TeamDaoImpl extends BaseDaoImpl implements TeamDao {

	public PageBean<Teams> getAllTeams(int pageIndex) {
		PageBean<Teams> page = new PageBean<Teams>();
		int startIndex = (pageIndex - 1) * WebConstants.NUM_PER_BACK_PAGE_TEAM;
		String hql = "from Teams t order by createTime desc";
		Long count = (Long) this.getHibernateTemplate().find("select count(*) " + hql).get(0);
		logger.debug("查询总数为：" + count);
		page.setTotalRow(count.intValue());// 总记录数目
		Session s = this.getHibernateTemplate().getSessionFactory().getCurrentSession();
		List<Teams> list = s.createQuery(hql).setMaxResults(WebConstants.NUM_PER_BACK_PAGE_TEAM).setFirstResult(startIndex).list();
		page.setResultList(list);// 数据列表
		page.setRowPerPage(WebConstants.NUM_PER_BACK_PAGE_TEAM);// 每页记录数目
		page.setPageIndex(pageIndex);// 当前页码
		return page;
	}
	//通过团购信息类型和城市查询最新的团购信息
	//num 所需查询的条数，cateName 团购信息类型,city 城市
	public List<Teams> getTopNewTeamsByCateAndCity(int num,String cateName,String cityName){
		String hql="from Teams t where t.cate.name='"+cateName+"' and (t.cityName='"+cityName+"' or t.cityName='全国') order by t.createTime desc";
		Session s = this.getHibernateTemplate().getSessionFactory().getCurrentSession();
		List<Teams> list = s.createQuery(hql).setMaxResults(num).list();
		return list;
	}
	
	//通过类型id查询所有团购信息列表
	public PageBean<Teams> getAllTeamsByCateId(int pageIndex,long id){
		
		PageBean<Teams> page = new PageBean<Teams>();
		int startIndex = (pageIndex - 1) * WebConstants.NUM_PER_FRONT_PAGE_TEAM;
		String hql = "from Teams t where t.cate.id='"+id+"' order by t.createTime desc";
		logger.debug(hql);
		logger.debug("select count(*) " + hql);
		Long count = (Long) this.getHibernateTemplate().find("select count(*) " + hql).get(0);
		logger.debug("查询总数为：" + count);
		page.setTotalRow(count.intValue());// 总记录数目
		Session s = this.getHibernateTemplate().getSessionFactory().getCurrentSession();
		List<Teams> list = s.createQuery(hql).setMaxResults(WebConstants.NUM_PER_FRONT_PAGE_TEAM).setFirstResult(startIndex).list();
		page.setResultList(list);// 数据列表
		page.setRowPerPage(WebConstants.NUM_PER_FRONT_PAGE_TEAM);// 每页记录数目
		page.setPageIndex(pageIndex);// 当前页码
		return page;
		
		
		
		
	}
	
}
