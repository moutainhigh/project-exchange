package com.throne212.fupin.action;

import java.util.Date;
import java.util.List;

import com.opensymphony.xwork2.ActionContext;
import com.throne212.fupin.biz.FamilyBFBiz;
import com.throne212.fupin.biz.OrgBiz;
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
import com.throne212.fupin.domain.PicCun;
import com.throne212.fupin.domain.PicFamily;
import com.throne212.fupin.domain.Reason;
import com.throne212.fupin.domain.Record;
import com.throne212.fupin.domain.User;

public class FamilyBFAction extends BaseAction {
	private FamilyBFBiz familyBFBiz;
	private PageBean pageBean;
	private Integer pageIndex;
	private CuoshiFamily cuoshi;
	private ChengxiaoFamily chengxiao;
	private Reason reason;
	private Record record;
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
	
	
	
	
	// 帮扶图片信息列表
	public String picFamilyList() {
		User user = (User) ActionContext.getContext().getSession().get(WebConstants.SESS_USER_OBJ);
		Cun cun = null;
		if (user instanceof Admin) {
			this.setMsg("超级管理员无权进行此操作！");
			return "pic_list";
		} else if (user instanceof Org) {
			Org org = (Org) user;
			List<Cun> list = familyBFBiz.getEntitiesByColumn(Cun.class, "org", org);
			if (list != null && list.size()>0) {
				cun = list.get(0);
			}
		} 
		if (cun == null) {
			this.setMsg("尚未指定帮扶村，不能进行操作!");
			return "pic_list";
		}
		pageBean = familyBFBiz.getAllPicFamilyByCunId(pic, cun.getId(), pageIndex);

		return "pic_list";
	}

	private PicFamily pic;
	public String saveOrUpdatePicFamily() {
		if (pic == null) {
			this.setMsg("保存失败，请检查数据是否录入完整");
			return "pic_edit";
		}
		if (pic != null && !Util.isEmpty(pic.getYear()) && !Util.isEmpty(pic.getType())) {// 添加或更新市扶贫账号信息
			User user = (User) ActionContext.getContext().getSession().get(WebConstants.SESS_USER_OBJ);
			Family family = null;
			if (user instanceof Admin) {
				this.setMsg("超级管理员无权进行此操作！");
				return "pic_edit";
			} else if (user instanceof Org) {
				Org org = (Org) user;
				List<Family> list = familyBFBiz.getEntitiesByColumn(Family.class, "cun.org", org);
				if (list != null && list.size()>0) {
					family = list.get(0);
				}
			} 
			if (family == null) {
				this.setMsg("尚未指定帮扶村，不能进行操作!");
				return "pic_edit";
			}
			pic.setFamily(family);
			String image = (String) ActionContext.getContext().getSession().get(WebConstants.SESS_IMAGE);
			if (image != null) {
				pic.setPath(image);
				ActionContext.getContext().getSession().remove(WebConstants.SESS_IMAGE);
			}else{
				this.setMsg("图片未能上传，请先上传图片，再确认操作");
				return "pic_edit";
			}
			pic.setStatus(WebConstants.SHENHE_STATUS_UNCOMMIT);
			pic = familyBFBiz.saveOrUpdatePicFamily(pic);
			this.setMsg("保存成功");
			this.setSucc("Y");
			pic = null;
		} else if (pic != null && pic.getId() != null) {// 查看详情
			pic = familyBFBiz.getEntityById(PicFamily.class, pic.getId());
		}
		return "pic_edit";

	}
	public String viewPic(){
		pic = familyBFBiz.getEntityById(PicFamily.class, pic.getId());
		return "show_pic";
	}

	// 确定提交
	public String confirmPic() {
		if (pic.getId() != null) {
			pic = familyBFBiz.getEntityById(PicFamily.class, pic.getId());
			pic.setStatus(WebConstants.SHENHE_STATUS_PROCECING);
			familyBFBiz.saveOrUpdateEntity(pic);
		}
		return picFamilyList();
	}

