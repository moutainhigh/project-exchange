package com.throne212.tg.config;

public class Value {
	private String type;//解析类型，如：常量、用解析器、主键等等
	private String data;//常量的值
	private Parser parser;//解析器

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}

	public Parser getParser() {
		return parser;
	}

	public void setParser(Parser parser) {
		this.parser = parser;
	}

	public String getData() {
		return data;
	}

	public void setData(String data) {
		this.data = data;
	}

}
