package com.throne212.fupin.biz.impl;

import com.throne212.fupin.biz.ProjectBiz;
import com.throne212.fupin.common.PageBean;
import com.throne212.fupin.dao.ProjectDao;
import com.throne212.fupin.domain.ProjectCun;

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

}
