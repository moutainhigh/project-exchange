package com.throne212.info168.web.domain;

import java.util.HashSet;
import java.util.Set;

public class Area {
	private Long id;
	private String name;
	private Area parent;
	private Integer grade;
	private Set<Area> childs = new HashSet<Area>();

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public Area getParent() {
		return parent;
	}

	public void setParent(Area parent) {
		this.parent = parent;
	}

	public Integer getGrade() {
		return grade;
	}

	public void setGrade(Integer grade) {
		this.grade = grade;
	}

	public Set<Area> getChilds() {
		return childs;
	}

	public void setChilds(Set<Area> childs) {
		this.childs = childs;
	}

}
