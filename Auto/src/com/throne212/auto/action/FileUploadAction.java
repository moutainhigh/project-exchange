package com.throne212.auto.action;

import java.io.File;

import org.apache.commons.io.FileUtils;

import com.opensymphony.xwork2.ActionContext;
import com.throne212.auto.common.WebConstants;

public class FileUploadAction extends BaseAction {
	
	private File myfile;
	private String myfileContentType;
	private String myfileFileName;

	public String execute() throws Exception {
		if (myfile != null) {
			String path = Thread.currentThread().getContextClassLoader().getResource("/").getPath();
			path = path.substring(0, path.indexOf("WEB-INF"));
			path += "upload";
			logger.debug("image saved path : " + path);
			int dot = myfileFileName.lastIndexOf(".");
			String subfix = myfileFileName.substring(dot + 1);
			String targetFileName = System.currentTimeMillis()+"."+subfix;
			myfileFileName = targetFileName;
			FileUtils.copyFile(myfile, new File(path+File.separator+targetFileName));
			ActionContext.getContext().getSession().put(WebConstants.SESS_IMAGE, targetFileName);
		}
		return SUCCESS;
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
