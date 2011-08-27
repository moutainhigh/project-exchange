package com.throne212.fupin.dao;

import com.throne212.fupin.common.PageBean;
import com.throne212.fupin.domain.Project;

public interface ProjectDao extends BaseDao {

	public <T extends Project> PageBean<T> getProjectList(Class<T> clazz,Integer pageIndex);
}
