package com.throne212.info168.web.common;

import java.util.List;

public class PageBean<T> {
	private int totalRow;	//总行数
	private int rowPerPage;	//每页显示行数
	private int pageIndex;	//当前显示页码
	private List<T> resultList;	//结果集合
	
	/**
	 * 构造方法
	 *
	 */
	public PageBean() {
	}
	
	/**
	 * 构造方法
	 *
	 */
	public PageBean(int totalRow, int rowPerPage, int pageIndex, List<T> resultList) {
		this.totalRow = totalRow;
		this.rowPerPage = rowPerPage;
		this.pageIndex = pageIndex;
		this.resultList = resultList;
	}
	
	/**
	 * 获取总行数
	 * @return
	 */
	public int getTotalRow() {
		return this.totalRow;
	}
	
	/**
	 * 设置总行数
	 * @param totalRow
	 */
	public void setTotalRow(int totalRow) {
		this.totalRow = totalRow;
	}
	
	/**
	 * 获取每页显示行数
	 * @return
	 */
	public int getRowPerPage() {
		return this.rowPerPage;
	}
	
	/**
	 * 设置每页显示行数
	 * @param rowPerPage
	 */
	public void setRowPerPage(int rowPerPage) {
		this.rowPerPage = rowPerPage;
	}
	
	/**
	 * 获取当前显示页码
	 * @return
	 */
	public int getPageIndex() {
		return this.pageIndex;
	}
	
	/**
	 * 设置当前显示页码
	 * @param pageIndex
	 */
	public void setPageIndex(int pageIndex) {
		this.pageIndex = pageIndex;
	}
	
	/**
	 * 获取总页数
	 * @return
	 */
	public int getMaxPage() {
		if(rowPerPage == 0)
			return 0;
		int maxPage = (this.rowPerPage + this.totalRow - 1) / this.rowPerPage;
		return maxPage == 0 ? 1 : maxPage;
	}
	
	/**
	 * 获取结果集合
	 * @return
	 */
	public List<T> getResultList() {
		return this.resultList;
	}
	
	/**
	 * 设置结果集合
	 * @param resultList
	 */
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
}

