package com.throne212.fupin.action;

import java.util.List;

import com.opensymphony.xwork2.ActionContext;
import com.throne212.fupin.biz.AdminBiz;
import com.throne212.fupin.biz.BaseBiz;
import com.throne212.fupin.common.WebConstants;
import com.throne212.fupin.domain.Area;
import com.throne212.fupin.domain.AreaWorkOrg;
import com.throne212.fupin.domain.Cun;
import com.throne212.fupin.domain.Family;
import com.throne212.fupin.domain.Leader;
import com.throne212.fupin.domain.Org;
import com.throne212.fupin.domain.Shi;
import com.throne212.fupin.domain.ShiWorkOrg;
import com.throne212.fupin.domain.User;
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
		if(parentId!=null)
			list = adminBiz.getEntitiesByColumn(Area.class, "shi", adminBiz.getEntityById(Shi.class, parentId));
		else
			list = adminBiz.getAll(Area.class);
		return "list";
	}
	public String getAllZhen() {
		if(parentId!=null)
			list = adminBiz.getEntitiesByColumn(Zhen.class, "area", adminBiz.getEntityById(Area.class, parentId));
		else
			list = adminBiz.getAll(Zhen.class);
		return "list";
	}
	public String getAllCun() {
		if(parentId!=null)
			list = adminBiz.getEntitiesByColumn(Cun.class, "zhen", adminBiz.getEntityById(Zhen.class, parentId));
		else
			list = adminBiz.getAll(Cun.class);
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
	//根据单位对应的村查找所有贫困户
	public String getAllFamilyByCun(){
		User user =(User)ActionContext.getContext().getSession().get(WebConstants.SESS_USER_OBJ);
		Org org =(Org)user;
		list=baseBiz.getEntitiesByColumn(Family.class, "cun", org.getCun());
		return "cun_family";
	}
	
	//根据单位查找所有干部
	public String getAllLeaderByOrg(){
		User user =(User)ActionContext.getContext().getSession().get(WebConstants.SESS_USER_OBJ);
		Org org =(Org)user;
		list=baseBiz.getEntitiesByColumn(Leader.class, "org", org);
		return "org_leader";
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
