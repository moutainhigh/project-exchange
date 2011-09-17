package com.throne212.fupin.action;

import java.util.List;

import com.opensymphony.xwork2.ActionContext;
import com.throne212.fupin.biz.BaseBiz;
import com.throne212.fupin.biz.FrontBiz;
import com.throne212.fupin.common.PageBean;
import com.throne212.fupin.common.Util;
import com.throne212.fupin.common.WebConstants;
import com.throne212.fupin.domain.Area;
import com.throne212.fupin.domain.ChengxiaoCun;
import com.throne212.fupin.domain.ChengxiaoFamily;
import com.throne212.fupin.domain.Cun;
import com.throne212.fupin.domain.CuoshiCun;
import com.throne212.fupin.domain.CuoshiFamily;
import com.throne212.fupin.domain.Family;
import com.throne212.fupin.domain.Org;
import com.throne212.fupin.domain.Permission;
import com.throne212.fupin.domain.PicCun;
import com.throne212.fupin.domain.Reason;
import com.throne212.fupin.domain.Shi;
import com.throne212.fupin.domain.Zhen;

public class FrontAction extends BaseAction {
	private Cun cun;
	private BaseBiz baseBiz;
	private FrontBiz frontBiz;
	private PageBean pageBean;
	private Integer pageIndex;
	private List<PicCun> picList;
	private CuoshiCun cuoshiCun;
	private ChengxiaoCun chengxiaoCun;
	private ChengxiaoFamily chengxiaoFamily;
	private CuoshiFamily cuoshiFamily;
	private Reason reason;
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
		areaList=frontBiz.getAreaWithPoor();
		for(Area area : areaList){
			area.setZhenList(frontBiz.getZhenWithPoor(area));
			for(Zhen z : area.getZhenList()){
				z.setCunList(frontBiz.getCunWithPoor(z));
			}
		}
		return "tree_shi_info";
	}
	
	
	//根据cunId获取cun的信息
	public String showCunInfo(){
		cun=baseBiz.getEntityById(Cun.class, cun.getId());
		picList=baseBiz.getEntitiesByTwoColumn(PicCun.class, "cun", cun, "status", WebConstants.SHENHE_STATUS_PASS);
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
	
	//市的统计
	private Long shiId;
	public String shiStat(){
		shi = baseBiz.getEntityById(Shi.class, shiId);
		return "shi_stat";
	}
	public String shiCunList(){
		shi = baseBiz.getEntityById(Shi.class, shiId);
		//cunList = baseBiz.getEntitiesByColumn(Cun.class, "zhen.area.shi", shi);
		cunList = frontBiz.getCunWithPoor();
		return "shi_cun_list";
	}
	
	//区县的统计
	private Long areaId;
	public String areaStat(){
		area = baseBiz.getEntityById(Area.class, areaId);
		
		return "area_stat";
	}
	
	private List<Cun> cunList;
	public String areaCunList(){
		area = baseBiz.getEntityById(Area.class, areaId);
		cunList = baseBiz.getEntitiesByColumn(Cun.class, "zhen.area", area);
		return "area_cun_list";
	}
	
	//镇的统计
	private Long zhenId;
	public String zhenStat(){
		zhen = baseBiz.getEntityById(Zhen.class, zhenId);
		return "zhen_stat";
	}
	
	public String zhenCunList(){
		zhen = baseBiz.getEntityById(Zhen.class, zhenId);
		cunList = baseBiz.getEntitiesByColumn(Cun.class, "zhen", zhen);
		return "zhen_cun_list";
	}
	
	private Permission per;
	public String login(){
		if(per==null || Util.isEmpty(per.getLoginName())){
			this.setMsg("登录名不能为空");
			return "login";
		}
		Permission perInDB = baseBiz.getEntityByUnique(Permission.class, "loginName", per.getLoginName());
		if(perInDB==null){
			this.setMsg("登录名不存在");
			return "login";
		}
		if(perInDB.getPassword()!=null && !perInDB.getPassword().equals(per.getPassword())){
			this.setMsg("密码错误");
			return "login";
		}
		ActionContext.getContext().getSession().put(WebConstants.SESS_USER_PERMISSION,perInDB);
		return viewFamily();
	}
	private Family family;
	public String viewFamily(){
		Object obj = ActionContext.getContext().getSession().get(WebConstants.SESS_USER_PERMISSION);
		if(obj == null){
			return "login"; 
		}
		family = baseBiz.getEntityById(Family.class, family.getId());
		return "view_family";
	}

	public String  showFamilyChengxiao() {
		Object obj = ActionContext.getContext().getSession().get(WebConstants.SESS_USER_PERMISSION);
		if(obj == null){
			return "login"; 
		}
		family = baseBiz.getEntityById(Family.class, family.getId());
		List<ChengxiaoFamily> chengxiaoList=baseBiz.getEntitiesByTwoColumn(ChengxiaoFamily.class, "family", family,"status", WebConstants.SHENHE_STATUS_PASS);
		if (chengxiaoList!=null&&chengxiaoList.size()>0) {
			chengxiaoFamily=chengxiaoList.get(0);
		}
		return "view_family_chengxiao";
	}
	public String  showFamilyCuoshi() {
		Object obj = ActionContext.getContext().getSession().get(WebConstants.SESS_USER_PERMISSION);
		if(obj == null){
			return "login"; 
		}
		family = baseBiz.getEntityById(Family.class, family.getId());
		List<CuoshiFamily> cuoshiList=baseBiz.getEntitiesByTwoColumn(CuoshiFamily.class, "family", family,"status", WebConstants.SHENHE_STATUS_PASS);
		if (cuoshiList!=null&&cuoshiList.size()>0) {
			cuoshiFamily=cuoshiList.get(0);
		}
		return "view_family_cuoshi";
	}
	public String  showFamilyReason() {
		Object obj = ActionContext.getContext().getSession().get(WebConstants.SESS_USER_PERMISSION);
		if(obj == null){
			return "login"; 
		}
		family = baseBiz.getEntityById(Family.class, family.getId());
		List<Reason> reasonList=baseBiz.getEntitiesByTwoColumn(Reason.class, "family", family,"status", WebConstants.SHENHE_STATUS_PASS);
		if (reasonList!=null&&reasonList.size()>0) {
			reason=reasonList.get(0);
		}
		return "view_family_reason";
	}
	public String  showFamilyContent() {
		Object obj = ActionContext.getContext().getSession().get(WebConstants.SESS_USER_PERMISSION);
		if(obj == null){
			return "login"; 
		}
		family = baseBiz.getEntityById(Family.class, family.getId());
		pageBean=frontBiz.getAllRecordByFamilyId(family.getId(), pageIndex);
		return "family_record";
		
	}
	
	
	//查询
	private String pinyin;
	public String queryCunByPinyin(){
		if(cunId!=null){
			cun = new Cun();
			cun.setId(cunId);
			return showCunInfo();
		}
			
		if(!Util.isEmpty(pinyin)){
			List list = frontBiz.getAllLike(Cun.class, "pinyin", pinyin);
			if(list==null || list.size()==0){
				this.setMsg("没有找到相关记录");
				return "query";
			}else{
				cun = (Cun) list.get(0);
				return showCunInfo();
			}
		}
		return "query";
	}
	private Long orgId;
	public String queryCunByOrgPinyin(){
		if(orgId!=null){
			Org org = frontBiz.getEntityById(Org.class, orgId);
			if(org.getCun() == null){
				this.setMsg("该单位没有对应的帮扶村");
				return "query";
			}
			cun = org.getCun();
			return showCunInfo();
		}
		
		if(!Util.isEmpty(pinyin)){
			List list = frontBiz.getAllLike(Org.class, "pinyin", pinyin);
			if(list==null || list.size()==0){
				this.setMsg("没有找到相关记录");
				return "query";
			}else{
				Org org = (Org) list.get(0);
				if(org.getCun() == null){
					this.setMsg("该单位没有对应的帮扶村");
					return "query";
				}
				cun = org.getCun();
				return showCunInfo();
			}
		}
		return "query";
	}
	private Long cunId;
	public String queryDiqu(){
		if(cunId!=null){
			cun = new Cun();
			cun.setId(cunId);
			return showCunInfo();
		}else if(zhenId!=null){
			return zhenStat();
		}else if(areaId!=null){
			return areaStat();
		}
		return shiStat();
	}
	
	public List<Cun> getCunList() {
		return cunList;
	}


	public void setCunList(List<Cun> cunList) {
		this.cunList = cunList;
	}


	public Cun getCun() {
		return cun;
	}


	public void setCun(Cun cun) {
		this.cun = cun;
	}

	public Long getAreaId() {
		return areaId;
	}


	public void setAreaId(Long areaId) {
		this.areaId = areaId;
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


	public List<PicCun> getPicList() {
		return picList;
	}


	public void setPicList(List<PicCun> picList) {
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


	public Long getZhenId() {
		return zhenId;
	}


	public void setZhenId(Long zhenId) {
		this.zhenId = zhenId;
	}


	public Permission getPer() {
		return per;
	}


	public void setPer(Permission per) {
		this.per = per;
	}


	public Family getFamily() {
		return family;
	}


	public void setFamily(Family family) {
		this.family = family;
	}


	public Long getShiId() {
		return shiId;
	}


	public void setShiId(Long shiId) {
		this.shiId = shiId;
	}


	public String getPinyin() {
		return pinyin;
	}


	public void setPinyin(String pinyin) {
		this.pinyin = pinyin;
	}


	public Long getCunId() {
		return cunId;
	}


	public void setCunId(Long cunId) {
		this.cunId = cunId;
	}


	public Long getOrgId() {
		return orgId;
	}


	public void setOrgId(Long orgId) {
		this.orgId = orgId;
	}


	public ChengxiaoFamily getChengxiaoFamily() {
		return chengxiaoFamily;
	}


	public void setChengxiaoFamily(ChengxiaoFamily chengxiaoFamily) {
		this.chengxiaoFamily = chengxiaoFamily;
	}


	public CuoshiFamily getCuoshiFamily() {
		return cuoshiFamily;
	}


	public void setCuoshiFamily(CuoshiFamily cuoshiFamily) {
		this.cuoshiFamily = cuoshiFamily;
	}


	public Reason getReason() {
		return reason;
	}


	public void setReason(Reason reason) {
		this.reason = reason;
	}
	
	
	
}
