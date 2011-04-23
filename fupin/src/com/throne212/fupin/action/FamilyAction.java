package com.throne212.fupin.action;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.InputStream;
import java.util.List;

import jxl.Sheet;
import jxl.Workbook;

import com.opensymphony.xwork2.ActionContext;
import com.throne212.fupin.biz.OrgBiz;
import com.throne212.fupin.common.PageBean;
import com.throne212.fupin.common.Util;
import com.throne212.fupin.common.WebConstants;
import com.throne212.fupin.domain.Area;
import com.throne212.fupin.domain.Family;
import com.throne212.fupin.domain.Leader;

public class FamilyAction extends BaseAction {

	private PageBean pageBean;
	private Integer pageIndex;
	private String queryKey;
	
	private InputStream downloadFile;

	private OrgBiz orgBiz;

	public String familyList() {
		pageBean = orgBiz.getAllFamily(queryKey, pageIndex);
		return "family_list";
	}

	private Family family;

	public String viewFamily() {
		family = orgBiz.getEntityById(Family.class, family.getId());
		return "family_view";
	}

	public String editFamily() {
		family = orgBiz.getEntityById(Family.class, family.getId());
		return "family_edit";
	}
	
	public String saveFamily() {
		orgBiz.saveOrUpdateEntity(family);
		this.setSucc("Y");
		this.setMsg("贫困户保存成功");
		return "family_edit";
	}

	// 删除
	public String deleteFamily() {
		String[] shiWrokOrgIds = (String[]) ActionContext.getContext().getParameters().get("ids");
		if (shiWrokOrgIds != null && shiWrokOrgIds.length > 0) {
			for (String idStr : shiWrokOrgIds) {
				Long id = Long.parseLong(idStr);
				//删除帮扶关系 
				List<Leader> leaderList = orgBiz.getEntitiesByColumn(Leader.class, "family.id", id);
				if(leaderList!=null && leaderList.size()>0){
					for(Leader l : leaderList){
						l.setFamily(null);
						orgBiz.saveOrUpdateEntity(l);
					}
				}
				orgBiz.deleteEntity(Family.class, id);
			}
			this.setMsg("删除贫困户成功");
		}
		return familyList();
	}
	
	//数据导入
	public String uploadExcel(){
		String fileName = (String) ActionContext.getContext().getSession().get(WebConstants.SESS_IMAGE);
		if(fileName!=null){
			String msg = null;
			try {
				msg = orgBiz.uploadFamilyData(fileName);
				this.setSucc("Y");
				this.setMsg("数据导入成功\\n"+msg);
			} catch (Exception e) {
				e.printStackTrace();
				this.setMsg("数据导入失败\\n"+e.getMessage());
			}
		}
		return "upload";
	}
	//调查表导入
	public String uploadExcel2(){
		String fileName = (String) ActionContext.getContext().getSession().get(WebConstants.SESS_IMAGE);
		if(fileName!=null){
			String msg = null;
			try {
				msg = orgBiz.uploadFamilyData2(fileName);
				this.setSucc("Y");
				this.setMsg("数据导入成功\\n"+msg);
			} catch (Exception e) {
				e.printStackTrace();
				this.setMsg("数据导入失败\\n"+e.getMessage());
			}
		}
		return "upload2";
	}
	//数据导入，Excel模板3
	public String uploadExcel3(){
		String fileName = (String) ActionContext.getContext().getSession().get(WebConstants.SESS_IMAGE);
		if(fileName!=null){
			String msg = null;
			try {
				msg = orgBiz.uploadFamilyData3(fileName);
				this.setSucc("Y");
				this.setMsg("数据导入成功\\n"+msg);
			} catch (Exception e) {
				e.printStackTrace();
				this.setMsg("数据导入失败\\n"+e.getMessage());
			}
		}
		return "upload3";
	}
	//数据导出
	public String downloadExcel(){
		try {
			String path = orgBiz.getFamilyExcelDownloadFile(queryKey);
			if (path != null){
				this.setDownloadFile(new FileInputStream(path));
				this.setMsg("family");//文件名
			}
			else
				this.setMsg("文件生成失败，请联系管理员");
		} catch (Exception e) {
			e.printStackTrace();
			this.setMsg("文件下载失败");
		}
		return "excel";
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

	public OrgBiz getOrgBiz() {
		return orgBiz;
	}

	public void setOrgBiz(OrgBiz orgBiz) {
		this.orgBiz = orgBiz;
	}

	public String getQueryKey() {
		return queryKey;
	}

	public void setQueryKey(String queryKey) {
		this.queryKey = queryKey;
	}

	public Family getFamily() {
		return family;
	}

	public void setFamily(Family family) {
		this.family = family;
	}

	public InputStream getDownloadFile() {
		return downloadFile;
	}

	public void setDownloadFile(InputStream downloadFile) {
		this.downloadFile = downloadFile;
	}



}
