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

import sf.dao.DownloadDao;
import sf.pojo.Download;

public class DownloadAction extends DispatchAction {
	
	DownloadDao downDao = new DownloadDao();
	private static Logger log = Logger.getLogger(ContentAction.class);

	public ActionForward listDownload(ActionMapping mapping, ActionForm form, HttpServletRequest request, HttpServletResponse response) throws Exception {
		List<Download> list = downDao.getAllDownload();
		request.getSession().setAttribute("downloadList", list);
		return mapping.findForward("download_list");
	}
	
	public ActionForward gotoDownload(ActionMapping mapping, ActionForm form, HttpServletRequest request, HttpServletResponse response) throws Exception {
		DynaBean f = (DynaBean) form;
		String dId = (String) f.get("dId");
		if(dId == null || "".equals(dId)){
			dId = (String) request.getAttribute("dId");
		}
		if(dId != null && !"".equals(dId) && dId.matches("[0-9]{1,}")){
			request.setAttribute("download", downDao.getDownloadById(Long.parseLong(dId)));
		}		
		return mapping.findForward("download_edit");
	}
	
	public ActionForward saveDownload(ActionMapping mapping, ActionForm form, HttpServletRequest request, HttpServletResponse response) throws Exception {
		DynaBean f = (DynaBean) form;
		String dId = (String) f.get("dId");
		if(dId == null || "".equals(dId)){
			Download d = new Download();
			d.setComment(Integer.valueOf((String)f.get("comment")));
			d.setFilePath((String) f.get("filePath"));
			d.setName((String) f.get("name"));
			d.setSize(Long.parseLong((String) f.get("size")));
			d.setTime(new Date());
			d.setUp(0);
			d.setDesc((String) f.get("desc"));
			boolean succ = downDao.addDownload(d);
			if (succ) {
				request.setAttribute("msg", "添加新记录成功");
			} else {
				request.setAttribute("msg", "添加记录失败，请联系管理员");
			}
			return this.listDownload(mapping, form, request, response);
		}else{
			if(dId.matches("[0-9]{1,}")){
				Download d = downDao.getDownloadById(Long.parseLong(dId));
				if(d != null){
					d.setComment(Integer.valueOf((String)f.get("comment")));
					d.setFilePath((String) f.get("filePath"));
					d.setName((String) f.get("name"));
					d.setSize(Long.parseLong((String) f.get("size")));
					d.setTime(new Date());
					d.setDesc((String) f.get("desc"));
					boolean succ = downDao.updateDownload(d);
					if (succ) {
						request.setAttribute("msg", "更新记录成功");
					} else {
						request.setAttribute("msg", "更新记录失败，请联系管理员");
					}
				}
			}
		}
		return this.gotoDownload(mapping, form, request, response);
	} 
	
	public ActionForward deleteDownload(ActionMapping mapping, ActionForm form, HttpServletRequest request, HttpServletResponse response) throws Exception {
		String[] ids = request.getParameterValues("id_check");
		if (ids != null) {
			for (String idStr : ids) {
				Long id = Long.parseLong(idStr);
				if(id >0 ){
					if(downDao.deleteDownload(id)){
						request.setAttribute("msg", "删除记录成功，记录数为："+ids.length);
					}else{
						request.setAttribute("msg", "删除记录失败，请联系管理员");
					}
				}
			}
		}
		return this.listDownload(mapping, form, request, response);
	}
		
}
