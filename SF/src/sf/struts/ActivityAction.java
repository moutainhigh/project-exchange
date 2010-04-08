package sf.struts;

import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.beanutils.DynaBean;
import org.apache.log4j.Logger;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;
import org.apache.struts.actions.DispatchAction;

import sf.dao.ActivityDao;
import sf.pojo.Activity;

public class ActivityAction extends DispatchAction {
	
	ActivityDao aDao = new ActivityDao();
	private static Logger log = Logger.getLogger(ContentAction.class);

	public ActionForward listActivity(ActionMapping mapping, ActionForm form, HttpServletRequest request, HttpServletResponse response) throws Exception {
		List<Activity> list = aDao.getAllActivity();
		request.getSession().setAttribute("activityList", list);
		return mapping.findForward("activity_list");
	}
	
	public ActionForward gotoActivity(ActionMapping mapping, ActionForm form, HttpServletRequest request, HttpServletResponse response) throws Exception {
		DynaBean f = (DynaBean) form;
		String aId = (String) f.get("aId");
		if(aId == null || "".equals(aId)){
			aId = (String) request.getAttribute("aId");
		}
		if(aId != null && !"".equals(aId) && aId.matches("[0-9]{1,}")){
			request.setAttribute("a", aDao.getActivityById(Long.parseLong(aId)));
		}		
		return mapping.findForward("activity_edit");
	}
	
	public ActionForward saveActivity(ActionMapping mapping, ActionForm form, HttpServletRequest request, HttpServletResponse response) throws Exception {
		DynaBean f = (DynaBean) form;
		String aId = (String) f.get("aId");
		if(aId == null || "".equals(aId)){
			Activity d = new Activity();
			d.setTitle((String)f.get("title"));
			d.setContent((String) f.get("content"));
			d.setTime(new Date());
			boolean succ = aDao.addActivity(d);
			if (succ) {
				request.setAttribute("msg", "添加新记录成功");
			} else {
				request.setAttribute("msg", "添加记录失败，请联系管理员");
			}
			request.setAttribute("aId", aId);
			return this.listActivity(mapping, form, request, response);
		}else{
			if(aId.matches("[0-9]{1,}")){
				Activity d = aDao.getActivityById(Long.parseLong(aId));
				if(d != null){
					d.setTitle((String)f.get("title"));
					d.setContent((String) f.get("content"));
					d.setTime(new Date());
					boolean succ = aDao.addActivity(d);
					if (succ) {
						request.setAttribute("msg", "更新记录成功");
					} else {
						request.setAttribute("msg", "更新记录失败，请联系管理员");
					}
				}
			}
		}
		return this.listActivity(mapping, form, request, response);
	} 
	
	public ActionForward deleteActivity(ActionMapping mapping, ActionForm form, HttpServletRequest request, HttpServletResponse response) throws Exception {
		String[] ids = request.getParameterValues("id_check");
		if (ids != null) {
			for (String idStr : ids) {
				Long id = Long.parseLong(idStr);
				if(id >0 ){
					if(aDao.deleteActivity(id)){
						request.setAttribute("msg", "删除记录成功，记录数为："+ids.length);
					}else{
						request.setAttribute("msg", "删除记录失败，请联系管理员");
					}
				}
			}
		}
		return this.listActivity(mapping, form, request, response);
	}
		
}
