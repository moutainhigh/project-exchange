package com.throne212.fupin.action;

import java.io.FileInputStream;
import java.io.InputStream;
import java.util.ArrayList;
import java.util.List;

import com.opensymphony.xwork2.ActionContext;
import com.throne212.fupin.biz.QuestionBiz;
import com.throne212.fupin.common.PageBean;
import com.throne212.fupin.common.QuestionStatDO;
import com.throne212.fupin.common.WebConstants;
import com.throne212.fupin.domain.Question;
import com.throne212.fupin.domain.Question1;
import com.throne212.fupin.domain.Question2;

public class QuestionAction extends BaseAction {

	private PageBean pageBean;
	private Integer pageIndex;
	private Long areaId;
	private Long zhenId;
	private Long cunId;
	private String familyName;

	// excel导出文件
	private InputStream downloadFile;

	private Question1 q1;
	private Question2 q2;
	private QuestionStatDO q;

	private QuestionBiz questionBiz;

	private String isShow;

	// 一
	public String list1() {
		pageBean = questionBiz.listQuestion1(areaId, zhenId, cunId, pageIndex);
		return "list1";
	}

	public String uploadQuestion1() {
		String fileName = (String) ActionContext.getContext().getSession().get(WebConstants.SESS_IMAGE);
		if (fileName != null) {
			String msg = null;
			try {
				msg = questionBiz.importQuestion1(fileName);
				this.setSucc("Y");
				this.setMsg("数据导入成功\\n" + msg);
			} catch (Exception e) {
				e.printStackTrace();
				this.setMsg("数据导入失败\\n" + e.getMessage());
			}
		}
		return "upload1";
	}

	public String deleteQuestion1() {
		if (q1 != null && q1.getId() != null) {
			questionBiz.deleteEntity(Question1.class, q1.getId());
			this.setMsg("删除成功");
		} else {
			String[] ids = (String[]) ActionContext.getContext().getParameters().get("ids");
			if (ids != null && ids.length > 0) {
				for (String idStr : ids) {
					Long id = Long.parseLong(idStr);
					Question1 q = questionBiz.getEntityById(Question1.class, id);
					if (q != null) {
						questionBiz.deleteEntity(Question1.class, id);
						this.setMsg("删除成功");
					}
				}
			}
		}
		return list1();
	}

	public String show1() {
		if (q1 != null && q1.getId() != null) {
			q1 = questionBiz.getEntityById(Question1.class, q1.getId());
		}
		isShow = "Y";
		if(q1.getYear() == 2012)
			return "show1_2012";
		return "show1";
	}

	public String stat1() {
		if (areaId != null || zhenId != null)
			q = questionBiz.statQuestion1(areaId, zhenId);
		return "stat1";
	}

	public String edit1() {
		if (q1 != null && q1.getId() != null) {
			q1 = questionBiz.getEntityById(Question1.class, q1.getId());
		}
		if(q1.getYear() == 2012)
			return "edit1_2012";
		return "edit1";
	}

	public String save1() {
		if (q1 != null && q1.getId() != null) {
			Question1 q = questionBiz.getEntityById(Question1.class, q1.getId());
			for (int i = 1; i <= 104; i++) {
				q.setItem(i, q1.getItem(i) == null ? 0 : q1.getItem(i));
			}
			questionBiz.saveOrUpdateEntity(q);
			this.setMsg("保存成功");
			this.setSucc("Y");
		}
		return edit1();
	}

	public String exportQ1() {
		if (q1 == null || q1.getId() == null || (q1 = questionBiz.getEntityById(Question1.class, q1.getId())) == null)
			return show1();
		String filePath = null;
		try {
			filePath = questionBiz.getQ1ExcelReportFilePath(q1);
			if (filePath != null) {
				downloadFile = new FileInputStream(filePath);
				this.setMsg("q1");
			} else {
				this.setMsg("Excel文件生成失败，数据不完整或参数错误，请联系管理员");
				return show1();
			}
		} catch (Exception e) {
			logger.error("Excel文件生成失败，数据不完整或参数错误，请联系管理员", e);
			this.setMsg("Excel文件生成失败，数据不完整或参数错误，请联系管理员");
			return show1();
		}
		return "excel";
	}

