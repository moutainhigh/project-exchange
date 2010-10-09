package com.throne212.tg.web.action;

public class TestAction {

	private String name;

	public String execute() {
		name = "测试名称001";
		return "success";
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

}
