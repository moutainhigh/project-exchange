package com.throne212.tui5.domain;

import java.util.List;

//分类
public class Task {

	private String id;
	private String pinyin;
	private String name;
	private String parentId;

	//用于显示，不存储
	private List<Task> childs;
	
	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getPinyin() {
		return pinyin;
	}

	public void setPinyin(String pinyin) {
		this.pinyin = pinyin;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getParentId() {
		return parentId;
	}

	public void setParentId(String parentId) {
		this.parentId = parentId;
	}

	public List<Task> getChilds() {
		return childs;
	}

	public void setChilds(List<Task> childs) {
		this.childs = childs;
	}

}
