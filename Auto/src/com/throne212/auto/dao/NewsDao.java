package com.throne212.auto.dao;

import java.util.List;

import com.throne212.auto.domain.News;


public interface NewsDao extends BaseDao{

	public List<News> getNewsList(int first,int max);
	public List<News> getNewsList(int first,int max,int type);
	public long getNewsListCount();
	
}
