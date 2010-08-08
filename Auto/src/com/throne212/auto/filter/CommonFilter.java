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

public class CommonFilter implements Filter {

	private Logger logger = Logger.getLogger(this.getClass());

	public void destroy() {
		// TODO Auto-generated method stub

	}

	public void doFilter(ServletRequest req, ServletResponse resp, FilterChain chain) throws IOException, ServletException {
		HttpServletRequest request = (HttpServletRequest) req;
		HttpServletResponse response = (HttpServletResponse) resp;

		logger.debug(request.getParameter("sale.fullName"));
		request.setCharacterEncoding("GBK");
		//String name = request.getParameter("formDO.name");
		//request.getSession().getServletContext().
		logger.debug(request.getParameter("sale.fullName"));
		chain.doFilter(req, resp);

		response.setHeader("Pragma", "No-cache");
		response.setHeader("Cache-Control", "no-cache");
		response.setHeader("Cache-Control", "no-store");
		response.setDateHeader("Expires", 0);
		response.setContentType("text/html; charset=GBK");
		response.setCharacterEncoding("GBK");
	}

	public void init(FilterConfig arg0) throws ServletException {
		// TODO Auto-generated method stub

	}

}
