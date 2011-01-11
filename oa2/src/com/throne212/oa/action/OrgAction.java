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
import com.throne212.oa.dao.OrgDao;
import com.throne212.oa.domain.DropdownList;
import com.throne212.oa.domain.muyingorg.Org;

public class OrgAction extends DispatchAction{
	
	private OrgDao orgDao = new OrgDao();
	private DropdownListDao dicDao = new DropdownListDao();

	public ActionForward addOrg(ActionMapping mapping, ActionForm form, HttpServletRequest request, HttpServletResponse response) throws Exception {
		Org doc = this.buildOrgModel(request);
		orgDao.addNewOrg(doc);
		
		request.setAttribute("msg", "新母婴机构[ "+doc.getName()+" ]注册成功");
		return mapping.findForward("edit");
	}
	public ActionForward updateOrg(ActionMapping mapping, ActionForm form, HttpServletRequest request, HttpServletResponse response) throws Exception {
		Org doc = this.buildOrgModel(request);
		orgDao.updateOrg(doc);		
		request.setAttribute("msg", "母婴机构[ "+doc.getName()+" ]更新成功");
		return mapping.findForward("edit");
	}
	
	private Org buildOrgModel(HttpServletRequest request){
		Org org = new Org();
		Map map = request.getParameterMap();
		Iterator it = map.keySet().iterator();
		while(it.hasNext()){
			String paramName = (String) it.next();
			String paramValue = request.getParameter(paramName);
			if(paramName != null && paramName.startsWith("org.")){
				String[] arr = paramName.split("\\.");
				if(arr != null && arr.length ==2){
					String fieldName = arr[1];
					try {
						Field f = Org.class.getDeclaredField(fieldName);
						if(!f.isAccessible())
							f.setAccessible(true);
						if(f.getType().getName().equals(String.class.getName()))
							f.set(org, paramValue);
						else if(f.getType().getName().equals(Date.class.getName()))
							f.set(org, (paramValue==null||"".equals(paramValue))?null:new SimpleDateFormat("yyyy-MM-dd").parse(paramValue));
						else if(f.getType().getName().equals(Boolean.class.getName()))
							f.set(org, (paramValue==null||"".equals(paramValue))?null:Boolean.valueOf(Boolean.parseBoolean(paramValue)));
						else if(f.getType().getName().equals(Long.class.getName()))
							f.set(org, (paramValue==null||"".equals(paramValue))?null:Long.valueOf(Long.parseLong(paramValue)));
						else if(f.getType().getName().equals(Integer.class.getName()))
							f.set(org, (paramValue==null||"".equals(paramValue))?null:Integer.valueOf(Integer.parseInt(paramValue)));
					} catch (Exception e) {
						e.printStackTrace();
					} 					
				}else if(arr != null && arr.length == 3 && "id".equalsIgnoreCase(arr[2]) && paramValue!=null && !"".equals(paramValue)){
					String fieldName = arr[1];
					try {
						Field f = Org.class.getDeclaredField(fieldName);
						if(!f.isAccessible())
							f.setAccessible(true);
						DropdownList dropdown = (DropdownList) f.getType().newInstance();
						dropdown.setId(Long.valueOf(Long.parseLong(paramValue)));
						f.set(org, dropdown);
					} catch (Exception e) {
						e.printStackTrace();
					} 					
				}	
			}
		}
		return org;
	}
	
