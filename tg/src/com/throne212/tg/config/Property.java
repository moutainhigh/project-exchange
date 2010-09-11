package com.throne212.tg.config;

public class Property {
	private String name;//名称
	private String type;//类型
	private Value value;//值

	public Property() {
		super();
		// TODO Auto-generated constructor stub
	}

	public Property(String name, String type) {
		super();
		this.name = name;
		this.type = type;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}

	public Value getValue() {
		return value;
	}

	public void setValue(Value value) {
		this.value = value;
	}
}
