package com.throne212.fupin.action;

import java.util.List;

import com.opensymphony.xwork2.ActionContext;
import com.throne212.fupin.biz.ZhenBFBiz;
import com.throne212.fupin.common.PageBean;
import com.throne212.fupin.common.Util;
import com.throne212.fupin.common.WebConstants;
import com.throne212.fupin.domain.Admin;
import com.throne212.fupin.domain.AreaWorkOrg;
import com.throne212.fupin.domain.ChengxiaoZhen;
import com.throne212.fupin.domain.CuoshiZhen;
import com.throne212.fupin.domain.PicZhen;
import com.throne212.fupin.domain.ShiWorkOrg;
import com.throne212.fupin.domain.User;
import com.throne212.fupin.domain.Zhen;

public class ZhenBFAction extends BaseAction {

	private ZhenBFBiz zhenBFBiz;

	private PageBean pageBean;
	private Integer pageIndex;

	private Long areaId;// 所属区县id

	public String zhenBFList() {
		pageBean = zhenBFBiz.getAllZhen(areaId, pageIndex);
		return "zhen_bf_list";
	}

	private Zhen zhen;

	public String viewZhenOrgMapping() {
		zhen = zhenBFBiz.getEntityById(Zhen.class, zhen.getId());
		return "zhen_org_mapping";
	}

	public String cancelZhenOrgMapping() {
		zhen = zhenBFBiz.getEntityById(Zhen.class, zhen.getId());
		zhen.setShiWorkOrg(null);
		zhen.setAreaWorkOrg(null);
		zhenBFBiz.saveOrUpdateEntity(zhen);
		this.setSucc("Y");
		this.setMsg("撤销指定成功");
		return zhenBFList();
	}

	private Long orgId;

	public String saveZhenOrgMapping() {
		Zhen zhenInDB = zhenBFBiz.getEntityById(Zhen.class, zhen.getId());
		User user = zhenBFBiz.getEntityById(User.class, orgId);
		if (user instanceof ShiWorkOrg) {
			zhenInDB.setShiWorkOrg((ShiWorkOrg) user);
			zhenInDB.setAreaWorkOrg(null);
			zhenBFBiz.saveOrUpdateEntity(zhenInDB);
		} else if (user instanceof AreaWorkOrg) {
			zhenInDB.setShiWorkOrg(null);
			zhenInDB.setAreaWorkOrg((AreaWorkOrg) user);
			zhenBFBiz.saveOrUpdateEntity(zhenInDB);
		}
		this.setSucc("Y");
		this.setMsg("指定成功");
		return "zhen_org_mapping";
	}

	// 镇帮扶措施
	private CuoshiZhen cuoshi;

	// 镇帮扶措施列表
	public String cuoshiZhenList() {
		User user = (User) ActionContext.getContext().getSession().get(WebConstants.SESS_USER_OBJ);
		Zhen zhen = null;
		if (user instanceof Admin) {
			pageBean = zhenBFBiz.getAllCuoshiZhen(cuoshi, pageIndex);
			return "cuoshizhen_list";
		} else if (user instanceof ShiWorkOrg) {
			ShiWorkOrg shiOrg = (ShiWorkOrg) user;
			List<Zhen> list = zhenBFBiz.getEntitiesByColumn(Zhen.class, "shiWorkOrg", shiOrg);
			if (list != null) {
				zhen = list.get(0);
			}
		} else if (user instanceof AreaWorkOrg) {
			AreaWorkOrg areOrg = (AreaWorkOrg) user;
			List<Zhen> list = zhenBFBiz.getEntitiesByColumn(Zhen.class, "areaWorkOrg", areOrg);
			if (list != null) {
				zhen = list.get(0);
			}
		}
		if (zhen == null) {
			this.setMsg("尚未指定帮扶镇，不能进行操作!");
			return "cuoshizhen_list";
		}
		pageBean = zhenBFBiz.getAllCuoshiZhenByZhenId(cuoshi, zhen.getId(), pageIndex);
		return "cuoshizhen_list";
	}
	
	public String editZhenCuoshi(){
		User user = (User) ActionContext.getContext().getSession().get(WebConstants.SESS_USER_OBJ);
		if (user instanceof Admin) {
			this.setMsg("超级管理员无权进行此操作！");
			return "cuoshizhen_edit";
		} else if (user instanceof ShiWorkOrg) {
			ShiWorkOrg shiOrg = (ShiWorkOrg) user;
			List<Zhen> list = zhenBFBiz.getEntitiesByColumn(Zhen.class, "shiWorkOrg", shiOrg);
			if (list != null) {
				zhen = list.get(0);
			}
		} else if (user instanceof AreaWorkOrg) {
			AreaWorkOrg areOrg = (AreaWorkOrg) user;
			List<Zhen> list = zhenBFBiz.getEntitiesByColumn(Zhen.class, "areaWorkOrg", areOrg);
			if (list != null) {
				zhen = list.get(0);
			}
		}
		if (zhen == null) {
			this.setMsg("尚未指定帮扶镇，不能进行操作!");
			return "cuoshizhen_edit";
		}
		return "cuoshizhen_edit";
	}

