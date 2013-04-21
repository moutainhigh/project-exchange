package com.throne212.oa.servlet;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.util.Iterator;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileItemFactory;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

public class ExcelUploadServlet extends HttpServlet{

	public void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		this.doPost(req, resp);
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		boolean isMultipart = ServletFileUpload.isMultipartContent(request);
		if(isMultipart){
			// Create a factory for disk-based file items
			FileItemFactory factory = new DiskFileItemFactory();
			// Create a new file upload handler
			ServletFileUpload upload = new ServletFileUpload(factory);
			// Parse the request
			try {
				List items = upload.parseRequest(request);
				Iterator it = items.iterator();
				for(;it.hasNext();){
					FileItem item = (FileItem) it.next();
					System.out.println(item.getName()+"\t"+item.getContentType()+"\t"+item.getFieldName()+"\t"+item.isFormField());
					if(!item.isFormField()){
						String path = Thread.currentThread().getContextClassLoader().getResource("/").getPath();
						path = path.substring(0, path.indexOf("WEB-INF"));
						path += "report"+File.separator+"excel";
						System.out.println("excel saved path : " + path);
						int dot = item.getName().lastIndexOf(".");
						String subfix = item.getName().substring(dot + 1);
						String targetFileName = System.currentTimeMillis()+"."+subfix;
						String absPath = path+File.separator+targetFileName;
						FileOutputStream fos = new FileOutputStream(new File(absPath));
						int len = -1;
						byte[] buff = new byte[1024];
						InputStream is = item.getInputStream();
						while((len=is.read(buff))>0){
							fos.write(buff, 0, len);
						}
						fos.close();
						is.close();
						request.setAttribute("excelPath", absPath);
						request.setAttribute("targetFileName", targetFileName);
						System.out.println("Excel报表上传成功");
						//上传成功
						request.setAttribute("upload_flag", "Y");
						request.getRequestDispatcher("/report.do?method=uploadReport").forward(request, response);
					}
				}
			} catch (Exception e) {
				e.printStackTrace();
				//上传失败
				request.setAttribute("upload_flag", "N");
				request.getRequestDispatcher("/report.do?method=uploadReport").forward(request, response);
			}
		}
	}	
	
}
