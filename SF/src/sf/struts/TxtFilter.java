package sf.struts;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;

import sf.common.Constant;

public class TxtFilter implements Filter {

	private static Logger log = Logger.getLogger(TxtFilter.class);

	public void destroy() {

	}

	public void doFilter(ServletRequest req, ServletResponse resp, FilterChain chain) throws IOException,
			ServletException {

		HttpServletRequest request = (HttpServletRequest) req;
		HttpServletResponse response = (HttpServletResponse) resp;
		
		//设置字符集
		request.setCharacterEncoding("utf8");
		response.setCharacterEncoding("utf8");
		
		chain.doFilter(request, response);

	}

	public void init(FilterConfig arg0) throws ServletException {

	}

}
