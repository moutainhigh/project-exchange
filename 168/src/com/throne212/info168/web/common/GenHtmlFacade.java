package com.throne212.info168.web.common;

import java.io.Writer;
import java.util.Locale;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.struts2.ServletActionContext;

import com.throne212.info168.web.domain.Info;

import freemarker.template.Configuration;
import freemarker.template.ObjectWrapper;
import freemarker.template.Template;
import freemarker.template.TemplateExceptionHandler;

public class GenHtmlFacade {

	private static GenHtmlFacade instance = new GenHtmlFacade();

	private GenHtmlFacade() {
		init();
	}

	public static GenHtmlFacade getInstance() {
		return instance;
	}

	private Configuration cfg;

	public void init() {
		// Initialize the FreeMarker configuration;
		// - Create a configuration instance
		cfg = new Configuration();
		// - Templates are stoted in the WEB-INF/templates directory of the Web
		// app.
		cfg.setServletContextForTemplateLoading(ServletActionContext.getServletContext(), "front/");
		// - Set update dealy to 0 for now, to ease debugging and testing.
		// Higher value should be used in production environment.
		cfg.setTemplateUpdateDelay(0);
		// - Set an error handler that prints errors so they are readable with
		// a HTML browser.
		cfg.setTemplateExceptionHandler(TemplateExceptionHandler.HTML_DEBUG_HANDLER);
		// - Use beans wrapper (recommmended for most applications)
		cfg.setObjectWrapper(ObjectWrapper.BEANS_WRAPPER);
		// - Set the default charset of the template files
		cfg.setDefaultEncoding("UTF-8");
		// - Set the charset of the output. This is actually just a hint, that
		// templates may require for URL encoding and for generating META
		// element
		// that uses http-equiv="Content-type".
		cfg.setOutputEncoding("UTF-8");
		// - Set the default locale
		cfg.setLocale(Locale.CHINESE);
	}

	public void gen(Info info) {
		try {
			HttpServletRequest request = ServletActionContext.getRequest();
			HttpServletResponse response = ServletActionContext.getResponse();

			// Set the request charset to the same as the output charset,
			// because HTML forms normally send parameters encoded with that.
			request.setCharacterEncoding(cfg.getOutputEncoding());

			// Get the template object
			Template t = cfg.getTemplate("page_html.ftl");

			// Prepare the HTTP response:
			// - Set the MIME-type and the charset of the output.
			// Note that the charset should be in sync with the output_encoding
			// setting.
			response.setContentType("text/html; charset=" + cfg.getOutputEncoding());
			// - Prevent browser or proxy caching the page.
			// Note that you should use it only for development and for
			// interactive
			// pages, as it significantly slows down the Web site.
			response.setHeader("Cache-Control", "no-store, no-cache, must-revalidate, post-check=0, pre-check=0");
			response.setHeader("Pragma", "no-cache");
			response.setHeader("Expires", "Thu, 01 Dec 1994 00:00:00 GMT");
			Writer out = response.getWriter();

			// Merge the data-model and the template

			t.process(info, out);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}
