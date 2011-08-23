package com.throne212.fupin.action;

import com.throne212.fupin.domain.ProjectCun;

public class ProjectAction extends BaseAction {

	// 村项目管理
	private ProjectCun proCun;

	public String saveProCun() {
		
		return "project_cun";
	}

	public ProjectCun getProCun() {
		return proCun;
	}

	public void setProCun(ProjectCun proCun) {
		this.proCun = proCun;
	}

}
