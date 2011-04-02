package com.throne212.fupin.action;

import com.opensymphony.xwork2.ActionContext;
import com.throne212.fupin.biz.OrgBiz;
import com.throne212.fupin.common.PageBean;
import com.throne212.fupin.common.WebConstants;
import com.throne212.fupin.domain.Cun;
import com.throne212.fupin.domain.User;
import com.throne212.fupin.domain.Zhen;
import com.throne212.fupin.domain.ZhenWorkOrg;

public class CunAction extends BaseAction {

	private PageBean pageBean;
	private Integer pageIndex;
	private String queryKey;

	private OrgBiz orgBiz;

	public String cunList() {
		pageBean = orgBiz.getAllCun(queryKey, pageIndex);
		return "cun_list";
	}

	private Cun cun;

	public String viewCun() {
		cun = orgBiz.getEntityById(Cun.class, cun.getId());
		return "cun_view";
	}

	public String editCun() {
		cun = orgBiz.getEntityById(Cun.class, cun.getId());
		return "cun_edit";
	}
	
	public String saveCun() {
		orgBiz.saveOrUpdateEntity(cun);
		this.setSucc("Y");
		this.setMsg("贫困村资料保存成功");
		return "cun_edit";
	}
	
	//数据导入
	public String uploadExcel(){
		String fileName = (String) ActionContext.getContext().getSession().get(WebConstants.SESS_IMAGE);
		if(fileName!=null){
			String msg = null;
			try {
				msg = orgBiz.uploadCunData(fileName);
				this.setSucc("Y");
				this.setMsg("数据导入成功\\n"+msg);
			} catch (Exception e) {
				e.printStackTrace();
				this.setMsg("数据导入失败\\n"+e.getMessage());
			}
		}
		return "upload";
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

	public Cun getCun() {
		return cun;
	}

	public void setCun(Cun cun) {
		this.cun = cun;
	}



}
