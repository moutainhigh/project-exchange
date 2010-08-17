package com.throne212.auto.biz.impl;

import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.ServletActionContext;

import com.throne212.auto.biz.NewsBiz;
import com.throne212.auto.common.PageBean;
import com.throne212.auto.common.WebConstants;
import com.throne212.auto.dao.NewsDao;
import com.throne212.auto.domain.Brand;
import com.throne212.auto.domain.Insurance;
import com.throne212.auto.domain.Link;
import com.throne212.auto.domain.News;
import com.throne212.auto.domain.Sale;
import com.throne212.auto.domain.Special;
import com.throne212.auto.domain.Zhuangshi;

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
		if (pageIndex == 0) {
			pageIndex = 1;
		}
		int startIndex = (pageIndex - 1) * WebConstants.maxRowPerPage;
		bean.setResultList(newsDao.getNewsList(startIndex, WebConstants.maxRowPerPage));
		bean.setPageIndex(pageIndex);
		bean.setRowPerPage(WebConstants.maxRowPerPage);
		bean.setTotalRow((int) newsDao.getNewsListCount());
		return bean;
	}

	public PageBean<News> getNews(int pageIndex, int type) {
		PageBean<News> bean = new PageBean<News>();
		if (pageIndex == 0) {
			pageIndex = 1;
		}
		int startIndex = (pageIndex - 1) * WebConstants.maxRowPerPage;
		bean.setResultList(newsDao.getNewsList(startIndex, WebConstants.maxRowPerPage, type));
		bean.setPageIndex(pageIndex);
		bean.setRowPerPage(WebConstants.maxRowPerPage);
		bean.setTotalRow((int) newsDao.getNewsListCount(type));
		return bean;
	}

	public News getLastedRecommendNews() {
		return newsDao.getLastedRecommendNews();
	}

	public News getFocusNews() {
		return newsDao.getFocusNews();
	}

	public News getJjXindeRecommendNews() {
		return newsDao.getRecommendNews(WebConstants.NEWS_JINGJI_XINDE);
	}

	public News getBeijingRecommendNews() {
		return newsDao.getRecommendNews(WebConstants.NEWS_BEIJING);
	}

	public News getBaoyangRecommendNews() {
		return newsDao.getRecommendNews(WebConstants.NEWS_BAOYANG);
	}

	public News getChengbenRecommendNews() {
		return newsDao.getRecommendNews(WebConstants.NEWS_CHENGBEN);
	}

	public PageBean<News> getNews(int pageIndex, String key) {
		PageBean<News> bean = new PageBean<News>();
		if (pageIndex == 0) {
			pageIndex = 1;
		}
		int startIndex = (pageIndex - 1) * WebConstants.maxRowPerPage;
		bean.setResultList(newsDao.getNewsList(startIndex, WebConstants.maxRowPerPage, key));
		bean.setPageIndex(pageIndex);
		bean.setRowPerPage(WebConstants.maxRowPerPage);
		bean.setTotalRow((int) newsDao.getNewsListCount(key));
		return bean;
	}

	public PageBean<Special> getSpecials(int pageIndex, String key) {
		PageBean<Special> bean = new PageBean<Special>();
		if (pageIndex == 0) {
			pageIndex = 1;
		}
		int startIndex = (pageIndex - 1) * WebConstants.maxRowPerPage;
		bean.setResultList(newsDao.getSpecialList(startIndex, WebConstants.maxRowPerPage, key));
		bean.setPageIndex(pageIndex);
		bean.setRowPerPage(WebConstants.maxRowPerPage);
		bean.setTotalRow((int) newsDao.getSpecialListCount(key));
		return bean;
	}

	public List<News> getTop9News() {
		return newsDao.getNewsList(0, 9, WebConstants.NEWS_NEWS);
	}

	public List<News> getTop7News() {
		return newsDao.getNewsList(0, 7);
	}

	public List<News> getTop7BaoYangNews() {
		return newsDao.getNewsList(0, 7, WebConstants.NEWS_BAOYANG);
	}

	public List<News> getTop7ChengBenNews() {
		return newsDao.getNewsList(0, 7, WebConstants.NEWS_CHENGBEN);
	}

	public List<News> getTop3ZhuangShiNews() {
		return newsDao.getNewsList(0, 3, WebConstants.NEWS_ZHUANGSHI);
	}

	public List<News> getTop5BaoxianNews() {
		return newsDao.getNewsList(0, 5, WebConstants.NEWS_BAOXIAN);
	}

	public List<Special> getTop9Special() {
		return newsDao.getSpecialRecommentList(0, 9);
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

	public List<Link> getLinkList() {
		return newsDao.getAll(Link.class, "orderNum", "asc");
	}

	public List<News> getTop4RecommendImageNews() {
		return newsDao.getTop4RecommendImageNews();
	}

	public List<News> getOther5RecommendNews(int type) {
		return newsDao.getNewsList(0, 6, type);
	}

	public List<Insurance> getTop3Baoxian() {
		return newsDao.getTop3Baoxian();
	}

	public List<Zhuangshi> getTop3Zhuangshi() {
		return newsDao.getTop3Zhuangshi();
	}

	public List<Brand> getBrandList() {
		return newsDao.getBrandList();
	}

	public List<Brand> getChildBrandList(long brandId) {
		Brand parent = this.getEntityById(Brand.class, brandId);
		return newsDao.getChildBrandList(parent);
	}

	public List<Brand> getTopBrandList() {
		return newsDao.getTopBrandList();
	}

	public List<Brand> getBrandList(long saleId) {
		Sale sale = this.getEntityById(Sale.class, saleId);
		return newsDao.getBrandList(sale);
	}

	public List<Sale> getTop10Sale() {
		List<Sale> list = newsDao.getTop10Sale();
		return list;
	}

	public List<News> getTop10Xinde() {
		return newsDao.getTop10Xinde();
	}

	public void batchSaveHtml() {
		List<News> list = newsDao.getAll(News.class);		
		if (list != null && list.size() > 0) {
			for (News n : list) {
				FileOutputStream fos = null;
				try {
					String newsName = "news";
					if(n.getCategory() == null || n.getCategory().getOrderNum() <= 0){
						newsName = "special";
					}
					//String no = System.currentTimeMillis()+"";
					String no = n.getNo();
					String path = Thread.currentThread().getContextClassLoader().getResource("/").getPath();
					path = path.substring(0, path.indexOf("WEB-INF"));
					path += "news/" + no + ".html";
					fos = new FileOutputStream(path);

					HttpServletRequest request = ServletActionContext.getRequest();
					String newsPath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
							+ request.getContextPath() + "/" + newsName + ".htm?" + newsName + ".id=" + n.getId();

					URL url = new URL(newsPath);
					HttpURLConnection conn = (HttpURLConnection) url.openConnection();
					conn.setRequestMethod("GET");
					conn.setDoOutput(true);
					conn.connect();
					InputStream in = conn.getInputStream();
					int len = -1;
					byte[] buff = new byte[1024];
					while ((len = in.read(buff)) != -1) {
						fos.write(buff, 0, len);
					}
					in.close();
					fos.close();
					//n.setNo(no);
					//newsDao.saveOrUpdate(n);
					Thread.currentThread().sleep(100);

				} catch (Exception e) {
					e.printStackTrace();
				} finally {
					if (fos != null)
						try {
							fos.close();
						} catch (IOException e) {
							e.printStackTrace();
						}
				}
			}
		}
	}
}
