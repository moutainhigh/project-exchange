package com.throne212.info168.web.domain;

import java.util.HashSet;
import java.util.Set;

//信息分类
public class Category implements Comparable<Category> {
	private Long id;// 主键
	private String name;// 分类名称
	private Category parent;// 父分类
	private Integer grade;// 排序级别
	private String pinyin;//拼音
	private Set<Category> childs = new HashSet<Category>();// 子分类集合

	public Category() {
		super();
	}

	public Category(String name) {
		super();
		this.name = name;
	}

	public Category(String name, Integer grade) {
		super();
		this.name = name;
		this.grade = grade;
	}

	public Category(String name, Category parent) {
		super();
		this.name = name;
		this.parent = parent;
	}

	public Category(String name, Category parent, Integer grade, Set<Category> childs) {
		super();
		this.name = name;
		this.parent = parent;
		this.grade = grade;
		this.childs = childs;
	}

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

	public Category getParent() {
		return parent;
	}

	public void setParent(Category parent) {
		this.parent = parent;
	}

	public Integer getGrade() {
		return grade;
	}

	public void setGrade(Integer grade) {
		this.grade = grade;
	}

	public Set<Category> getChilds() {
		return childs;
	}

	public void setChilds(Set<Category> childs) {
		this.childs = childs;
	}

	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + ((id == null) ? 0 : id.hashCode());
		result = prime * result + ((name == null) ? 0 : name.hashCode());
		return result;
	}

	public String getPinyin() {
		return pinyin;
	}

	public void setPinyin(String pinyin) {
		this.pinyin = pinyin;
	}

	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		final Category other = (Category) obj;
		if (id == null) {
			if (other.id != null)
				return false;
		} else if (!id.equals(other.id))
			return false;
		if (name == null) {
			if (other.name != null)
				return false;
		} else if (!name.equals(other.name))
			return false;
		return true;
	}

	public int compareTo(Category o) {
		if (o == null || o.getGrade() == null || o.getId() == null)
			return 1;
		else if (this.grade != null)
			return this.grade - o.getGrade();
		else if (this.getId() != null)
			return (int) (this.getId() - o.getId());
		return 0;
	}

}
