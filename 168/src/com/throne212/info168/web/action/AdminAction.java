package com.throne212.info168.web.action;

import java.util.List;

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
	private PageBean<Info> pageBean;
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

	public PageBean<Info> getPageBean() {
		return pageBean;
	}

	public void setPageBean(PageBean<Info> pageBean) {
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

}
