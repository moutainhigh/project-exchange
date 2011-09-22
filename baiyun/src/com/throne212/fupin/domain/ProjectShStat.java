package com.throne212.fupin.domain;

//项目完成状态
public class ProjectShStat extends ProjectStat {

	private ProjectShehui project;
	
	private String preDate;//预计完成时间

	public ProjectShehui getProject() {
		return project;
	}

	public void setProject(ProjectShehui project) {
		this.project = project;
	}

	public String getPreDate() {
		return preDate;
	}

	public void setPreDate(String preDate) {
		this.preDate = preDate;
	} 
	

}
