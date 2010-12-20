package com.throne212.oa.action;

import java.lang.reflect.Field;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;
import org.apache.struts.actions.DispatchAction;

import com.throne212.oa.common.PageBean;
import com.throne212.oa.common.Util;
import com.throne212.oa.dao.DropdownListDao;
import com.throne212.oa.dao.PersonFileDao;
import com.throne212.oa.domain.DropdownList;
import com.throne212.oa.domain.file.PersonFile;

public class PersonFileAction extends DispatchAction {

	private PersonFileDao fileDao = new PersonFileDao();
	private DropdownListDao dicDao = new DropdownListDao();

	public ActionForward addPersonFile(ActionMapping mapping, ActionForm form, HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		PersonFile doc = this.buildPersonFileModel(request);
		fileDao.addNewPersonFile(doc);
		request.setAttribute("msg", "新人事文件添加成功");
		return mapping.findForward("edit");
	}

	public ActionForward updatePersonFile(ActionMapping mapping, ActionForm form, HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		PersonFile doc = this.buildPersonFileModel(request);
		fileDao.updatePersonFile(doc);
		request.setAttribute("msg", "人事文件更新成功");
		return mapping.findForward("edit");
	}

	private PersonFile buildPersonFileModel(HttpServletRequest request) {
		PersonFile file = new PersonFile();
		Map map = request.getParameterMap();
		Iterator it = map.keySet().iterator();
		while (it.hasNext()) {
			String paramName = (String) it.next();
			String paramValue = request.getParameter(paramName);
			if (paramName != null && paramName.startsWith("file.")) {
				String[] arr = paramName.split("\\.");
				if (arr != null && arr.length == 2) {
					String fieldName = arr[1];
					try {
						Field f = PersonFile.class.getDeclaredField(fieldName);
						if (!f.isAccessible())
							f.setAccessible(true);
						if (f.getType().getName().equals(String.class.getName()))
							f.set(file, paramValue);
						else if (f.getType().getName().equals(Date.class.getName()))
							f.set(file, (paramValue == null || "".equals(paramValue)) ? null : new SimpleDateFormat("yyyy-MM-dd").parse(paramValue));
						else if (f.getType().getName().equals(Boolean.class.getName()))
							f.set(file, (paramValue == null || "".equals(paramValue)) ? null : Boolean.valueOf(Boolean.parseBoolean(paramValue)));
						else if (f.getType().getName().equals(Long.class.getName()))
							f.set(file, (paramValue == null || "".equals(paramValue)) ? null : Long.valueOf(Long.parseLong(paramValue)));
						else if (f.getType().getName().equals(Integer.class.getName()))
							f.set(file, (paramValue == null || "".equals(paramValue)) ? null : Integer.valueOf(Integer.parseInt(paramValue)));
					} catch (Exception e) {
						e.printStackTrace();
					}
				} else if (arr != null && arr.length == 3 && "id".equalsIgnoreCase(arr[2]) && paramValue != null && !"".equals(paramValue)) {
					String fieldName = arr[1];
					try {
						Field f = PersonFile.class.getDeclaredField(fieldName);
						if (!f.isAccessible())
							f.setAccessible(true);
						DropdownList dropdown = (DropdownList) f.getType().newInstance();
						dropdown.setId(Long.valueOf(Long.parseLong(paramValue)));
						f.set(file, dropdown);
					} catch (Exception e) {
						e.printStackTrace();
					}
				}
			}
		}
		return file;
	}

	public ActionForward listPersonFile(ActionMapping mapping, ActionForm form, HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		PersonFile condition = this.buildPersonFileModel(request);
		String currPage = request.getParameter("pageIndex");
		int page = 1;
		if (!Util.isEmpty(currPage)) {
			page = Integer.parseInt(currPage);
			page = page < 1 ? 1 : page;
		}
		PageBean pageBean = fileDao.findPersonFiles(page, condition, request.getParameterMap());
		request.setAttribute("pageBean", pageBean);
		return mapping.findForward("list");
	}

