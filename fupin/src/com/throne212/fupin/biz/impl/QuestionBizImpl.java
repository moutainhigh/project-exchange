package com.throne212.fupin.biz.impl;

import java.io.File;
import java.io.FileInputStream;
import java.util.Date;

import jxl.Sheet;
import jxl.Workbook;

import com.throne212.fupin.biz.QuestionBiz;
import com.throne212.fupin.common.PageBean;
import com.throne212.fupin.common.Util;
import com.throne212.fupin.dao.CunDao;
import com.throne212.fupin.dao.QuestionDao;
import com.throne212.fupin.domain.Cun;
import com.throne212.fupin.domain.Family;
import com.throne212.fupin.domain.Org;
import com.throne212.fupin.domain.Question1;
import com.throne212.fupin.domain.Question2;

public class QuestionBizImpl extends BaseBizImpl implements QuestionBiz {
	
	private QuestionDao qDao;
	
	private CunDao cunDao;
	
	public PageBean<Question1> listQuestion1(Long areaId, Long zhenId, Long cunId, Integer pageIndex) {
		if(pageIndex == null || pageIndex < 1)
			pageIndex = 1;
		return qDao.listQuestion1(areaId, zhenId, cunId, pageIndex);
	}

	public String importQuestion1(String fileName) throws Exception{
		StringBuffer sb = new StringBuffer();
		String path = Thread.currentThread().getContextClassLoader().getResource("/").getPath();
		path = path.substring(0, path.indexOf("WEB-INF"));
		path += "upload";
		FileInputStream fin = new FileInputStream(path + File.separator + fileName);

		Workbook workbook = Workbook.getWorkbook(fin);
		Sheet sheet = workbook.getSheet(0);
		
		String cunName = sheet.getCell(1, 1).getContents();
		//检验,表一的导入可以用贫困村的名字来判断导入的是那个村
		Cun cun = cunDao.getCunByFullName(cunName);
		if(cun == null){
			throw new RuntimeException("村("+cunName+")获取失败");
		}
		String orgName = sheet.getCell(3, 1).getContents();
		
		try {
			
			Question1 q1 = qDao.getEntityByUniqueColumn(Question1.class, "cun", cun);
			if(q1 == null){
				q1 = new Question1();
				q1.setCreateDate(new Date());
			}
			q1.setCun(cun);
			
			Org org = cunDao.getEntityByUniqueColumn(Org.class, "orgName", orgName);
			if(org == null)
				org = cun.getOrg();
			q1.setOrg(org);
			
			int index = 1;
			for(int i=4;i<=121;i++){
				String col1 = sheet.getCell(0, i).getContents();
				if(col1!=null && col1.matches("\\d{3}")){
					String str = sheet.getCell(3,i).getContents();
					double val = 0;
					try {
						val = Double.valueOf(str);
					} catch (Exception e) {
						e.printStackTrace();
					}
					q1.setItem(index++, val);
				}
			}
			
			//填表人和日期
			Date date = null;
			String writer = null;
			String theStr = sheet.getCell(0,122).getContents();
			if(theStr.contains("填表人") && theStr.contains("日期")){
				writer = theStr.substring(theStr.indexOf("：")+1, theStr.lastIndexOf("填")).trim();
				String dateStr = theStr.substring(theStr.lastIndexOf("：")+1);
				date = Util.getDateByTxtChina(dateStr.replaceAll("\\s", "").trim());
			}
			q1.setWriter(writer);
			q1.setDate(date);
			
			this.saveOrUpdateEntity(q1);
			sb.append("资料导入成功，村名:" + cunName);
			workbook.close();
		} catch (RuntimeException e) {
			e.printStackTrace();
			throw new RuntimeException("导入失败，请检查数据及其格式是否完整和准确");
		}

		return sb.toString();
	}

	public PageBean<Question2> listQuestion2(Long areaId, Long zhenId, Long cunId, String familyName, Integer pageIndex) {
		if(pageIndex == null || pageIndex < 1)
			pageIndex = 1;
		return qDao.listQuestion2(areaId, zhenId, cunId,familyName, pageIndex);
	}

	public String importQuestion2(String fileName) throws Exception{

		StringBuffer sb = new StringBuffer();
		String path = Thread.currentThread().getContextClassLoader().getResource("/").getPath();
		path = path.substring(0, path.indexOf("WEB-INF"));
		path += "upload";
		FileInputStream fin = new FileInputStream(path + File.separator + fileName);

		Workbook workbook = Workbook.getWorkbook(fin);
		Sheet sheet = workbook.getSheet(0);
		
		String idNo = sheet.getCell(3, 57).getContents();
		if(Util.isEmpty(idNo) || (idNo.trim().length()!=15 && idNo.trim().length()!=18)){
			throw new RuntimeException("户主的身份证("+idNo+")为空或格式错误");
		}
		idNo = idNo.trim();
		//检验,表二按照身份证号码
		Family family = cunDao.getEntityByUniqueColumn(Family.class, "idNo", idNo);
		if(family == null){
			throw new RuntimeException("户主的身份证("+idNo+")不存在与系统中");
		}
		String orgName = sheet.getCell(3, 1).getContents();
		
		try {
			
			Question2 q2 = qDao.getEntityByUniqueColumn(Question2.class, "family", family);
			if(q2 == null){
				q2 = new Question2();
				q2.setCreateDate(new Date());
			}
			q2.setFamily(family);
			q2.setIdNo(idNo);
			
			Org org = cunDao.getEntityByUniqueColumn(Org.class, "orgName", orgName);
			if(org == null)
				org = family.getCun().getOrg();
			q2.setOrg(org);
			
			int index = 1;
			for(int i=4;i<=55;i++){
				String col1 = sheet.getCell(0, i).getContents();
				if(col1!=null && col1.matches("\\d{3}")){
					String str = sheet.getCell(3,i).getContents();
					double val = 0;
					try {
						val = Double.valueOf(str);
					} catch (Exception e) {
						e.printStackTrace();
					}
					q2.setItem(index++, val);
				}
			}
			
			//填表人和日期
			Date date = null;
			String writer = sheet.getCell(1,56).getContents();
			String theStr = sheet.getCell(3,56).getContents();
			try {
				date = Util.getDateByTxtChina(theStr.replaceAll("\\s", "").trim());
			} catch (Exception e) {
				e.printStackTrace();
			}
			q2.setWriter(writer);
			q2.setDate(date);
			
			this.saveOrUpdateEntity(q2);
			sb.append("资料导入成功，户名:" + family.getName()+"("+idNo+")");
			workbook.close();
		} catch (RuntimeException e) {
			e.printStackTrace();
			throw new RuntimeException("导入失败，请检查数据及其格式是否完整和准确");
		}

		return sb.toString();
	
	}

	public QuestionDao getqDao() {
		return qDao;
	}

	public void setqDao(QuestionDao qDao) {
		this.qDao = qDao;
	}

	public CunDao getCunDao() {
		return cunDao;
	}

	public void setCunDao(CunDao cunDao) {
		this.cunDao = cunDao;
	}
	
	public static void main(String[] args) throws Exception {
		System.out.println("123".matches("\\d{3}"));
		String theStr = "填表人：梁仲俊  填报日期：2012年 3月  5日";
		System.out.println(theStr.substring(theStr.indexOf("：")+1, theStr.indexOf("填报日期")));
		System.out.println(theStr.substring(theStr.lastIndexOf("：")+1));
		System.out.println(Util.getDateByTxtChina("2012年 3月  5日"));
	}
	
}
