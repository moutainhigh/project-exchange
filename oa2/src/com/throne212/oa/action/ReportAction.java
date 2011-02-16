package com.throne212.oa.action;

import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.lang.reflect.Field;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.GregorianCalendar;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import jxl.Cell;
import jxl.CellType;
import jxl.Sheet;
import jxl.Workbook;
import jxl.write.Label;
import jxl.write.Number;
import jxl.write.WritableSheet;
import jxl.write.WritableWorkbook;
import jxl.write.WriteException;
import jxl.write.biff.RowsExceededException;

import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;
import org.apache.struts.actions.DispatchAction;
import org.hibernate.CacheMode;
import org.hibernate.Session;

import com.throne212.oa.HibernateSessionFactory;
import com.throne212.oa.common.Util;
import com.throne212.oa.dao.DropdownListDao;
import com.throne212.oa.dao.ReportDao;
import com.throne212.oa.domain.DropdownList;
import com.throne212.oa.domain.report.Hospital;
import com.throne212.oa.domain.report.HospitalType;
import com.throne212.oa.domain.report.WorkReport;
import com.throne212.oa.domain.report.WorkReportA1;
import com.throne212.oa.domain.report.WorkReportA2;
import com.throne212.oa.domain.report.WorkReportA3;
import com.throne212.oa.domain.report.WorkReportA4;
import com.throne212.oa.domain.report.WorkReportB1;
import com.throne212.oa.domain.report.WorkReportB2;
import com.throne212.oa.domain.report.WorkReportB3;
import com.throne212.oa.domain.report.WorkReportB4;
import com.throne212.oa.domain.report.WorkReportB5;
import com.throne212.oa.domain.report.WorkReportB6;
import com.throne212.oa.domain.report.WorkReportB7;
import com.throne212.oa.domain.report.Year;

public class ReportAction extends DispatchAction {

	private ReportDao reportDao = new ReportDao();
	private DropdownListDao dicDao = new DropdownListDao();

