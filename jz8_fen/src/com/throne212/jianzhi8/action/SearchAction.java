package com.throne212.jianzhi8.action;

import org.apache.log4j.Logger;
import org.apache.struts2.convention.annotation.ParentPackage;

import com.opensymphony.xwork2.ActionSupport;
import com.throne212.jianzhi8.common.Util;

@ParentPackage("basePackage")
public class SearchAction extends ActionSupport {
	
	private Logger logger = Logger.getLogger(this.getClass());
	
	//参数string
	private String param;
	//类型参数
	private String type;
	
	//变量
	private String pageNum;
	private String key;
	
	public String s(){
		logger.info("param:["+param+"]");
		logger.info("type:["+type+"]");
		if(!Util.isEmpty(param)){
			param = param.trim();
			if(param.contains("-")){
				String[] arr = param.split("-");
				if(arr.length > 1)
					pageNum = arr[1];
				key = arr[0];
			}else{
				key = param;
			}
		}
		logger.info("key:["+key+"]");
		logger.info("pageNum:["+pageNum+"]");
		return null;
	}

	public String getParam() {
		return param;
	}

	public void setParam(String param) {
		this.param = param;
	}

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}

}