	// 增加或修改镇帮扶措施
	public String saveOrUpdateCuoshiZhen() {

		if (cuoshi == null) {
			this.setMsg("保存失败，请检查数据是否录入完整");
			return "cuoshizhen_edit";
		}
		if (cuoshi != null && !Util.isEmpty(cuoshi.getYear())) {// 添加或更新市扶贫账号信息
			if (cuoshi.getYear() == null) {
				this.setMsg("请选择帮扶年度！");
				return "cuoshizhen_edit";
			}
			User user = (User) ActionContext.getContext().getSession().get(WebConstants.SESS_USER_OBJ);
			Zhen zhen = null;
			if (user instanceof Admin) {
				this.setMsg("超级管理员无权进行此操作！");
				return "cuoshizhen_edit";
			} else if (user instanceof ShiWorkOrg) {
				ShiWorkOrg shiOrg = (ShiWorkOrg) user;
				List<Zhen> list = zhenBFBiz.getEntitiesByColumn(Zhen.class, "shiWorkOrg", shiOrg);
				if (list != null) {
					zhen = list.get(0);
				}
			} else if (user instanceof AreaWorkOrg) {
				AreaWorkOrg areOrg = (AreaWorkOrg) user;
				List<Zhen> list = zhenBFBiz.getEntitiesByColumn(Zhen.class, "areaWorkOrg", areOrg);
				if (list != null) {
					zhen = list.get(0);
				}
			}
			if (zhen == null) {
				this.setMsg("尚未指定帮扶镇，不能进行操作!");
				return "cuoshizhen_edit";
			}
			cuoshi.setZhen(zhen);
			if (!"".equals(cuoshi.getYear()) && "".equals(cuoshi.getSeason())) {
				cuoshi.setType(WebConstants.CUOSHI_TYPE_YEAR);
			}
			if (!"".equals(cuoshi.getYear()) && !"".equals(cuoshi.getSeason())) {
				cuoshi.setType(WebConstants.CUOSHI_TYPE_SEASON);
			}
			cuoshi.setStatus(WebConstants.SHENHE_STATUS_UNCOMMIT);
			cuoshi = zhenBFBiz.saveOrUpdateCuoshiZhen(cuoshi);
			this.setMsg("保存成功");
			this.setSucc("Y");
			cuoshi = null;
		} else if (cuoshi != null && cuoshi.getId() != null) {// 查看详情
			cuoshi = zhenBFBiz.getEntityById(CuoshiZhen.class, cuoshi.getId());
			editZhenCuoshi();
		}
		return "cuoshizhen_edit";

	}

	// 确定提交
	public String confirmCuoshi() {
		if (cuoshi.getId() != null) {
			cuoshi = zhenBFBiz.getEntityById(CuoshiZhen.class, cuoshi.getId());
			cuoshi.setStatus(WebConstants.SHENHE_STATUS_PROCECING);
			zhenBFBiz.saveOrUpdateEntity(cuoshi);
		}
		return cuoshiZhenList();

	}

	// 删除措施
	public String deleteCuoshiZhen() {
		String[] cuoshiZhenIds = (String[]) ActionContext.getContext().getParameters().get("cuoshiZhen_ids");
		if (cuoshiZhenIds != null && cuoshiZhenIds.length > 0) {
			for (String idStr : cuoshiZhenIds) {
				Long id = Long.parseLong(idStr);
				zhenBFBiz.deleteEntity(CuoshiZhen.class, id);
			}
			this.setMsg("删除市级账号成功");
		}
		return cuoshiZhenList();
	}

	private ChengxiaoZhen chengxiao;

