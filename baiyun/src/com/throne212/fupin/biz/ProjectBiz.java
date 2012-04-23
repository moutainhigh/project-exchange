package com.throne212.fupin.biz;

import com.throne212.fupin.common.PageBean;
import com.throne212.fupin.domain.ProjectCun;
import com.throne212.fupin.domain.ProjectCunStat;
import com.throne212.fupin.domain.ProjectShStat;
import com.throne212.fupin.domain.ProjectShehui;
import com.throne212.fupin.domain.ProjectZdStat;
import com.throne212.fupin.domain.ProjectZhongdian;

public interface ProjectBiz extends BaseBiz {

	public PageBean<ProjectCun> getProjectCunList(Integer pageIndex);
	
	public PageBean<ProjectZhongdian> getProjectZdList(Integer pageIndex);
	
	public PageBean<ProjectShehui> getProjectShList(Integer pageIndex);
	
	//进度
	
	public ProjectCunStat getCunStat(ProjectCunStat param);
	public ProjectCunStat getCunStat(ProjectCunStat param,Long cunId);
	public ProjectZdStat getZdStat(ProjectZdStat param);
	public ProjectShStat getShStat(ProjectShStat param);

}
