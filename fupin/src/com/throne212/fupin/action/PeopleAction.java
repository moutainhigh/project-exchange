package com.throne212.fupin.action;

import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.List;
import java.util.Map;

import com.opensymphony.xwork2.ActionContext;
import com.throne212.fupin.biz.PeopleBiz;
import com.throne212.fupin.common.PageBean;
import com.throne212.fupin.common.WebConstants;
import com.throne212.fupin.domain.Org;
import com.throne212.fupin.domain.People;
import com.throne212.fupin.domain.PeopleSetting;
import com.throne212.fupin.domain.User;


//民意调查的action
public class PeopleAction extends BaseAction {
	
	private PeopleBiz peopleBiz;

	public void setPeopleBiz(PeopleBiz peopleBiz) {
		this.peopleBiz = peopleBiz;
	} 
	
	private Long areaId;
	private Long zhenId;
	private Long cunId;
	public String summary(){
		fillSettingList();
		if(year == null)
			year = 2011;
		pageBean = peopleBiz.summary(year, areaId, zhenId, cunId, pageIndex);
		return "people_summary";
	}
	
	private List<PeopleSetting> settingList;
	public String peopleSetting(){
		Map<String, Object> params = ActionContext.getContext().getParameters();
		for(String param : params.keySet()){
			if(param.contains("mount_")){
				String[] val = (String[]) params.get(param);
				if(val != null && val.length == 1){
					int mount = Integer.parseInt(val[0]);
					int year = Integer.parseInt(param.split("_")[1]);
					PeopleSetting ps = peopleBiz.getSettingByYear(year);
					if(ps != null){
						ps.setMount(mount);
					}else{
						ps = new PeopleSetting();
						ps.setYear(year);
						ps.setMount(mount);
					}
					peopleBiz.saveOrUpdateEntity(ps);
					this.setMsg("保存成功");
				}
			}
		}
		fillSettingList();
		return "people_setting";
	}
	
	private void fillSettingList(){
		settingList = new ArrayList<PeopleSetting>();
		int currYear = Calendar.getInstance().get(Calendar.YEAR);
		for(int i=2011;i<currYear;i++){
			PeopleSetting ps = peopleBiz.getSettingByYear(i);
			if(ps == null){
				ps = new PeopleSetting();
				ps.setYear(i);
			}
			settingList.add(ps);
			if(year != null && year.equals(ps.getYear())){
				ActionContext.getContext().put("ps", ps);
			}
		}
	}
	
	private PageBean pageBean;
	private Integer pageIndex;
	private Integer year;
	public String peopleList(){
		if(year == null)
			year = 2011;
		pageBean = peopleBiz.getPeoples(year, pageIndex);
		fillSettingList();
		return "people_list";
	}
	
	private People p;
	public String viewPeople(){
		if(p != null && p.getId() != null){
			p = peopleBiz.getEntityById(People.class, p.getId());
		}
		fillSettingList();
		return "people_edit";
	}
	public String savePeople(){
		fillSettingList();
		if(p!=null && p.getTargetType() == null){
			this.setMsg("被调查人的类别必选");
			return "people_edit";
		}
		if(p!=null && (p.getItem1() == 0 || p.getItem2() == 0 || p.getItem3() == 0 || p.getItem4() == 0)){
			this.setMsg("请勾选所有调查满意度");
			return "people_edit";
		}
		tmpSavePeople();
		if(p != null && p.getId() != null){
			p.setStatus(2);//提交
			peopleBiz.saveOrUpdateEntity(p);
		}
		return "people_edit";
	}
	
	public String tmpSavePeople(){
		fillSettingList();
		if(p != null){
			if(p.getId() != null){
				People p2 = peopleBiz.getEntityById(People.class, p.getId());
				if(p2 != null){
					p2.setItem1(p.getItem1());
					p2.setItem2(p.getItem2());
					p2.setItem3(p.getItem3());
					p2.setItem4(p.getItem4());
					p2.setName(p.getName());
					p2.setTargetName(p.getTargetName());
					p2.setTargetType(p.getTargetType());
					p2.setYear(p.getYear());
					p2.setDate(p.getDate());
					p = p2;
				}
			}else{
				PeopleSetting ps = peopleBiz.getSettingByYear(p.getYear());
				if(ps != null){
					long count = peopleBiz.getPeopleSubmitCount(p.getYear());
					if(count+1 > ps.getMount()){
						this.setMsg("已经超过设置的该年度的最大份数:" + ps.getMount());
						return "people_edit"; 
					}
				}
				p.setCreateDate(new Date());
			}
			User user = (User) ActionContext.getContext().getSession().get(WebConstants.SESS_USER_OBJ);
			if(user instanceof Org){
				Org org = (Org) user;
				p.setOrg(org);
				p.setCun(org.getCun());
				p.setStatus(1);//草稿
			}
			peopleBiz.saveOrUpdateEntity(p);
			this.setMsg("保存成功");
			this.setSucc("Y");
		}
		return "people_edit";
	}
	
	public List<PeopleSetting> getSettingList() {
		return settingList;
	}
	public void setSettingList(List<PeopleSetting> settingList) {
		this.settingList = settingList;
	}
	public PeopleBiz getPeopleBiz() {
		return peopleBiz;
	}

	public Integer getYear() {
		return year;
	}

	public void setYear(Integer year) {
		this.year = year;
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

	public People getP() {
		return p;
	}

	public void setP(People p) {
		this.p = p;
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

	public Long getCunId() {
		return cunId;
	}

	public void setCunId(Long cunId) {
		this.cunId = cunId;
	}
	
}