	public String exportQ1Stat1() {
		if (areaId == null && zhenId == null)
			return stat1();
		else {
			String filePath = null;
			try {
				filePath = questionBiz.getQ1StatExcelReportFilePath(areaId, zhenId);
				if (filePath != null) {
					downloadFile = new FileInputStream(filePath);
					this.setMsg("q1_stat");
				} else {
					this.setMsg("Excel文件生成失败，数据不完整或参数错误，请联系管理员");
					return stat1();
				}
			} catch (Exception e) {
				logger.error("Excel文件生成失败，数据不完整或参数错误，请联系管理员", e);
				this.setMsg("Excel文件生成失败，数据不完整或参数错误，请联系管理员");
				return stat1();
			}
			return "excel";
		}
	}

	// 二
	public String list2() {
		pageBean = questionBiz.listQuestion2(areaId, zhenId, cunId, familyName, pageIndex);
		return "list2";
	}

	public String uploadQuestion2() {
		String fileName = (String) ActionContext.getContext().getSession().get(WebConstants.SESS_IMAGE);
		if (fileName != null) {
			String msg = null;
			try {
				msg = questionBiz.importQuestion2(fileName);
				this.setSucc("Y");
				this.setMsg("数据导入成功\\n" + msg);
			} catch (Exception e) {
				e.printStackTrace();
				this.setMsg("数据导入失败\\n" + e.getMessage());
			}
		}
		return "upload2";
	}

	public String deleteQuestion2() {
		if (q2 != null && q2.getId() != null) {
			questionBiz.deleteEntity(Question2.class, q2.getId());
			this.setMsg("删除成功");
		} else {
			String[] ids = (String[]) ActionContext.getContext().getParameters().get("ids");
			if (ids != null && ids.length > 0) {
				for (String idStr : ids) {
					Long id = Long.parseLong(idStr);
					Question2 q = questionBiz.getEntityById(Question2.class, id);
					if (q != null) {
						questionBiz.deleteEntity(Question2.class, id);
						this.setMsg("删除成功");
					}
				}
			}
		}
		return list2();
	}

	public String show2() {
		if (q2 != null && q2.getId() != null) {
			q2 = questionBiz.getEntityById(Question2.class, q2.getId());
		}
		isShow = "Y";
		return "show2";
	}

	public String stat2() {
		if (areaId != null || zhenId != null || cunId != null)
			q = questionBiz.statQuestion2(areaId, zhenId, cunId);
		return "stat2";
	}

	public String edit2() {
		if (q2 != null && q2.getId() != null) {
			q2 = questionBiz.getEntityById(Question2.class, q2.getId());
		}
		return "edit2";
	}

	public String save2() {
		if (q2 != null && q2.getId() != null) {
			Question2 q = questionBiz.getEntityById(Question2.class, q2.getId());
			for (int i = 1; i <= 47; i++) {
				q.setItem(i, q2.getItem(i) == null ? 0 : q2.getItem(i));
			}
			questionBiz.saveOrUpdateEntity(q);
			this.setMsg("保存成功");
			this.setSucc("Y");
		}
		return edit2();
	}

	public String exportQ2() {
		if (q2 == null || q2.getId() == null || (q2 = questionBiz.getEntityById(Question2.class, q2.getId())) == null)
			return show2();
		String filePath = null;
		try {
			filePath = questionBiz.getQ2ExcelReportFilePath(q2);
			if (filePath != null) {
				downloadFile = new FileInputStream(filePath);
				this.setMsg("q2");
			} else {
				this.setMsg("Excel文件生成失败，数据不完整或参数错误，请联系管理员");
				return show2();
			}
		} catch (Exception e) {
			logger.error("Excel文件生成失败，数据不完整或参数错误，请联系管理员", e);
			this.setMsg("Excel文件生成失败，数据不完整或参数错误，请联系管理员");
			return show2();
		}
		return "excel";
	}

