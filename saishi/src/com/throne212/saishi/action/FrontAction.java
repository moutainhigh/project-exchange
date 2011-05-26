package com.throne212.saishi.action;

import java.util.List;

import com.throne212.saishi.biz.DataBiz;
import com.throne212.saishi.domain.Content;
import com.throne212.saishi.domain.News;
import com.throne212.saishi.domain.Tixing;


public class FrontAction extends BaseAction {
	private DataBiz dataBiz;

	public String news() {
		
		return "news";
	}

	private Content c;
	private List<News> newsList;
	private List<Tixing> tixingList;
	public String index() {
		List<Content> list = dataBiz.getAll(Content.class);
		if(list != null && list.size() > 0)
			c = list.get(0);
		newsList = dataBiz.getTop10News();
		tixingList = dataBiz.getTop5Tixing();
		return "index";
	}
	
	public Content getC() {
		return c;
	}
	public void setC(Content c) {
		this.c = c;
	}


	public List<News> getNewsList() {
		return newsList;
	}

	public void setNewsList(List<News> newsList) {
		this.newsList = newsList;
	}

	public DataBiz getDataBiz() {
		return dataBiz;
	}

	public void setDataBiz(DataBiz dataBiz) {
		this.dataBiz = dataBiz;
	}

	public List<Tixing> getTixingList() {
		return tixingList;
	}

	public void setTixingList(List<Tixing> tixingList) {
		this.tixingList = tixingList;
	}
}
