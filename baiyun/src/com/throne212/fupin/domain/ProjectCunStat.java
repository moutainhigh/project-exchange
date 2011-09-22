package com.throne212.fupin.domain;

//项目完成状态
public class ProjectCunStat extends ProjectStat {

	private ProjectCun project;
	
	private String content;//下一步推进措施

	public ProjectCun getProject() {
		return project;
	}

	public void setProject(ProjectCun project) {
		this.project = project;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	} 
	

}
