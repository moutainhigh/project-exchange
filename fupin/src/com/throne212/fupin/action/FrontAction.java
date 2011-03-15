package com.throne212.fupin.action;

import java.util.List;

import com.throne212.fupin.biz.BaseBiz;
import com.throne212.fupin.biz.CunBFBiz;
import com.throne212.fupin.biz.FrontBiz;
import com.throne212.fupin.common.PageBean;
import com.throne212.fupin.common.WebConstants;
import com.throne212.fupin.domain.Area;
import com.throne212.fupin.domain.ChengxiaoCun;
import com.throne212.fupin.domain.Cun;
import com.throne212.fupin.domain.CuoshiCun;
import com.throne212.fupin.domain.Pic;
import com.throne212.fupin.domain.Shi;
import com.throne212.fupin.domain.Zhen;

public class FrontAction extends BaseAction {
	private Cun cun;
	private BaseBiz baseBiz;
	private FrontBiz frontBiz;
	private PageBean pageBean;
	private Integer pageIndex;
	private List<Pic> picList;
	private CuoshiCun cuoshiCun;
	private ChengxiaoCun chengxiaoCun;
	private Shi shi;
	private Area area;
	private Zhen zhen;
	private List<Area> areaList;
	
	public String showTreeAndShiInfo(){
		/*List<Shi> shiInDBList=baseBiz.getAll(Shi.class);
		if (shiInDBList!=null&&shiInDBList.size()>0) {
			shi=shiInDBList.get(0);
		}
		areaList=baseBiz.getEntitiesByColumn(Area.class, "shi", shi);*/
		areaList=baseBiz.getAll(Area.class);
		for(Area area : areaList){
			area.setZhenList(baseBiz.getEntitiesByColumn(Zhen.class, "area", area));
			for(Zhen z : area.getZhenList()){
				z.setCunList(baseBiz.getEntitiesByColumn(Cun.class, "zhen", z));
			}
		}
		return "tree_shi_info";
	}
	
	
	//根据cunId获取cun的信息
	public String showCunInfo(){
		cun=baseBiz.getEntityById(Cun.class, cun.getId());
		picList=baseBiz.getEntitiesByTwoColumn(Pic.class, "cun", cun, "status", WebConstants.SHENHE_STATUS_PASS);
		return "cun_info";
		
	}
	//获取单位信息
	public String showOrgInfo(){
		cun=baseBiz.getEntityById(Cun.class, cun.getId());
		return "cun_org";
	}
	//获取措施规划信息
	public String showCuoshiInfo(){
		cun=baseBiz.getEntityById(Cun.class, cun.getId());
		List<CuoshiCun> cuoshiList=baseBiz.getEntitiesByTwoColumn(CuoshiCun.class, "cun", cun,"status", WebConstants.SHENHE_STATUS_PASS);
		if (cuoshiList!=null&&cuoshiList.size()>0) {
			cuoshiCun=cuoshiList.get(0);
		}
		return "cun_cuoshi";
	}
	//获取成效信息
	public String showChengxiaoInfo(){
		cun=baseBiz.getEntityById(Cun.class, cun.getId());
		List<ChengxiaoCun> chengxiaoList=baseBiz.getEntitiesByTwoColumn(ChengxiaoCun.class, "cun", cun,"status", WebConstants.SHENHE_STATUS_PASS);
		if (chengxiaoList!=null&&chengxiaoList.size()>0) {
			chengxiaoCun=chengxiaoList.get(0);
		}
		return "cun_chengxiao";
	}
	//获取贫困户信息
	public String showFamilyInfo(){
		cun=baseBiz.getEntityById(Cun.class, cun.getId());
		pageBean=frontBiz.getAllFamilyByCunId(cun.getId(), pageIndex);
		return "cun_family";
	}
	//市贫困村列表
	public String poorCunListUnderShi(){
		if (shi!=null&&shi.getId()!=null) {
			shi=frontBiz.getEntityById(Shi.class, shi.getId());
		  pageBean = frontBiz.getAllCunUnderShi(shi.getId(), pageIndex);
		}
		return "poorcun_shi_list";
	}
	//区贫困村列表
	public String poorCunListUnderArea(){
		
		if (area!=null&&area.getId()!=null) {
			area=frontBiz.getEntityById(Area.class, area.getId());
			pageBean=frontBiz.getAllCunUnderArea(area.getId(), pageIndex);
		}
		return "poorcun_area_list";
	}
	//镇贫困村列表
	public String poorCunListUnderZhen(){
		if (zhen!=null&&zhen.getId()!=null) {
			zhen=frontBiz.getEntityById(Zhen.class, zhen.getId());
			pageBean=frontBiz.getAllCunUnderZhen(zhen.getId(), pageIndex);
		}
		return "poorcun_zhen_list";
		
	}
	
	//单位查询
	private String keyOrgName;
	public String searchOrg(){
		List<Cun> list =frontBiz.getAllLike(Cun.class, "cun.org.orgName", keyOrgName);
		if (list!=null&&list.size()>0) {
			cun=list.get(0);
		}
		return "cun_info";
		
	}
	
	
	
	public Cun getCun() {
		return cun;
	}


	public void setCun(Cun cun) {
		this.cun = cun;
	}





	public BaseBiz getBaseBiz() {
		return baseBiz;
	}


	public void setBaseBiz(BaseBiz baseBiz) {
		this.baseBiz = baseBiz;
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


	public List<Pic> getPicList() {
		return picList;
	}


	public void setPicList(List<Pic> picList) {
		this.picList = picList;
	}


	public CuoshiCun getCuoshiCun() {
		return cuoshiCun;
	}


	public void setCuoshiCun(CuoshiCun cuoshiCun) {
		this.cuoshiCun = cuoshiCun;
	}


	public ChengxiaoCun getChengxiaoCun() {
		return chengxiaoCun;
	}


	public void setChengxiaoCun(ChengxiaoCun chengxiaoCun) {
		this.chengxiaoCun = chengxiaoCun;
	}


	public FrontBiz getFrontBiz() {
		return frontBiz;
	}


	public void setFrontBiz(FrontBiz frontBiz) {
		this.frontBiz = frontBiz;
	}
	public Shi getShi() {
		return shi;
	}
	public void setShi(Shi shi) {
		this.shi = shi;
	}
	public Area getArea() {
		return area;
	}
	public void setArea(Area area) {
		this.area = area;
	}
	public Zhen getZhen() {
		return zhen;
	}
	public void setZhen(Zhen zhen) {
		this.zhen = zhen;
	}
	public String getKeyOrgName() {
		return keyOrgName;
	}
	public void setKeyOrgName(String keyOrgName) {
		this.keyOrgName = keyOrgName;
	}


	public List<Area> getAreaList() {
		return areaList;
	}


	public void setAreaList(List<Area> areaList) {
		this.areaList = areaList;
	}
	
	
	
}