	public ActionForward listOrg(ActionMapping mapping, ActionForm form, HttpServletRequest request, HttpServletResponse response) throws Exception {
		Org condition = this.buildOrgModel(request);
		String currPage = request.getParameter("pageIndex");
		int page = 1;
		if(!Util.isEmpty(currPage)){
			page = Integer.parseInt(currPage);
			page = page<1?1:page;
		}
		PageBean pageBean = orgDao.findOrgs(page, condition, request.getParameterMap());
		request.setAttribute("pageBean", pageBean);
		return mapping.findForward("list");
	}
	public ActionForward viewOrg(ActionMapping mapping, ActionForm form, HttpServletRequest request, HttpServletResponse response) throws Exception {
		Org doc = orgDao.getOrgById(Long.parseLong(request.getParameter("id")));
		request.setAttribute("org", doc);
		return mapping.findForward("edit");
	}
	/*//注销
	public ActionForward unregOrg(ActionMapping mapping, ActionForm form, HttpServletRequest request, HttpServletResponse response) throws Exception {
		Org doc = orgDao.getOrgById(Long.parseLong(request.getParameter("id")));
		doc.setStatus(Integer.valueOf(0));
		doc.setUnregReason(request.getParameter("reason"));
		orgDao.updateOrg(doc);
		return this.listOrg(mapping, form, request, response);
	}
	//恢复
	public ActionForward resumeOrg(ActionMapping mapping, ActionForm form, HttpServletRequest request, HttpServletResponse response) throws Exception {
		Org doc = orgDao.getOrgById(Long.parseLong(request.getParameter("id")));
		doc.setStatus(Integer.valueOf(1));
		orgDao.updateOrg(doc);
		return this.listOrg(mapping, form, request, response);
	}*/
	//删除
	public ActionForward deleteOrg(ActionMapping mapping, ActionForm form, HttpServletRequest request, HttpServletResponse response) throws Exception {
		int rst = orgDao.deleteOrg(Long.parseLong(request.getParameter("id")));
		if(rst > 0){
			request.setAttribute("msg", "母婴机构注册删除成功");
		}
		return this.listOrg(mapping, form, request, response);
	}
	
	//数据字典列表
	public ActionForward listDic(ActionMapping mapping, ActionForm form, HttpServletRequest request, HttpServletResponse response) throws Exception {
		Map map = orgDao.getAllDic();
		request.setAttribute("dicMap", map);
		return mapping.findForward("dic_list");
	}
	public ActionForward dicEdit(ActionMapping mapping, ActionForm form, HttpServletRequest request, HttpServletResponse response) throws Exception {
		String dicName = request.getParameter("dicName");
		List list = dicDao.getDropdownList(dicName);
		Class clazz = Class.forName(Org.class.getPackage().getName()+"."+dicName);
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
		if(!Util.isEmpty(listorder))
			dic.setListorder(Integer.valueOf(Integer.parseInt(listorder)));
		dicDao.updateDic(dic);
		request.setAttribute("msg", "字段数据更新成功");
		String dicName = request.getParameter("dicName");
		if(dicName != null)
			request.getSession().getServletContext().removeAttribute(dicName);
		return this.dicEdit(mapping, form, request, response);
	}
	// 增加数据字典
	public ActionForward addDic(ActionMapping mapping, ActionForm form, HttpServletRequest request, HttpServletResponse response) throws Exception {
		String name = request.getParameter("d_name");
		String listorder = request.getParameter("d_listorder");
		String dicName = request.getParameter("dicName");
		dicName = Org.class.getPackage().getName() + "." + dicName;
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
		dicName = Org.class.getPackage().getName() + "." + dicName;
		int rst = dicDao.deleteDic(dicName, Long.valueOf(Long.parseLong(id)));
		if(rst > 0)
			request.setAttribute("msg", "数据字典项删除成功");
		else
			request.setAttribute("msg", "数据字典项删除失败，请检查是否已经有数据与该字典项关联");
		if (dicName != null)
			request.getSession().getServletContext().removeAttribute(request.getParameter("dicName"));
		return this.dicEdit(mapping, form, request, response);
	}
	
	public static void main(String[] args) {
		//System.out.println("doc.name".startsWith("doc."));
		String str = "doc.name";
		String[] arr = str.split("\\.");
		for (int i = 0; i < arr.length; i++) {
			String string = arr[i];
			System.out.println(string);
		}	
		System.out.println(Boolean.valueOf(Boolean.parseBoolean("false")));
	}
	
	public ActionForward getOrgInfo(ActionMapping mapping, ActionForm form, HttpServletRequest request, HttpServletResponse response) throws Exception {
		String id = request.getParameter("id");
		Org org = orgDao.getOrgById(Long.parseLong(id));
		request.setAttribute("org", org);
		return mapping.findForward("print");
	}

}
