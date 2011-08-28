package com.throne212.fupin.dao;

import com.throne212.fupin.common.PageBean;
import com.throne212.fupin.domain.Project;
import com.throne212.fupin.domain.ProjectCunStat;
import com.throne212.fupin.domain.ProjectShStat;
import com.throne212.fupin.domain.ProjectZdStat;

public interface ProjectDao extends BaseDao {

	public <T extends Project> PageBean<T> getProjectList(Class<T> clazz,Integer pageIndex);
	
	public ProjectCunStat getCunStat(ProjectCunStat param);
	public ProjectZdStat getZdStat(ProjectZdStat param);
	public ProjectShStat getShStat(ProjectShStat param);
}
