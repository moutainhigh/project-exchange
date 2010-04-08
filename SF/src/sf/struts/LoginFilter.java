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

public class LoginFilter implements Filter {

	private static Logger log = Logger.getLogger(LoginFilter.class);

	public void destroy() {

	}

	public void doFilter(ServletRequest req, ServletResponse resp, FilterChain chain) throws IOException,
			ServletException {

		HttpServletRequest request = (HttpServletRequest) req;
		HttpServletResponse response = (HttpServletResponse) resp;
		
		String url = request.getRequestURI();
		//System.out.println(url);
		if(url != null && (url.contains("/admin/login.jsp") || url.contains("/admin/LogonAction.do"))){
			//ignore
		}else if (request.getSession(false) == null || request.getSession().getAttribute(Constant.SESS_USER) == null) {
			log.info("Session time out OR invalid access manange pages");
			request.getSession().setAttribute(Constant.SESS_LOGIN_MSG, "请登录...");
			request.getRequestDispatcher("/admin/login.jsp").forward(request, response);
			return;
		}

		//设置字符集
		request.setCharacterEncoding("utf8");
		
		chain.doFilter(request, response);

	}

	public void init(FilterConfig arg0) throws ServletException {

	}

}
