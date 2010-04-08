package sf.struts;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;
import org.apache.struts.actions.DispatchAction;
import org.apache.struts.validator.LazyValidatorForm;


import sf.common.Constant;
import sf.common.PwdMD5;
import sf.dao.UserDao;
import sf.pojo.User;

public class LogonAction extends DispatchAction {

	private Logger log = Logger.getLogger(this.getClass());
	
	private static UserDao userDao = new UserDao();

	public ActionForward login(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		LazyValidatorForm f = (LazyValidatorForm) form;
		String loginName = (String) f.get("username");
		String password = (String) f.get("password");
		String rand = (String) f.get("rand");
		log.debug("User trying to login: >>>>>>>>>>>>> loginName=" + loginName + " password=" + password);
		if (loginName == null || password == null || "".equals(loginName) || "".equals(password)) {
			request.getSession().setAttribute(Constant.SESS_LOGIN_MSG, "用户名或密码为空");
			return mapping.findForward("login_fail");
		}
		String sessRand = (String) request.getSession().getAttribute(Constant.RAND);
		if (sessRand == null || !sessRand.equals(rand)) {
			request.getSession().setAttribute(Constant.SESS_LOGIN_MSG, "验证码错误");
			return mapping.findForward("login_fail");
		}
		User user = userDao.login(loginName, password);
		if (user == null) {
			user = userDao.login(loginName, PwdMD5.getPwd(loginName, password));
			if (user == null) {
				request.getSession().setAttribute(Constant.SESS_LOGIN_MSG, "用户名或密码错误，请重新输入");
				return mapping.findForward("login_fail");
			}
		}
		// succ
		request.getSession().setAttribute(Constant.SESS_USER, user);
		log.info("User login successfully, loginName=" + user.getLoginName());
		return mapping.findForward("login_succ");
	}

	public ActionForward logout(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		User user = (User) request.getSession().getAttribute(Constant.SESS_USER);
		if (user != null)
			log.info("User log out , loginName=" + user.getLoginName());
		request.getSession().removeAttribute(Constant.SESS_USER);
		request.getSession().invalidate();
		return mapping.findForward("login");
	}

}
