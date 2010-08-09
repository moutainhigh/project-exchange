package com.throne212.auto.biz.impl;

import java.util.Date;
import java.util.List;

import com.throne212.auto.biz.NewsBiz;
import com.throne212.auto.common.PageBean;
import com.throne212.auto.common.WebConstants;
import com.throne212.auto.dao.NewsDao;
import com.throne212.auto.domain.News;
import com.throne212.auto.domain.Special;

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
		bean.setTotalRow((int)newsDao.getNewsListCount());
		return bean;
	}
	
	public PageBean<News> getNews(int pageIndex,int type) {
		PageBean<News> bean = new PageBean<News>();
		if(pageIndex == 0){
			pageIndex = 1;
		}
		int startIndex = (pageIndex-1) * WebConstants.maxRowPerPage;
		bean.setResultList(newsDao.getNewsList(startIndex, WebConstants.maxRowPerPage,type));
		bean.setPageIndex(pageIndex);
		bean.setRowPerPage(WebConstants.maxRowPerPage);
		bean.setTotalRow((int)newsDao.getNewsListCount());
		return bean;
	}

	public News getLastedRecommendNews() {
		return newsDao.getLastedRecommendNews();
	}

	public PageBean<News> getNews(int pageIndex, String key) {
		PageBean<News> bean = new PageBean<News>();
		if(pageIndex == 0){
			pageIndex = 1;
		}
		int startIndex = (pageIndex-1) * WebConstants.maxRowPerPage;
		bean.setResultList(newsDao.getNewsList(startIndex, WebConstants.maxRowPerPage,key));
		bean.setPageIndex(pageIndex);
		bean.setRowPerPage(WebConstants.maxRowPerPage);
		bean.setTotalRow((int)newsDao.getNewsListCount(key));
		return bean;
	}
	public PageBean<Special> getSpecials(int pageIndex, String key) {
		PageBean<Special> bean = new PageBean<Special>();
		if(pageIndex == 0){
			pageIndex = 1;
		}
		int startIndex = (pageIndex-1) * WebConstants.maxRowPerPage;
		bean.setResultList(newsDao.getSpecialList(startIndex, WebConstants.maxRowPerPage,key));
		bean.setPageIndex(pageIndex);
		bean.setRowPerPage(WebConstants.maxRowPerPage);
		bean.setTotalRow((int)newsDao.getSpecialListCount(key));
		return bean;
	}
	public List<News> getTop9News(){
		return newsDao.getNewsList(0, 9, WebConstants.NEWS_NEWS);
	}
	public List<News> getTop7News(){
		return newsDao.getNewsList(0, 7);
	}
	public List<News> getTop7BaoYangNews(){
		return newsDao.getNewsList(0, 7, WebConstants.NEWS_BAOYANG);
	}
	public List<News> getTop7ChengBenNews(){
		return newsDao.getNewsList(0, 7, WebConstants.NEWS_CHENGBEN);
	}
	public List<News> getTop3ZhuangShiNews(){
		return newsDao.getNewsList(0, 3, WebConstants.NEWS_ZHUANGSHI);
	}
	public List<News> getTop5BaoxianNews(){
		return newsDao.getNewsList(0, 5, WebConstants.NEWS_BAOXIAN);
	}
	
	public List<Special> getTop9Special(){
		return newsDao.getSpecialList(0, 9);
	}

	public List<News> getTop12BeijingNews() {
		return newsDao.getNewsList(0, 12, WebConstants.NEWS_BEIJING);
	}

	public List<News> getTop5zjXindeNews() {
		return newsDao.getNewsList(0, 5, WebConstants.NEWS_ZHONGJI_XINDE);
	}

	public List<News> getTop6jjXindeNews() {
		return newsDao.getNewsList(0, 6, WebConstants.NEWS_JINGJI_XINDE);
	}
	
}
