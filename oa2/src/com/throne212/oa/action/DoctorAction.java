package com.throne212.oa.action;

import java.lang.reflect.Field;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Iterator;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;
import org.apache.struts.actions.DispatchAction;

import com.throne212.oa.common.PageBean;
import com.throne212.oa.common.Util;
import com.throne212.oa.dao.DoctorDao;
import com.throne212.oa.domain.doctor.Doctor;
import com.throne212.oa.domain.doctor.DropdownList;

public class DoctorAction extends DispatchAction{
	
	private DoctorDao docDao = new DoctorDao();

	public ActionForward addDoctor(ActionMapping mapping, ActionForm form, HttpServletRequest request, HttpServletResponse response) throws Exception {
		Doctor doc = this.buildDoctorModel(request);
		docDao.addNewDoctor(doc);
		
		request.setAttribute("msg", "新医生[ "+doc.getName()+" ]注册成功");
		return mapping.findForward("edit");
	}
	
	private Doctor buildDoctorModel(HttpServletRequest request){
		Doctor doc = new Doctor();
		Map map = request.getParameterMap();
		Iterator it = map.keySet().iterator();
		while(it.hasNext()){
			String paramName = (String) it.next();
			String paramValue = request.getParameter(paramName);
			if(paramName != null && paramName.startsWith("doc.")){
				String[] arr = paramName.split("\\.");
				if(arr != null && arr.length ==2){
					String fieldName = arr[1];
					try {
						Field f = Doctor.class.getDeclaredField(fieldName);
						if(!f.isAccessible())
							f.setAccessible(true);
						if(f.getType().getName().equals(String.class.getName()))
							f.set(doc, paramValue);
						else if(f.getType().getName().equals(Date.class.getName()))
							f.set(doc, (paramValue==null||"".equals(paramValue))?null:new SimpleDateFormat("yyyy-MM-dd").parse(paramValue));
						else if(f.getType().getName().equals(Boolean.class.getName()))
							f.set(doc, (paramValue==null||"".equals(paramValue))?null:Boolean.valueOf(Boolean.parseBoolean(paramValue)));
					} catch (Exception e) {
						e.printStackTrace();
					} 					
				}else if(arr != null && arr.length == 3 && "id".equalsIgnoreCase(arr[2]) && paramValue!=null && !"".equals(paramValue)){
					String fieldName = arr[1];
					try {
						Field f = Doctor.class.getDeclaredField(fieldName);
						if(!f.isAccessible())
							f.setAccessible(true);
						DropdownList dropdown = (DropdownList) f.getType().newInstance();
						dropdown.setId(Long.valueOf(Long.parseLong(paramValue)));
						f.set(doc, dropdown);
					} catch (Exception e) {
						e.printStackTrace();
					} 					
				}	
			}
		}
		//照片
		if(request.getSession().getAttribute("image")!=null){
			doc.setImage((String) request.getSession().getAttribute("image"));
			request.getSession().removeAttribute("image");
		}
		return doc;
	}
	
	public ActionForward listDoctor(ActionMapping mapping, ActionForm form, HttpServletRequest request, HttpServletResponse response) throws Exception {
		Doctor condition = this.buildDoctorModel(request);
		String currPage = request.getParameter("page");
		int page = 1;
		if(!Util.isEmpty(currPage)){
			page = Integer.parseInt(currPage);
			page = page<1?1:page;
		}
		PageBean pageBean = docDao.findDoctors(page, condition, request.getParameterMap());
		request.setAttribute("pageBean", pageBean);
		return mapping.findForward("list");
	}
	public ActionForward viewDoctor(ActionMapping mapping, ActionForm form, HttpServletRequest request, HttpServletResponse response) throws Exception {
		Doctor doc = docDao.getDoctorById(Long.parseLong(request.getParameter("id")));
		request.setAttribute("doc", doc);
		return mapping.findForward("edit");
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

}