	public ActionForward viewPersonFile(ActionMapping mapping, ActionForm form, HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		PersonFile file = fileDao.getPersonFileById(Long.parseLong(request.getParameter("id")));
		request.setAttribute("file", file);
		return mapping.findForward("edit");
	}

	// 删除
	public ActionForward deletePersonFile(ActionMapping mapping, ActionForm form, HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		int rst = fileDao.deletePersonFile(Long.parseLong(request.getParameter("id")));
		if (rst > 0) {
			request.setAttribute("msg", "人事删除成功");
		}
		return this.listPersonFile(mapping, form, request, response);
	}

	// 数据字典列表
	public ActionForward listDic(ActionMapping mapping, ActionForm form, HttpServletRequest request, HttpServletResponse response) throws Exception {
		Map map = fileDao.getAllDic();
		request.setAttribute("dicMap", map);
		return mapping.findForward("dic_list");
	}

	public ActionForward dicEdit(ActionMapping mapping, ActionForm form, HttpServletRequest request, HttpServletResponse response) throws Exception {
		String dicName = request.getParameter("dicName");
		List list = dicDao.getDropdownList(dicName);
		System.out.println(PersonFile.class.getPackage().getName() + "." + dicName);
		Class clazz = Class.forName(PersonFile.class.getPackage().getName() + "." + dicName);
		Field f = clazz.getDeclaredField("componentName");
		request.setAttribute("dic_name", (String) f.get(clazz.newInstance()));
		request.setAttribute("dicList", list);
		return mapping.findForward("dic_edit");
	}

	public ActionForward saveDic(ActionMapping mapping, ActionForm form, HttpServletRequest request, HttpServletResponse response) throws Exception {
		String idStr = request.getParameter("d_id");
		String name = request.getParameter("d_name");
		String listorder = request.getParameter("d_listorder");
		DropdownList dic = dicDao.getDropdownListById(Long.valueOf(Long.parseLong(idStr)));
		dic.setName(name);
		if (!Util.isEmpty(listorder))
			dic.setListorder(Integer.valueOf(Integer.parseInt(listorder)));
		dicDao.updateDic(dic);
		request.setAttribute("msg", "字段数据更新成功");
		String dicName = request.getParameter("dicName");
		if (dicName != null)
			request.getSession().getServletContext().removeAttribute(dicName);
		return this.dicEdit(mapping, form, request, response);
	}

	// 增加数据字典
	public ActionForward addDic(ActionMapping mapping, ActionForm form, HttpServletRequest request, HttpServletResponse response) throws Exception {
		String name = request.getParameter("d_name");
		String listorder = request.getParameter("d_listorder");
		String dicName = request.getParameter("dicName");
		dicName = PersonFile.class.getPackage().getName() + "." + dicName;
		Integer i = null;
		if (!Util.isEmpty(listorder))
			i = Integer.valueOf(Integer.parseInt(listorder));
		dicDao.addDic(dicName, name, i);
		request.setAttribute("msg", "数据字典项增加成功");
		if (dicName != null)
			request.getSession().getServletContext().removeAttribute(request.getParameter("dicName"));
		return this.dicEdit(mapping, form, request, response);
	}
	
	// 删除数据字典
	public ActionForward deleteDic(ActionMapping mapping, ActionForm form, HttpServletRequest request, HttpServletResponse response) throws Exception {
		String id = request.getParameter("id");
		String dicName = request.getParameter("dicName");
		dicName = PersonFile.class.getPackage().getName() + "." + dicName;
		int rst = dicDao.deleteDic(dicName, Long.valueOf(Long.parseLong(id)));
		if(rst > 0)
			request.setAttribute("msg", "数据字典项删除成功");
		else
			request.setAttribute("msg", "数据字典项删除失败，请检查是否已经有数据与该字典项关联");
		if (dicName != null)
			request.getSession().getServletContext().removeAttribute(request.getParameter("dicName"));
		return this.dicEdit(mapping, form, request, response);
	}

}
