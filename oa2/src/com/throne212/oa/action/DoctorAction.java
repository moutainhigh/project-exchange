package com.throne212.oa.action;

import java.io.FileOutputStream;
import java.lang.reflect.Field;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.GregorianCalendar;
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
import com.throne212.oa.dao.DoctorDao;
import com.throne212.oa.dao.DropdownListDao;
import com.throne212.oa.dao.RecordDao;
import com.throne212.oa.domain.DropdownList;
import com.throne212.oa.domain.doctor.ChangeRecord;
import com.throne212.oa.domain.doctor.Cun;
import com.throne212.oa.domain.doctor.Doctor;
import com.throne212.oa.domain.doctor.KaoheRecord;
import com.throne212.oa.domain.doctor.Record;
import com.throne212.oa.domain.doctor.TrainingRecord;

public class DoctorAction extends DispatchAction{
	
	private DoctorDao docDao = new DoctorDao();
	private DropdownListDao dicDao = new DropdownListDao();
	private RecordDao recDao = new RecordDao();

	public ActionForward addDoctor(ActionMapping mapping, ActionForm form, HttpServletRequest request, HttpServletResponse response) throws Exception {
		Doctor doc = this.buildDoctorModel(request);
		docDao.addNewDoctor(doc);
		
		request.setAttribute("msg", "新医生[ "+doc.getName()+" ]注册成功");
		return mapping.findForward("edit");
	}
	public ActionForward updateDoctor(ActionMapping mapping, ActionForm form, HttpServletRequest request, HttpServletResponse response) throws Exception {
		Doctor doc = this.buildDoctorModel(request);
		docDao.updateDoctor(doc);		
		request.setAttribute("msg", "医生[ "+doc.getName()+" ]更新成功");
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
						else if(f.getType().getName().equals(Long.class.getName()))
							f.set(doc, (paramValue==null||"".equals(paramValue))?null:Long.valueOf(Long.parseLong(paramValue)));
						else if(f.getType().getName().equals(Integer.class.getName()))
							f.set(doc, (paramValue==null||"".equals(paramValue))?null:Integer.valueOf(Integer.parseInt(paramValue)));
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
		String currPage = request.getParameter("pageIndex");
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
		//记录
		List crList = recDao.getRecords(ChangeRecord.class, doc.getId());
		List tnList = recDao.getRecords(TrainingRecord.class, doc.getId());
		List khList = recDao.getRecords(KaoheRecord.class, doc.getId());
		request.setAttribute("crList", crList);
		request.setAttribute("tnList", tnList);
		request.setAttribute("khList", khList);
		return mapping.findForward("edit");
	}
	//注销
	public ActionForward unregDoctor(ActionMapping mapping, ActionForm form, HttpServletRequest request, HttpServletResponse response) throws Exception {
		Doctor doc = docDao.getDoctorById(Long.parseLong(request.getParameter("id")));
		doc.setStatus(Integer.valueOf(0));
		doc.setUnregReason(request.getParameter("reason"));
		docDao.updateDoctor(doc);
		return this.listDoctor(mapping, form, request, response);
	}
	//恢复
	public ActionForward resumeDoctor(ActionMapping mapping, ActionForm form, HttpServletRequest request, HttpServletResponse response) throws Exception {
		Doctor doc = docDao.getDoctorById(Long.parseLong(request.getParameter("id")));
		doc.setStatus(Integer.valueOf(1));
		docDao.updateDoctor(doc);
		return this.listDoctor(mapping, form, request, response);
	}
	//删除
	public ActionForward deleteDoctor(ActionMapping mapping, ActionForm form, HttpServletRequest request, HttpServletResponse response) throws Exception {
		int rst = docDao.deleteDoctor(Long.parseLong(request.getParameter("id")));
		if(rst > 0){
			request.setAttribute("msg", "医生注册删除成功");
		}
		return this.listDoctor(mapping, form, request, response);
	}
	
	//数据字典列表
	public ActionForward listDic(ActionMapping mapping, ActionForm form, HttpServletRequest request, HttpServletResponse response) throws Exception {
		Map map = docDao.getAllDic();
		request.setAttribute("dicMap", map);
		return mapping.findForward("dic_list");
	}
	public ActionForward dicEdit(ActionMapping mapping, ActionForm form, HttpServletRequest request, HttpServletResponse response) throws Exception {
		String dicName = request.getParameter("dicName");
		List list = dicDao.getDropdownList(dicName);
		Class clazz = Class.forName(Doctor.class.getPackage().getName()+"."+dicName);
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
		dicName = Doctor.class.getPackage().getName() + "." + dicName;
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
		dicName = Doctor.class.getPackage().getName() + "." + dicName;
		int rst = dicDao.deleteDic(dicName, Long.valueOf(Long.parseLong(id)));
		if(rst > 0)
			request.setAttribute("msg", "数据字典项删除成功");
		else
			request.setAttribute("msg", "数据字典项删除失败，请检查是否已经有数据与该字典项关联");
		if (dicName != null)
			request.getSession().getServletContext().removeAttribute(request.getParameter("dicName"));
		return this.dicEdit(mapping, form, request, response);
	}
	
