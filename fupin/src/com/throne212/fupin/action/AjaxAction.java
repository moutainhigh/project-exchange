package com.throne212.fupin.action;

import java.util.List;

import com.throne212.fupin.biz.AdminBiz;
import com.throne212.fupin.biz.BaseBiz;
import com.throne212.fupin.domain.Area;
import com.throne212.fupin.domain.AreaWorkOrg;
import com.throne212.fupin.domain.Shi;
import com.throne212.fupin.domain.ShiWorkOrg;
import com.throne212.fupin.domain.Zhen;

public class AjaxAction extends BaseAction {

	private AdminBiz adminBiz;
	private BaseBiz baseBiz;
	public String test() {
		return "msg";
	}

	private List list;

	// 获取所有市
	public String getAllShi() {
		list = adminBiz.getAll(Shi.class, "id", "asc");
		return "shi_list";
	}
	private Long parentId;
	public String getAllArea() {
		list = adminBiz.getEntitiesByColumn(Area.class, "shi", adminBiz.getEntityById(Shi.class, parentId));
		return "list";
	}
	public String getAllZhen() {
		list = adminBiz.getEntitiesByColumn(Zhen.class, "area", adminBiz.getEntityById(Area.class, parentId));
		return "list";
	}

	
	//根据市扶贫单位查找区县
	private Long shiWorkOrgId;
	public String getAreaByShiWorkOrg(){
		ShiWorkOrg shiWorkOrg=baseBiz.getEntityById(ShiWorkOrg.class, shiWorkOrgId);
		Shi shi=shiWorkOrg.getShi();
		list=baseBiz.getEntitiesByColumn(Area.class, "shi", shi);
	return	"shi_areas";
		
	}
	//获取所有市扶贫单位
	public String getAllShiWorkOrg(){
		
		list=baseBiz.getAll(ShiWorkOrg.class, "id", "asc");
		
		return "shiworkorg_list";
		
	}
	//根据区扶贫办获取镇
	private Long areaWorkOrgId;
	public String getZhenByAreaWorkOrg(){
		AreaWorkOrg areaWorkOrg=baseBiz.getEntityById(AreaWorkOrg.class, areaWorkOrgId);
		Area area=areaWorkOrg.getArea();
		list=baseBiz.getEntitiesByColumn(Zhen.class, "area", area);
		return "area_zhens";
	}
	
	//根据市扶贫办获取区扶贫办
	public String getAreaWorkOrgByShiOrg(){
		
		ShiWorkOrg shiOrg=baseBiz.getEntityById(ShiWorkOrg.class, shiWorkOrgId);
		list=baseBiz.getEntitiesByColumn(AreaWorkOrg.class, "shiWorkOrg", shiOrg);
		System.out.print("_+_+_+_+_+_+"+list);
		return "shiorg_areaorgs";
	}
	public AdminBiz getAdminBiz() {
		return adminBiz;
	}

	public void setAdminBiz(AdminBiz adminBiz) {
		this.adminBiz = adminBiz;
	}

	public List getList() {
		return list;
	}

	public void setList(List list) {
		this.list = list;
	}
	public Long getParentId() {
		return parentId;
	}
	public void setParentId(Long parentId) {
		this.parentId = parentId;
	}
	public BaseBiz getBaseBiz() {
		return baseBiz;
	}
	public void setBaseBiz(BaseBiz baseBiz) {
		this.baseBiz = baseBiz;
	}
	public Long getShiWorkOrgId() {
		return shiWorkOrgId;
	}
	public void setShiWorkOrgId(Long shiWorkOrgId) {
		this.shiWorkOrgId = shiWorkOrgId;
	}
	public Long getAreaWorkOrgId() {
		return areaWorkOrgId;
	}
	public void setAreaWorkOrgId(Long areaWorkOrgId) {
		this.areaWorkOrgId = areaWorkOrgId;
	}

}
