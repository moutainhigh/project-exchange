package com.throne212.jianzhi8.common;


import java.text.SimpleDateFormat;
import java.util.Date;


public class HtmlConfig {
	
	public static final String REPLACE_UUID = "{uuid}";// ���UUID�ַ����滻
	public static final String REPLACE_DATE_YY = "{date_yyyy}";// ��ǰ�����ַ����滻(��)
	public static final String REPLACE_DATE_MM = "{date_MM}";// ��ǰ�����ַ����滻(��)
	public static final String REPLACE_DATE_DD = "{date_dd}";// ��ǰ�����ַ����滻(��)
	public static final String REPLACE_DATE_HH = "{date_HH}";// ��ǰ�����ַ����滻(ʱ)
	
	public static final String BASE_JAVASCRIPT = "baseJavascript";// baseJavascript
	public static final String INDEX = "index";// ��ҳ
	public static final String LOGIN = "login";// ��¼
	public static final String ARTICLE_CONTENT = "articleContent";// ��������
	public static final String PRODUCT_CONTENT = "productContent";// ��Ʒ����
	public static final String ERROR_PAGE = "errorPage";// ����ҳ
	public static final String ERROR_PAGE_ACCESS_DENIED = "errorPageAccessDenied";// Ȩ�޴���ҳ
	public static final String ERROR_PAGE_500 = "errorPage500";// ����ҳ500
	public static final String ERROR_PAGE_404 = "errorPage404";// ����ҳ404
	public static final String ERROR_PAGE_403 = "errorPage403";// ����ҳ403
	
	private String name;// ��������
	private String description;// ����
	private String templateFilePath;// Freemarkerģ���ļ�·��
	private String htmlFilePath;// ����HTML��̬�ļ����·��

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public String getTemplateFilePath() {
		return templateFilePath;
	}

	public void setTemplateFilePath(String templateFilePath) {
		this.templateFilePath = templateFilePath;
	}

	public void setHtmlFilePath(String htmlFilePath) {
		this.htmlFilePath = htmlFilePath;
	}
	
	// ��ȡ����HTML��̬�ļ����·��
	public String getHtmlFilePath() {
		htmlFilePath = htmlFilePath.replace(REPLACE_UUID, Util.getUUID());
		SimpleDateFormat yyDateFormat = new SimpleDateFormat("yyyy");
		SimpleDateFormat mmDateFormat = new SimpleDateFormat("MM");
		SimpleDateFormat ddDateFormat = new SimpleDateFormat("dd");
		SimpleDateFormat hhDateFormat = new SimpleDateFormat("HH");
		htmlFilePath = htmlFilePath.replace(REPLACE_DATE_YY, yyDateFormat.format(new Date()));
		htmlFilePath = htmlFilePath.replace(REPLACE_DATE_MM, mmDateFormat.format(new Date()));
		htmlFilePath = htmlFilePath.replace(REPLACE_DATE_DD, ddDateFormat.format(new Date()));
		htmlFilePath = htmlFilePath.replace(REPLACE_DATE_HH, hhDateFormat.format(new Date()));
		return htmlFilePath;
	}

}