package com.throne212.fupin.action;

import java.util.Date;
import java.util.List;

import com.opensymphony.xwork2.ActionContext;
import com.throne212.fupin.biz.CunBFBiz;
import com.throne212.fupin.common.PageBean;
import com.throne212.fupin.common.Util;
import com.throne212.fupin.common.WebConstants;
import com.throne212.fupin.domain.Admin;
import com.throne212.fupin.domain.AreaWorkOrg;
import com.throne212.fupin.domain.ChengxiaoCun;
import com.throne212.fupin.domain.Cun;
import com.throne212.fupin.domain.CuoshiCun;
import com.throne212.fupin.domain.Org;
import com.throne212.fupin.domain.PicCun;
import com.throne212.fupin.domain.PicZhen;
import com.throne212.fupin.domain.Recheck;
import com.throne212.fupin.domain.ShiWorkOrg;
import com.throne212.fupin.domain.User;
import com.throne212.fupin.domain.Zhen;
import com.throne212.fupin.domain.ZhenWorkOrg;

public class CunBFAction extends BaseAction {
	private CunBFBiz cunBFBiz;
	private PageBean pageBean;
	private Integer pageIndex;
	// 村帮扶措施
	private CuoshiCun cuoshi;
	private ChengxiaoCun chengxiao;
	private PicCun pic;
	private Cun cun;
	// 村帮扶措施列表
	public String cuoshiCunList() {
		User user = (User) ActionContext.getContext().getSession().get(WebConstants.SESS_USER_OBJ);
		Cun cun = null;
		if (user instanceof Admin || user instanceof AreaWorkOrg || user instanceof ZhenWorkOrg) {
			pageBean = cunBFBiz.getAllCuoshiCun(cuoshi, pageIndex);
			return "cuoshicun_list";
		} else if (user instanceof Org) {
			Org org = (Org) user;
			List<Cun> list = cunBFBiz.getEntitiesByColumn(Cun.class, "org", org);
			if (list != null && list.size() > 0) {
				cun = list.get(0);
			}
		} 
		if (cun == null) {
			this.setMsg("尚未指定帮扶村，不能进行操作!");
			return "cuoshicun_list";
		}
		pageBean = cunBFBiz.getAllCuoshiCunByCunId(cuoshi, cun.getId(), pageIndex);
		return "cuoshicun_list";
	}
	
	public String editCunCuoshi(){
		User user = (User) ActionContext.getContext().getSession().get(WebConstants.SESS_USER_OBJ);
		if (user instanceof Admin) {
			this.setMsg("超级管理员无权进行此操作！");
			return "cuoshicun_edit";
		} else if (user instanceof Org) {
			Org org = (Org) user;
			List<Cun> list = cunBFBiz.getEntitiesByColumn(Cun.class, "org", org);
			if (list != null&&list.size()>0) {
				cun = list.get(0);
			}
		}
		if (cun == null) {
			this.setMsg("尚未指定帮扶村，不能进行操作!");
			return "cuoshicun_edit";
		}
		return "cuoshicun_edit";
	}
	
	// 增加或修改村帮扶措施
	public String saveOrUpdateCuoshiCun() {

		if (cuoshi == null) {
			this.setMsg("保存失败，请检查数据是否录入完整");
			return "cuoshicun_edit";
		}
		if (cuoshi != null && !Util.isEmpty(cuoshi.getContent())) {// 添加或更新信息
			User user = (User) ActionContext.getContext().getSession().get(WebConstants.SESS_USER_OBJ);
			Cun cun = null;
			if (user instanceof Admin) {
				this.setMsg("超级管理员无权进行此操作！");
				return "cuoshicun_edit";
			} else if (user instanceof Org) {
				Org org = (Org) user;
				List<Cun> list = cunBFBiz.getEntitiesByColumn(Cun.class, "org", org);
				if (list != null&&list.size()>0) {
					cun = list.get(0);
				}
			} 
			if (cun == null) {
				this.setMsg("尚未指定帮扶村，不能进行操作!");
				return "cuoshicun_edit";
			}
			cuoshi.setCun(cun);
			cuoshi.setStatus(WebConstants.SHENHE_STATUS_UNCOMMIT);
			cuoshi = cunBFBiz.saveOrUpdateCuoshiCun(cuoshi);
			this.setMsg("保存成功");
			this.setSucc("Y");
			cuoshi = null;
		} else if (cuoshi != null && cuoshi.getId() != null) {// 查看详情
			
			cuoshi = cunBFBiz.getEntityById(CuoshiCun.class, cuoshi.getId());
			editCunCuoshi();
		}
		return "cuoshicun_edit";

	}
	
