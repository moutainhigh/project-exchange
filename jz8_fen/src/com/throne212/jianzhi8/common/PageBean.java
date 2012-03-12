package com.throne212.jianzhi8.common;

import java.net.URLEncoder;
import java.util.List;

public class PageBean<T> {
	private int totalRow;
	private int rowPerPage;
	private int pageIndex;
	private List<T> resultList;
	private Object total;

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

	public String getPaper(String href, String key){
		StringBuffer sb = new StringBuffer();
		int max = this.getMaxPage();
		for (int i = pageIndex - 5; i < pageIndex; i++) {
			if (i < 1)
				continue;
			sb.append("<a href=\"" + href + "p" + i + key +"\">" + i + "</a>");
			sb.append("&nbsp;");
		}
		sb.append("<b>" + pageIndex + "</b>&nbsp;");
		for (int i = pageIndex + 1; i <= pageIndex + 5; i++) {
			if (i >= max)
				break;
			sb.append("<a href=\"" + href + "p" + i + key + "\">" + i + "</a>");
			sb.append("&nbsp;");
		}
		if (pageIndex + 5 < max)
			sb.append("...");
		return sb.toString();
	}
	
	public String getSearchPaper(String key){
		StringBuffer sb = new StringBuffer();
		int max = this.getMaxPage();
		for (int i = pageIndex - 5; i < pageIndex; i++) {
			if (i < 1)
				continue;
			sb.append("<a href=\"/s/p" + i + key + "\">" + i + "</a>");
			sb.append("&nbsp;");
		}
		sb.append("<b>" + pageIndex + "</b>&nbsp;");
		for (int i = pageIndex + 1; i <= pageIndex + 5; i++) {
			if (i >= max)
				break;
			sb.append("<a href=\"/s/p" + i + key + "\">" + i + "</a>");
			sb.append("&nbsp;");
		}
		if (pageIndex + 5 < max)
			sb.append("...");
		return sb.toString();
	}
}
