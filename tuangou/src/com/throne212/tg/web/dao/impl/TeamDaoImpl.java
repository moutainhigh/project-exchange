package com.throne212.tg.web.dao.impl;

import java.util.List;

import org.hibernate.Session;

import com.throne212.tg.web.common.PageBean;
import com.throne212.tg.web.common.WebConstants;
import com.throne212.tg.web.dao.TeamDao;
import com.throne212.tg.web.domain.Teams;

public class TeamDaoImpl extends BaseDaoImpl implements TeamDao {

	public PageBean<Teams> getAllTeams(int pageIndex) {
		if (pageIndex == 0) {
			pageIndex = 1;
		}
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
		String hql="from Teams t where t.cate.name='"+cateName+"' and t.cityName='"+cityName+"' order by t.createTime desc";
		Session s = this.getHibernateTemplate().getSessionFactory().getCurrentSession();
		List<Teams> list = s.createQuery(hql).setMaxResults(num).list();
		return list;
	}
	//通过团购信息类型查询所有城市的最新团购信息
	public List<Teams> getTopNewTeamsByCateOfAllCtiy(int num,String cateName){
		
		String hql="from Teams t where t.cate.name='"+cateName+"' order by t.createTime desc";
		Session s = this.getHibernateTemplate().getSessionFactory().getCurrentSession();
		List<Teams> list = s.createQuery(hql).setMaxResults(num).list();
		return list;
		
		
		
	}
	
	//通过类型id查询所有团购信息列表
	public PageBean<Teams> getAllTeamsByCateId(int pageIndex,long cateId){
		if (pageIndex == 0) {
			pageIndex = 1;
		}
		PageBean<Teams> page = new PageBean<Teams>();
		int startIndex = (pageIndex - 1) * WebConstants.NUM_PER_FRONT_PAGE_TEAM;
		String hql = "from Teams t where t.cate.id='"+cateId+"' order by t.createTime desc";
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
	//通过类型id和城市名查询所有团购信息列表
	public PageBean<Teams> getAllTeamsByCateIdAndCityName(int pageIndex,long cateId,String cityName){
		if (pageIndex == 0) {
			pageIndex = 1;
		}
		PageBean<Teams> page = new PageBean<Teams>();
		int startIndex = (pageIndex - 1) * WebConstants.NUM_PER_FRONT_PAGE_TEAM;
		String hql;
		if ("全国".equals(cityName)) {
			hql="from Teams t where t.cate.id='"+cateId+"' order by t.createTime desc";
		} else {
			hql = "from Teams t where t.cate.id='"+cateId+"' and t.cityName='"+cityName+"' order by t.createTime desc";

		}
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
	//通过关键字搜索团购信息
	public PageBean<Teams> searchTeamsByKeyword(int pageIndex,String keyword){
		
		
		PageBean<Teams> page = new PageBean<Teams>();
		int startIndex = (pageIndex - 1) * WebConstants.NUM_PER_PAGE_SEARCH_TEAM;
		String hql = "from Teams t where t.title like '%"+keyword+"%' or t.summary like '%"+keyword+"%' order by t.createTime desc";
		logger.debug(hql);
		logger.debug("select count(*) " + hql);
		Long count = (Long) this.getHibernateTemplate().find("select count(*) " + hql).get(0);
		logger.debug("查询总数为：" + count);
		page.setTotalRow(count.intValue());// 总记录数目
		Session s = this.getHibernateTemplate().getSessionFactory().getCurrentSession();
		List<Teams> list = s.createQuery(hql).setMaxResults(WebConstants.NUM_PER_PAGE_SEARCH_TEAM).setFirstResult(startIndex).list();
		page.setResultList(list);// 数据列表
		page.setRowPerPage(WebConstants.NUM_PER_PAGE_SEARCH_TEAM);// 每页记录数目
		page.setPageIndex(pageIndex);// 当前页码
		return page;
		
		
		
	}
	//按团购信息关键字查询类似团购信息

	public List<Teams> getSimilarTeams(int num,String cateName,String keywords){
		if (null==keywords) {
			
		keywords="";
			
		}
		keywords=keywords.trim();
		
		String[] keywordArray=keywords.split(" ");
		StringBuilder hqlBuilder=new StringBuilder();
		hqlBuilder.append("from Teams t where t.cate.name='"+cateName+"' and (");
		for (int i = 0; i < keywordArray.length; i++) {
			logger.debug(""+keywordArray[i]);
			hqlBuilder.append(" t.summary like '%"+keywordArray[i]+"%' or");
		}
		hqlBuilder.append(" 0=1) order by t.createTime desc");
		logger.debug(hqlBuilder.toString());
		
//		String hql="from Teams t where t.cate.name='"+cateName+"' and t.summary like '%"+cityName+"%' order by t.createTime desc";
		String hql=hqlBuilder.toString();
		Session s = this.getHibernateTemplate().getSessionFactory().getCurrentSession();
		List<Teams> list = s.createQuery(hql).setMaxResults(num).list();
		return list;
		
		
		
		
		
		
	}
	
	//查询用户收藏的团购信息
	public PageBean<Teams> getAllCollectTeamsOfUser(int pageIndex,String loginName){
		
		
		if (pageIndex == 0) {
			pageIndex = 1;
		}
		PageBean<Teams> page = new PageBean<Teams>();
		int startIndex = (pageIndex - 1) * WebConstants.NUM_PER_PAGE_COLLECT_TEAM;
//		String hql = "from Teams t left join t.collectUsers u where u.loginName='"+loginName+"' order by t.createTime desc";
		String hql="select distinct t from User u,Teams t where u.loginName='"+loginName+"' and u in elements(t.collectUsers) order by t.createTime desc";
		logger.debug(hql);
		Session s = this.getHibernateTemplate().getSessionFactory().getCurrentSession();
		int count = s.createQuery(hql).list().size();
		logger.debug("查询总数为：" + count);
		page.setTotalRow(count);// 总记录数目
		List<Teams> list = s.createQuery(hql).setMaxResults(WebConstants.NUM_PER_PAGE_COLLECT_TEAM).setFirstResult(startIndex).list();
		page.setResultList(list);// 数据列表
		page.setRowPerPage(WebConstants.NUM_PER_PAGE_COLLECT_TEAM);// 每页记录数目
		page.setPageIndex(pageIndex);// 当前页码
		return page;
		
		
		
		
	}
	
	
	
	
	
	
}
