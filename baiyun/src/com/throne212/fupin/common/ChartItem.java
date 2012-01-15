package com.throne212.fupin.common;

public class ChartItem {

	private String dataXml;
	private String setXml;
	private String swf;
	private String divId;
	private String title;
	public Object[][] grid;
	private Integer height;

	public String getDataXml() {
		return dataXml;
	}

	public void setDataXml(String dataXml) {
		this.dataXml = dataXml;
	}

	public String getSetXml() {
		return setXml;
	}

	public void setSetXml(String setXml) {
		this.setXml = setXml;
	}

	public String getSwf() {
		return swf;
	}

	public void setSwf(String swf) {
		this.swf = swf;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public Object[][] getGrid() {
		return grid;
	}

	public void setGrid(Object[][] grid) {
		this.grid = grid;
	}

	public String getDivId() {
		return divId;
	}

	public void setDivId(String divId) {
		this.divId = divId;
	}

	public Integer getHeight() {
		return height;
	}

	public void setHeight(Integer height) {
		this.height = height;
	}

}
