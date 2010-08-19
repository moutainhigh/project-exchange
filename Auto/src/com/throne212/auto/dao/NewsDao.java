package com.throne212.auto.dao;

import java.util.Date;
import java.util.List;

import com.throne212.auto.domain.Brand;
import com.throne212.auto.domain.Insurance;
import com.throne212.auto.domain.News;
import com.throne212.auto.domain.Sale;
import com.throne212.auto.domain.Special;
import com.throne212.auto.domain.Zhuangshi;


public interface NewsDao extends BaseDao{

	public List<News> getNewsList(int first,int max);
	public List<News> getNewsList(int first,int max,String key);
	public List<Special> getSpecialList(int first,int max,String key);
	public List<News> getNewsList(int first,int max,int type);
	public List<Special> getSpecialList(int first,int max);
	public List<Special> getSpecialRecommentList(int first,int max);
	public long getNewsListCount();
	public long getNewsListCount(int type);
	public long getNewsListCount(String key);

	public long getSpecialListCount(String key);
	
	public News getLastedRecommendNews();
	public News getFocusNews();
	
	public News getRecommendNews(int type);
	
	public List<News> getTop4RecommendImageNews();
	
	public List<Insurance> getTop3Baoxian();
	public List<Zhuangshi> getTop3Zhuangshi();
	
	public List<Brand> getBrandList();
	public List<Brand> getBrandList(Sale sale);
	public List<Brand> getChildBrandList(Brand parent);
	public List<Brand> getTopBrandList();
	
	public List<Sale> getTop10Sale();
	public List<News> getTop10Xinde();
	
	public List<News> getAllNews(Date startDate,Date endDate);
}
