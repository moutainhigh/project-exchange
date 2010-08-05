package com.throne212.auto.biz.impl;

import java.util.Date;

import com.throne212.auto.biz.NewsBiz;
import com.throne212.auto.common.PageBean;
import com.throne212.auto.common.WebConstants;
import com.throne212.auto.dao.BaseDao;
import com.throne212.auto.dao.NewsDao;
import com.throne212.auto.domain.News;

public class NewsBizImpl extends BaseBizImpl implements NewsBiz {
	
	private NewsDao newsDao;

	public void setNewsDao(NewsDao newsDao) {
		this.newsDao = newsDao;
	}

	public News addNews(News news) {
		news.setPublishDate(new Date());
		super.baseDao.saveOrUpdate(news);
		return news;
	}

	public PageBean<News> getNews(int pageIndex) {
		PageBean<News> bean = new PageBean<News>();
		if(pageIndex == 0){
			pageIndex = 1;
		}
		int startIndex = (pageIndex-1) * WebConstants.maxRowPerPage;
		bean.setResultList(newsDao.getNewsList(startIndex, WebConstants.maxRowPerPage));
		bean.setPageIndex(pageIndex);
		bean.setRowPerPage(WebConstants.maxRowPerPage);
		bean.setTotalRow((int)newsDao.getNewsListCount(startIndex, WebConstants.maxRowPerPage));
		return bean;
	}
	
}
