package com.throne212.oa.common;

import java.util.List;

public class PageBean {
	private long totalRow;	//������
	private int rowPerPage;	//ÿҳ��ʾ����
	private int pageIndex;	//��ǰ��ʾҳ��
	private List resultList;	//�������
	
	/**
	 * ���췽��
	 *
	 */
	public PageBean() {
	}
	
	/**
	 * ���췽��
	 *
	 */
	public PageBean(int totalRow, int rowPerPage, int pageIndex, List resultList) {
		this.totalRow = totalRow;
		this.rowPerPage = rowPerPage;
		this.pageIndex = pageIndex;
		this.resultList = resultList;
	}
	
	/**
	 * ��ȡ������
	 * @return
	 */
	public long getTotalRow() {
		return this.totalRow;
	}
	
	/**
	 * ����������
	 * @param totalRow
	 */
	public void setTotalRow(long totalRow) {
		this.totalRow = totalRow;
	}
	
	/**
	 * ��ȡÿҳ��ʾ����
	 * @return
	 */
	public int getRowPerPage() {
		return this.rowPerPage;
	}
	
	/**
	 * ����ÿҳ��ʾ����
	 * @param rowPerPage
	 */
	public void setRowPerPage(int rowPerPage) {
		this.rowPerPage = rowPerPage;
	}
	
	/**
	 * ��ȡ��ǰ��ʾҳ��
	 * @return
	 */
	public int getPageIndex() {
		return this.pageIndex;
	}
	
	/**
	 * ���õ�ǰ��ʾҳ��
	 * @param pageIndex
	 */
	public void setPageIndex(int pageIndex) {
		this.pageIndex = pageIndex;
	}
	
	/**
	 * ��ȡ��ҳ��
	 * @return
	 */
	public long getMaxPage() {
		if(rowPerPage == 0)
			return 0;
		long maxPage = (this.rowPerPage + this.totalRow - 1) / this.rowPerPage;
		return maxPage == 0 ? 1 : maxPage;
	}
	
	/**
	 * ��ȡ�������
	 * @return
	 */
	public List getResultList() {
		return this.resultList;
	}
	
	/**
	 * ���ý������
	 * @param resultList
	 */
	public void setResultList(List resultList) {
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

