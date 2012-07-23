package com.throne212.fupin.biz;

import com.throne212.fupin.common.PageBean;
import com.throne212.fupin.common.QuestionStatDO;
import com.throne212.fupin.domain.Family;
import com.throne212.fupin.domain.Question1;
import com.throne212.fupin.domain.Question2;

public interface QuestionBiz extends BaseBiz {

	// 调查表一
	public PageBean<Question1> listQuestion1(Long areaId, Long zhenId, Long cunId, Integer pageIndex);

	public String importQuestion1(String fileName) throws Exception;

	public QuestionStatDO statQuestion1(Long areaId, Long zhenId);

	public String getQ1ExcelReportFilePath(Question1 q1) throws Exception;
	
	public String getQ1StatExcelReportFilePath(Long areaId, Long zhenId) throws Exception;

	// 调查表二
	public PageBean<Question2> listQuestion2(Long areaId, Long zhenId, Long cunId, String familyName, Integer pageIndex);

	public String importQuestion2(String fileName) throws Exception;

	public QuestionStatDO statQuestion2(Long areaId, Long zhenId, Long cunId);

	public String getQ2ExcelReportFilePath(Question2 q2) throws Exception;
	
	public String getQ2StatExcelReportFilePath(Long areaId, Long zhenId, Long cunId) throws Exception;
	
	//单位调查表获取用户列表
	public PageBean<Family> getFamilyList(String familyName, Integer pageIndex, int year);

}
