package com.throne212.fupin.action;

import java.io.File;
import java.io.IOException;

import org.apache.commons.io.FileUtils;

import com.opensymphony.xwork2.ActionContext;
import com.throne212.fupin.common.WebConstants;


public class ExcelUploadAction extends BaseAction {
	private File myfile;
	private String myfileContentType;
	private String myfileFileName;
	private String type;
	public String execute(){
		if (myfile != null) {
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
				ActionContext.getContext().getSession().put(WebConstants.SESS_IMAGE, targetFileName);
				//根据类型来转发
				if("cun".equals(type)){
					return "cun";
				}else if("family2".equals(type)){
					return "family2";
				}else if("family3".equals(type)){
					return "family3";
				}else if("question1".equals(type)){
					return "question1";
				}else if("question2".equals(type)){
					return "question2";
				}else if("question1_org".equals(type)){
					return "question1_org";
				}else if("question2_org".equals(type)){
					return "question2_org";
				}
				return "success";
			} catch (IOException e) {
				e.printStackTrace();
			}
			
		}
		return "upload_fail";
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

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}

}
