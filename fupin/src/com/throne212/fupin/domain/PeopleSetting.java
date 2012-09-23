package com.throne212.fupin.domain;


//民意调查
public class PeopleSetting extends MyEntity {

	private Integer year;// 年份
	private Integer mount;// 份数

	public Integer getYear() {
		return year;
	}

	public void setYear(Integer year) {
		this.year = year;
	}

	public Integer getMount() {
		return mount;
	}

	public void setMount(Integer mount) {
		this.mount = mount;
	}

}
