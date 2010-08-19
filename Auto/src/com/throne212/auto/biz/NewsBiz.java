package com.throne212.auto.biz;

import java.util.Date;
import java.util.List;

import com.throne212.auto.common.PageBean;
import com.throne212.auto.domain.Brand;
import com.throne212.auto.domain.Insurance;
import com.throne212.auto.domain.Link;
import com.throne212.auto.domain.News;
import com.throne212.auto.domain.Sale;
import com.throne212.auto.domain.Special;
import com.throne212.auto.domain.Zhuangshi;

public interface NewsBiz extends BaseBiz{

	public News addNews(News news);
	
	public PageBean<News> getNews(int page);
	
	public PageBean<News> getNews(int page,int type);
	
	public News getLastedRecommendNews();
	public News getFocusNews();
	
	public PageBean<News> getNews(int page,String key);
	
	public PageBean<Special> getSpecials(int page,String key);
	
	public List<News> getTop9News();
	
	public List<News> getTop7News();
	
	public List<News> getTop7BaoYangNews();
	public List<News> getTop7ChengBenNews();
	public List<News> getTop3ZhuangShiNews();
	public List<News> getTop5BaoxianNews();
	
	public List<News> getTop5zjXindeNews();
	public List<News> getTop6jjXindeNews();
	public News getJjXindeRecommendNews();
	public List<News> getTop12BeijingNews();
	public News getBeijingRecommendNews();
	
	public News getBaoyangRecommendNews();
	public News getChengbenRecommendNews();
	
	public List<Special> getTop9Special();
	
	public List<Link> getLinkList();
	
	public List<News> getTop4RecommendImageNews();
	
	public List<News> getOther5RecommendNews(int type);
	
	public List<Insurance> getTop3Baoxian();
	
	public List<Zhuangshi> getTop3Zhuangshi();
	
	public List<Brand> getBrandList();
	public List<Brand> getBrandList(long saleId);
	public List<Brand> getChildBrandList(long brandId);
	public List<Brand> getTopBrandList();
	
	public List<Sale> getTop10Sale();
	public List<News> getTop10Xinde();
	
	public int batchSaveHtml(Date startDate,Date endDate);
	public int indexSaveHtml();
}