	// 确定提交
	public String confirmCuoshi() {
		if (cuoshi.getId() != null) {
			cuoshi = cunBFBiz.getEntityById(CuoshiCun.class, cuoshi.getId());
			cuoshi.setStatus(WebConstants.SHENHE_STATUS_PROCECING);
			//自动为审核通过
			cuoshi.setStatus(WebConstants.SHENHE_STATUS_PASS);
			cunBFBiz.saveOrUpdateEntity(cuoshi);
			this.setMsg("提交成功！");
			cuoshi = null;
		}
		return cuoshiCunList();

	}
	// 删除措施
	public String deleteCuoshiCun() {
		String[] cuoshiCunIds = (String[]) ActionContext.getContext().getParameters().get("cuoshiCun_ids");
		if (cuoshiCunIds != null && cuoshiCunIds.length > 0) {
			for (String idStr : cuoshiCunIds) {
				Long id = Long.parseLong(idStr);
				cunBFBiz.deleteEntity(CuoshiCun.class, id);
			}
			this.setMsg("删除措施成功");
		}
		return cuoshiCunList();
	}
	
	// 成效列表
	public String chengxiaoCunList() {
		User user = (User) ActionContext.getContext().getSession().get(WebConstants.SESS_USER_OBJ);
		Cun cun = null;
		if (user instanceof Admin || user instanceof AreaWorkOrg || user instanceof ZhenWorkOrg) {
			pageBean = cunBFBiz.getAllChengxiaoCun(chengxiao, pageIndex);
			return "chengxiaocun_list";
		} else if (user instanceof Org) {
			Org org = (Org) user;
			List<Cun> list = cunBFBiz.getEntitiesByColumn(Cun.class, "org", org);
			if (list != null&&list.size()>0) {
				cun = list.get(0);
			}
		} 
		if (cun == null) {
			this.setMsg("尚未指定帮扶村，不能进行操作!");
			return "chengxiaocun_list";
		}
		pageBean = cunBFBiz.getAllChengxiaoCunByCunId(chengxiao, cun.getId(), pageIndex);
		return "chengxiaocun_list";
	}
	
	public String editCunChengxiao(){
		User user = (User) ActionContext.getContext().getSession().get(WebConstants.SESS_USER_OBJ);
		if (user instanceof Admin) {
			this.setMsg("超级管理员无权进行此操作！");
			return "chengxiaocun_edit";
		} else if (user instanceof Org) {
			Org org = (Org) user;
			List<Cun> list = cunBFBiz.getEntitiesByColumn(Cun.class, "org", org);
			if (list != null&&list.size()>0) {
				cun = list.get(0);
			}
		} 
		if (cun == null) {
			this.setMsg("尚未指定帮扶村，不能进行操作!");
			return "chengxiaocun_edit";
		}
		if (chengxiao!=null&&chengxiao.getId()!=null) {
			chengxiao=cunBFBiz.getEntityById(ChengxiaoCun.class, chengxiao.getId());
		}
		return "chengxiaocun_edit";
	}
	
