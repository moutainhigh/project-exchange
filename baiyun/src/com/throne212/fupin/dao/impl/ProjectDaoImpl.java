package com.throne212.fupin.dao.impl;

import java.util.List;

import org.hibernate.Session;

import com.opensymphony.xwork2.ActionContext;
import com.throne212.fupin.common.PageBean;
import com.throne212.fupin.common.WebConstants;
import com.throne212.fupin.dao.ProjectDao;
import com.throne212.fupin.domain.Org;
import com.throne212.fupin.domain.Project;
import com.throne212.fupin.domain.ProjectCun;
import com.throne212.fupin.domain.ProjectCunStat;
import com.throne212.fupin.domain.ProjectShStat;
import com.throne212.fupin.domain.ProjectShehui;
import com.throne212.fupin.domain.ProjectZdStat;
import com.throne212.fupin.domain.ProjectZhongdian;
import com.throne212.fupin.domain.User;

public class ProjectDaoImpl extends BaseDaoImpl implements ProjectDao {

	public <T extends Project> PageBean<T> getProjectList(Class<T> clazz, Integer pageIndex) {

		if (pageIndex == null || pageIndex == 0) {
			pageIndex = 1;
		}

		PageBean<T> page = new PageBean<T>();
		int startIndex = (pageIndex - 1) * WebConstants.PAGE_SIZE;
		String hql = "from " + clazz.getSimpleName() + " where 1=1";

		User user = (User) ActionContext.getContext().getSession().get(WebConstants.SESS_USER_OBJ);
		if (user instanceof Org) {
			hql += " and org.id=" + user.getId();
		}

		hql += " order by id desc";
		Long count = (Long) this.getHibernateTemplate().find("select count(*) " + hql).get(0);
		logger.debug("查询总数为：" + count);
		page.setTotalRow(count.intValue());// 总记录数目
		Session s = this.getHibernateTemplate().getSessionFactory().getCurrentSession();
		List<T> list = s.createQuery(hql).setMaxResults(WebConstants.PAGE_SIZE).setFirstResult(startIndex).list();
		page.setResultList(list);// 数据列表
		page.setRowPerPage(WebConstants.PAGE_SIZE);// 每页记录数目
		page.setPageIndex(pageIndex);// 当前页码
		return page;

	}

	public ProjectCunStat getCunStat(ProjectCunStat param) {
		Integer year = param.getYear();
		Integer month = param.getMonth();
		Long proId = param.getProject().getId();

		User user = (User) ActionContext.getContext().getSession().get(WebConstants.SESS_USER_OBJ);
		
		String hql = "from ProjectCunStat s where year=? and month=? and s.project.id=" + proId;
		
		if (user instanceof Org) {
			hql += " and s.project.org.id=" + user.getId();
		}

		List<ProjectCunStat> statList = this.getHibernateTemplate().find(hql, new Object[] { year, month });

		if (statList != null && statList.size() > 0)
			return statList.get(0);
		
		
		if (user instanceof Org) {
			hql = "from ProjectCun where org.id=" + user.getId();
			List<ProjectCun> list = this.getHibernateTemplate().find(hql);
			if (list != null && list.size() > 0){
				ProjectCun proCun = list.get(0);
				ProjectCunStat cunStat = new ProjectCunStat();
				cunStat.setProject(proCun);
				cunStat.setMonth(month);
				cunStat.setYear(year);
				cunStat.setProject(param.getProject());
				this.saveOrUpdate(cunStat);
				return cunStat;
			}				
		}	
		
		return null;

	}
	
	public ProjectZdStat getZdStat(ProjectZdStat param){
		Integer year = param.getYear();
		Integer month = param.getMonth();
		Long proId = param.getProject().getId();

		User user = (User) ActionContext.getContext().getSession().get(WebConstants.SESS_USER_OBJ);
		String hql = "from ProjectZdStat s where year=? and month=? and s.project.id=" + proId + " and s.project.org.id=" + user.getId();

		List<ProjectZdStat> statList = this.getHibernateTemplate().find(hql, new Object[] { year, month });

		if (statList != null && statList.size() > 0)
			return statList.get(0);
		
		if (user instanceof Org) {
			hql = "from ProjectZhongdian where org.id=" + user.getId();
			List<ProjectZhongdian> list = this.getHibernateTemplate().find(hql);
			if (list != null && list.size() > 0){
				ProjectZhongdian proCun = list.get(0);
				ProjectZdStat cunStat = new ProjectZdStat();
				cunStat.setProject(proCun);
				cunStat.setMonth(month);
				cunStat.setYear(year);
				cunStat.setProject(param.getProject());
				this.saveOrUpdate(cunStat);
				return cunStat;
			}				
		}	
		
		return null;
	}
	public ProjectShStat getShStat(ProjectShStat param){
		Integer year = param.getYear();
		Integer month = param.getMonth();
		Long proId = param.getProject().getId();

		User user = (User) ActionContext.getContext().getSession().get(WebConstants.SESS_USER_OBJ);
		String hql = "from ProjectShStat s where year=? and month=? and s.project.id=" + proId + " and s.project.org.id=" + user.getId();

		List<ProjectShStat> statList = this.getHibernateTemplate().find(hql, new Object[] { year, month });

		if (statList != null && statList.size() > 0)
			return statList.get(0);
		
		if (user instanceof Org) {
			hql = "from ProjectShehui where org.id=" + user.getId();
			List<ProjectShehui> list = this.getHibernateTemplate().find(hql);
			if (list != null && list.size() > 0){
				ProjectShehui proCun = list.get(0);
				ProjectShStat cunStat = new ProjectShStat();
				cunStat.setProject(proCun);
				cunStat.setMonth(month);
				cunStat.setYear(year);
				cunStat.setProject(param.getProject());
				this.saveOrUpdate(cunStat);
				return cunStat;
			}				
		}	
		
		return null;
	}

}
