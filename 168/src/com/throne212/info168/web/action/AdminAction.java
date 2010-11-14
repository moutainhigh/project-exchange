package com.throne212.info168.web.action;

import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.PrintWriter;
import java.io.Writer;
import java.util.Date;
import java.util.List;
import java.util.Properties;

import com.opensymphony.xwork2.ActionContext;
import com.throne212.info168.web.biz.CommonBiz;
import com.throne212.info168.web.biz.InfoBiz;
import com.throne212.info168.web.biz.UserBiz;
import com.throne212.info168.web.common.EncryptUtil;
import com.throne212.info168.web.common.PageBean;
import com.throne212.info168.web.common.Util;
import com.throne212.info168.web.common.WebConstants;
import com.throne212.info168.web.domain.Area;
import com.throne212.info168.web.domain.HotCitySetting;
import com.throne212.info168.web.domain.Info;
import com.throne212.info168.web.domain.Setting;
import com.throne212.info168.web.domain.User;

public class AdminAction extends BaseAction{
	
	private UserBiz userBiz;
	private InfoBiz infoBiz;
	private CommonBiz commonBiz;

	public String index() {
		return "index";
	}

	// 修改密码
	private String oldpassword;
	private String newpassword;
	private String renewpassword;

	public String changePwd() {
		if (Util.isEmpty(oldpassword) || Util.isEmpty(newpassword) || Util.isEmpty(renewpassword)) {
			this.setMsg("请完整输入所有密码输入框");
		} else if (newpassword.length() < 6 || renewpassword.length() < 6) {
			this.setMsg("密码长度不小于6");
		} else if (!newpassword.equals(renewpassword)) {
			this.setMsg("两次新密码输入不一致");
		} else {
			User user = (User) ActionContext.getContext().getSession().get(WebConstants.SESS_USER_OBJ);
			if (!oldpassword.equals(user.getPassword()) && !EncryptUtil.md5Encode(oldpassword).equals(user.getPassword())) {
				this.setMsg("原密码错误");
			} else {
				user.setPassword(EncryptUtil.md5Encode(newpassword));
				userBiz.saveOrUpdateEntity(user);
				ActionContext.getContext().getSession().put(WebConstants.SESS_USER_OBJ, user);
				this.setMsg("密码修改成功");
			}
		}
		return "password";
	}
	
	//信息列表
	private PageBean pageBean;
	private Integer page;
	
	public String infoList(){
		if(page == null || page < 1)
			page = 1;
		pageBean = infoBiz.getAllInfo(page);
		return "info_list";
	}
	
	public String unchckedinfoList(){
		if(page == null || page < 1)
			page = 1;
		pageBean = infoBiz.getAllUncheckInfo(page);
		return "info_list";
	}
	
	public String passInfoCheck(){
		Info info = infoBiz.getEntityById(Info.class, infoId);
		info.setIsChecked(true);
		infoBiz.saveOrUpdateEntity(info);
		this.setMsg("信息审核通过");
		return infoList();
	}
	
	public String recommend(){
		Info info = infoBiz.getEntityById(Info.class, infoId);
		info.setRecommend(true);
		infoBiz.saveOrUpdateEntity(info);
		this.setMsg("信息热门推荐成功");
		return infoList();
	}
	
	//删除信息
	private String infoListFrom;
	private Long infoId;
	public String deleteInfo(){
		if(infoId != null){
			infoBiz.deleteEntity(Info.class, infoId);
			this.setMsg("信息删除成功");
		}
		return infoList();
	}
	
	//******************系统设置********************//
	//热门城市列表
	private List<Setting> hotCities;
	public String hotCity(){
		hotCities = commonBiz.getSetting(HotCitySetting.class);
		return "hot_city";
	}
	
	private Long cityId;
	public String addHotCity(){
		if(cityId != null){
			Area city = commonBiz.getEntityById(Area.class, cityId);
			hotCities = commonBiz.getSetting(HotCitySetting.class);
			for(Setting setting : hotCities){
				HotCitySetting hotCity = (HotCitySetting) setting;
				if(hotCity.getName().equals(city.getName()) && hotCity.getPinyin().equals(city.getPinyin())){
					this.setMsg("该城市已经是热门城市了");
					return hotCity();
				}
			}
			HotCitySetting newHot = new HotCitySetting();
			newHot.setName(city.getName());
			newHot.setPinyin(city.getPinyin());
			newHot.setDate(new Date());
			newHot.setEntityId(city.getId());
			commonBiz.saveOrUpdateEntity(newHot);
			this.setMsg("热门城市添加成功");
			
			//更新缓存
			hotCities = commonBiz.getSetting(HotCitySetting.class);
			ActionContext.getContext().getApplication().put(WebConstants.HOT_CITIES, hotCities);
		}
		return hotCity();
	}
	
