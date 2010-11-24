package com.throne212.oa.action;

import java.lang.reflect.Field;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;
import org.apache.struts.actions.DispatchAction;

import com.throne212.oa.common.Util;
import com.throne212.oa.dao.DropdownListDao;
import com.throne212.oa.dao.ReportDao;
import com.throne212.oa.domain.DropdownList;
import com.throne212.oa.domain.report.HospitalType;
import com.throne212.oa.domain.report.WorkReport;

public class ReportAction extends DispatchAction{
	
	private ReportDao reportDao = new ReportDao();
	private DropdownListDao dicDao = new DropdownListDao();
	
	//������
	public ActionForward main(ActionMapping mapping, ActionForm form, HttpServletRequest request, HttpServletResponse response) throws Exception {
		List orgTypeList = reportDao.getDicValueList(HospitalType.class.getName());
		request.setAttribute("orgTypeList", orgTypeList);
		return mapping.findForward("main");
	}
	
	public ActionForward listYear(ActionMapping mapping, ActionForm form, HttpServletRequest request, HttpServletResponse response) throws Exception {
		List yearList = reportDao.getAllYears();
		request.setAttribute("years", yearList);
		return mapping.findForward("year");
	}
	public ActionForward listMonth(ActionMapping mapping, ActionForm form, HttpServletRequest request, HttpServletResponse response) throws Exception {
		List yearList = reportDao.getAllYears();
		request.setAttribute("years", yearList);
		return mapping.findForward("month");
	}
	public ActionForward listSeason(ActionMapping mapping, ActionForm form, HttpServletRequest request, HttpServletResponse response) throws Exception {
		List yearList = reportDao.getAllYears();
		request.setAttribute("years", yearList);
		return mapping.findForward("season");
	}
	
	public ActionForward index(ActionMapping mapping, ActionForm form, HttpServletRequest request, HttpServletResponse response) throws Exception {
		List yearList = reportDao.getAllYears();
		request.setAttribute("years", yearList);
		return mapping.findForward("default");
	}

	public ActionForward addYear(ActionMapping mapping, ActionForm form, HttpServletRequest request, HttpServletResponse response) throws Exception {
		try {
			reportDao.addNewYear(Integer.valueOf(request.getParameter("newYear")).intValue());
			request.setAttribute("msg", "�����[ "+request.getParameter("newYear")+" ]��ӳɹ�");
		} catch (RuntimeException e) {
			e.printStackTrace();
			request.setAttribute("msg", "������ʧ�ܣ����������Ƿ��Ѿ������");
		}
		return index(mapping,form,request,response);
	}
	public ActionForward deleteYear(ActionMapping mapping, ActionForm form, HttpServletRequest request, HttpServletResponse response) throws Exception {
		int rst = -1;
		try {
			rst = reportDao.deleteYear(Integer.valueOf(request.getParameter("year")).intValue());
			if(rst > 0){
				request.setAttribute("msg", "���[ "+request.getParameter("newYear")+" ]ɾ���ɹ�");
			}else{
				request.setAttribute("msg", "���ɾ��ʧ��");
			}
		} catch (RuntimeException e) {
			e.printStackTrace();
			request.setAttribute("msg", "���ɾ��ʧ�ܣ������Ƿ������Ƿ��Ѿ������˱���������");
		}
		return index(mapping,form,request,response);
	}
	
	//�����б�
	public ActionForward listOrg(ActionMapping mapping, ActionForm form, HttpServletRequest request, HttpServletResponse response) throws Exception {
		Long typeId = Long.valueOf(request.getParameter("orgTypeId"));
		List orgList = reportDao.getHospitalByType(typeId);
		request.setAttribute("orgList", orgList);
		return mapping.findForward("org");
	}
	public ActionForward addHospital(ActionMapping mapping, ActionForm form, HttpServletRequest request, HttpServletResponse response) throws Exception {
		try {
			reportDao.addOrgInType(Long.valueOf(request.getParameter("hosId")),Long.valueOf(request.getParameter("orgTypeId")));
			request.setAttribute("msg", "��ӵ�λ�ɹ�");
		} catch (RuntimeException e) {
			e.printStackTrace();
			request.setAttribute("msg", "��ӵ�λʧ��");
		}
		return listOrg(mapping,form,request,response);
	}
	public ActionForward removeHospital(ActionMapping mapping, ActionForm form, HttpServletRequest request, HttpServletResponse response) throws Exception {
		try {
			reportDao.removeOrgInType(Long.valueOf(request.getParameter("hosId")));
			request.setAttribute("msg", "�Ƴ���λ�ɹ�");
		} catch (RuntimeException e) {
			e.printStackTrace();
			request.setAttribute("msg", "�Ƴ���λʧ��");
		}
		return listOrg(mapping,form,request,response);
	}
	
	//�����ֵ��б�
	public ActionForward listDic(ActionMapping mapping, ActionForm form, HttpServletRequest request, HttpServletResponse response) throws Exception {
		Map map = reportDao.getAllDic();
		request.setAttribute("dicMap", map);
		return mapping.findForward("dic_list");
	}
	public ActionForward dicEdit(ActionMapping mapping, ActionForm form, HttpServletRequest request, HttpServletResponse response) throws Exception {
		String dicName = request.getParameter("dicName");
		List list = dicDao.getDropdownList(dicName);
		Class clazz = Class.forName(WorkReport.class.getPackage().getName()+"."+dicName);
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
		request.setAttribute("msg", "�ֶ����ݸ��³ɹ�");
		String dicName = request.getParameter("dicName");
		if(dicName != null)
			request.getSession().getServletContext().removeAttribute(dicName);
		return this.dicEdit(mapping, form, request, response);
	}
	// ���������ֵ�
	public ActionForward addDic(ActionMapping mapping, ActionForm form, HttpServletRequest request, HttpServletResponse response) throws Exception {
		String name = request.getParameter("d_name");
		String listorder = request.getParameter("d_listorder");
		String dicName = request.getParameter("dicName");
		dicName = WorkReport.class.getPackage().getName() + "." + dicName;
		Integer i = null;
		if (!Util.isEmpty(listorder))
			i = Integer.valueOf(Integer.parseInt(listorder));
		dicDao.addDic(dicName, name, i);
		request.setAttribute("msg", "�����ֵ������ӳɹ�");
		if (dicName != null)
			request.getSession().getServletContext().removeAttribute(dicName);
		return this.dicEdit(mapping, form, request, response);
	}
	// ɾ�������ֵ�
	public ActionForward deleteDic(ActionMapping mapping, ActionForm form, HttpServletRequest request, HttpServletResponse response) throws Exception {
		String id = request.getParameter("id");
		String dicName = request.getParameter("dicName");
		dicName = WorkReport.class.getPackage().getName() + "." + dicName;
		int rst = dicDao.deleteDic(dicName, Long.valueOf(Long.parseLong(id)));
		if(rst > 0)
			request.setAttribute("msg", "�����ֵ���ɾ���ɹ�");
		else
			request.setAttribute("msg", "�����ֵ���ɾ��ʧ�ܣ������Ƿ��Ѿ�����������ֵ������");
		if (dicName != null)
			request.getSession().getServletContext().removeAttribute(dicName);
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

}
