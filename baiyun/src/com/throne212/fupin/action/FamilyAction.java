package com.throne212.fupin.action;

import java.io.FileInputStream;
import java.io.InputStream;
import java.util.List;

import com.opensymphony.xwork2.ActionContext;
import com.throne212.fupin.biz.OrgBiz;
import com.throne212.fupin.common.PageBean;
import com.throne212.fupin.common.WebConstants;
import com.throne212.fupin.domain.Admin;
import com.throne212.fupin.domain.AreaWorkOrg;
import com.throne212.fupin.domain.Family;
import com.throne212.fupin.domain.Leader;
import com.throne212.fupin.domain.ShiWorkOrg;
import com.throne212.fupin.domain.User;

public class FamilyAction extends BaseAction {

	private PageBean pageBean;
	private Integer pageIndex;
	private String queryKey;
	private Long areaId;
	private Long zhenId;
	private Long cunId;
	
	private InputStream downloadFile;

	private OrgBiz orgBiz;
	
	// 导出Excel
	public String exportFamilyList() {
		String filePath = null;
		try {
			User user = (User) ActionContext.getContext().getSession().get(WebConstants.SESS_USER_OBJ);
			if(user instanceof Admin || user instanceof ShiWorkOrg){
				filePath = orgBiz.getAllFamilyExport(queryKey, pageIndex,areaId,zhenId,cunId);
			}else
				filePath = orgBiz.getAllFamilyExport(queryKey, pageIndex);
			if (filePath != null) {
				downloadFile = new FileInputStream(filePath);
				this.setMsg("family_list");
			} else {
				this.setMsg("Excel文件生成失败，数据不完整或参数错误，请联系管理员");
				return familyList();
			}
		} catch (Exception e) {
			logger.error("Excel文件生成失败", e);
			this.setMsg("Excel文件生成失败，请联系管理员");
			return familyList();
		}
		return "excel";
	}

	public String familyList() {
		User user = (User) ActionContext.getContext().getSession().get(WebConstants.SESS_USER_OBJ);
		if(user instanceof Admin || user instanceof ShiWorkOrg || user instanceof AreaWorkOrg ){
			areaId = 2L;
			pageBean = orgBiz.getAllFamily(queryKey, pageIndex,areaId,zhenId,cunId);
		}else
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
		String[] ids = (String[]) ActionContext.getContext().getParameters().get("ids");
		if (ids != null && ids.length > 0) {
			for (String idStr : ids) {
				Long id = Long.parseLong(idStr);
				//删除帮扶关系 
				List<Leader> leaderList = orgBiz.getEntitiesByColumn(Leader.class, "family.id", id);
				if(leaderList!=null && leaderList.size()>0){
					for(Leader l : leaderList){
						l.setFamily(null);
						orgBiz.saveOrUpdateEntity(l);
					}
				}
				orgBiz.deleteFamily(id);
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



}
