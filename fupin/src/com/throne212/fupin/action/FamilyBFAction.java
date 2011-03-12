package com.throne212.fupin.action;

import java.util.List;

import com.opensymphony.xwork2.ActionContext;
import com.throne212.fupin.biz.FamilyBFBiz;
import com.throne212.fupin.common.PageBean;
import com.throne212.fupin.common.Util;
import com.throne212.fupin.common.WebConstants;
import com.throne212.fupin.domain.Admin;
import com.throne212.fupin.domain.ChengxiaoFamily;
import com.throne212.fupin.domain.Cun;
import com.throne212.fupin.domain.CuoshiCun;
import com.throne212.fupin.domain.CuoshiFamily;
import com.throne212.fupin.domain.Family;
import com.throne212.fupin.domain.Leader;
import com.throne212.fupin.domain.Org;
import com.throne212.fupin.domain.Reason;
import com.throne212.fupin.domain.User;

public class FamilyBFAction extends BaseAction {
	private FamilyBFBiz familyBFBiz;
	private PageBean pageBean;
	private Integer pageIndex;
	private CuoshiFamily cuoshi;
	private ChengxiaoFamily chengxiao;
	private Reason reason;
	private Cun cun;
	// 户帮扶措施列表
	public String cuoshiFamilyList() {
		User user = (User) ActionContext.getContext().getSession().get(WebConstants.SESS_USER_OBJ);
		
		if (user instanceof Admin) {
			pageBean = familyBFBiz.getAllCuoshiFamily(cuoshi, pageIndex);
			return "cuoshifamily_list";
		} 
		Org org = (Org) user;
		pageBean = familyBFBiz.getAllCuoshiFamilyByCunId(cuoshi,org.getCun().getId(), pageIndex);
		return "cuoshifamily_list";
	}
	
	
	
	// 增加或修改户帮扶措施
	private Long leaderId;
	public String saveOrUpdateCuoshiFamily() {
		if (cuoshi == null) {
			this.setMsg("保存失败，请检查数据是否录入完整");
			return "cuoshifamily_edit";
		}
		if (cuoshi != null && !Util.isEmpty(cuoshi.getYear())) {// 添加或更新信息
			if (cuoshi.getYear() == null) {
				this.setMsg("请选择帮扶年度！");
				return "cuoshifamily_edit";
			}
			User user = (User) ActionContext.getContext().getSession().get(WebConstants.SESS_USER_OBJ);
			if (user instanceof Admin) {
				this.setMsg("超级管理员无权进行此操作！");
				return "cuoshifamily_edit";
			} 
			Family family=null;
			if (cuoshi.getFamily()!=null&&cuoshi.getFamily().getId()!=null) {
				family=familyBFBiz.getEntityById(Family.class, cuoshi.getFamily().getId());
				cuoshi.setFamily(family);
			}
			if (family!=null&&leaderId!=null) {
				Leader leader =familyBFBiz.getEntityById(Leader.class, leaderId);
				leader.setFamily(family);
			}
			cuoshi.setFamily(family);
			cuoshi.setStatus(WebConstants.SHENHE_STATUS_UNCOMMIT);
			cuoshi = familyBFBiz.saveOrUpdateCuoshiFamily(cuoshi);
			this.setMsg("保存成功");
			this.setSucc("Y");
			cuoshi = null;
		} else if (cuoshi != null && cuoshi.getId() != null) {// 查看详情
			cuoshi = familyBFBiz.getEntityById(CuoshiFamily.class, cuoshi.getId());
		}
		return "cuoshifamily_edit";
	}
	
