package com.throne212.fupin.action;

import com.opensymphony.xwork2.ActionContext;
import com.throne212.fupin.biz.AdminBiz;
import com.throne212.fupin.common.PageBean;
import com.throne212.fupin.common.Util;
import com.throne212.fupin.common.WebConstants;
import com.throne212.fupin.domain.Admin;
import com.throne212.fupin.domain.Area;
import com.throne212.fupin.domain.AreaWorkOrg;
import com.throne212.fupin.domain.MyEntity;
import com.throne212.fupin.domain.Shi;
import com.throne212.fupin.domain.ShiWorkOrg;
import com.throne212.fupin.domain.User;
import com.throne212.fupin.domain.Zhen;
import com.throne212.fupin.domain.ZhenWorkOrg;

public class AdminAction extends BaseAction {
	private AdminBiz adminBiz;
	// 市级账号列表
	private Integer pageIndex;
	private PageBean pageBean;

	public String shiWorkOrgList() {
		pageBean = adminBiz.getShiWorkOrgBean(pageIndex);
		return "shiWorkOrg_list";
	}

	// 添加或修改市级账号
	private ShiWorkOrg shiWorkOrg;

	public String saveOrUpdateShiWorkOrg() {

		if (shiWorkOrg == null) {
			this.setMsg("保存失败，请检查数据是否录入完整");
			return "shiWorkOrg_edit";
		}
		if (shiWorkOrg != null && !Util.isEmpty(shiWorkOrg.getLoginName())) {// 添加或更新市扶贫账号信息
			if (shiWorkOrg.getShi().getId() == null) {
				this.setMsg("请选择所属市！");
				return "shiWorkOrg_edit";
			}
			if (shiWorkOrg.getId() == null) {
				ShiWorkOrg shiOrg = adminBiz.getEntityByUnique(ShiWorkOrg.class, "loginName", shiWorkOrg.getLoginName());
				if (shiOrg != null) {
					this.setMsg("用户名已经被使用，请更名");
					return "shiWorkOrg_edit";
				}
			}

			Shi shi = adminBiz.getEntityById(Shi.class, shiWorkOrg.getShi().getId());
			shiWorkOrg.setShi(shi);
			shiWorkOrg = adminBiz.saveOrUpdateShiWorkOrg(shiWorkOrg);
			this.setMsg("保存成功");
			this.setSucc("Y");
			shiWorkOrg = null;
		} else if (shiWorkOrg != null && shiWorkOrg.getId() != null) {// 查看市扶贫账号详情
			shiWorkOrg = adminBiz.getEntityById(ShiWorkOrg.class, shiWorkOrg.getId());
		}
		return "shiWorkOrg_edit";

	}

	// 删除市级账号
	public String deleteShiWorkOrg() {
		String[] shiWrokOrgIds = (String[]) ActionContext.getContext().getParameters().get("shiWorkOrg_ids");
		if (shiWrokOrgIds != null && shiWrokOrgIds.length > 0) {
			for (String idStr : shiWrokOrgIds) {
				Long id = Long.parseLong(idStr);
				adminBiz.deleteEntity(ShiWorkOrg.class, id);
			}
			this.setMsg("删除市级账号成功");
		}
		return shiWorkOrgList();
	}

	private AreaWorkOrg areaWorkOrg;

	// 区县级账号列表
	public String areaWorkOrgList() {
		User user = (User) ActionContext.getContext().getSession().get(WebConstants.SESS_USER_OBJ);
		if (user instanceof Admin) {
			pageBean = adminBiz.getAreaWorkOrgBean(pageIndex);
			return "areaWorkOrg_list";
		} else if (user instanceof ShiWorkOrg) {
			pageBean = adminBiz.getAreaWorkOrgBean(pageIndex, user.getId());
		}
		return "areaWorkOrg_list";
	}

	// 区县级账号管理
	public String saveOrUpdateAreaWorkOrg() {

		if (areaWorkOrg == null) {
			this.setMsg("保存失败，请检查数据是否录入完整");
			return "areaWorkOrg_edit";
		}
		if (areaWorkOrg != null && !Util.isEmpty(areaWorkOrg.getLoginName())) {// 添加或更新
			if (areaWorkOrg.getArea().getId() == null) {
				this.setMsg("请选择所属区县！");
				return "areaWorkOrg_edit";
			}
			if (areaWorkOrg.getId() == null) {
				AreaWorkOrg areaOrg = adminBiz.getEntityByUnique(AreaWorkOrg.class, "loginName", areaWorkOrg.getLoginName());
				if (areaOrg != null) {
					this.setMsg("用户名已经被使用，请更名");
					return "areaWorkOrg_edit";
				}
			}

			Area area = adminBiz.getEntityById(Area.class, areaWorkOrg.getArea().getId());
			ShiWorkOrg shiWorkOrg = adminBiz.getEntityById(ShiWorkOrg.class, areaWorkOrg.getShiWorkOrg().getId());
			areaWorkOrg.setShiWorkOrg(shiWorkOrg);
			areaWorkOrg.setArea(area);
			areaWorkOrg = adminBiz.saveOrUpdateAreaWorkOrg(areaWorkOrg);
			this.setMsg("保存成功");
			this.setSucc("Y");
			areaWorkOrg = null;
		} else if (areaWorkOrg != null && areaWorkOrg.getId() != null) {// 查看详情
			areaWorkOrg = adminBiz.getEntityById(AreaWorkOrg.class, areaWorkOrg.getId());
			return "areaWorkOrg_edit";
		}
		return "areaWorkOrg_edit";

	}

