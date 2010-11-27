package com.throne212.info168.web.result;

import java.io.BufferedWriter;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.OutputStreamWriter;
import java.io.Writer;
import java.util.Locale;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.struts2.ServletActionContext;
import org.apache.struts2.dispatcher.StrutsResultSupport;
import org.apache.struts2.views.freemarker.FreemarkerManager;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionInvocation;
import com.opensymphony.xwork2.LocaleProvider;
import com.opensymphony.xwork2.inject.Inject;
import com.opensymphony.xwork2.util.ValueStack;

import freemarker.template.Configuration;
import freemarker.template.ObjectWrapper;
import freemarker.template.Template;
import freemarker.template.TemplateException;
import freemarker.template.TemplateModel;
import freemarker.template.TemplateModelException;

public class FreemarkerResult extends StrutsResultSupport {
	private static final long serialVersionUID = -3778230771704661631L;
	protected ActionInvocation invocation;
	protected Configuration configuration;
	protected ObjectWrapper wrapper;
	protected FreemarkerManager freemarkerManager;
	private Writer writer;
	protected String location;
	private String pContentType = "text/html";
	protected String fileName; // 要生成的静态页面名称
	protected String filePath; // 要生成的静态页面的路径
	protected String staticTemplate; // 用于生成静态页面Freemarker模板的路径

	public FreemarkerResult() {
		super();
	}

	public FreemarkerResult(String location) {
		super(location);
	}

	@Inject
	public void setFreemarkerManager(FreemarkerManager mgr) {
		//System.out.println("自动调用设置freemarker管理器");
		this.freemarkerManager = mgr;
	}

	public void setContentType(String aContentType) {
		pContentType = aContentType;
	}

	public String getContentType() {
		return pContentType;
	}

	public void doExecute(String location, ActionInvocation invocation) throws IOException, TemplateException {
		this.location = location;
		this.invocation = invocation;
		this.configuration = getConfiguration();
		configuration.setOutputEncoding("UTF-8");
		this.wrapper = getObjectWrapper();
		this.fileName = (String) conditionalParse(fileName, invocation);
		this.staticTemplate = (String) conditionalParse(staticTemplate, invocation);
		this.filePath = ((String) conditionalParse(filePath, invocation)) == null ? "" : ((String) conditionalParse(filePath, invocation));
		/*if (!location.startsWith("/")) {
			ActionContext ctx = invocation.getInvocationContext();
			HttpServletRequest req = (HttpServletRequest) ctx.get(ServletActionContext.HTTP_REQUEST);
			String base = ResourceUtil.getResourceBase(req);
			location = base + "/" + location;
		}*/
		location = "/" + location;
		//如果存在就直接转发
		String path = ServletActionContext.getServletContext().getRealPath(filePath) + File.separator;
		if(new File(path + fileName).exists()){
			ActionContext ctx = invocation.getInvocationContext();
			HttpServletRequest req = (HttpServletRequest) ctx.get(ServletActionContext.HTTP_REQUEST);
			HttpServletResponse resp = (HttpServletResponse) ctx.get(ServletActionContext.HTTP_RESPONSE);
			try {
				req.getRequestDispatcher("/info/"+fileName).forward(req, resp);
			} catch (ServletException e) {
				e.printStackTrace();
			}
			return;
		}
		
		// 生成html页面的模板类
		Template template = configuration.getTemplate(location, deduceLocale());
		// 生成静态页面的的模板类
		Template staticTemplate = configuration.getTemplate(this.staticTemplate, deduceLocale());
		TemplateModel model = createModel();
//		String path = ServletActionContext.getServletContext().getRealPath(filePath) + File.separator;
		Writer out = new BufferedWriter(new OutputStreamWriter(new FileOutputStream(path + fileName),"UTF-8"));
		if (preTemplateProcess(template, model)) {
			try {
				staticTemplate.process(model, out);
				template.process(model, getWriter());
			} finally {
				postTemplateProcess(template, model);
				postTemplateProcess(staticTemplate, model);
				out.flush();
				out.close();
			}
		}
	}

	protected Configuration getConfiguration() throws TemplateException {
		return freemarkerManager.getConfiguration(ServletActionContext.getServletContext());
	}

	protected ObjectWrapper getObjectWrapper() {
		return configuration.getObjectWrapper();
	}

	public void setWriter(Writer writer) {
		this.writer = writer;
	}

	protected Writer getWriter() throws IOException {
		if (writer != null) {
			return writer;
		}
		return ServletActionContext.getResponse().getWriter();
	}

	protected TemplateModel createModel() throws TemplateModelException {
		ServletContext servletContext = ServletActionContext.getServletContext();
		HttpServletRequest request = ServletActionContext.getRequest();
		HttpServletResponse response = ServletActionContext.getResponse();
		ValueStack stack = ServletActionContext.getContext().getValueStack();
		Object action = null;
		if (invocation != null)
			action = invocation.getAction(); // Added for NullPointException
		return freemarkerManager.buildTemplateModel(stack, action, servletContext, request, response, wrapper);
	}

	protected Locale deduceLocale() {
		if (invocation.getAction() instanceof LocaleProvider) {
			return ((LocaleProvider) invocation.getAction()).getLocale();
		} else {
			return configuration.getLocale();
		}
	}

	protected void postTemplateProcess(Template template, TemplateModel data) throws IOException {
	}

	protected boolean preTemplateProcess(Template template, TemplateModel model) throws IOException {
		Object attrContentType = template.getCustomAttribute("content_type");
		if (attrContentType != null) {
			ServletActionContext.getResponse().setContentType(attrContentType.toString());
		} else {
			String contentType = getContentType();
			if (contentType == null) {
				contentType = "text/html";
			}
			String encoding = template.getEncoding();
			if (encoding != null) {
				contentType = contentType + "; charset=" + encoding;
			}
			ServletActionContext.getResponse().setContentType(contentType);
		}
		return true;
	}

	public String getFileName() {
		return fileName;
	}

	public void setFileName(String fileName) {
		this.fileName = fileName;
	}

	public String getFilePath() {
		return filePath;
	}

	public void setFilePath(String filePath) {
		this.filePath = filePath;
	}

	public String getStaticTemplate() {
		return staticTemplate;
	}

	public void setStaticTemplate(String staticTemplate) {
		this.staticTemplate = staticTemplate;
	}
}