	// 确定提交
	public String confirmCuoshi() {
		if (cuoshi.getId() != null) {
			cuoshi = familyBFBiz.getEntityById(CuoshiFamily.class, cuoshi.getId());
			cuoshi.setStatus(WebConstants.SHENHE_STATUS_PROCECING);
			familyBFBiz.saveOrUpdateEntity(cuoshi);
		}
		return cuoshiFamilyList();

	}
	// 删除措施
	public String deleteCuoshiFamily() {
		String[] cuoshiFamilyIds = (String[]) ActionContext.getContext().getParameters().get("cuoshiFamily_ids");
		if (cuoshiFamilyIds != null && cuoshiFamilyIds.length > 0) {
			for (String idStr : cuoshiFamilyIds) {
				Long id = Long.parseLong(idStr);
				familyBFBiz.deleteEntity(CuoshiFamily.class, id);
			}
			this.setMsg("删除措施成功");
		}
		return cuoshiFamilyList();
	}
	
	// 户帮扶成效列表
	public String chengxiaoFamilyList() {
		User user = (User) ActionContext.getContext().getSession().get(WebConstants.SESS_USER_OBJ);
		
		if (user instanceof Admin) {
			pageBean = familyBFBiz.getAllChengxiaoFamily(chengxiao, pageIndex);
			return "chengxiaocun_list";
		} 
		Org org = (Org) user;
		pageBean = familyBFBiz.getAllChengxiaoFamilyByCunId(chengxiao,org.getCun().getId(), pageIndex);
		return "chengxiaofamily_list";
	}
	// 增加或修改户帮扶成效
	public String saveOrUpdateChengxiaoFamily() {
		if (chengxiao == null) {
			this.setMsg("保存失败，请检查数据是否录入完整");
			return "chengxiaofamily_edit";
		}
		if (chengxiao != null && !Util.isEmpty(chengxiao.getYear())) {// 添加或更新信息
			if (chengxiao.getYear() == null) {
				this.setMsg("请选择帮扶年度！");
				return "chengxiaofamily_edit";
			}
			User user = (User) ActionContext.getContext().getSession().get(WebConstants.SESS_USER_OBJ);
			if (user instanceof Admin) {
				this.setMsg("超级管理员无权进行此操作！");
				return "chengxiaofamily_edit";
			} 
			Family family=null;
			if (chengxiao.getFamily()!=null&&chengxiao.getFamily().getId()!=null) {
				family=familyBFBiz.getEntityById(Family.class, chengxiao.getFamily().getId());
				chengxiao.setFamily(family);
			}
			if (family!=null&&leaderId!=null) {
				Leader leader =familyBFBiz.getEntityById(Leader.class, leaderId);
				leader.setFamily(family);
			}
			chengxiao.setFamily(family);
			chengxiao.setStatus(WebConstants.SHENHE_STATUS_UNCOMMIT);
			chengxiao = familyBFBiz.saveOrUpdateChengxiaoFamily(chengxiao);
			this.setMsg("保存成功");
			this.setSucc("Y");
			chengxiao = null;
		} else if (chengxiao != null && chengxiao.getId() != null) {// 查看详情
			chengxiao = familyBFBiz.getEntityById(ChengxiaoFamily.class, chengxiao.getId());
		}
		return "chengxiaofamily_edit";
	}
	// 确定提交
	public String confirmChengxiao() {
		if (chengxiao.getId() != null) {
			chengxiao = familyBFBiz.getEntityById(ChengxiaoFamily.class, chengxiao.getId());
			chengxiao.setStatus(WebConstants.SHENHE_STATUS_PROCECING);
			familyBFBiz.saveOrUpdateEntity(chengxiao);
		}
		return chengxiaoFamilyList();
	}
	// 删除成效
	public String deleteChengxiaoFamily() {
		String[] chengxiaoFamilyIds = (String[]) ActionContext.getContext().getParameters().get("chengxiaoFamily_ids");
		if (chengxiaoFamilyIds != null && chengxiaoFamilyIds.length > 0) {
			for (String idStr : chengxiaoFamilyIds) {
				Long id = Long.parseLong(idStr);
				familyBFBiz.deleteEntity(ChengxiaoFamily.class, id);
			}
			this.setMsg("删除措施成功");
		}
		return chengxiaoFamilyList();
	}
	