	// 成效列表
	public String chengxiaoZhenList() {
		User user = (User) ActionContext.getContext().getSession().get(WebConstants.SESS_USER_OBJ);
		Zhen zhen = null;
		if (user instanceof Admin) {
			pageBean = zhenBFBiz.getAllChengxiaoZhen(chengxiao, pageIndex);
			return "chengxiaozhen_list";
		} else if (user instanceof ShiWorkOrg) {
			ShiWorkOrg shiOrg = (ShiWorkOrg) user;
			List<Zhen> list = zhenBFBiz.getEntitiesByColumn(Zhen.class, "shiWorkOrg", shiOrg);
			if (list != null) {
				zhen = list.get(0);
			}
		} else if (user instanceof AreaWorkOrg) {
			AreaWorkOrg areOrg = (AreaWorkOrg) user;
			List<Zhen> list = zhenBFBiz.getEntitiesByColumn(Zhen.class, "areaWorkOrg", areOrg);
			if (list != null) {
				zhen = list.get(0);
			}
		}
		if (zhen == null) {
			this.setMsg("尚未指定帮扶镇，不能进行操作!");
			return "chengxiaozhen_list";
		}
		pageBean = zhenBFBiz.getAllChengxiaoZhenByZhenId(chengxiao, zhen.getId(), pageIndex);
		return "chengxiaozhen_list";
	}

	// 增加或修改镇帮扶成效
	public String saveOrUpdateChengxiaoZhen() {

		if (chengxiao == null) {
			this.setMsg("保存失败，请检查数据是否录入完整");
			return "chengxiaozhen_edit";
		}
		if (chengxiao != null && !Util.isEmpty(chengxiao.getYear())) {// 添加或更新市扶贫账号信息
			if (chengxiao.getYear() == null) {
				this.setMsg("请选择帮扶年度！");
				return "chengxiaozhen_edit";
			}
			User user = (User) ActionContext.getContext().getSession().get(WebConstants.SESS_USER_OBJ);
			Zhen zhen = null;
			if (user instanceof Admin) {
				this.setMsg("超级管理员无权进行此操作！");
				return "cuoshizhen_edit";
			} else if (user instanceof ShiWorkOrg) {
				ShiWorkOrg shiOrg = (ShiWorkOrg) user;
				List<Zhen> list = zhenBFBiz.getEntitiesByColumn(Zhen.class, "shiWorkOrg", shiOrg);
				if (list != null) {
					zhen = list.get(0);
				}
			} else if (user instanceof AreaWorkOrg) {
				AreaWorkOrg areOrg = (AreaWorkOrg) user;
				List<Zhen> list = zhenBFBiz.getEntitiesByColumn(Zhen.class, "areaWorkOrg", areOrg);
				if (list != null) {
					zhen = list.get(0);
				}
			}
			if (zhen == null) {
				this.setMsg("尚未指定帮扶镇，不能进行操作!");
				return "chengxiaozhen_edit";
			}
			chengxiao.setZhen(zhen);
			chengxiao.setStatus(WebConstants.SHENHE_STATUS_UNCOMMIT);
			chengxiao = zhenBFBiz.saveOrUpdateChengxiaoZhen(chengxiao);
			this.setMsg("保存成功");
			this.setSucc("Y");
			chengxiao = null;
		} else if (chengxiao != null && chengxiao.getId() != null) {// 查看详情
			chengxiao = zhenBFBiz.getEntityById(ChengxiaoZhen.class, chengxiao.getId());
		}
		return "chengxiaozhen_edit";

	}

	// 确定提交
	public String confirmChengxiao() {
		if (chengxiao.getId() != null) {
			chengxiao = zhenBFBiz.getEntityById(ChengxiaoZhen.class, chengxiao.getId());
			chengxiao.setStatus(WebConstants.SHENHE_STATUS_PROCECING);
			zhenBFBiz.saveOrUpdateEntity(chengxiao);
		}
		return chengxiaoZhenList();
	}

	// 删除成效
	public String deleteChengxiaoZhen() {
		String[] chengxiaoZhenIds = (String[]) ActionContext.getContext().getParameters().get("chengxiaoZhen_ids");
		if (chengxiaoZhenIds != null && chengxiaoZhenIds.length > 0) {
			for (String idStr : chengxiaoZhenIds) {
				Long id = Long.parseLong(idStr);
				zhenBFBiz.deleteEntity(ChengxiaoZhen.class, id);
			}
			this.setMsg("删除市级账号成功");
		}
		return chengxiaoZhenList();
	}

	private PicZhen pic;

	// 帮扶图片信息列表
	public String picZhenList() {
		User user = (User) ActionContext.getContext().getSession().get(WebConstants.SESS_USER_OBJ);
		Zhen zhen = null;
		if (user instanceof Admin) {
			pageBean = zhenBFBiz.getAllPicZhen(pic, pageIndex);
			return "piczhen_list";
		} else if (user instanceof ShiWorkOrg) {
			ShiWorkOrg shiOrg = (ShiWorkOrg) user;
			List<Zhen> list = zhenBFBiz.getEntitiesByColumn(Zhen.class, "shiWorkOrg", shiOrg);
			if (list != null) {
				zhen = list.get(0);
			}
		} else if (user instanceof AreaWorkOrg) {
			AreaWorkOrg areOrg = (AreaWorkOrg) user;
			List<Zhen> list = zhenBFBiz.getEntitiesByColumn(Zhen.class, "areaWorkOrg", areOrg);
			if (list != null) {
				zhen = list.get(0);
			}
		}
		if (zhen == null) {
			this.setMsg("尚未指定帮扶镇，不能进行操作!");
			return "piczhen_list";
		}
		pageBean = zhenBFBiz.getAllPicZhenByZhenId(pic, zhen.getId(), pageIndex);

		return "pic_list";
	}

