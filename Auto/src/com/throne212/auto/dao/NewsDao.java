package com.throne212.auto.dao;

import java.util.List;

import com.throne212.auto.domain.News;
import com.throne212.auto.domain.Special;


public interface NewsDao extends BaseDao{

	public List<News> getNewsList(int first,int max);
	public List<News> getNewsList(int first,int max,String key);
	public List<Special> getSpecialList(int first,int max,String key);
	public List<News> getNewsList(int first,int max,int type);
	public List<Special> getSpecialList(int first,int max);
	public long getNewsListCount();
	public long getNewsListCount(String key);
	public long getSpecialListCount(String key);
	
	public News getLastedRecommendNews();
	public News getFocusNews();
	
	public News getRecommendNews(int type);
	
	public List<News> getTop4RecommendImageNews();
	
}
