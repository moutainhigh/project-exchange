package com.throne212.info168.web.domain;

public class TopPriceSetting extends Setting {

	private Category cate;// 所属分类
	private Double price;//置顶价格
	private Area area;//所属地区

	public Double getPrice() {
		return price;
	}

	public void setPrice(Double price) {
		this.price = price;
	}

	public Category getCate() {
		return cate;
	}

	public void setCate(Category cate) {
		this.cate = cate;
	}

	public Area getArea() {
		return area;
	}

	public void setArea(Area area) {
		this.area = area;
	}

}
