package com.throne212.tg.config;

import java.util.List;


public class MappingClass {
	//网页
	private String url;
	private String type;
	private String encode;
	//类型
	private String name;
	private String database;
	private String table;
	private String catelog;
	//属性
	private List<Property> propertyList;

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getTable() {
		return table;
	}

	public void setTable(String table) {
		this.table = table;
	}

	public String getCatelog() {
		return catelog;
	}

	public void setCatelog(String catelog) {
		this.catelog = catelog;
	}
	public String getUrl() {
		return url;
	}

	public void setUrl(String url) {
		this.url = url;
	}

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}

	public List<Property> getPropertyList() {
		return propertyList;
	}

	public void setPropertyList(List<Property> propertyList) {
		this.propertyList = propertyList;
	}

	public String getEncode() {
		return encode;
	}

	public void setEncode(String encode) {
		this.encode = encode;
	}

	public String getDatabase() {
		return database;
	}

	public void setDatabase(String database) {
		this.database = database;
	}

}
