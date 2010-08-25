package com.throne212.auto.filter;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.net.HttpURLConnection;
import java.net.URL;

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
	
	private static BaseBiz baseBiz = null;

	public void destroy() {
		// TODO Auto-generated method stub

	}

	public void doFilter(ServletRequest req, ServletResponse resp, FilterChain chain) throws IOException, ServletException {
		HttpServletRequest request = (HttpServletRequest) req;
		HttpServletResponse response = (HttpServletResponse) resp;
		logger.debug("res="+request.getRequestURI());
		String auto = request.getParameter("auto");
		if("Y".equals(auto)){
			chain.doFilter(req, resp);
			return;
		}
		String res = request.getRequestURI();
		String no = res.substring(res.indexOf("/news")+"/news".length()+1, res.lastIndexOf("."));
		News news = baseBiz.getEntityByUnique(News.class, "no", no);
		if(news != null){
			news.setClick(news.getClick()+1);
			if(news.getCategory() == null){
				boolean save = saveNewsHtml(news.getNo(),news.getId(),"special",request);
				if(save){
//					response.sendRedirect("../special.htm?special.id="+news.getId());
//					return;
					try {
						Thread.currentThread().sleep(3000);
					} catch (InterruptedException e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					}
				}
			}
			else{
				boolean save = saveNewsHtml(news.getNo(),news.getId(),"news",request);
				if(save){
					//request.getRequestDispatcher("/news.htm?news.id="+news.getId()).forward(request, response);
					//response.sendRedirect("../news.htm?news.id="+news.getId());
					//return;
					try {
						Thread.currentThread().sleep(3000);
					} catch (InterruptedException e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					}
				}
			}
			baseBiz.saveOrUpdateEntity(news);
		}
		chain.doFilter(req, resp);
	}
	private boolean saveNewsHtml(String name,long id,String newsName,HttpServletRequest request){
		String path = Thread.currentThread().getContextClassLoader().getResource("/").getPath();
		path = path.substring(0, path.indexOf("WEB-INF"));
		path += "news/"+name+".html";
		if(new File(path).exists()){
			return false;
		}
		logger.info("save new html news file no="+name);
		FileOutputStream fos = null;
		try {
			fos = new FileOutputStream(path);
			
			String newsPath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+request.getContextPath()+"/"+newsName+".htm?"+newsName+".id="+id;
			
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
		} catch (Exception e) {
			e.printStackTrace();
		} finally{
			if(fos != null)
				try {fos.close();} catch (IOException e) {e.printStackTrace();}
		}
		return true;
	}

	public void init(FilterConfig arg0) throws ServletException {
		// TODO Auto-generated method stub
		baseBiz = (BaseBiz) ((ApplicationContext) arg0.getServletContext().getAttribute(WebApplicationContext.ROOT_WEB_APPLICATION_CONTEXT_ATTRIBUTE)).getBean("baseBiz");
	}
	
	public static void main(String[] args) {
		String str = "/Auto/news/1281667235839.html";
		System.out.println(str.substring(str.indexOf("/news")+"/news".length()+1, str.lastIndexOf(".")));
	}

}