	//打印
	public ActionForward getDoctorInfo(ActionMapping mapping, ActionForm form, HttpServletRequest request, HttpServletResponse response) throws Exception {
		String id = request.getParameter("id");
		Doctor d = docDao.getDoctorById(Long.parseLong(id));
		request.setAttribute("doc", d);
		String page = request.getParameter("page");
		
		List crList = recDao.getRecords(ChangeRecord.class, d.getId(), 3);
		List trList = recDao.getRecords(TrainingRecord.class, d.getId(), 6);
		List krList = recDao.getRecords(KaoheRecord.class, d.getId(), 3);
		request.setAttribute("crList", crList);
		request.setAttribute("trList", trList);
		request.setAttribute("krList", krList);
		
		return mapping.findForward("print_set");
	}
	public ActionForward printDoctorInfo(ActionMapping mapping, ActionForm form, HttpServletRequest request, HttpServletResponse response) throws Exception {
		String id = request.getParameter("id");
		Doctor d = docDao.getDoctorById(Long.parseLong(id));
		request.setAttribute("doc", d);
		String page = "";
		String op = "";
		
		String printAction = request.getParameter("printAction");
		if("doc".equals(printAction)){
			page = "";
			op = "11";
		}else if("cr".equals(printAction)){
			page = "2";
			String crId = request.getParameter("crId");
			ChangeRecord cr = null;
			if(crId == null || "".equals(crId))
				cr = (ChangeRecord) recDao.getLastRecord(ChangeRecord.class, d.getId());
			else
				cr = (ChangeRecord) recDao.getRecordById(Long.valueOf(crId));
			request.setAttribute("cr", cr);
			op = "2" + cr.getpOrder();
		}else if("tr".equals(printAction)){
			String trId = request.getParameter("trId");
			long rid = Long.valueOf(trId).longValue();
			TrainingRecord tr = null;
			if(trId == null || "".equals(trId))
				tr = (TrainingRecord) recDao.getLastRecord(TrainingRecord.class, d.getId());
			else
				tr = (TrainingRecord) recDao.getRecordById(Long.valueOf(trId));
			page = "2";
			op = "3" + tr.getpOrder();
			List trList = recDao.getRecords(TrainingRecord.class, d.getId(), 6);
			for(int i = 0; i < trList.size(); i++){
				TrainingRecord trInList = (TrainingRecord) trList.get(i);
				if(tr.getId().equals(trInList.getId())){
					if((i+1) > 3){
						page = "3";
					}
				}
			}
			request.setAttribute("tr", tr);
		}else if("kr".equals(printAction)){
			page = "3";
			String krId = request.getParameter("krId");
			KaoheRecord kr = null;
			if(krId == null || "".equals(krId))
				kr = (KaoheRecord) recDao.getLastRecord(KaoheRecord.class, d.getId());
			else
				kr = (KaoheRecord) recDao.getRecordById(Long.valueOf(krId));
			op = "4" + kr.getpOrder();
			request.setAttribute("kr", kr);
		}
		
		request.setAttribute("op", op);
		
		if(page == null || "".equals(page))
			return mapping.findForward("print");
		else
			return mapping.findForward("print" + page);
	}
	public ActionForward printOption(ActionMapping mapping, ActionForm form, HttpServletRequest request, HttpServletResponse response) throws Exception {
		String op = request.getParameter("op");
		int num = Integer.parseInt(op);
		String page = "1";
		if(num >= 21 && num <= 23){
			page = "2";
			ChangeRecord cr = new ChangeRecord();
			cr.setDate(new Date());
			cr.setContent("记录内容");
			request.setAttribute("cr", cr);
		}else if(num >= 31 && num <= 33){
			page = "2";
			TrainingRecord tr = new TrainingRecord();
			tr.setDate(new Date());
			tr.setContent("记录内容");
			request.setAttribute("tr", tr);
		}else if(num >= 34 && num <= 36){
			page = "3";
			TrainingRecord tr = new TrainingRecord();
			tr.setDate(new Date());
			tr.setContent("记录内容");
			request.setAttribute("tr", tr);
		}else if(num >= 41 && num <= 43){
			page = "3";
			KaoheRecord kr = new KaoheRecord();
			kr.setDate(new Date());
			kr.setContent("记录内容");
			request.setAttribute("kr", kr);
		}else{
			Doctor doc = new Doctor();
			doc.setName("姓名");
			doc.setGender(Boolean.valueOf(true));
			doc.setBirthday(new Date());
			doc.setIdNo("身份证号码...");
			Cun c = new Cun();
			c.setName("村名");
			doc.setAreaCun(c);
			doc.setZigeNo("资格号码");
			doc.setShenpiOrg("审批机构");
			Calendar time = GregorianCalendar.getInstance();
			time.set(Calendar.YEAR, 1999);
			time.set(Calendar.MONTH, 11);
			time.set(Calendar.DAY_OF_MONTH, 31);
			doc.setOkDate(new Date(time.getTimeInMillis()));
			request.setAttribute("doc", doc);
		}
			
		return mapping.findForward("print_op_" + page);
	}
	public ActionForward savePos(ActionMapping mapping, ActionForm form, HttpServletRequest request, HttpServletResponse response) throws Exception {
		String json = request.getParameter("json");
		String op = request.getParameter("op");
		if(op != null && !"".equals(op)){
			saveJson(json, op);
		}
		return null;
	}
	
