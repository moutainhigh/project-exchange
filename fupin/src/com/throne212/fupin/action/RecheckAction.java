package com.throne212.fupin.action;

import com.opensymphony.xwork2.ActionContext;
import com.throne212.fupin.biz.ShenHeBiz;
import com.throne212.fupin.common.PageBean;
import com.throne212.fupin.common.WebConstants;
import com.throne212.fupin.domain.ChengxiaoCun;
import com.throne212.fupin.domain.ChengxiaoFamily;
import com.throne212.fupin.domain.CuoshiCun;
import com.throne212.fupin.domain.CuoshiFamily;
import com.throne212.fupin.domain.Org;
import com.throne212.fupin.domain.PicCun;
import com.throne212.fupin.domain.PicFamily;
import com.throne212.fupin.domain.Reason;
import com.throne212.fupin.domain.Recheck;
import com.throne212.fupin.domain.Record;

public class RecheckAction extends BaseAction {

	private ShenHeBiz shenHeBiz;

	private PageBean pageBean;
	private Integer pageIndex;
	private String moduleType;
	private String state;

	public String list() {
		pageBean = shenHeBiz.getAllRecheck(moduleType, state, pageIndex);
		return "list";
	}

	private Recheck recheck;

	public String save() {
		recheck.setState("待审核");
		Org org = (Org) ActionContext.getContext().getSession().get(WebConstants.SESS_USER_OBJ);
		recheck.setOrg(org);
		shenHeBiz.saveOrUpdateEntity(recheck);
		this.setSucc("Y");
		this.setMsg("保存成功");
		return "edit";
	}

	public String delete() {
		String[] ids = (String[]) ActionContext.getContext().getParameters().get("ids");
		if (ids != null && ids.length > 0) {
			for (String id : ids) {
				shenHeBiz.deleteEntity(Recheck.class, Long.parseLong(id));
			}
			this.setSucc("Y");
			this.setMsg("删除成功");
		}
		return list();
	}

	// 重审的审核
	private Long recordId;

	public String listRecheck() {
		pageBean = shenHeBiz.getAllRecheck(recordId, pageIndex);
		return "recheck_list";
	}

	public String passRecheck() {
		recheck = shenHeBiz.getEntityById(Recheck.class, recheck.getId());

		Long recordId = recheck.getRecordId();
		if ("村措施".equals(recheck.getModule())) {
			CuoshiCun c = shenHeBiz.getEntityById(CuoshiCun.class, recordId);
			if (c != null) {
				c.setStatus(WebConstants.SHENHE_STATUS_UNCOMMIT);
				shenHeBiz.saveOrUpdateEntity(c);
			}
		} else if ("村成效".equals(recheck.getModule())) {
			ChengxiaoCun c = shenHeBiz.getEntityById(ChengxiaoCun.class, recordId);
			if (c != null) {
				c.setStatus(WebConstants.SHENHE_STATUS_UNCOMMIT);
				shenHeBiz.saveOrUpdateEntity(c);
			}
		} else if ("村图片".equals(recheck.getModule())) {
			PicCun c = shenHeBiz.getEntityById(PicCun.class, recordId);
			if (c != null) {
				c.setStatus(WebConstants.SHENHE_STATUS_UNCOMMIT);
				shenHeBiz.saveOrUpdateEntity(c);
			}
		} else if ("户贫困原因".equals(recheck.getModule()) || "户帮扶原因".equals(recheck.getModule())) {
			Reason c = shenHeBiz.getEntityById(Reason.class, recordId);
			if (c != null) {
				c.setStatus(WebConstants.SHENHE_STATUS_UNCOMMIT);
				shenHeBiz.saveOrUpdateEntity(c);
			}
		} else if ("户帮扶措施".equals(recheck.getModule())) {
			CuoshiFamily c = shenHeBiz.getEntityById(CuoshiFamily.class, recordId);
			if (c != null) {
				c.setStatus(WebConstants.SHENHE_STATUS_UNCOMMIT);
				shenHeBiz.saveOrUpdateEntity(c);
			}
		} else if ("户扶持内容".equals(recheck.getModule())) {
			Record c = shenHeBiz.getEntityById(Record.class, recordId);
			if (c != null) {
				c.setStatus(WebConstants.SHENHE_STATUS_UNCOMMIT);
				shenHeBiz.saveOrUpdateEntity(c);
			}
		} else if ("户帮扶成效".equals(recheck.getModule())) {
			ChengxiaoFamily c = shenHeBiz.getEntityById(ChengxiaoFamily.class, recordId);
			if (c != null) {
				c.setStatus(WebConstants.SHENHE_STATUS_UNCOMMIT);
				shenHeBiz.saveOrUpdateEntity(c);
			}
		} else if ("户图片".equals(recheck.getModule())) {
			PicFamily c = shenHeBiz.getEntityById(PicFamily.class, recordId);
			if (c != null) {
				c.setStatus(WebConstants.SHENHE_STATUS_UNCOMMIT);
				shenHeBiz.saveOrUpdateEntity(c);
			}
		}

		recheck.setState("批准重审");
		shenHeBiz.saveOrUpdateEntity(recheck);
		this.setMsg("通过审核成功");
		return listRecheck();
	}

	public String unpassRecheck() {
		recheck = shenHeBiz.getEntityById(Recheck.class, recheck.getId());
		recheck.setState("不批准重审");
		shenHeBiz.saveOrUpdateEntity(recheck);
		this.setMsg("不通过审核成功");
		return listRecheck();
	}

	public String deleteRecheck() {
		String[] ids = (String[]) ActionContext.getContext().getParameters().get("ids");
		if (ids != null && ids.length > 0) {
			for (String id : ids) {
				shenHeBiz.deleteEntity(Recheck.class, Long.parseLong(id));
			}
			this.setSucc("Y");
			this.setMsg("删除成功");
		}
		return listRecheck();
	}

	public ShenHeBiz getShenHeBiz() {
		return shenHeBiz;
	}

	public void setShenHeBiz(ShenHeBiz shenHeBiz) {
		this.shenHeBiz = shenHeBiz;
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

	public String getModuleType() {
		return moduleType;
	}

	public void setModuleType(String moduleType) {
		this.moduleType = moduleType;
	}

	public String getState() {
		return state;
	}

	public void setState(String state) {
		this.state = state;
	}

	public Recheck getRecheck() {
		return recheck;
	}

	public void setRecheck(Recheck recheck) {
		this.recheck = recheck;
	}

	public Long getRecordId() {
		return recordId;
	}

	public void setRecordId(Long recordId) {
		this.recordId = recordId;
	}

}
