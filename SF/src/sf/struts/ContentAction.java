package sf.struts;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.beanutils.DynaBean;
import org.apache.log4j.Logger;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;
import org.apache.struts.actions.DispatchAction;

import sf.dao.CatalogDao;
import sf.dao.ContentDao;
import sf.dao.DivideDao;
import sf.dao.FamilyDao;
import sf.pojo.Catalog;
import sf.pojo.Content;
import sf.pojo.Divide;
import sf.pojo.Family;

public class ContentAction extends DispatchAction {

	private static CatalogDao catalogDao = new CatalogDao();
	private static ContentDao contentDao = new ContentDao();
	private static FamilyDao familyDao = new FamilyDao();
	private static DivideDao divideDao = new DivideDao();
	private static Logger log = Logger.getLogger(ContentAction.class);

	public ActionForward catalog(ActionMapping mapping, ActionForm form, HttpServletRequest request, HttpServletResponse response) throws Exception {
		List<Catalog> list = catalogDao.getAllCatalogs();
		request.getSession().setAttribute("catalogList", list);
		return mapping.findForward("catalog");
	}

	public ActionForward showContent(ActionMapping mapping, ActionForm form, HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		DynaBean f = (DynaBean) form;
		String contentIdStr = (String) f.get("contentId");
		if (contentIdStr == null || "".equals(contentIdStr) || !contentIdStr.matches("[0-9]{1,}")) {
			// ...
		} else {
			Long id = Long.valueOf(contentIdStr);
			Content content = contentDao.getContentById(id);
			if (content != null)
				log.info("get contnet id=" + content.getId() + " title=" + content.getTitle());
			request.setAttribute("content", content.getContent());
			request.setAttribute("contentId", contentIdStr);
		}
		return mapping.findForward("content");
	}

	public ActionForward saveContent(ActionMapping mapping, ActionForm form, HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		DynaBean f = (DynaBean) form;
		String contentIdStr = (String) f.get("contentId");
		String contentStr = (String) f.get("content");
		// contentStr = new String(contentStr.getBytes(),"UTF8");
		if (contentIdStr == null || "".equals(contentIdStr) || !contentIdStr.matches("[0-9]{1,}")) {
			// ...
			request.setAttribute("msg", "保存文本失败，请检查");
		} else {
			Long id = Long.valueOf(contentIdStr);
			Content content = contentDao.getContentById(id);
			content.setContent(contentStr);
			boolean succ = contentDao.updateContent(content);
			if (succ) {
				request.setAttribute("content", content.getContent());
				request.setAttribute("contentId", contentIdStr);
				log.info("save contnet id=" + content.getId() + " title=" + content.getTitle() + " succ");
			} else {
				request.setAttribute("msg", "系统问题，请联系管理员");
			}
		}
		return mapping.findForward("content");
	}

	// family
	public ActionForward showFamily(ActionMapping mapping, ActionForm form, HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		List<Family> list = familyDao.getAllFamliy();
		log.info("get all family size=" + list.size());
		request.setAttribute("families", list);
		return mapping.findForward("family");
	}

	public ActionForward saveFamily(ActionMapping mapping, ActionForm form, HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		DynaBean f = (DynaBean) form;
		String updateIdStr = (String) f.get("updateIdStr");
		if (updateIdStr == null || "".equals(updateIdStr)) {
			Family fm = new Family();
			fm.setGroupNum((String) f.get("new_groupNum"));
			fm.setIdText((String) f.get("new_idText"));
			fm.setName((String) f.get("new_name"));
			if (f.get("new_orderNum") == null || "".equals(f.get("new_orderNum").toString())) {
				fm.setOrderNum(0);
			} else {
				fm.setOrderNum(Integer.valueOf(f.get("new_orderNum").toString()));
			}
			fm.setVersion((String) f.get("new_version"));
			boolean succ = familyDao.addFamliy(fm);
			if (succ) {
				request.setAttribute("msg", "添加新记录成功");
			} else {
				request.setAttribute("msg", "添加记录失败，请联系管理员");
			}
		} else {
			Long id = Long.parseLong(updateIdStr);
			Family fm = familyDao.getFamilyById(id);
			if (fm != null) {
				fm.setGroupNum((String) f.get("new_groupNum"));
				fm.setIdText((String) f.get("new_idText"));
				fm.setName((String) f.get("new_name"));
				if (f.get("new_orderNum") == null || "".equals(f.get("new_orderNum").toString())) {
					fm.setOrderNum(0);
				} else {
					fm.setOrderNum(Integer.valueOf(f.get("new_orderNum").toString()));
				}
				fm.setVersion((String) f.get("new_version"));
				boolean succ = familyDao.updateFamliy(fm);
				if (succ) {
					request.setAttribute("msg", "更新记录成功");
				} else {
					request.setAttribute("msg", "更新记录失败，请联系管理员");
				}
			}
		}
		return this.showFamily(mapping, form, request, response);
	}

