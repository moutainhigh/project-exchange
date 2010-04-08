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

import sf.dao.PicDao;
import sf.pojo.Pic;

public class PicAction extends DispatchAction {
	
	PicDao downDao = new PicDao();
	private static Logger log = Logger.getLogger(ContentAction.class);

	public ActionForward listPic(ActionMapping mapping, ActionForm form, HttpServletRequest request, HttpServletResponse response) throws Exception {
		List<Pic> list = downDao.getAllPic();
		request.getSession().setAttribute("PicList", list);
		return mapping.findForward("pic_list");
	}
	
	public ActionForward gotoPic(ActionMapping mapping, ActionForm form, HttpServletRequest request, HttpServletResponse response) throws Exception {
		DynaBean f = (DynaBean) form;
		String dId = (String) f.get("dId");
		if(dId == null || "".equals(dId)){
			dId = (String) request.getAttribute("dId");
		}
		if(dId != null && !"".equals(dId) && dId.matches("[0-9]{1,}")){
			request.setAttribute("Pic", downDao.getPicById(Long.parseLong(dId)));
		}		
		return mapping.findForward("pic_edit");
	}
	
	public ActionForward savePic(ActionMapping mapping, ActionForm form, HttpServletRequest request, HttpServletResponse response) throws Exception {
		DynaBean f = (DynaBean) form;
		String dId = (String) f.get("dId");
		if(dId == null || "".equals(dId)){
			Pic d = new Pic();
			d.setFilePath((String) f.get("filePath"));
			d.setTitle((String) f.get("title"));
			d.setTime(new Date());
			boolean succ = downDao.addPic(d);
			if (succ) {
				request.setAttribute("msg", "添加新记录成功");
			} else {
				request.setAttribute("msg", "添加记录失败，请联系管理员");
			}
			return this.listPic(mapping, form, request, response);
		}else{
			if(dId.matches("[0-9]{1,}")){
				Pic d = downDao.getPicById(Long.parseLong(dId));
				if(d != null){
					d.setFilePath((String) f.get("filePath"));
					d.setTitle((String) f.get("title"));
					d.setTime(new Date());
					boolean succ = downDao.updatePic(d);
					if (succ) {
						request.setAttribute("msg", "更新记录成功");
					} else {
						request.setAttribute("msg", "更新记录失败，请联系管理员");
					}
				}
			}
		}
		return this.gotoPic(mapping, form, request, response);
	} 
	
	public ActionForward deletePic(ActionMapping mapping, ActionForm form, HttpServletRequest request, HttpServletResponse response) throws Exception {
		String[] ids = request.getParameterValues("id_check");
		if (ids != null) {
			for (String idStr : ids) {
				Long id = Long.parseLong(idStr);
				if(id >0 ){
					if(downDao.deletePic(id)){
						request.setAttribute("msg", "删除记录成功，记录数为："+ids.length);
					}else{
						request.setAttribute("msg", "删除记录失败，请联系管理员");
					}
				}
			}
		}
		return this.listPic(mapping, form, request, response);
	}
		
}