	private void saveJson(String json, String jsonNo) throws Exception{
		StringBuffer sb = new StringBuffer(json);
		sb.deleteCharAt(sb.length()-2);
		System.out.println("new json pos="+sb);
		
		String path = Thread.currentThread().getContextClassLoader().getResource("/").getPath();
		path = path.substring(0, path.indexOf("WEB-INF"));
		path += "doctor/json/json"+jsonNo+".txt";
		System.out.println("json saved path : " + path);
		
		FileOutputStream fos = new FileOutputStream(path);
		fos.write(sb.toString().getBytes());
		fos.flush();
		fos.close();
	}
	
	private Record r;
	
	//记录
	public ActionForward editRecord(ActionMapping mapping, ActionForm form, HttpServletRequest request, HttpServletResponse response) throws Exception {
		String recType = request.getParameter("rec_type");
		String recId = request.getParameter("rec_id");
		if(recId != null && !"".equals(recId)){
			r = recDao.getRecordById(Long.valueOf(recId));
			request.setAttribute("r", r);
		}
		if("change".equals(recType)){
			request.setAttribute("rec_name", "注册变更");
		}else if("training".equals(recType)){
			request.setAttribute("rec_name", "培训");
		}else if("kaohe".equals(recType)){
			request.setAttribute("rec_name", "考核");
		}
		return mapping.findForward("record");
	}
	
	public ActionForward saveRecord(ActionMapping mapping, ActionForm form, HttpServletRequest request, HttpServletResponse response) throws Exception {
		String date = request.getParameter("r.date");
		Date d = null;
		String content = request.getParameter("r.content");
		String pOrder = request.getParameter("pOrder");
		if(date == null || "".equals(date)){
			request.setAttribute("msg", "日期不可为空");
			return editRecord(mapping,form,request,response);
		}
		try {
			d = new SimpleDateFormat("yyyy-MM-dd").parse(date);
		} catch (Exception e) {
			e.printStackTrace();
			request.setAttribute("msg", "日期不可为空");
			return editRecord(mapping,form,request,response);
		}
		if(content == null || "".equals(content)){
			request.setAttribute("msg", "记录不可为空");
			return editRecord(mapping,form,request,response);
		}
		String recId = request.getParameter("rec_id");
		
		String id = request.getParameter("id");
		if(id == null || "".equals(id)){
			request.setAttribute("msg", "医生id不可为空");
			return editRecord(mapping,form,request,response);
		}
		Long docId = Long.valueOf(id);
		
		
		String recType = request.getParameter("rec_type");
		if("change".equals(recType)){
			request.setAttribute("rec_name", "注册变更");
			if(recId != null && !"".equals(recId)){
				r = recDao.getRecordById(Long.valueOf(recId));
			}else{
				r = new ChangeRecord();
			}
		}else if("training".equals(recType)){
			request.setAttribute("rec_name", "培训");
			if(recId != null && !"".equals(recId)){
				r = recDao.getRecordById(Long.valueOf(recId));
			}else{
				r = new TrainingRecord();
			}
		}else if("kaohe".equals(recType)){
			request.setAttribute("rec_name", "考核");
			if(recId != null && !"".equals(recId)){
				r = recDao.getRecordById(Long.valueOf(recId));
			}else{
				r = new KaoheRecord();
			}
		}else{
			request.setAttribute("msg", "类型参数缺失");
			return editRecord(mapping,form,request,response);
		}

		r.setContent(content);
		r.setDate(d);
		r.setDocId(docId);
		if(pOrder != null && !"".equals(pOrder))
			r.setpOrder(Integer.valueOf(pOrder));
		recDao.saveRecord(r);
		request.setAttribute("msg", "保存记录成功");
		request.setAttribute("succ", "Y");
		return editRecord(mapping,form,request,response);
	}
	
	public ActionForward deleteRecord(ActionMapping mapping, ActionForm form, HttpServletRequest request, HttpServletResponse response) throws Exception {
		String recId = request.getParameter("rec_id");
		if(recId != null && !"".equals(recId)){
			int rst = recDao.deleteRecordById(Long.valueOf(recId));
			if(rst > 0)
				request.setAttribute("mymsg", "删除记录成功");
		}
		return viewDoctor(mapping, form, request, response);
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
	public Record getR() {
		return r;
	}
	public void setR(Record r) {
		this.r = r;
	}

}