	public ActionForward updateFamilyOrderNum(ActionMapping mapping, ActionForm form, HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		String[] ids = request.getParameterValues("id_check");
		if (ids != null) {
			for (String idStr : ids) {
				Long id = Long.parseLong(idStr);
				Family fm = familyDao.getFamilyById(id);
				if (fm != null) {
					String num = request.getParameter("orderNum_" + id);
					if (num.matches("[0-9]{1,}")) {
						fm.setOrderNum(Integer.parseInt(num));
						familyDao.updateFamliy(fm);
						request.setAttribute("msg", "更新成功，记录数为："+ids.length);
					} else {
						request.setAttribute("msg", "数据格式错误");
					}
				}
			}
		}
		return this.showFamily(mapping, form, request, response);
	}

	public ActionForward deleteFamily(ActionMapping mapping, ActionForm form, HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		String[] ids = request.getParameterValues("id_check");
		if (ids != null) {
			for (String idStr : ids) {
				Long id = Long.parseLong(idStr);
				if(id >0 ){
					if(familyDao.deleteFamliy(id)){
						request.setAttribute("msg", "删除记录成功，记录数为："+ids.length);
					}else{
						request.setAttribute("msg", "删除记录失败，请联系管理员");
					}
				}
			}
		}
		return this.showFamily(mapping, form, request, response);
	}
	
	
	// divide
	public ActionForward showDivide(ActionMapping mapping, ActionForm form, HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		List<Divide> list = divideDao.getAllDivide();
		log.info("get all Divide size=" + list.size());
		request.setAttribute("divides", list);
		return mapping.findForward("divide");
	}

	public ActionForward saveDivide(ActionMapping mapping, ActionForm form, HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		DynaBean f = (DynaBean) form;
		String updateIdStr = (String) f.get("updateIdStr");
		if (updateIdStr == null || "".equals(updateIdStr)) {
			Divide d = new Divide();
			d.setGroupNum((String) f.get("new_groupNum"));
			d.setIdText((String) f.get("new_idText"));
			d.setName((String) f.get("new_name"));
			d.setType(Integer.parseInt(f.get("new_type").toString()));
			if (f.get("new_orderNum") == null || "".equals(f.get("new_orderNum").toString())) {
				d.setOrderNum(0);
			} else {
				d.setOrderNum(Integer.valueOf(f.get("new_orderNum").toString()));
			}
			d.setVersion((String) f.get("new_version"));
			boolean succ = divideDao.addDivide(d);
			if (succ) {
				request.setAttribute("msg", "添加新记录成功");
			} else {
				request.setAttribute("msg", "添加记录失败，请联系管理员");
			}
		} else {
			Long id = Long.parseLong(updateIdStr);
			Divide d = divideDao.getDivideById(id);
			if (d != null) {
				d.setGroupNum((String) f.get("new_groupNum"));
				d.setIdText((String) f.get("new_idText"));
				d.setName((String) f.get("new_name"));
				d.setType(Integer.parseInt(f.get("new_type").toString()));
				if (f.get("new_orderNum") == null || "".equals(f.get("new_orderNum").toString())) {
					d.setOrderNum(0);
				} else {
					d.setOrderNum(Integer.valueOf(f.get("new_orderNum").toString()));
				}
				d.setVersion((String) f.get("new_version"));
				boolean succ = divideDao.updateDivide(d);
				if (succ) {
					request.setAttribute("msg", "更新记录成功");
				} else {
					request.setAttribute("msg", "更新记录失败，请联系管理员");
				}
			}
		}
		return this.showDivide(mapping, form, request, response);
	}

	public ActionForward updateDivideOrderNum(ActionMapping mapping, ActionForm form, HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		String[] ids = request.getParameterValues("id_check");
		if (ids != null) {
			for (String idStr : ids) {
				Long id = Long.parseLong(idStr);
				Divide d = divideDao.getDivideById(id);
				if (d != null) {
					String num = request.getParameter("orderNum_" + id);
					if (num.matches("[0-9]{1,}")) {
						d.setOrderNum(Integer.parseInt(num));
						divideDao.updateDivide(d);
						request.setAttribute("msg", "更新成功，记录数为："+ids.length);
					} else {
						request.setAttribute("msg", "数据格式错误");
					}
				}
			}
		}
		return this.showDivide(mapping, form, request, response);
	}

	public ActionForward deleteDivide(ActionMapping mapping, ActionForm form, HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		String[] ids = request.getParameterValues("id_check");
		if (ids != null) {
			for (String idStr : ids) {
				Long id = Long.parseLong(idStr);
				if(id >0 ){
					if(divideDao.deleteDivide(id)){
						request.setAttribute("msg", "删除记录成功，记录数为："+ids.length);
					}else{
						request.setAttribute("msg", "删除记录失败，请联系管理员");
					}
				}
			}
		}
		return this.showDivide(mapping, form, request, response);
	}

}