	public String saveOrUpdatePicZhen() {

		if (pic == null) {
			this.setMsg("保存失败，请检查数据是否录入完整");
			return "piczhen_edit";
		}
		if (pic != null && !Util.isEmpty(pic.getYear())) {// 添加或更新市扶贫账号信息
			if (pic.getYear() == null) {
				this.setMsg("请选择帮扶年度！");
				return "piczhen_edit";
			}
			User user = (User) ActionContext.getContext().getSession().get(WebConstants.SESS_USER_OBJ);
			Zhen zhen = null;
			if (user instanceof Admin) {
				this.setMsg("超级管理员无权进行此操作！");
				return "piczhen_edit";
			} else if (user instanceof ShiWorkOrg) {
				ShiWorkOrg shiOrg = (ShiWorkOrg) user;
				List<Zhen> list = zhenBFBiz.getEntitiesByColumn(Zhen.class, "shiWorkOrg", shiOrg);
				if (list != null) {
					zhen = list.get(0);
				}
			} else if (user instanceof AreaWorkOrg) {
				AreaWorkOrg areOrg = (AreaWorkOrg) user;
				List<Zhen> list = zhenBFBiz.getEntitiesByColumn(Zhen.class, "areaWorkOrg", areOrg);
				if (list != null) {
					zhen = list.get(0);
				}
			}
			if (zhen == null) {
				this.setMsg("尚未指定帮扶镇，不能进行操作!");
				return "piczhen_edit";
			}
			pic.setZhen(zhen);
			String image = (String) ActionContext.getContext().getSession().get(WebConstants.SESS_IMAGE);
			if (image != null) {
				pic.setPath(image);
				ActionContext.getContext().getSession().remove(WebConstants.SESS_IMAGE);
			}
			pic.setStatus(WebConstants.SHENHE_STATUS_UNCOMMIT);
			pic = zhenBFBiz.saveOrUpdatePicZhen(pic);
			this.setMsg("保存成功");
			this.setSucc("Y");
			pic = null;
		} else if (pic != null && pic.getId() != null) {// 查看详情
			pic = zhenBFBiz.getEntityById(PicZhen.class, pic.getId());
		}
		return "pic_edit";

	}

	// 确定提交
	public String confirmPic() {
		if (pic.getId() != null) {
			pic = zhenBFBiz.getEntityById(PicZhen.class, pic.getId());
			pic.setStatus(WebConstants.SHENHE_STATUS_PROCECING);
			zhenBFBiz.saveOrUpdateEntity(pic);
		}
		return picZhenList();
	}

	// 删除图片
	public String deletePicZhen() {
		String[] picZhenIds = (String[]) ActionContext.getContext().getParameters().get("picZhen_ids");
		if (picZhenIds != null && picZhenIds.length > 0) {
			for (String idStr : picZhenIds) {
				Long id = Long.parseLong(idStr);
				zhenBFBiz.deleteEntity(PicZhen.class, id);
			}
			this.setMsg("删除图片成功！");
		}
		return picZhenList();
	}

	public ZhenBFBiz getZhenBFBiz() {
		return zhenBFBiz;
	}

	public void setZhenBFBiz(ZhenBFBiz zhenBFBiz) {
		this.zhenBFBiz = zhenBFBiz;
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

	public Zhen getZhen() {
		return zhen;
	}

	public void setZhen(Zhen zhen) {
		this.zhen = zhen;
	}

	public Long getOrgId() {
		return orgId;
	}

	public void setOrgId(Long orgId) {
		this.orgId = orgId;
	}

	public CuoshiZhen getCuoshi() {
		return cuoshi;
	}

	public void setCuoshi(CuoshiZhen cuoshi) {
		this.cuoshi = cuoshi;
	}

	public ChengxiaoZhen getChengxiao() {
		return chengxiao;
	}

	public void setChengxiao(ChengxiaoZhen chengxiao) {
		this.chengxiao = chengxiao;
	}

	public PicZhen getPic() {
		return pic;
	}

	public void setPic(PicZhen pic) {
		this.pic = pic;
	}

}
