package com.throne212.jianzhi8.common;

import java.util.List;

import org.apache.struts2.ServletActionContext;

import com.opensymphony.xwork2.ActionContext;

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

	public String getPagerJianzhi() {
		StringBuffer sb = new StringBuffer();
		String typeId = (String) ServletActionContext.getRequest().getAttribute("typeId");
		String ctClass = (String) ServletActionContext.getRequest().getAttribute("ctClass");
		if (typeId == null)
			typeId = "";
		if (ctClass != null && ctClass.equals("1"))
			ctClass = "0";
		else
			ctClass = "";
		// System.out.println("wlejfwlke" + typeId);
		int max = this.getMaxPage();

		for (int i = pageIndex - 5; i < pageIndex; i++) {
			if (i < 1)
				continue;
			sb.append("<A href='/jianzhi/" + typeId + "c" + ctClass + "p" + i + "' class='o'>" + i + "</A>");
		}

		sb.append("<B>" + pageIndex + "</B>&nbsp;");

		for (int i = pageIndex + 1; i <= pageIndex + 5; i++) {
			if (i >= max)
				break;
			sb.append("<A href='/jianzhi/" + typeId + "c" + ctClass + "p" + i + "' class='o'>" + i + "</A>");
		}

		if (pageIndex + 5 < max)
			sb.append("...");

		return sb.toString();
	}

	public String getPagerJob() {
		StringBuffer sb = new StringBuffer();
		String typeId = (String) ServletActionContext.getRequest().getAttribute("typeId");
		String ctClass = (String) ServletActionContext.getRequest().getAttribute("ctClass");
		if (typeId == null)
			typeId = "";
		if (ctClass != null && ctClass.equals("1"))
			ctClass = "0";
		else
			ctClass = "";
		// System.out.println("wlejfwlke" + typeId);
		int max = this.getMaxPage();

		for (int i = pageIndex - 5; i < pageIndex; i++) {
			if (i < 1)
				continue;
			sb.append("<A href='/job/" + typeId + "c" + ctClass + "p" + i + "' class='o'>" + i + "</A>");
		}

		sb.append("<B>" + pageIndex + "</B>&nbsp;");

		for (int i = pageIndex + 1; i <= pageIndex + 5; i++) {
			if (i >= max)
				break;
			sb.append("<A href='/job/" + typeId + "c" + ctClass + "p" + i + "' class='o'>" + i + "</A>");
		}

		if (pageIndex + 5 < max)
			sb.append("...");

		return sb.toString();
	}

	public String getPagerSearch() {
		StringBuffer sb = new StringBuffer();
		String key = (String) ServletActionContext.getRequest().getAttribute("key");
		String kind = (String) ServletActionContext.getRequest().getAttribute("kind");
		if(kind == null)
			kind = "";
		// System.out.println("wlejfwlke" + typeId);
		int max = this.getMaxPage();

		for (int i = pageIndex - 5; i < pageIndex; i++) {
			if (i < 1)
				continue;
			sb.append("<A href='/sk" + kind + "/" + key + "-" + i + "' class='o'>" + i + "</A>");
		}

		sb.append("<B>" + pageIndex + "</B>&nbsp;");

		for (int i = pageIndex + 1; i <= pageIndex + 5; i++) {
			if (i >= max)
				break;
			sb.append("<A href='/sk" + kind + "/" + key + "-" + i + "' class='o'>" + i + "</A>");
		}

		if (pageIndex + 5 < max)
			sb.append("...");

		return sb.toString();
	}
	
	public String getPagerRencai() {
		StringBuffer sb = new StringBuffer();
		String typeId = (String) ServletActionContext.getRequest().getAttribute("typeId");
		String ctClass = (String) ServletActionContext.getRequest().getAttribute("ctClass");
		if (typeId == null)
			typeId = "";
		if (ctClass == null)
			ctClass = "";
		int max = this.getMaxPage();

		for (int i = pageIndex - 5; i < pageIndex; i++) {
			if (i < 1)
				continue;
			sb.append("<A href='/rencai/" + typeId + "c" + ctClass + "p" + i + "' class='o'>" + i + "</A>");
		}

		sb.append("<B>" + pageIndex + "</B>&nbsp;");

		for (int i = pageIndex + 1; i <= pageIndex + 5; i++) {
			if (i >= max)
				break;
			sb.append("<A href='/rencai/" + typeId + "c" + ctClass + "p" + i + "' class='o'>" + i + "</A>");
		}

		if (pageIndex + 5 < max)
			sb.append("...");

		return sb.toString();
	}
	
	public String getPagerRenzheng() {
		StringBuffer sb = new StringBuffer();
		String typeId = (String) ServletActionContext.getRequest().getAttribute("typeId");
		String ctClass = (String) ServletActionContext.getRequest().getAttribute("ctClass");
		if (typeId == null)
			typeId = "";
		if (ctClass == null)
			ctClass = "";
		int max = this.getMaxPage();

		for (int i = pageIndex - 5; i < pageIndex; i++) {
			if (i < 1)
				continue;
			sb.append("<A href='/renzheng/" + typeId + "c" + ctClass + "p" + i + "' class='o'>" + i + "</A>");
		}

		sb.append("<B>" + pageIndex + "</B>&nbsp;");

		for (int i = pageIndex + 1; i <= pageIndex + 5; i++) {
			if (i >= max)
				break;
			sb.append("<A href='/renzheng/" + typeId + "c" + ctClass + "p" + i + "' class='o'>" + i + "</A>");
		}

		if (pageIndex + 5 < max)
			sb.append("...");

		return sb.toString();
	}
}
