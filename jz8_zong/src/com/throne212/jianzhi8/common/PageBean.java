package com.throne212.jianzhi8.common;

import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
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

	/*
	 * 不计算总页数，只显示下nextnum页。
	 */
	public String getPaper(String href,int nextnum){
		StringBuffer sb = new StringBuffer();
		for (int i = pageIndex - 5; i < pageIndex; i++) {
			if (i < 1)
				continue;
			sb.append("<a href=\"" + href + "p" + i +"/\">" + i + "</a>");
		}
		sb.append("<b>" + pageIndex + "</b>");
		for (int i = pageIndex + 1; i <= pageIndex + nextnum; i++) {
			if (!this.isnext)
				break;
			sb.append("<a href=\"" + href + "p" + i + "/\">" + i + "</a>");
		}
		//System.out.print(this.isnext+"   "+nextnum);
		return sb.toString();
	}
	
	
	public String getPaper(String href){
		StringBuffer sb = new StringBuffer();
		//int max = this.resultList.size();
		int max = this.getMaxPage();
		for (int i = pageIndex - 5; i < pageIndex; i++) {
			if (i < 1)
				continue;
			sb.append("<a href=\"" + href + "p" + i +"/\">" + i + "</a>");
		}
		sb.append("<b>" + pageIndex + "</b>");
		for (int i = pageIndex + 1; i <= pageIndex + 5; i++) {
			if (i > max)
				break;
			sb.append("<a href=\"" + href + "p" + i + "/\">" + i + "</a>");
		}
//		if (pageIndex + 5 < max)
//			sb.append("...");
		return sb.toString();
	}
	
	public String getPaper(String href, String key){
		StringBuffer sb = new StringBuffer();
		//int max = this.resultList.size();
		int max = this.getMaxPage();
		for (int i = pageIndex - 5; i < pageIndex; i++) {
			if (i < 1)
				continue;
			sb.append("<a href=\"" + href + "p" + i + key +"\">" + i + "</a>");
		}
		sb.append("<b>" + pageIndex + "</b>");
		for (int i = pageIndex + 1; i <= pageIndex + 5; i++) {
			if (i >= max)
				break;
			sb.append("<a href=\"" + href + "p" + i + key + "\">" + i + "</a>");
		}
//		if (pageIndex + 5 < max)
//			sb.append("...");
		return sb.toString();
	}
	
	
	public String getSearchPaper(String ctclass,String key) throws UnsupportedEncodingException{
		if(ctclass==null) ctclass="";
		key=key.replaceAll("兼职", "");
		if("0".equals(ctclass)||"1".equals(ctclass)||"".equals(ctclass))
			key=key+"兼职";
		if(key!=null) key=java.net.URLEncoder.encode(key,"utf-8");
		StringBuffer sb = new StringBuffer();
		int max = this.getMaxPage();
		for (int i = pageIndex - 5; i < pageIndex; i++) {
			if (i < 1)
				continue;
			if(ctclass.length()==0)
			sb.append("<a href=\"/s/"+ key +"/p"+ i + "/\">" + i + "</a>");
			else
				sb.append("<a href=\"/sk"+ctclass+"/"+ key +"/p"+ i + "/\">" + i + "</a>");
			//sb.append("&nbsp;");
		}
		sb.append("<b>" + pageIndex + "</b>");
		for (int i = pageIndex + 1; i <= pageIndex + 5; i++) {
			if (i >= max)
				break;
			if(ctclass.length()==0)
			sb.append("<a href=\"/s/"+ key + "/p"+i+"/\">" + i + "</a>");
			else
			sb.append("<a href=\"/sk"+ctclass+"/"+ key + "/p"+i+"/\">" + i + "</a>");	
			//sb.append("&nbsp;");
		}
		//if (pageIndex + 5 < max)
		//	sb.append("...");
		return sb.toString();
	}

	/*
	 * 没有统计总数。每次只显示当前页面的下一页。如果当前页信息条数小于30 则没有下一条。
	 */
	public String getSearchPaper2(String ctclass,String key,int nextnum) throws UnsupportedEncodingException{
		if(ctclass==null) ctclass="";
		key=key.replaceAll("兼职", "");
		if("0".equals(ctclass)||"1".equals(ctclass)||"".equals(ctclass))
			key=key+"兼职";
		if(key!=null) key=java.net.URLEncoder.encode(key,"utf-8");
		StringBuffer sb = new StringBuffer();
//		int max = this.getMaxPage();
		
		for (int i = pageIndex - 5; i < pageIndex; i++) {
			if (i < 1)
				continue;
			if(ctclass.length()==0)
			sb.append("<a href=\"/s/"+ key +"/p"+ i + "/\">" + i + "</a>");
			else
				sb.append("<a href=\"/sk"+ctclass+"/"+ key +"/p"+ i + "/\">" + i + "</a>");
			//sb.append("&nbsp;");
		}
		sb.append("<b>" + pageIndex + "</b>");
		for (int i = pageIndex + 1; i <= pageIndex + nextnum; i++) {
			if (!this.isnext)
				break;
			if(ctclass.length()==0)
			sb.append("<a href=\"/s/"+ key + "/p"+i+"/\">" + i + "</a>");
			else
			sb.append("<a href=\"/sk"+ctclass+"/"+ key + "/p"+i+"/\">" + i + "</a>");	
		}
		return sb.toString();
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
