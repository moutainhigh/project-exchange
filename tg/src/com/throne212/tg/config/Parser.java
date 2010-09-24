package com.throne212.tg.config;

public class Parser {
	private String type;//解析类型，table，heading
	private Integer index;//标签所属索引，类似于jquery.eq(index)
	private String exclude;//排斥正则
	private String pattern;//匹配正则

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}

	public String getExclude() {
		return exclude;
	}

	public void setExclude(String exclude) {
		this.exclude = exclude;
	}

	public String getPattern() {
		return pattern;
	}

	public void setPattern(String pattern) {
		this.pattern = pattern;
	}

	public Integer getIndex() {
		return index;
	}

	public void setIndex(Integer index) {
		this.index = index;
	}

}