	public String exportQ2Stat2() {
		if (areaId == null && zhenId == null)
			return stat1();
		else {
			String filePath = null;
			try {
				filePath = questionBiz.getQ2StatExcelReportFilePath(areaId, zhenId, cunId);
				if (filePath != null) {
					downloadFile = new FileInputStream(filePath);
					this.setMsg("q2_stat");
				} else {
					this.setMsg("Excel文件生成失败，数据不完整或参数错误，请联系管理员");
					return stat1();
				}
			} catch (Exception e) {
				logger.error("Excel文件生成失败，数据不完整或参数错误，请联系管理员", e);
				this.setMsg("Excel文件生成失败，数据不完整或参数错误，请联系管理员");
				return stat1();
			}
			return "excel";
		}
	}

	private String qType;

	public String lockList() {
		List<Question> qList = new ArrayList<Question>();
		if ("2".equals(qType)) {
			List<Question2> q2List = questionBiz.getEntitiesByColumn(Question2.class, "status", 2);
			qList.addAll(q2List);
		} else {
			List<Question1> q1List = questionBiz.getEntitiesByColumn(Question1.class, "status", 2);
			qList.addAll(q1List);
		}
		pageBean = new PageBean();
		pageBean.setResultList(qList);
		return "lock_list";
	}

	public String unlock() {
		String[] ids = (String[]) ActionContext.getContext().getParameters().get("ids");
		for (String id : ids) {
			Long i = Long.valueOf(id);
			if ("2".equals(qType)) {
				Question2 q2 = questionBiz.getEntityById(Question2.class, i);
				if (q2 != null) {
					q2.setStatus(0);
					questionBiz.saveOrUpdateEntity(q2);
					this.setMsg("解锁成功");
				}
			} else {
				Question1 q1 = questionBiz.getEntityById(Question1.class, i);
				if (q1 != null) {
					q1.setStatus(0);
					questionBiz.saveOrUpdateEntity(q1);
					this.setMsg("解锁成功");
				}
			}
		}
		return lockList();
	}

	public PageBean getPageBean() {
		return pageBean;
	}

	public void setPageBean(PageBean pageBean) {
		this.pageBean = pageBean;
	}

	public Integer getPageIndex() {
		return pageIndex;
	}

	public void setPageIndex(Integer pageIndex) {
		this.pageIndex = pageIndex;
	}

	public Long getAreaId() {
		return areaId;
	}

	public void setAreaId(Long areaId) {
		this.areaId = areaId;
	}

	public Long getZhenId() {
		return zhenId;
	}

	public void setZhenId(Long zhenId) {
		this.zhenId = zhenId;
	}

	public Long getCunId() {
		return cunId;
	}

	public void setCunId(Long cunId) {
		this.cunId = cunId;
	}

	public Question1 getQ1() {
		return q1;
	}

	public void setQ1(Question1 q1) {
		this.q1 = q1;
	}

	public Question2 getQ2() {
		return q2;
	}

	public void setQ2(Question2 q2) {
		this.q2 = q2;
	}

	public QuestionBiz getQuestionBiz() {
		return questionBiz;
	}

	public void setQuestionBiz(QuestionBiz questionBiz) {
		this.questionBiz = questionBiz;
	}

	public String getFamilyName() {
		return familyName;
	}

	public void setFamilyName(String familyName) {
		this.familyName = familyName;
	}

	public String getIsShow() {
		return isShow;
	}

	public void setIsShow(String isShow) {
		this.isShow = isShow;
	}

	public QuestionStatDO getQ() {
		return q;
	}

	public void setQ(QuestionStatDO q) {
		this.q = q;
	}

	public InputStream getDownloadFile() {
		return downloadFile;
	}

	public void setDownloadFile(InputStream downloadFile) {
		this.downloadFile = downloadFile;
	}

	public String getqType() {
		return qType;
	}

	public void setqType(String qType) {
		this.qType = qType;
	}

}
