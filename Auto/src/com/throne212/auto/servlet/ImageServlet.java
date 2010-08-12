package com.throne212.auto.servlet;

import java.io.FileInputStream;
import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;

import com.throne212.auto.common.Util;


public class ImageServlet extends HttpServlet {

	private Logger log = Logger.getLogger(ImageServlet.class.getName());

	private static final long serialVersionUID = 1L;
	
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String image = request.getParameter("image");
		String w = request.getParameter("w");
		String h = request.getParameter("h");
		
		String path = Thread.currentThread().getContextClassLoader().getResource("/").getPath();
		path = path.substring(0, path.indexOf("WEB-INF"));
		
		if(image == null || "".equals(image)){
			path += "img/no.jpg";
			log.debug("ÔÝÎÞÍ¼Æ¬");
		}else{			
			path += "upload/";
			path += image;
			log.debug("image saved path : " + path);
		}
		try {
			FileInputStream fin = new FileInputStream(path);
			if(Util.isEmpty(w) || Util.isEmpty(h))
				Util.writeImage(fin, response.getOutputStream());
			else
				Util.writeImage(fin, response.getOutputStream(),Integer.parseInt(w),Integer.parseInt(h));
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		this.doGet(request, response);
	}

	public static void main(String[] args) {
		String f = "hello";
		String str = "getHello";
		String r = "get" + String.valueOf(f.charAt(0)).toUpperCase() + f.substring(1);
		System.out.println(r);
	}

}
