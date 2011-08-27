package com.throne212.fupin.biz;

import com.throne212.fupin.common.PageBean;
import com.throne212.fupin.domain.ProjectCun;

public interface ProjectBiz extends BaseBiz {

	public PageBean<ProjectCun> getProjectCunList(Integer pageIndex);

}