	public String viewChengxiaoCun(){
		User user = (User) ActionContext.getContext().getSession().get(WebConstants.SESS_USER_OBJ);
		if (user instanceof Admin) {
			this.setMsg("超级管理员无权进行此操作！");
			return "chengxiaocun_edit";
		} else if (user instanceof Org) {
			Org org = (Org) user;
			List<Cun> list = cunBFBiz.getEntitiesByColumn(Cun.class, "org", org);
			if (list != null&&list.size()>0) {
				cun = list.get(0);
			}
		}
		if (cun == null) {
			this.setMsg("尚未指定帮扶村，不能进行操作!");
			return "chengxiaocun_edit";
		}
		chengxiao=cunBFBiz.getEntityById(ChengxiaoCun.class, chengxiao.getId());
		return "chengxiaocun_edit";
		
	}
	// 增加或修改村帮扶成效
	public String saveOrUpdateChengxiaoCun() {
		if (chengxiao == null) {
			this.setMsg("保存失败，请检查数据是否录入完整");
			return "chengxiaocun_edit";
		}
		if (chengxiao != null && !Util.isEmpty(chengxiao.getYear())) {// 添加或更新市扶贫账号信息
			if (chengxiao.getYear() == null) {
				this.setMsg("请选择帮扶年度！");
				return "chengxiaocun_edit";
			}
			User user = (User) ActionContext.getContext().getSession().get(WebConstants.SESS_USER_OBJ);
			Cun cun = null;
			if (user instanceof Admin) {
				this.setMsg("超级管理员无权进行此操作！");
				return "cuoshizhen_edit";
			} else if (user instanceof Org) {
				Org org = (Org) user;
				List<Cun> list = cunBFBiz.getEntitiesByColumn(Cun.class, "org", org);
				if (list != null&&list.size()>0) {
					cun = list.get(0);
				}
			} 
			if (cun == null) {
				this.setMsg("尚未指定帮扶村，不能进行操作!");
				return "chengxiaocun_edit";
			}
			chengxiao.setCun(cun);
			chengxiao.setStatus(WebConstants.SHENHE_STATUS_UNCOMMIT);
			chengxiao = cunBFBiz.saveOrUpdateChengxiaoCun(chengxiao);
			this.setMsg("保存成功");
			this.setSucc("Y");
			chengxiao = null;
		} else if (chengxiao != null && chengxiao.getId() != null) {// 查看详情
			chengxiao = cunBFBiz.getEntityById(ChengxiaoCun.class, chengxiao.getId());
		}
		return "chengxiaocun_edit";

	}
	// 确定提交
	public String confirmChengxiao() {
		if (chengxiao.getId() != null) {
			chengxiao = cunBFBiz.getEntityById(ChengxiaoCun.class, chengxiao.getId());
			chengxiao.setStatus(WebConstants.SHENHE_STATUS_PROCECING);
			//自动为审核通过
			chengxiao.setStatus(WebConstants.SHENHE_STATUS_PASS);
			cunBFBiz.saveOrUpdateEntity(chengxiao);
			this.setMsg("提交成功！");
		}
		return chengxiaoCunList();
	}
	
	// 删除成效
	public String deleteChengxiaoCun() {
		String[] chengxiaoCunIds = (String[]) ActionContext.getContext().getParameters().get("chengxiaoCun_ids");
		if (chengxiaoCunIds != null && chengxiaoCunIds.length > 0) {
			for (String idStr : chengxiaoCunIds) {
				Long id = Long.parseLong(idStr);
				cunBFBiz.deleteEntity(ChengxiaoCun.class, id);
			}
			this.setMsg("删除成效成功");
		}
		return chengxiaoCunList();
	}
	
	// 帮扶图片信息列表
	public String picCunList() {
		User user = (User) ActionContext.getContext().getSession().get(WebConstants.SESS_USER_OBJ);
		Cun cun = null;
		if (user instanceof Admin) {
			this.setMsg("超级管理员无权进行此操作！");
			return "pic_list";
		} else if (user instanceof Org) {
			Org org = (Org) user;
			List<Cun> list = cunBFBiz.getEntitiesByColumn(Cun.class, "org", org);
			if (list != null && list.size()>0) {
				cun = list.get(0);
			}
		} 
		if (cun == null) {
			this.setMsg("尚未指定帮扶村，不能进行操作!");
			return "pic_list";
		}
		pageBean = cunBFBiz.getAllPicCunByCunId(pic, cun.getId(), pageIndex);

		return "pic_list";
	}

	public String saveOrUpdatePicCun() {

		if (pic == null) {
			this.setMsg("保存失败，请检查数据是否录入完整");
			return "pic_edit";
		}
		if (pic != null && !Util.isEmpty(pic.getYear()) && !Util.isEmpty(pic.getType())) {// 添加或更新市扶贫账号信息
			User user = (User) ActionContext.getContext().getSession().get(WebConstants.SESS_USER_OBJ);
			Cun cun = null;
			if (user instanceof Admin) {
				this.setMsg("超级管理员无权进行此操作！");
				return "pic_edit";
			} else if (user instanceof Org) {
				Org org = (Org) user;
				List<Cun> list = cunBFBiz.getEntitiesByColumn(Cun.class, "org", org);
				if (list != null && list.size()>0) {
					cun = list.get(0);
				}
			} 
			if (cun == null) {
				this.setMsg("尚未指定帮扶村，不能进行操作!");
				return "pic_edit";
			}
			pic.setCun(cun);
			String image = (String) ActionContext.getContext().getSession().get(WebConstants.SESS_IMAGE);
			if (image != null) {
				pic.setPath(image);
				ActionContext.getContext().getSession().remove(WebConstants.SESS_IMAGE);
			}else{
				this.setMsg("图片未能上传，请先上传图片，再确认操作");
				return "pic_edit";
			}
			pic.setStatus(WebConstants.SHENHE_STATUS_UNCOMMIT);
			pic = cunBFBiz.saveOrUpdatePicCun(pic);
			this.setMsg("保存成功");
			this.setSucc("Y");
			pic = null;
		} else if (pic != null && pic.getId() != null) {// 查看详情
			pic = cunBFBiz.getEntityById(PicCun.class, pic.getId());
		}
		return "pic_edit";

	}
	public String viewPic(){
		pic = cunBFBiz.getEntityById(PicCun.class, pic.getId());
		return "show_pic";
	}