	// 删除区县级账号
	public String deleteAreaWorkOrg() {
		String[] areaWrokOrgIds = (String[]) ActionContext.getContext().getParameters().get("areaWorkOrg_ids");
		if (areaWrokOrgIds != null && areaWrokOrgIds.length > 0) {
			for (String idStr : areaWrokOrgIds) {
				Long id = Long.parseLong(idStr);
				adminBiz.deleteEntity(AreaWorkOrg.class, id);
			}
			this.setMsg("删除区县级账号成功");
		}
		return areaWorkOrgList();
	}

	// 镇级账号管理
	private ZhenWorkOrg zhenWorkOrg;

	// 镇级账号列表
	public String zhenWorkOrgList() {
		User user = (User) ActionContext.getContext().getSession().get(WebConstants.SESS_USER_OBJ);
		if (user instanceof Admin) {
			pageBean = adminBiz.getZhenWorkOrgBean(pageIndex);
			return "zhenWorkOrg_list";
		} else if (user instanceof AreaWorkOrg) {
			pageBean = adminBiz.getZhenWorkOrgBean(pageIndex, user.getId());
		}
		return "zhenWorkOrg_list";
	}

	// 保存或修改镇级账号
	public String saveOrUpdateZhenWorkOrg() {

		if (zhenWorkOrg == null) {
			this.setMsg("保存失败，请检查数据是否录入完整");
			return "zhenWorkOrg_edit";
		}
		if (zhenWorkOrg != null && !Util.isEmpty(zhenWorkOrg.getLoginName())) {// 添加或更新
			if (zhenWorkOrg.getZhen().getId() == null) {
				this.setMsg("请选择所属镇！");
				return "zhenWorkOrg_edit";
			}
			if (zhenWorkOrg.getId() == null) {
				ZhenWorkOrg zhenOrg = adminBiz.getEntityByUnique(ZhenWorkOrg.class, "loginName", zhenWorkOrg.getLoginName());
				if (zhenOrg != null) {
					this.setMsg("用户名已经被使用，请更名");
					return "zhenWorkOrg_edit";
				}
			}
			Zhen zhen = adminBiz.getEntityById(Zhen.class, zhenWorkOrg.getZhen().getId());
			AreaWorkOrg areaOrg = adminBiz.getEntityById(AreaWorkOrg.class, zhenWorkOrg.getAreaWorkOrg().getId());
			zhenWorkOrg.setAreaWorkOrg(areaOrg);
			zhenWorkOrg.setZhen(zhen);
			zhenWorkOrg = adminBiz.saveOrUpdateZhenWorkOrg(zhenWorkOrg);
			this.setMsg("保存成功");
			this.setSucc("Y");
			zhenWorkOrg = null;
		} else if (zhenWorkOrg != null && zhenWorkOrg.getId() != null) {// 查看详情
			zhenWorkOrg = adminBiz.getEntityById(ZhenWorkOrg.class, zhenWorkOrg.getId());
			return "zhenWorkOrg_edit";
		}
		return "zhenWorkOrg_edit";

	}

	// 删除镇级账号
	public String deleteZhenWorkOrg() {
		String[] zhenWrokOrgIds = (String[]) ActionContext.getContext().getParameters().get("zhenWorkOrg_ids");
		if (zhenWrokOrgIds != null && zhenWrokOrgIds.length > 0) {
			for (String idStr : zhenWrokOrgIds) {
				Long id = Long.parseLong(idStr);
				adminBiz.deleteEntity(ZhenWorkOrg.class, id);
			}
			this.setMsg("删除镇级账号成功");
		}
		return zhenWorkOrgList();
	}

	public AdminBiz getAdminBiz() {
		return adminBiz;
	}

	public void setAdminBiz(AdminBiz adminBiz) {
		this.adminBiz = adminBiz;
	}

	public Integer getPageIndex() {
		return pageIndex;
	}

	public void setPageIndex(Integer pageIndex) {
		this.pageIndex = pageIndex;
	}

	public ShiWorkOrg getShiWorkOrg() {
		return shiWorkOrg;
	}

	public void setShiWorkOrg(ShiWorkOrg shiWorkOrg) {
		this.shiWorkOrg = shiWorkOrg;
	}

	public PageBean getPageBean() {
		return pageBean;
	}

	public void setPageBean(PageBean pageBean) {
		this.pageBean = pageBean;
	}

	public AreaWorkOrg getAreaWorkOrg() {
		return areaWorkOrg;
	}

	public void setAreaWorkOrg(AreaWorkOrg areaWorkOrg) {
		this.areaWorkOrg = areaWorkOrg;
	}

	public ZhenWorkOrg getZhenWorkOrg() {
		return zhenWorkOrg;
	}

	public void setZhenWorkOrg(ZhenWorkOrg zhenWorkOrg) {
		this.zhenWorkOrg = zhenWorkOrg;
	}

}
