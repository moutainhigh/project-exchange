package com.throne212.fupin.biz.impl;

import com.throne212.fupin.biz.ProjectBiz;
import com.throne212.fupin.common.PageBean;
import com.throne212.fupin.dao.ProjectDao;
import com.throne212.fupin.domain.ProjectCun;
import com.throne212.fupin.domain.ProjectCunStat;
import com.throne212.fupin.domain.ProjectShStat;
import com.throne212.fupin.domain.ProjectShehui;
import com.throne212.fupin.domain.ProjectZdStat;
import com.throne212.fupin.domain.ProjectZhongdian;

public class ProjectBizImpl extends BaseBizImpl implements ProjectBiz {

	private ProjectDao projectDao;

	public ProjectDao getProjectDao() {
		return projectDao;
	}

	public void setProjectDao(ProjectDao projectDao) {
		this.projectDao = projectDao;
	}

	public PageBean<ProjectCun> getProjectCunList(Integer pageIndex) {
		return projectDao.getProjectList(ProjectCun.class, pageIndex);
	}

	public PageBean<ProjectZhongdian> getProjectZdList(Integer pageIndex) {
		return projectDao.getProjectList(ProjectZhongdian.class, pageIndex);
	}

	public PageBean<ProjectShehui> getProjectShList(Integer pageIndex) {
		return projectDao.getProjectList(ProjectShehui.class, pageIndex);
	}
	
	public ProjectCunStat getCunStat(ProjectCunStat param){
		return projectDao.getCunStat(param);
	}
	public ProjectZdStat getZdStat(ProjectZdStat param){
		return projectDao.getZdStat(param);
	}
	public ProjectShStat getShStat(ProjectShStat param){
		return projectDao.getShStat(param);
	}
}
