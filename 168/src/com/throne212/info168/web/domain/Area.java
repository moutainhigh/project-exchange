package com.throne212.info168.web.domain;

import java.util.HashSet;
import java.util.Set;

public class Area {
	private Long id;//主键
	private String name;//地区名称
	private Area parent;//父地区
	private Integer grade;//排序级别
	private Set<Area> childs = new HashSet<Area>();//子地区

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
