package com.throne212.tui5.action;

import java.io.File;
import java.io.IOException;

import org.apache.commons.io.FileUtils;

import com.opensymphony.xwork2.ActionContext;
import com.throne212.tui5.common.Const;
import com.throne212.tui5.common.Util;
import com.throne212.tui5.domain.User;

public class FileUploadAction extends BaseAction {
	private File myfile;
	private String myfileContentType;
	private String myfileFileName;
	
	private String newName;
	
	public String gaojian() {
		User user = (User) ActionContext.getContext().getSession().get(Const.SESS_USER_OBJ);
		if (user == null) {
			this.setMsg("您没有登录，请登录以后重新上传");
			return "error";
		}
		if (myfile != null) {
			if (myfile.length() > 1024 * 1024 * 5) {
				logger.debug(myfile.length());
				this.setMsg("图片太大,请上传小于5M的图片！");
				return "error";
			}
			String path = Thread.currentThread().getContextClassLoader().getResource("/").getPath();
			path = path.substring(0, path.indexOf("WEB-INF"));
			path += "upload/gaojian";
			logger.debug("image saved path : " + path);
			int dot = myfileFileName.lastIndexOf(".");
			String subfix = myfileFileName.substring(dot + 1);
			if (Util.isEmpty(subfix)) {
				this.setMsg("文件格式错误");
				return "error";
			} else if (!subfix.trim().equalsIgnoreCase("JPG") 
					&& !subfix.trim().equalsIgnoreCase("JPEG")
					&& !subfix.trim().equalsIgnoreCase("PNG") 
					&& !subfix.trim().equalsIgnoreCase("BMP") 
					&& !subfix.trim().equalsIgnoreCase("GIF")) {
				this.setMsg("请上传后缀名仅为jpg,jpeg,gif,png,bmp的图片文件");
				return "error";
			}
			String targetFileName = System.currentTimeMillis() + "." + subfix;
			myfileFileName = targetFileName;
			try {
				FileUtils.copyFile(myfile, new File(path + File.separator + targetFileName));
				newName = targetFileName;
				return "success";
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
		return "error";
	}
	
	public String task() {
		User user = (User) ActionContext.getContext().getSession().get(Const.SESS_USER_OBJ);
		if (user == null) {
			this.setMsg("您没有登录，请登录以后重新上传");
			return "error";
		}
		if (myfile != null) {
			if (myfile.length() > 1024 * 1024 * 2) {
				logger.debug(myfile.length());
				this.setMsg("文件太大,请上传小于2M的文件！");
				return "error";
			}
			String path = Thread.currentThread().getContextClassLoader().getResource("/").getPath();
			path = path.substring(0, path.indexOf("WEB-INF"));
			path += "upload/task";
			logger.debug("task attachemnt saved path : " + path);
			int dot = myfileFileName.lastIndexOf(".");
			String subfix = myfileFileName.substring(dot + 1);
			if (Util.isEmpty(subfix)) {
				this.setMsg("文件格式错误");
				return "error";
			} else if (!subfix.trim().equalsIgnoreCase("JPG") 
					&& !subfix.trim().equalsIgnoreCase("JPEG") 
					&& !subfix.trim().equalsIgnoreCase("PNG")
					&& !subfix.trim().equalsIgnoreCase("BMP")
					&& !subfix.trim().equalsIgnoreCase("PDF")
					&& !subfix.trim().equalsIgnoreCase("DOC")
					&& !subfix.trim().equalsIgnoreCase("DOCX")
					&& !subfix.trim().equalsIgnoreCase("XLS")
					&& !subfix.trim().equalsIgnoreCase("XLSX")
					&& !subfix.trim().equalsIgnoreCase("TXT")
					&& !subfix.trim().equalsIgnoreCase("RAR")
					&& !subfix.trim().equalsIgnoreCase("ZIP")
					&& !subfix.trim().equalsIgnoreCase("GIF")) {
				this.setMsg("请上传后缀名仅为jpg,jpeg,gif,png,bmp,txt,doc,xls,rar,zip的文件");
				return "error";
			}
			String targetFileName = System.currentTimeMillis() + "." + subfix;
			myfileFileName = targetFileName;
			try {
				FileUtils.copyFile(myfile, new File(path + File.separator + targetFileName));
				newName = targetFileName;
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

	public String getNewName() {
		return newName;
	}

	public void setNewName(String newName) {
		this.newName = newName;
	}

}
