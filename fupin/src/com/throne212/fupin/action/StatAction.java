package com.throne212.fupin.action;

import java.io.FileInputStream;
import java.io.InputStream;
import java.util.List;

import org.apache.struts2.ServletActionContext;

import com.opensymphony.xwork2.ActionContext;
import com.throne212.fupin.biz.StatBiz;
import com.throne212.fupin.common.FamilyTypeStatDO;
import com.throne212.fupin.common.PageBean;
import com.throne212.fupin.common.WebConstants;
import com.throne212.fupin.domain.User;

public class StatAction extends BaseAction {

	private StatBiz statBiz;

	private PageBean<FamilyTypeStatDO> pageBean;

	private Integer pageIndex;

	//查询参数
	private Long cunId;
	private Long zhenId;
	private Long areaId;
	
	public String familyTypeList() {
		User user = (User) ActionContext.getContext().getSession().get(WebConstants.SESS_USER_OBJ);
		pageBean = statBiz.getFamilyTypeByUser(user, cunId, zhenId, areaId, pageIndex);
		//统计当前页合计的百分比
		int[][] sumArr = (int[][]) pageBean.getTotal();
		int type1Sum = sumArr[0][0];
		int type3Sum = sumArr[0][2];
		int sum = sumArr[0][4];
		double rate = (type1Sum + type3Sum) / (1.0 * sum);
		rate = ((int) (rate * 10000)) / 100.0;
		ServletActionContext.getRequest().setAttribute("rate", rate + "%");
		//统计总计的百分比
		type1Sum = sumArr[1][0];
		type3Sum = sumArr[1][2];
		sum = sumArr[1][4];
		rate = (type1Sum + type3Sum) / (1.0 * sum);
		rate = ((int) (rate * 10000)) / 100.0;
		ServletActionContext.getRequest().setAttribute("rate2", rate + "%");
		return "family_type_stat";
	}
	
	// excel导出文件
	private InputStream downloadFile;
	// 导出Excel
	public String exportExcel() {
		String filePath = null;
		try {
			User user = (User) ActionContext.getContext().getSession().get(WebConstants.SESS_USER_OBJ);
			filePath = statBiz.exportFamilyTypeByUser(user, cunId, zhenId, areaId, pageIndex);
			if (filePath != null) {
				downloadFile = new FileInputStream(filePath);
				this.setMsg("family_type_stat");
			} else {
				this.setMsg("Excel文件生成失败，数据不完整或参数错误，请联系管理员");
				return familyTypeList();
			}
		} catch (Exception e) {
			logger.error("Excel文件生成失败", e);
			this.setMsg("Excel文件生成失败，请联系管理员");
			return familyTypeList();
		}
		return "excel";
	}

	public StatBiz getStatBiz() {
		return statBiz;
	}

	public void setStatBiz(StatBiz statBiz) {
		this.statBiz = statBiz;
	}

	public PageBean<FamilyTypeStatDO> getPageBean() {
		return pageBean;
	}

	public void setPageBean(PageBean<FamilyTypeStatDO> pageBean) {
		this.pageBean = pageBean;
	}

	public Integer getPageIndex() {
		return pageIndex;
	}

	public void setPageIndex(Integer pageIndex) {
		this.pageIndex = pageIndex;
	}

	public Long getCunId() {
		return cunId;
	}

	public void setCunId(Long cunId) {
		this.cunId = cunId;
	}

	public Long getZhenId() {
		return zhenId;
	}

	public void setZhenId(Long zhenId) {
		this.zhenId = zhenId;
	}

	public Long getAreaId() {
		return areaId;
	}

	public void setAreaId(Long areaId) {
		this.areaId = areaId;
	}

	public InputStream getDownloadFile() {
		return downloadFile;
	}

	public void setDownloadFile(InputStream downloadFile) {
		this.downloadFile = downloadFile;
	}

}