	public String removeHotCity(){
		if(cityId!=null){
			commonBiz.deleteEntity(HotCitySetting.class, cityId);
			this.setMsg("热门城市移除成功");
			//更新缓存
			hotCities = commonBiz.getSetting(HotCitySetting.class);
			ActionContext.getContext().getApplication().put(WebConstants.HOT_CITIES, hotCities);
		}
		return hotCity();
	}
	
	//网站配置
	private String title;
	private String keywords;
	private String desc; 
	
	public String siteSetting(){
		if(!Util.isEmpty(title)){
			String path = Thread.currentThread().getContextClassLoader().getResource("/").getPath();
			path = path + File.separator + "site.properties";
			Writer writer = null;
			try {
				Properties props = new Properties();
				props.put("site_title", title);
				props.put("site_desc", desc);
				props.put("site_keywords", keywords);
				writer = new PrintWriter(new FileOutputStream(path));
				props.store(writer, null);
				ActionContext.getContext().getApplication().put(WebConstants.APP_TITLE, props.get("site_title"));
				ActionContext.getContext().getApplication().put(WebConstants.APP_DESC, props.get("site_desc"));
				ActionContext.getContext().getApplication().put(WebConstants.APP_KEY_WORDS, props.get("site_keywords"));
			} catch (FileNotFoundException e1) {
				e1.printStackTrace();
			} catch (IOException ex) {
				ex.printStackTrace();
			} finally{
				if(writer != null){
					try {
						writer.close();
					} catch (IOException e1) {
						e1.printStackTrace();
					}
				}
			}
		}
		return "site_setting";
	}
	
	//用户列表
	public String userList(){
		if(page == null || page < 1)
			page = 1;
		pageBean = userBiz.getAllUsers(page);
		return "user_list";
	}
	
	public String getOldpassword() {
		return oldpassword;
	}

	public void setOldpassword(String oldpassword) {
		this.oldpassword = oldpassword;
	}

	public String getNewpassword() {
		return newpassword;
	}

	public void setNewpassword(String newpassword) {
		this.newpassword = newpassword;
	}

	public String getRenewpassword() {
		return renewpassword;
	}

	public void setRenewpassword(String renewpassword) {
		this.renewpassword = renewpassword;
	}

	public UserBiz getUserBiz() {
		return userBiz;
	}

	public void setUserBiz(UserBiz userBiz) {
		this.userBiz = userBiz;
	}

	public InfoBiz getInfoBiz() {
		return infoBiz;
	}

	public void setInfoBiz(InfoBiz infoBiz) {
		this.infoBiz = infoBiz;
	}

	public PageBean getPageBean() {
		return pageBean;
	}

	public void setPageBean(PageBean pageBean) {
		this.pageBean = pageBean;
	}

	public Integer getPage() {
		return page;
	}

	public void setPage(Integer page) {
		this.page = page;
	}

	public String getInfoListFrom() {
		return infoListFrom;
	}

	public void setInfoListFrom(String infoListFrom) {
		this.infoListFrom = infoListFrom;
	}

	public Long getInfoId() {
		return infoId;
	}

	public void setInfoId(Long infoId) {
		this.infoId = infoId;
	}

	public List<Setting> getHotCities() {
		return hotCities;
	}

	public void setHotCities(List<Setting> hotCities) {
		this.hotCities = hotCities;
	}

	public CommonBiz getCommonBiz() {
		return commonBiz;
	}

	public void setCommonBiz(CommonBiz commonBiz) {
		this.commonBiz = commonBiz;
	}

	public Long getCityId() {
		return cityId;
	}

	public void setCityId(Long cityId) {
		this.cityId = cityId;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getKeywords() {
		return keywords;
	}

	public void setKeywords(String keywords) {
		this.keywords = keywords;
	}

	public String getDesc() {
		return desc;
	}

	public void setDesc(String desc) {
		this.desc = desc;
	}

}
