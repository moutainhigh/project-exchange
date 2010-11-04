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
import com.throne212.oa.dao.PersonDao;
import com.throne212.oa.domain.DropdownList;
import com.throne212.oa.domain.person.Person;

public class PersonAction extends DispatchAction {

	private PersonDao personDao = new PersonDao();
	private DropdownListDao dicDao = new DropdownListDao();

	public ActionForward addPerson(ActionMapping mapping, ActionForm form, HttpServletRequest request, HttpServletResponse response) throws Exception {
		Person doc = this.buildPersonModel(request);
		personDao.addNewPerson(doc);

		request.setAttribute("msg", "新人事[ " + doc.getName() + " ]注册成功");
		return mapping.findForward("edit");
	}

	public ActionForward updatePerson(ActionMapping mapping, ActionForm form, HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		Person doc = this.buildPersonModel(request);
		personDao.updatePerson(doc);
		request.setAttribute("msg", "人事[ " + doc.getName() + " ]更新成功");
		return mapping.findForward("edit");
	}

	private Person buildPersonModel(HttpServletRequest request) {
		Person person = new Person();
		Map map = request.getParameterMap();
		Iterator it = map.keySet().iterator();
		while (it.hasNext()) {
			String paramName = (String) it.next();
			String paramValue = request.getParameter(paramName);
			if (paramName != null && paramName.startsWith("person.")) {
				String[] arr = paramName.split("\\.");
				if (arr != null && arr.length == 2) {
					String fieldName = arr[1];
					try {
						Field f = Person.class.getDeclaredField(fieldName);
						if (!f.isAccessible())
							f.setAccessible(true);
						if (f.getType().getName().equals(String.class.getName()))
							f.set(person, paramValue);
						else if (f.getType().getName().equals(Date.class.getName()))
							f
									.set(person, (paramValue == null || "".equals(paramValue)) ? null : new SimpleDateFormat("yyyy-MM-dd")
											.parse(paramValue));
						else if (f.getType().getName().equals(Boolean.class.getName()))
							f.set(person, (paramValue == null || "".equals(paramValue)) ? null : Boolean.valueOf(Boolean.parseBoolean(paramValue)));
						else if (f.getType().getName().equals(Long.class.getName()))
							f.set(person, (paramValue == null || "".equals(paramValue)) ? null : Long.valueOf(Long.parseLong(paramValue)));
						else if (f.getType().getName().equals(Integer.class.getName()))
							f.set(person, (paramValue == null || "".equals(paramValue)) ? null : Integer.valueOf(Integer.parseInt(paramValue)));
					} catch (Exception e) {
						e.printStackTrace();
					}
				} else if (arr != null && arr.length == 3 && "id".equalsIgnoreCase(arr[2]) && paramValue != null && !"".equals(paramValue)) {
					String fieldName = arr[1];
					try {
						Field f = Person.class.getDeclaredField(fieldName);
						if (!f.isAccessible())
							f.setAccessible(true);
						DropdownList dropdown = (DropdownList) f.getType().newInstance();
						dropdown.setId(Long.valueOf(Long.parseLong(paramValue)));
						f.set(person, dropdown);
					} catch (Exception e) {
						e.printStackTrace();
					}
				}
			}
		}
		return person;
	}

	public ActionForward listPerson(ActionMapping mapping, ActionForm form, HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		Person condition = this.buildPersonModel(request);
		String currPage = request.getParameter("pageIndex");
		int page = 1;
		if (!Util.isEmpty(currPage)) {
			page = Integer.parseInt(currPage);
			page = page < 1 ? 1 : page;
		}
		PageBean pageBean = personDao.findPersons(page, condition, request.getParameterMap());
		request.setAttribute("pageBean", pageBean);
		return mapping.findForward("list");
	}

	public ActionForward viewPerson(ActionMapping mapping, ActionForm form, HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		Person person = personDao.getPersonById(Long.parseLong(request.getParameter("id")));
		request.setAttribute("person", person);
		return mapping.findForward("edit");
	}

	// //注销
	// public ActionForward unregPerson(ActionMapping mapping, ActionForm form,
	// HttpServletRequest request, HttpServletResponse response) throws
	// Exception {
	// Person person =
	// personDao.getPersonById(Long.parseLong(request.getParameter("id")));
	// personDao.updatePerson(person);
	// return this.listPerson(mapping, form, request, response);
	// }
	// //恢复
	// public ActionForward resumePerson(ActionMapping mapping, ActionForm form,
	// HttpServletRequest request, HttpServletResponse response) throws
	// Exception {
	// Person person =
	// personDao.getPersonById(Long.parseLong(request.getParameter("id")));
	// personDao.updatePerson(person);
	// return this.listPerson(mapping, form, request, response);
	// }
	// 删除
	public ActionForward deletePerson(ActionMapping mapping, ActionForm form, HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		int rst = personDao.deletePerson(Long.parseLong(request.getParameter("id")));
		if (rst > 0) {
			request.setAttribute("msg", "人事删除成功");
		}
		return this.listPerson(mapping, form, request, response);
	}

	// 数据字典列表
	public ActionForward listDic(ActionMapping mapping, ActionForm form, HttpServletRequest request, HttpServletResponse response) throws Exception {
		Map map = personDao.getAllDic();
		request.setAttribute("dicMap", map);
		return mapping.findForward("dic_list");
	}

	public ActionForward dicEdit(ActionMapping mapping, ActionForm form, HttpServletRequest request, HttpServletResponse response) throws Exception {
		String dicName = request.getParameter("dicName");
		List list = dicDao.getDropdownList(dicName);
		Class clazz = Class.forName(Person.class.getPackage().getName() + "." + dicName);
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
		dicName = Person.class.getPackage().getName() + "." + dicName;
		Integer i = null;
		if (!Util.isEmpty(listorder))
			i = Integer.valueOf(Integer.parseInt(listorder));
		dicDao.addDic(dicName, name, i);
		request.setAttribute("msg", "数据字典项增加成功");
		if (dicName != null)
			request.getSession().getServletContext().removeAttribute(dicName);
		return this.dicEdit(mapping, form, request, response);
	}

	public static void main(String[] args) {
		// System.out.println("person.name".startsWith("person."));
		String str = "person.name";
		String[] arr = str.split("\\.");
		for (int i = 0; i < arr.length; i++) {
			String string = arr[i];
			System.out.println(string);
		}
		System.out.println(Boolean.valueOf(Boolean.parseBoolean("false")));
	}

}
