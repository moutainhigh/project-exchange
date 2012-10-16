package com.throne212.tui5.common;

import java.util.List;

public class PageBean<T> {
	private int totalRow;
	private int rowPerPage;
	private int pageIndex;
	private List<T> resultList;
	private Object total;
	private String typeName;
	private String queryTypeName;
	private String title;
	private String keywords;
	private String description;
	private String ggkeywords;
	private String typename;
	private String pages;
	private boolean isnext;
	public PageBean() {
	}

	public PageBean(int totalRow, int rowPerPage, int pageIndex, List<T> resultList) {
		this.totalRow = totalRow;
		this.rowPerPage = rowPerPage;
		this.pageIndex = pageIndex;
		this.resultList = resultList;
	}

	public int getTotalRow() {
		return this.totalRow;
	}

	public void setTotalRow(int totalRow) {
		this.totalRow = totalRow;
	}
	
	public boolean getIsnext() {
		return this.isnext;
	}

	public void setIsnext(boolean isnext) {
		this.isnext = isnext;
	}
	public int getRowPerPage() {
		return this.rowPerPage;
	}

	public void setRowPerPage(int rowPerPage) {
		this.rowPerPage = rowPerPage;
	}

	public int getPageIndex() {
		return this.pageIndex;
	}

	public void setPageIndex(int pageIndex) {
		this.pageIndex = pageIndex;
	}

	public int getMaxPage() {
		if (rowPerPage == 0)
			return 0;
		int maxPage = (this.rowPerPage + this.totalRow - 1) / this.rowPerPage;
		return maxPage == 0 ? 1 : maxPage;
	}

	public List<T> getResultList() {
		return this.resultList;
	}

	public void setResultList(List<T> resultList) {
		this.resultList = resultList;
	}

	public boolean getIsFirstPage() {
		return this.getPageIndex() == 1;
	}

	public boolean getIsLastPage() {
		return this.getPageIndex() == this.getMaxPage();
	}

	public int getPrePageIndex() {
		return this.getIsFirstPage() ? 1 : (this.pageIndex - 1);
	}

	public int getNextPageIndex() {
		return this.getIsLastPage() ? this.pageIndex : (this.pageIndex + 1);
	}

	public Object getTotal() {
		return total;
	}

	public void setTotal(Object total) {
		this.total = total;
	}
	
	public String getQueryTypeName() {
		return queryTypeName;
	}

	public void setQueryTypeName(String queryTypeName) {
		this.queryTypeName = queryTypeName;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getKeywords() {
		return keywords;
	}

	public void setKeywords(String keywords) {
		this.keywords = keywords;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public String getGgkeywords() {
		return ggkeywords;
	}

	public void setGgkeywords(String ggkeywords) {
		this.ggkeywords = ggkeywords;
	}

	public String getTypeName() {
		return typeName;
	}

	public void setTypeName(String typeName) {
		this.typeName = typeName;
	}

	public void setTypename(String typename) {
		this.typename = typename;
	}

	public String getTypename() {
		return typename;
	}

	public String getPages() {
		return pages;
	}

	public void setPages(String pages) {
		this.pages = pages;
	}
}