	// 删除图片
	public String deletePicFamily() {
		String[] picFamilyIds = (String[]) ActionContext.getContext().getParameters().get("picFamily_ids");
		if (picFamilyIds != null && picFamilyIds.length > 0) {
			for (String idStr : picFamilyIds) {
				Long id = Long.parseLong(idStr);
				familyBFBiz.deleteEntity(PicFamily.class, id);
			}
			this.setMsg("删除图片成功！");
		}
		return picFamilyList();
	}
	// 贫困户帮扶记录列表
	private Date fromDate;
	private Date toDate;
	public String recordList() {
		User user = (User) ActionContext.getContext().getSession().get(WebConstants.SESS_USER_OBJ);
		if (fromDate!=null&&toDate!=null) {
			if (fromDate.getTime()>toDate.getTime()) {
				this.setMsg("起始时间必须小于结束时间！");
				return "record_list";
			}
		}
		
		if (user instanceof Admin) {
			pageBean = familyBFBiz.getAllRecord(record, pageIndex,fromDate,toDate);
			return "record_list";
		} 
		Org org = (Org) user;
		pageBean = familyBFBiz.getAllRecordByCunId(record,org.getCun().getId(), pageIndex,fromDate,toDate);
		return "record_list";
	}
	//增加或修改帮扶记录
	public String saveOrUpdateRecord() {
		if (record == null) {
			this.setMsg("保存失败，请检查数据是否录入完整");
			return "record_edit";
		}
		if (record != null && record.getContent()!=null) {// 添加或更新信息
			if (record.getRecordDate() == null) {
				this.setMsg("请填入记录时间！");
				return "record_edit";
			}
			User user = (User) ActionContext.getContext().getSession().get(WebConstants.SESS_USER_OBJ);
			if (user instanceof Admin) {
				this.setMsg("超级管理员无权进行此操作！");
				return "record_edit";
			} 
			Family family=null;
			if (record.getFamily()!=null&&record.getFamily().getId()!=null) {
				family=familyBFBiz.getEntityById(Family.class, record.getFamily().getId());
				record.setFamily(family);
			}
			if (family!=null&&leaderId!=null) {
				Leader leader =familyBFBiz.getEntityById(Leader.class, leaderId);
				leader.setFamily(family);
			}
			record.setFamily(family);
			record.setStatus(WebConstants.SHENHE_STATUS_UNCOMMIT);
			record = familyBFBiz.saveOrUpdateRecord(record);
			this.setMsg("保存成功");
			this.setSucc("Y");
			record = null;
		} else if (record != null && record.getId() != null) {// 查看详情
			record = familyBFBiz.getEntityById(Record.class, record.getId());
		}
		return "record_edit";
	}
	// 确定提交
	public String confirmRecord() {
		if (record.getId() != null) {
			record = familyBFBiz.getEntityById(Record.class, record.getId());
			record.setStatus(WebConstants.SHENHE_STATUS_PROCECING);
			familyBFBiz.saveOrUpdateEntity(record);
		}
		return recordList();
	}
	// 删除记录
	public String deleteRecord() {
		String[] recordIds = (String[]) ActionContext.getContext().getParameters().get("record_ids");
		if (recordIds != null && recordIds.length > 0) {
			for (String idStr : recordIds) {
				Long id = Long.parseLong(idStr);
				familyBFBiz.deleteEntity(Record.class, id);
			}
			this.setMsg("删除扶持记录成功");
		}
		return recordList();
	}
	
	
	
	//规划到户
	private OrgBiz orgBiz;
	private Family family;
	private String queryKey;
	public String familyMappingList(){
		pageBean = orgBiz.getAllFamily(queryKey, pageIndex);
		if(pageBean.getResultList() != null && pageBean.getResultList().size()>0){
			for(Object o : pageBean.getResultList()){
				Family f = (Family) o;
				List list = orgBiz.getEntitiesByColumn(Leader.class, "family", f);
				f.setLeaderList(list);
			}
		}
		return "family_mapping_list";
	}
	
	private List leaderList;
	public String editFamilyMapping(){
		family = familyBFBiz.getEntityById(Family.class, family.getId());
		List list = orgBiz.getEntitiesByColumn(Leader.class, "family", family);
		family.setLeaderList(list);
		
		//获取领导列表
		User user = (User) ActionContext.getContext().getSession().get(WebConstants.SESS_USER_OBJ);
		if (user instanceof Org) {
			leaderList = orgBiz.getEntitiesByColumn(Leader.class, "org", user);
		} 
		
		return "family_mapping_edit";
	}
	
	public String saveFamilyMapping(){
		String[] ids = (String[]) ActionContext.getContext().getParameters().get("leaderIds");
		if(ids != null && ids.length > 0){
			family = orgBiz.getEntityById(Family.class, family.getId());
			for(String id : ids){
				Leader leader = orgBiz.getEntityById(Leader.class, Long.parseLong(id));
				leader.setFamily(family);
				orgBiz.saveOrUpdateEntity(leader);
			}
			this.setSucc("Y");
			this.setMsg("帮扶方式保存成功");
		}
		return "family_mapping_edit";
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

	public PicFamily getPic() {
		return pic;
	}

	public void setPic(PicFamily pic) {
		this.pic = pic;
	}

	public Record getRecord() {
		return record;
	}

	public void setRecord(Record record) {
		this.record = record;
	}

	public Date getFromDate() {
		return fromDate;
	}

	public void setFromDate(Date fromDate) {
		this.fromDate = fromDate;
	}

	public Date getToDate() {
		return toDate;
	}

	public void setToDate(Date toDate) {
		this.toDate = toDate;
	}

	public OrgBiz getOrgBiz() {
		return orgBiz;
	}

	public void setOrgBiz(OrgBiz orgBiz) {
		this.orgBiz = orgBiz;
	}

	public Family getFamily() {
		return family;
	}

	public void setFamily(Family family) {
		this.family = family;
	}

	public String getQueryKey() {
		return queryKey;
	}

	public void setQueryKey(String queryKey) {
		this.queryKey = queryKey;
	}

	public List getLeaderList() {
		return leaderList;
	}

	public void setLeaderList(List leaderList) {
		this.leaderList = leaderList;
	}
	
	

}
