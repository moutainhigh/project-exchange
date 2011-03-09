package com.throne212.fupin.action;

import com.opensymphony.xwork2.ActionContext;
import com.throne212.fupin.biz.DiquBiz;
import com.throne212.fupin.common.PageBean;
import com.throne212.fupin.common.Util;
import com.throne212.fupin.domain.Area;
import com.throne212.fupin.domain.Cun;
import com.throne212.fupin.domain.Diqu;
import com.throne212.fupin.domain.Shi;
import com.throne212.fupin.domain.Zhen;

public class DiquAction extends BaseAction {

	private DiquBiz diquBiz;

	private PageBean pageBean;
	private Integer pageIndex;

	private String queryKey;
	private String type;

	// 查询
	public String diquList() {
		pageBean = diquBiz.getAllDiqu(type, queryKey, pageIndex);
		return "diqu_list";
	}

	// 保存
	private Diqu diqu;
	private Long shiId;
	private Long areaId;
	private Long zhenId;

	public String saveDiqu() {
		if (diqu == null) {
			this.setMsg("保存失败，请检查数据是否录入完整");
			return "diqu_edit";
		}
		if (diqu != null && !Util.isEmpty(diqu.getName())) {// 添加或更新
			if (diqu.getId() == null) {
				if (Shi.class.getSimpleName().equals(type)) {

				} else if (Area.class.getSimpleName().equals(type)) {
					Area a = new Area();
					a.setName(diqu.getName());
					a.setShi(diquBiz.getEntityById(Shi.class, shiId));
					diqu = a;
				} else if (Zhen.class.getSimpleName().equals(type)) {
					Zhen a = new Zhen();
					a.setName(diqu.getName());
					a.setArea(diquBiz.getEntityById(Area.class, areaId));
					diqu = a;
				} else if (Cun.class.getSimpleName().equals(type)) {
					Cun a = new Cun();
					a.setName(diqu.getName());
					a.setZhen(diquBiz.getEntityById(Zhen.class, zhenId));
					diqu = a;
				}
			}

			diqu = diquBiz.saveDiqu(diqu);
			this.setMsg("保存成功");
			this.setSucc("Y");
			diqu = null;
		} else if (diqu != null && diqu.getId() != null) {// 查看
			diqu = diquBiz.getEntityById(Diqu.class, diqu.getId());
		}
		return "diqu_edit";
	}
	
	// 删除
	public String deleteDiqu() {
		String[] ids = (String[]) ActionContext.getContext().getParameters().get("ids");
		if (ids != null && ids.length > 0) {
			for (String idStr : ids) {
				Long id = Long.parseLong(idStr);
				diquBiz.deleteEntity(Diqu.class, id);
			}
			this.setMsg("删除地区成功");
		}
		return diquList();
	}

	public DiquBiz getDiquBiz() {
		return diquBiz;
	}

	public void setDiquBiz(DiquBiz diquBiz) {
		this.diquBiz = diquBiz;
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

	public String getQueryKey() {
		return queryKey;
	}

	public void setQueryKey(String queryKey) {
		this.queryKey = queryKey;
	}

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}

	public Diqu getDiqu() {
		return diqu;
	}

	public void setDiqu(Diqu diqu) {
		this.diqu = diqu;
	}

	public Long getShiId() {
		return shiId;
	}

	public void setShiId(Long shiId) {
		this.shiId = shiId;
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
}
