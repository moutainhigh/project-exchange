package com.throne212.saishi.action;

import java.io.File;
import java.io.IOException;

import org.apache.commons.io.FileUtils;

import com.opensymphony.xwork2.ActionContext;
import com.throne212.saishi.common.WebConstants;


public class FileUploadAction extends BaseAction {
	private File myfile;
	private String myfileContentType;
	private String myfileFileName;
	public String execute(){
		if (myfile != null) {
			String size= String.valueOf(myfile.length()/1024)+"KB";
			logger.debug("Upload file size:"+size);
			ActionContext.getContext().getSession().put(WebConstants.SESS_MUSIC_SIZE, size);
			String path = Thread.currentThread().getContextClassLoader().getResource("/").getPath();
			logger.debug(">>>>>>>>>>>>>>>>>>>"+path);
			logger.debug("+++++++++"+Thread.currentThread().getContextClassLoader().getResource("/"));
			path = path.substring(0, path.indexOf("WEB-INF"));
			logger.debug("》》》》》》》》》》》》"+path);
			path += "upload";
			logger.debug("image saved path : " + path);
			int dot = myfileFileName.lastIndexOf(".");
			String subfix = myfileFileName.substring(dot + 1);
			String targetFileName = System.currentTimeMillis()+"."+subfix;
			myfileFileName = targetFileName;
			try {
				FileUtils.copyFile(myfile, new File(path+File.separator+targetFileName));
				ActionContext.getContext().getSession().put(WebConstants.SESS_MUSIC, targetFileName);
				return "success";
			} catch (IOException e) {
				e.printStackTrace();
			}
			
		}
		return "error";
	}

	public File getMyfile() {
		return myfile;
	}

	public void setMyfile(File myfile) {
		this.myfile = myfile;
	}

	public String getMyfileContentType() {
		return myfileContentType;
	}

	public void setMyfileContentType(String myfileContentType) {
		this.myfileContentType = myfileContentType;
	}

	public String getMyfileFileName() {
		return myfileFileName;
	}

	public void setMyfileFileName(String myfileFileName) {
		this.myfileFileName = myfileFileName;
	}

}