	// 贫困原因列表
	public String reasonList() {
		User user = (User) ActionContext.getContext().getSession().get(WebConstants.SESS_USER_OBJ);
		
		if (user instanceof Admin) {
			pageBean = familyBFBiz.getAllReason(reason, pageIndex);
			return "reason_list";
		} 
		Org org = (Org) user;
		pageBean = familyBFBiz.getAllReasonByCunId(reason,org.getCun().getId(), pageIndex);
		return "reason_list";
	}
	//增加或修改贫困原因
	public String saveOrUpdateReason() {
		if (reason == null) {
			this.setMsg("保存失败，请检查数据是否录入完整");
			return "reason_edit";
		}
		if (reason != null && !Util.isEmpty(reason.getYear())) {// 添加或更新信息
			if (reason.getYear() == null) {
				this.setMsg("请选择帮扶年度！");
				return "reason_edit";
			}
			User user = (User) ActionContext.getContext().getSession().get(WebConstants.SESS_USER_OBJ);
			if (user instanceof Admin) {
				this.setMsg("超级管理员无权进行此操作！");
				return "reason_edit";
			} 
			Family family=null;
			if (reason.getFamily()!=null&&reason.getFamily().getId()!=null) {
				family=familyBFBiz.getEntityById(Family.class, reason.getFamily().getId());
				reason.setFamily(family);
			}
			if (family!=null&&leaderId!=null) {
				Leader leader =familyBFBiz.getEntityById(Leader.class, leaderId);
				leader.setFamily(family);
			}
			reason.setFamily(family);
			reason.setStatus(WebConstants.SHENHE_STATUS_UNCOMMIT);
			reason = familyBFBiz.saveOrUpdateReason(reason);
			this.setMsg("保存成功");
			this.setSucc("Y");
			reason = null;
		} else if (reason != null && reason.getId() != null) {// 查看详情
			reason = familyBFBiz.getEntityById(Reason.class, reason.getId());
		}
		return "reason_edit";
	}
	// 确定提交
	public String confirmReason() {
		if (reason.getId() != null) {
			reason = familyBFBiz.getEntityById(Reason.class, reason.getId());
			reason.setStatus(WebConstants.SHENHE_STATUS_PROCECING);
			familyBFBiz.saveOrUpdateEntity(reason);
		}
		return reasonList();
	}
	// 删除原因
	public String deleteReason() {
		String[] reasonIds = (String[]) ActionContext.getContext().getParameters().get("reason_ids");
		if (reasonIds != null && reasonIds.length > 0) {
			for (String idStr : reasonIds) {
				Long id = Long.parseLong(idStr);
				familyBFBiz.deleteEntity(Reason.class, id);
			}
			this.setMsg("删除原因成功");
		}
		return reasonList();
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


	public CuoshiFamily getCuoshi() {
		return cuoshi;
	}

	public void setCuoshi(CuoshiFamily cuoshi) {
		this.cuoshi = cuoshi;
	}

	public ChengxiaoFamily getChengxiao() {
		return chengxiao;
	}

	public void setChengxiao(ChengxiaoFamily chengxiao) {
		this.chengxiao = chengxiao;
	}

	public FamilyBFBiz getFamilyBFBiz() {
		return familyBFBiz;
	}

	public void setFamilyBFBiz(FamilyBFBiz familyBFBiz) {
		this.familyBFBiz = familyBFBiz;
	}

	public Cun getCun() {
		return cun;
	}

	public void setCun(Cun cun) {
		this.cun = cun;
	}

	public Reason getReason() {
		return reason;
	}

	public void setReason(Reason reason) {
		this.reason = reason;
	}

	public Long getLeaderId() {
		return leaderId;
	}

	public void setLeaderId(Long leaderId) {
		this.leaderId = leaderId;
	}
	
	

}
