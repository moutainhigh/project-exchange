package com.throne212.auto.filter;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;
import org.springframework.context.ApplicationContext;
import org.springframework.web.context.WebApplicationContext;

import com.throne212.auto.biz.BaseBiz;
import com.throne212.auto.domain.News;

public class NewsFilter implements Filter {

	private Logger logger = Logger.getLogger(this.getClass());

	public void destroy() {
		// TODO Auto-generated method stub

	}

	public void doFilter(ServletRequest req, ServletResponse resp, FilterChain chain) throws IOException, ServletException {
		HttpServletRequest request = (HttpServletRequest) req;
		HttpServletResponse response = (HttpServletResponse) resp;
		logger.debug("res="+request.getRequestURI());
		String res = request.getRequestURI();
		String no = res.substring(res.indexOf("/news")+"/news".length()+1, res.lastIndexOf("."));
		BaseBiz baseBiz = (BaseBiz) ((ApplicationContext) request.getSession().getServletContext().getAttribute(WebApplicationContext.ROOT_WEB_APPLICATION_CONTEXT_ATTRIBUTE)).getBean("baseBiz");
		News news = baseBiz.getEntityByUnique(News.class, "no", no);
		if(news != null){
			news.setClick(news.getClick()+1);
			baseBiz.saveOrUpdateEntity(news);
		}
		chain.doFilter(req, resp);
	}

	public void init(FilterConfig arg0) throws ServletException {
		// TODO Auto-generated method stub

	}
	
	public static void main(String[] args) {
		String str = "/Auto/news/1281667235839.html";
		System.out.println(str.substring(str.indexOf("/news")+"/news".length()+1, str.lastIndexOf(".")));
	}

}