	// ������
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
			request.setAttribute("msg", "�����[ " + request.getParameter("newYear") + " ]��ӳɹ�");
		} catch (RuntimeException e) {
			e.printStackTrace();
			request.setAttribute("msg", "������ʧ�ܣ����������Ƿ��Ѿ������");
		}
		return index(mapping, form, request, response);
	}

	public ActionForward deleteYear(ActionMapping mapping, ActionForm form, HttpServletRequest request, HttpServletResponse response) throws Exception {
		int rst = -1;
		try {
			rst = reportDao.deleteYear(Integer.valueOf(request.getParameter("year")).intValue());
			if (rst > 0) {
				request.setAttribute("msg", "���[ " + request.getParameter("newYear") + " ]ɾ���ɹ�");
			} else {
				request.setAttribute("msg", "���ɾ��ʧ��");
			}
		} catch (RuntimeException e) {
			e.printStackTrace();
			request.setAttribute("msg", "���ɾ��ʧ�ܣ������Ƿ������Ƿ��Ѿ������˱���������");
		}
		return index(mapping, form, request, response);
	}

	// �����б�
	public ActionForward listOrg(ActionMapping mapping, ActionForm form, HttpServletRequest request, HttpServletResponse response) throws Exception {
		Long typeId = Long.valueOf(request.getParameter("orgTypeId"));
		List orgList = reportDao.getHospitalByType(typeId);
		request.setAttribute("orgList", orgList);
		return mapping.findForward("org");
	}

	public ActionForward addHospital(ActionMapping mapping, ActionForm form, HttpServletRequest request, HttpServletResponse response) throws Exception {
		try {
			reportDao.addOrgInType(Long.valueOf(request.getParameter("hosId")), Long.valueOf(request.getParameter("orgTypeId")));
			request.setAttribute("msg", "��ӵ�λ�ɹ�");
		} catch (RuntimeException e) {
			e.printStackTrace();
			request.setAttribute("msg", "��ӵ�λʧ��");
		}
		return listOrg(mapping, form, request, response);
	}

	public ActionForward removeHospital(ActionMapping mapping, ActionForm form, HttpServletRequest request, HttpServletResponse response) throws Exception {
		try {
			//reportDao.removeOrgInType(Long.valueOf(request.getParameter("orgId")));
			// �õ��������
			String dateType = request.getParameter("dateType");
			Year y = null;
			if (!Util.isEmpty(request.getParameter("year"))) {
				y = reportDao.getYear(Integer.valueOf(request.getParameter("year")).intValue());
			}
			Integer season = null;
			if (!Util.isEmpty(request.getParameter("season"))) {
				season = Integer.valueOf(request.getParameter("season"));
			}
			Integer month = null;
			if (!Util.isEmpty(request.getParameter("month"))) {
				month = Integer.valueOf(request.getParameter("month"));
			}
			reportDao.removeOrgReport(Long.valueOf(request.getParameter("orgId")), y, season, month, dateType);
			request.setAttribute("msg", "�Ƴ���λ�ɹ�");
		} catch (RuntimeException e) {
			e.printStackTrace();
			request.setAttribute("msg", "�Ƴ���λʧ��");
		}
		return listOrg(mapping, form, request, response);
	}

	// �ϴ�����
	public ActionForward uploadReport(ActionMapping mapping, ActionForm form, HttpServletRequest request, HttpServletResponse response) throws Exception {
		String upload_flag = (String) request.getAttribute("upload_flag");
		if ("Y".equals(upload_flag)) {

			// �õ��������
			Hospital hos = reportDao.getOrgById(Long.valueOf(request.getParameter("orgId")).longValue());
			String dateType = request.getParameter("dateType");
			Year y = null;
			if (!Util.isEmpty(request.getParameter("year"))) {
				y = reportDao.getYear(Integer.valueOf(request.getParameter("year")).intValue());
			}
			Integer season = null;
			if (!Util.isEmpty(request.getParameter("season"))) {
				season = Integer.valueOf(request.getParameter("season"));
			}
			Integer month = null;
			if (!Util.isEmpty(request.getParameter("month"))) {
				month = Integer.valueOf(request.getParameter("month"));

			}

			String excelPath = (String) request.getAttribute("excelPath");

			try {
				// ͨ��excel�ļ������������
				WorkReport reportA1 = reportDao.getExistReport(WorkReportA1.class, hos, y, dateType, season, month);
				WorkReport reportA2 = reportDao.getExistReport(WorkReportA2.class, hos, y, dateType, season, month);
				WorkReport reportA3 = reportDao.getExistReport(WorkReportA3.class, hos, y, dateType, season, month);
				WorkReport reportA4 = reportDao.getExistReport(WorkReportA4.class, hos, y, dateType, season, month);

				WorkReport reportB1 = reportDao.getExistReport(WorkReportB1.class, hos, y, dateType, season, month);
				WorkReport reportB2 = reportDao.getExistReport(WorkReportB2.class, hos, y, dateType, season, month);
				WorkReport reportB3 = reportDao.getExistReport(WorkReportB3.class, hos, y, dateType, season, month);
				WorkReport reportB4 = reportDao.getExistReport(WorkReportB4.class, hos, y, dateType, season, month);
				WorkReport reportB5 = reportDao.getExistReport(WorkReportB5.class, hos, y, dateType, season, month);
				WorkReport reportB6 = reportDao.getExistReport(WorkReportB6.class, hos, y, dateType, season, month);
				WorkReport reportB7 = reportDao.getExistReport(WorkReportB7.class, hos, y, dateType, season, month);

				WorkReport[][] arr = new WorkReport[][] { { reportA1, reportA2, reportA3, reportA4 }, { reportB1, reportB2, reportB3, reportB4, reportB5, reportB6, reportB7 } };

				FileInputStream fin = new FileInputStream(excelPath);
				fill(arr, fin);

				// ���Դ�ӡ
				for (int i = 0; i < arr.length; i++) {
					for (int j = 0; j < arr[i].length; j++) {
						System.out.print("����" + i + "*" + j + " : ");
						printReport(arr[i][j]);
					}
				}

				// ��������
				for (int i = 0; i < arr.length; i++) {
					for (int j = 0; j < arr[i].length; j++) {
						arr[i][j].setOrg(hos);
						arr[i][j].setDateType(dateType);
						arr[i][j].setYear(y);
						arr[i][j].setSeason(season);
						arr[i][j].setMonth(month);
						reportDao.saveOrUpdateReport(arr[i][j]);
					}
				}

				hos.setDate(new Date());
				reportDao.saveOrUpdateHospital(hos);

				request.setAttribute("msg", "������ɹ�");
			} catch (RuntimeException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
				request.setAttribute("msg", "�����ϴ�ʧ�ܣ����鱨���ʽ�Ƿ���ȷ");
			}

		} else {
			request.setAttribute("msg", "�����ϴ�ʧ��");
		}
		return listOrg(mapping, form, request, response);
	}

	// ��䱨������
	private void fill(WorkReport[][] reports, InputStream is) throws Exception {
		Workbook workbook = Workbook.getWorkbook(is);
		Sheet sheet1 = workbook.getSheet(0);
		Sheet sheet2 = workbook.getSheet(1);

		fill(reports[0][0], sheet1, 7, 30);
		fill(reports[0][1], sheet1, 17, 20);
		fill(reports[0][2], sheet1, 34, 10);
		fill(reports[0][3], sheet1, 44, 18);

		fill(reports[1][0], sheet2, 11, 26);
		fill(reports[1][1], sheet2, 26, 23);
		fill(reports[1][2], sheet2, 42, 22);
		fill(reports[1][3], sheet2, 60, 25);
		fill(reports[1][4], sheet2, 77, 16);
		fill(reports[1][5], sheet2, 94, 15);
		fill(reports[1][6], sheet2, 105, 18);

		workbook.close();
	}

	// ���ĳһ��sheet�ı���
	private void fill(WorkReport report, Sheet sheet, int row, int len) {
		for (int i = 0; i < len; i++) {
			Cell c = sheet.getCell(i, row - 1);
			if (c.getType() == CellType.NUMBER && !Util.isEmpty(c.getContents())) {
				Integer value = Integer.valueOf(c.getContents());
				report.setC(i + 1, value);
			}
		}
	}

	private void fillToExcel(WorkReport report, WritableSheet sheet, int row, int len) {
		for (int i = 0; i < len; i++) {
			if (report.getC(i + 1) != null) {
				Number number = new Number(i, row - 1, report.getC(i + 1).doubleValue());
				try {
					sheet.addCell(number);
				} catch (RowsExceededException e) {
					e.printStackTrace();
				} catch (WriteException e) {
					e.printStackTrace();
				}
			}
		}
	}

	public ActionForward downloadReport(ActionMapping mapping, ActionForm form, HttpServletRequest request, HttpServletResponse response) throws Exception {

		// �õ��������
		Hospital hos = reportDao.getOrgById(Long.valueOf(request.getParameter("orgId")).longValue());
		String dateType = request.getParameter("dateType");
		Year y = null;
		if (!Util.isEmpty(request.getParameter("year"))) {
			y = reportDao.getYear(Integer.valueOf(request.getParameter("year")).intValue());
		}
		Integer season = null;
		if (!Util.isEmpty(request.getParameter("season"))) {
			season = Integer.valueOf(request.getParameter("season"));
		}
		Integer month = null;
		if (!Util.isEmpty(request.getParameter("month"))) {
			month = Integer.valueOf(request.getParameter("month"));

		}

		// �ļ�����
		String path = Thread.currentThread().getContextClassLoader().getResource("/").getPath();
		path = path.substring(0, path.indexOf("WEB-INF"));
		path += "report" + File.separator + "excel";
		System.out.println("excel saved path : " + path);
		String sourceFile = path + File.separator + "template.xls";
		String targetFile = path + File.separator + hos.getName() + y.getValue() + ".xls";
		/*
		 * FileInputStream fin = new FileInputStream(new
		 * File(path+File.separator+"template.xls")); FileOutputStream fos = new
		 * FileOutputStream(new
		 * File(path+File.separator+hos.getName()+y.getValue()+".xls")); int len =
		 * -1; byte[] buff = new byte[1024]; while((len=fin.read(buff))>0){
		 * fos.write(buff, 0, len); } fos.close(); fin.close();
		 */

		// �����ļ�
		WorkReport reportA1 = reportDao.getExistReport(WorkReportA1.class, hos, y, dateType, season, month);
		if (reportA1.getId() == null) {
			request.setAttribute("msg", "����û���ϴ�");
			return listOrg(mapping, form, request, response);
		}
		WorkReport reportA2 = reportDao.getExistReport(WorkReportA2.class, hos, y, dateType, season, month);
		WorkReport reportA3 = reportDao.getExistReport(WorkReportA3.class, hos, y, dateType, season, month);
		WorkReport reportA4 = reportDao.getExistReport(WorkReportA4.class, hos, y, dateType, season, month);

		WorkReport reportB1 = reportDao.getExistReport(WorkReportB1.class, hos, y, dateType, season, month);
		WorkReport reportB2 = reportDao.getExistReport(WorkReportB2.class, hos, y, dateType, season, month);
		WorkReport reportB3 = reportDao.getExistReport(WorkReportB3.class, hos, y, dateType, season, month);
		WorkReport reportB4 = reportDao.getExistReport(WorkReportB4.class, hos, y, dateType, season, month);
		WorkReport reportB5 = reportDao.getExistReport(WorkReportB5.class, hos, y, dateType, season, month);
		WorkReport reportB6 = reportDao.getExistReport(WorkReportB6.class, hos, y, dateType, season, month);
		WorkReport reportB7 = reportDao.getExistReport(WorkReportB7.class, hos, y, dateType, season, month);

		WorkReport[][] reports = new WorkReport[][] { { reportA1, reportA2, reportA3, reportA4 }, { reportB1, reportB2, reportB3, reportB4, reportB5, reportB6, reportB7 } };

		Workbook rw = Workbook.getWorkbook(new File(sourceFile));
		WritableWorkbook workbook = Workbook.createWorkbook(new File(targetFile), rw);

		WritableSheet sheet1 = workbook.getSheet(0);
		WritableSheet sheet2 = workbook.getSheet(1);

		fillToExcel(reports[0][0], sheet1, 7, 30);
		fillToExcel(reports[0][1], sheet1, 17, 20);
		fillToExcel(reports[0][2], sheet1, 34, 10);
		fillToExcel(reports[0][3], sheet1, 44, 18);

		fillToExcel(reports[1][0], sheet2, 11, 26);
		fillToExcel(reports[1][1], sheet2, 26, 23);
		fillToExcel(reports[1][2], sheet2, 42, 22);
		fillToExcel(reports[1][3], sheet2, 60, 25);
		fillToExcel(reports[1][4], sheet2, 77, 16);
		fillToExcel(reports[1][5], sheet2, 94, 15);
		fillToExcel(reports[1][6], sheet2, 105, 18);

		workbook.write();
		workbook.close();
		rw.close();

		// request.getRequestDispatcher("/report/excel/"+hos.getName()+y.getValue()+".xls").forward(request,
		// response);
		// response.sendRedirect(request.getSession().getServletContext().getAttribute("appPath")+"/report/excel/"+hos.getName()+y.getValue()+".xls");

		downFile(request, response, "application/vnd.ms-excel", hos.getName() + y.getValue() + ".xls", path + File.separator);

		return null;
	}

	private void downFile(HttpServletRequest request, HttpServletResponse response, String contentType, String filename, String path) {
		response.setContentType(contentType);
		response.setHeader("Content-disposition", "attachment; filename=" + filename);
		BufferedInputStream bis = null;
		BufferedOutputStream bos = null;

		String absPathFileName = path + filename;
		try {
			bis = new BufferedInputStream(new FileInputStream(absPathFileName));
			bos = new BufferedOutputStream(response.getOutputStream());
			byte[] buff = new byte[2048];
			int bytesRead;
			while (-1 != (bytesRead = bis.read(buff, 0, buff.length))) {
				bos.write(buff, 0, bytesRead);
			}
		} catch (final IOException e) {
			e.printStackTrace();
		} finally {
			try {
				bis.close();
				bos.close();
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
	}

	public static void printReport(WorkReport report) {
		for (int i = 1; i <= 30; i++) {
			System.out.print(report.getC(i) + ",");
		}
		System.out.println();
	}

	// ͬ�ڱȽ�
	public ActionForward listCompare(ActionMapping mapping, ActionForm form, HttpServletRequest request, HttpServletResponse response) throws Exception {
		Calendar calendar = GregorianCalendar.getInstance();
		int year = calendar.get(Calendar.YEAR);
		request.setAttribute("year", Integer.valueOf(year));
		String dateTitle = year + "��";
		String dateType = request.getParameter("dateType");
		if ("s".equalsIgnoreCase(dateType)) {
			int month = calendar.get(Calendar.MONTH) + 1;// ��ǰ�·�
			if (month >= 1 && month <= 3) {
				dateTitle = dateTitle + "��һ����";
				request.setAttribute("season", Integer.valueOf(1));
			} else if (month >= 4 && month <= 6) {
				dateTitle = dateTitle + "�ڶ�����";
				request.setAttribute("season", Integer.valueOf(2));
			} else if (month >= 7 && month <= 9) {
				dateTitle = dateTitle + "��������";
				request.setAttribute("season", Integer.valueOf(3));
			} else if (month >= 10 && month <= 12) {
				dateTitle = dateTitle + "���ļ���";
				request.setAttribute("season", Integer.valueOf(4));
			}
		} else if ("m".equalsIgnoreCase(dateType)) {
			int month = calendar.get(Calendar.MONTH) + 1;// ��ǰ�·�
			dateTitle = dateTitle + month + "��";
			request.setAttribute("month", Integer.valueOf(month));
		} else {

		}
		request.setAttribute("dateTitle", dateTitle);
		return mapping.findForward("compare");
	}

	// ����ͬ�ڶԱȱ���
	public ActionForward genCompare(ActionMapping mapping, ActionForm form, HttpServletRequest request, HttpServletResponse response) throws Exception {
		// �õ��������
		String dateType = request.getParameter("dateType");
		Year y = null;
		if (!Util.isEmpty(request.getParameter("year"))) {
			y = reportDao.getYear(Integer.valueOf(request.getParameter("year")).intValue());
		}
		Integer season = null;
		if (!Util.isEmpty(request.getParameter("season"))) {
			season = Integer.valueOf(request.getParameter("season"));
		}
		Integer month = null;
		if (!Util.isEmpty(request.getParameter("month"))) {
			month = Integer.valueOf(request.getParameter("month"));

		}

		try {
			// �ļ�����
			String path = Thread.currentThread().getContextClassLoader().getResource("/").getPath();
			path = path.substring(0, path.indexOf("WEB-INF"));
			path += "report" + File.separator + "excel";
			System.out.println("excel saved path : " + path);
			String sourceFile = path + File.separator + "template2.xls";// ģ���ļ�2
			String excelName = "compare" + y.getValue() + (season == null ? "" : season.toString()) + (month == null ? "" : month.toString()) + ".xls";
			String targetFile = path + File.separator + excelName;

			// Excelģ���ļ���ģ
			Workbook rw = Workbook.getWorkbook(new File(sourceFile));
			WritableWorkbook workbook = Workbook.createWorkbook(new File(targetFile), rw);

			List orgList = dicDao.getDropdownList(Hospital.class.getName());
			currCompare1Row = 4;
			for (int i = 0; i < orgList.size(); i++) {

				Hospital hos = (Hospital) orgList.get(i);
				// �����ļ�
				// ����ı���
				WorkReport reportA1 = reportDao.getExistReport(WorkReportA1.class, hos, y, dateType, season, month);
				if (reportA1.getId() == null) {
					request.setAttribute("msg", "���걨��û���ϴ�������(" + hos.getName() + ")");
					return listCompare(mapping, form, request, response);
				}
				WorkReport reportA2 = reportDao.getExistReport(WorkReportA2.class, hos, y, dateType, season, month);
				WorkReport reportA3 = reportDao.getExistReport(WorkReportA3.class, hos, y, dateType, season, month);
				WorkReport reportA4 = reportDao.getExistReport(WorkReportA4.class, hos, y, dateType, season, month);
				WorkReport reportB1 = reportDao.getExistReport(WorkReportB1.class, hos, y, dateType, season, month);
				WorkReport reportB2 = reportDao.getExistReport(WorkReportB2.class, hos, y, dateType, season, month);
				WorkReport reportB3 = reportDao.getExistReport(WorkReportB3.class, hos, y, dateType, season, month);
				WorkReport reportB4 = reportDao.getExistReport(WorkReportB4.class, hos, y, dateType, season, month);
				WorkReport reportB5 = reportDao.getExistReport(WorkReportB5.class, hos, y, dateType, season, month);
				WorkReport reportB6 = reportDao.getExistReport(WorkReportB6.class, hos, y, dateType, season, month);
				WorkReport reportB7 = reportDao.getExistReport(WorkReportB7.class, hos, y, dateType, season, month);
				WorkReport[][] thisReport = new WorkReport[][] { { reportA1, reportA2, reportA3, reportA4 }, { reportB1, reportB2, reportB3, reportB4, reportB5, reportB6, reportB7 } };

				// ȥ��ı���
				Year lastYear = reportDao.getYear(y.getValue().intValue()-1);
				reportA1 = reportDao.getExistReport(WorkReportA1.class, hos, lastYear, dateType, season, month);
				if (reportA1.getId() == null) {
					request.setAttribute("msg", "ȥ�걨��û���ϴ�����(" + hos.getName() + ")");
					return listCompare(mapping, form, request, response);
				}
				reportA2 = reportDao.getExistReport(WorkReportA2.class, hos, lastYear, dateType, season, month);
				reportA3 = reportDao.getExistReport(WorkReportA3.class, hos, lastYear, dateType, season, month);
				reportA4 = reportDao.getExistReport(WorkReportA4.class, hos, lastYear, dateType, season, month);
				reportB1 = reportDao.getExistReport(WorkReportB1.class, hos, lastYear, dateType, season, month);
				reportB2 = reportDao.getExistReport(WorkReportB2.class, hos, lastYear, dateType, season, month);
				reportB3 = reportDao.getExistReport(WorkReportB3.class, hos, lastYear, dateType, season, month);
				reportB4 = reportDao.getExistReport(WorkReportB4.class, hos, lastYear, dateType, season, month);
				reportB5 = reportDao.getExistReport(WorkReportB5.class, hos, lastYear, dateType, season, month);
				reportB6 = reportDao.getExistReport(WorkReportB6.class, hos, lastYear, dateType, season, month);
				reportB7 = reportDao.getExistReport(WorkReportB7.class, hos, lastYear, dateType, season, month);
				WorkReport[][] lastReport = new WorkReport[][] { { reportA1, reportA2, reportA3, reportA4 }, { reportB1, reportB2, reportB3, reportB4, reportB5, reportB6, reportB7 } };

				WritableSheet sheet1 = workbook.getSheet(0);
				WritableSheet sheet2 = workbook.getSheet(1);

				//���ɵ�һ��sheet
				buildCompareYear(sheet1,y.getValue());
				buildCompare1(sheet1,lastReport,thisReport,hos);
				//���ɵڶ���sheet
				buildCompare2(sheet2,lastReport,thisReport,hos);
				
			}
			workbook.write();
			workbook.close();
			rw.close();

			System.out.println("ͬ�ڱ������ɳɹ�");
			
			downFile(request, response, "application/vnd.ms-excel", excelName, path + File.separator);

			
			return null;
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			request.setAttribute("msg", "��������ʧ�ܣ����鱨���ʽ�Ƿ���ȷ");
		}

		return mapping.findForward("compare");
	}
	
	private void buildCompareYear(WritableSheet sheet,Integer year) throws Exception{
		Label label = new Label(1,3,year+"��");
		sheet.addCell(label);
		Label labe2 = new Label(2,3,(year.intValue()-1)+"��");
		sheet.addCell(labe2);
		
		Label labe3 = new Label(6,3,year+"��");
		sheet.addCell(labe3);
		Label labe4 = new Label(7,3,(year.intValue()-1)+"��");
		sheet.addCell(labe4);
		
		Label labe5 = new Label(11,3,year+"��");
		sheet.addCell(labe5);
		Label labe6 = new Label(12,3,(year.intValue()-1)+"��");
		sheet.addCell(labe6);
		
		Label labe7 = new Label(15,3,year+"��");
		sheet.addCell(labe7);
		Label labe8 = new Label(16,3,(year.intValue()-1)+"��");
		sheet.addCell(labe8);
	}

	private int currCompare1Row = 4;
	private void buildCompare1(WritableSheet sheet,WorkReport[][] lastReport,WorkReport[][] thisReport,Hospital hos) throws Exception{
		Label label = new Label(0,currCompare1Row,hos.getName());
		sheet.addCell(label);
		
		//��������
		Number number = new Number(1,currCompare1Row,thisReport[0][0].getC2().doubleValue());
		sheet.addCell(number);
		number = new Number(2,currCompare1Row,lastReport[0][0].getC2().doubleValue());
		sheet.addCell(number);
		
		//סԺ����
		number = new Number(6,currCompare1Row,thisReport[0][0].getC11().doubleValue());
		sheet.addCell(number);
		number = new Number(7,currCompare1Row,lastReport[0][0].getC11().doubleValue());
		sheet.addCell(number);
		
		//ʵ��ռ���ܴ���
		number = new Number(11,currCompare1Row,thisReport[0][0].getC22().doubleValue());
		sheet.addCell(number);
		number = new Number(12,currCompare1Row,lastReport[0][0].getC22().doubleValue());
		sheet.addCell(number);
		
		//�������
		number = new Number(15,currCompare1Row,thisReport[0][3].getC18().doubleValue());
		sheet.addCell(number);
		number = new Number(16,currCompare1Row,lastReport[0][3].getC18().doubleValue());
		sheet.addCell(number);
		
		currCompare1Row++;
	}
	
	private int currCompare2Row = 4;
	private void buildCompare2(WritableSheet sheet,WorkReport[][] lastReport,WorkReport[][] thisReport,Hospital hos) throws Exception{
		Label label = new Label(0,currCompare2Row,hos.getName());
		sheet.addCell(label);
		
		//����Σ�ز���
		sheet.addCell(new Number(1,currCompare2Row,thisReport[0][1].getC16().doubleValue()));
		sheet.addCell(new Number(2,currCompare2Row,thisReport[0][1].getC17().doubleValue()));
		sheet.addCell(new Number(3,currCompare2Row,thisReport[0][1].getC18().doubleValue()));
		
		//����С������
		sheet.addCell(new Number(4,currCompare2Row,thisReport[0][3].getC1().doubleValue()));
		
		//סԺ����
		sheet.addCell(new Number(5,currCompare2Row,thisReport[0][3].getC1().doubleValue()));
		sheet.addCell(new Number(6,currCompare2Row,thisReport[0][3].getC1().doubleValue()));
		
		//ϸ�ָ�����ϣ���Σ�
		sheet.addCell(new Number(7,currCompare2Row,thisReport[0][3].getC1().doubleValue()));
		sheet.addCell(new Number(8,currCompare2Row,thisReport[0][3].getC1().doubleValue()));
		sheet.addCell(new Number(9,currCompare2Row,thisReport[0][3].getC1().doubleValue()));
		sheet.addCell(new Number(10,currCompare2Row,thisReport[0][3].getC1().doubleValue()));
		sheet.addCell(new Number(11,currCompare2Row,thisReport[0][3].getC1().doubleValue()));
		sheet.addCell(new Number(12,currCompare2Row,thisReport[0][3].getC1().doubleValue()));
		sheet.addCell(new Number(13,currCompare2Row,thisReport[0][3].getC1().doubleValue()));
		sheet.addCell(new Number(14,currCompare2Row,thisReport[0][3].getC1().doubleValue()));
		
		//��ͥ����
		sheet.addCell(new Number(15,currCompare2Row,thisReport[0][3].getC1().doubleValue()));
		sheet.addCell(new Number(16,currCompare2Row,thisReport[0][3].getC1().doubleValue()));
		
		//����ʹ����%
		sheet.addCell(new Number(17,currCompare2Row,thisReport[0][3].getC1().doubleValue()));
		
		//�۲��Ҳ�����
		sheet.addCell(new Number(18,currCompare2Row,thisReport[0][3].getC1().doubleValue()));
		
		//�������
		sheet.addCell(new Number(19,currCompare2Row,thisReport[0][3].getC1().doubleValue()));
		
		currCompare2Row++;
	}

	// �����ֵ��б�
	public ActionForward listDic(ActionMapping mapping, ActionForm form, HttpServletRequest request, HttpServletResponse response) throws Exception {
		Map map = reportDao.getAllDic();
		request.setAttribute("dicMap", map);
		return mapping.findForward("dic_list");
	}

	public ActionForward dicEdit(ActionMapping mapping, ActionForm form, HttpServletRequest request, HttpServletResponse response) throws Exception {
		String dicName = request.getParameter("dicName");
		List list = dicDao.getDropdownList(dicName);
		Class clazz = Class.forName(WorkReport.class.getPackage().getName() + "." + dicName);
		Field f = clazz.getDeclaredField("componentName");
		request.setAttribute("dic_name", (String) f.get(clazz.newInstance()));
		request.setAttribute("dicList", list);
		List orgTypeList = reportDao.getDicValueList(HospitalType.class.getName());
		request.setAttribute("orgTypeList", orgTypeList);
		return mapping.findForward("dic_edit");
	}
	
	public ActionForward test(ActionMapping mapping, ActionForm form, HttpServletRequest request, HttpServletResponse response) throws Exception {
		//List list = dicDao.getDropdownList("HospitalType");
		
		Session s = HibernateSessionFactory.getSession();
		s.beginTransaction();
		List list = s.createQuery("from HospitalType").setCacheable(false).list();
		List list2 = s.createQuery("from Hospital").setCacheable(false).list();
//		List list = new ArrayList();
//		try {
//			Connection conn = s.connection();//DriverManager.getConnection("jdbc:mysql://localhost:3306/oa2","oa2","123");
//			Statement stmt = conn.createStatement();
//			ResultSet rs = stmt.executeQuery("select name from oa2_dropdown_list where data_type='report_hos_type'");
//			while(rs.next()){
//				list.add(rs.getString(1));
//			}
//			//conn.close();
//		} catch (Exception e) {
//			e.printStackTrace();
//		}
		s.getTransaction().commit();
		s.close();
		
//		List list = new ArrayList();
//		try {
//			Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/oa2","oa2","123");
//			Statement stmt = conn.createStatement();
//			ResultSet rs = stmt.executeQuery("select name from oa2_dropdown_list where data_type='report_hos_type'");
//			while(rs.next()){
//				list.add(rs.getString(1));
//			}
//			conn.close();
//		} catch (Exception e) {
//			e.printStackTrace();
//		}
		
		
		request.setAttribute("dicList", list);
		
		request.setAttribute("dicList2", list2);
		return mapping.findForward("test");
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
		request.setAttribute("msg", "�ֶ����ݸ��³ɹ�");
		String dicName = request.getParameter("dicName");
		if (dicName != null)
			request.getSession().getServletContext().removeAttribute(dicName);
		return this.dicEdit(mapping, form, request, response);
	}

	// ���������ֵ�
	public ActionForward addDic(ActionMapping mapping, ActionForm form, HttpServletRequest request, HttpServletResponse response) throws Exception {
		String name = request.getParameter("d_name");
		String listorder = request.getParameter("d_listorder");
		String dicName = request.getParameter("dicName");
		String hosType = request.getParameter("hos_type");
		dicName = WorkReport.class.getPackage().getName() + "." + dicName;
		Integer i = null;
		if (!Util.isEmpty(listorder))
			i = Integer.valueOf(Integer.parseInt(listorder));
		if(Util.isEmpty(hosType)){
			dicDao.addDic(dicName, name, i);
		}else{
			dicDao.addHospital(name, i, Long.valueOf(Long.parseLong(hosType)));
		}		
		request.setAttribute("msg", "�����ֵ������ӳɹ�");
		if (dicName != null)
			request.getSession().getServletContext().removeAttribute(request.getParameter("dicName"));
		return this.dicEdit(mapping, form, request, response);
	}

	// ɾ�������ֵ�
	public ActionForward deleteDic(ActionMapping mapping, ActionForm form, HttpServletRequest request, HttpServletResponse response) throws Exception {
		String id = request.getParameter("id");
		String dicName = request.getParameter("dicName");
		if(Hospital.class.getSimpleName().equals(dicName)){
			reportDao.removeOrgReport(Long.valueOf(Long.parseLong(id)));
		}
		dicName = WorkReport.class.getPackage().getName() + "." + dicName;
		int rst = dicDao.deleteDic(dicName, Long.valueOf(Long.parseLong(id)));
		if (rst > 0)
			request.setAttribute("msg", "�����ֵ���ɾ���ɹ�");
		else
			request.setAttribute("msg", "�����ֵ���ɾ��ʧ�ܣ������Ƿ��Ѿ�����������ֵ������");
		if (dicName != null)
			request.getSession().getServletContext().removeAttribute(request.getParameter("dicName"));
		return this.dicEdit(mapping, form, request, response);
	}

	public static void main(String[] args) {
		// System.out.println("doc.name".startsWith("doc."));
		/*
		 * String str = "doc.name"; String[] arr = str.split("\\."); for (int i =
		 * 0; i < arr.length; i++) { String string = arr[i];
		 * System.out.println(string); }
		 * System.out.println(Boolean.valueOf(Boolean.parseBoolean("false")));
		 */

		Calendar c = GregorianCalendar.getInstance();
		System.out.println(c.get(Calendar.DATE));

	}

}
