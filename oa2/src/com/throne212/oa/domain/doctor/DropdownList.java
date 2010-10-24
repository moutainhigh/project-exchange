package com.throne212.oa.domain.doctor;

//所有下来别表的父类
public abstract class DropdownList {
	protected Long id;//主键
	protected String name;//名称
	protected String description;//描述

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

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

}
