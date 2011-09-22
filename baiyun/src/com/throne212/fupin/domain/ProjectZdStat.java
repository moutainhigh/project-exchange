package com.throne212.fupin.domain;

//项目完成状态
public class ProjectZdStat extends ProjectStat {

	private ProjectZhongdian project;
	
	private String content;//下一步推进措施

	public ProjectZhongdian getProject() {
		return project;
	}

	public void setProject(ProjectZhongdian project) {
		this.project = project;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	} 
	

}