	// 确定提交
	public String confirmPic() {
		if (pic.getId() != null) {
			pic = cunBFBiz.getEntityById(PicCun.class, pic.getId());
			pic.setStatus(WebConstants.SHENHE_STATUS_PROCECING);
			//自动为审核通过
			pic.setStatus(WebConstants.SHENHE_STATUS_PASS);
			cunBFBiz.saveOrUpdateEntity(pic);
			this.setMsg("提交成功！");
		}
		return picCunList();
	}

	// 删除图片
	public String deletePicCun() {
		String[] picCunIds = (String[]) ActionContext.getContext().getParameters().get("picCun_ids");
		if (picCunIds != null && picCunIds.length > 0) {
			for (String idStr : picCunIds) {
				Long id = Long.parseLong(idStr);
				if(cunBFBiz.getEntityById(PicCun.class, id)==null)
					continue;
				cunBFBiz.deleteEntity(PicCun.class, id);
				this.setMsg("删除图片成功！");
			}
		}
		return picCunList();
	}
	
	//修改申请
	private String updateReason;
	private Long currId;
	public String updateApplyChengxiao(){
		Recheck r = new Recheck();
		r.setCreateDate(new Date());
		r.setModule("村成效");
		User user = (User) ActionContext.getContext().getSession().get(WebConstants.SESS_USER_OBJ);
		if(user instanceof Org){
			r.setOrg((Org) user);
		}
		r.setReason(updateReason);
		r.setRecordId(currId);
		r.setState("待审核");
		cunBFBiz.saveOrUpdateEntity(r);
		
		//修改状态
		chengxiao = cunBFBiz.getEntityById(ChengxiaoCun.class, currId);
		chengxiao.setStatus(WebConstants.SHENHE_STATUS_PROCECING);
		cunBFBiz.saveOrUpdateEntity(chengxiao);
		chengxiao=null;
		
		this.setMsg("提交修改申请成功");
		return chengxiaoCunList();
	}
	public String updateApplyCuoshi(){
		Recheck r = new Recheck();
		r.setCreateDate(new Date());
		r.setModule("村措施");
		User user = (User) ActionContext.getContext().getSession().get(WebConstants.SESS_USER_OBJ);
		if(user instanceof Org){
			r.setOrg((Org) user);
		}
		r.setReason(updateReason);
		r.setRecordId(currId);
		r.setState("待审核");
		cunBFBiz.saveOrUpdateEntity(r);
		
		//修改状态
		cuoshi = cunBFBiz.getEntityById(CuoshiCun.class, currId);
		cuoshi.setStatus(WebConstants.SHENHE_STATUS_PROCECING);
		cunBFBiz.saveOrUpdateEntity(cuoshi);
		cuoshi=null;
		
		this.setMsg("提交修改申请成功");
		return cuoshiCunList();
	}

	public CunBFBiz getCunBFBiz() {
		return cunBFBiz;
	}
	public void setCunBFBiz(CunBFBiz cunBFBiz) {
		this.cunBFBiz = cunBFBiz;
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
	public CuoshiCun getCuoshi() {
		return cuoshi;
	}
	public void setCuoshi(CuoshiCun cuoshi) {
		this.cuoshi = cuoshi;
	}
	public ChengxiaoCun getChengxiao() {
		return chengxiao;
	}
	public void setChengxiao(ChengxiaoCun chengxiao) {
		this.chengxiao = chengxiao;
	}
	public PicCun getPic() {
		return pic;
	}
	public void setPic(PicCun pic) {
		this.pic = pic;
	}

	public Cun getCun() {
		return cun;
	}

	public void setCun(Cun cun) {
		this.cun = cun;
	}

	public String getUpdateReason() {
		return updateReason;
	}

	public void setUpdateReason(String updateReason) {
		this.updateReason = updateReason;
	}

	public Long getCurrId() {
		return currId;
	}

	public void setCurrId(Long currId) {
		this.currId = currId;
	}
	
	
	
	

}
