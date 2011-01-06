package com.throne212.info168.web.action;

import java.util.Date;
import java.util.List;

import com.opensymphony.xwork2.ActionContext;
import com.throne212.info168.web.biz.CommonBiz;
import com.throne212.info168.web.biz.InfoBiz;
import com.throne212.info168.web.biz.UserBiz;
import com.throne212.info168.web.common.EncryptUtil;
import com.throne212.info168.web.common.PageBean;
import com.throne212.info168.web.common.Util;
import com.throne212.info168.web.common.WebConstants;
import com.throne212.info168.web.domain.Contact;
import com.throne212.info168.web.domain.Info;
import com.throne212.info168.web.domain.TopPriceSetting;
import com.throne212.info168.web.domain.User;

public class UserAction extends BaseAction {

	private UserBiz userBiz;
	private InfoBiz infoBiz;
	private CommonBiz commonBiz;

	// 用户bean
	private User user;

	// 信息列表
	private List<Info> infoList;
	private PageBean pageBean;
	private Integer page;

	private Long[] infoIds;

	public String infoList() {
		if (page == null || page < 1)
			page = 1;
		pageBean = userBiz.getInfos(page);
		return "info_list";
	}

	// 密码页面
	public String password() {

		return "password";
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

	// 删除信息
	public String deleteInfo() {
		for (Long id : infoIds) {
			try {
				userBiz.deleteEntity(Info.class, id);
			} catch (RuntimeException e) {
				e.printStackTrace();
				this.setMsg("删除错误，请不要重复删除");
			}
		}
		this.setMsg("信息删除成功");
		return infoList();
	}
	
	//修改联系方式
	private Contact contact;
	public String modify() {
		if(contact!=null){
			User user = (User) ActionContext.getContext().getSession().get(WebConstants.SESS_USER_OBJ);
			user.setContact(contact);
			userBiz.saveOrUpdateEntity(user);
			this.setMsg("联系方式修改成功");
		}
		return "modify";
	}
	
	
	//财务管理
	public String finance(){
		User userInSession = (User) ActionContext.getContext().getSession().get(WebConstants.SESS_USER_OBJ);
		this.user = userBiz.getEntityById(User.class, userInSession.getId());
		pageBean = userBiz.getFinanceByUser(page, user);
		return "finance";
	}
	private String orderNum;//订单号
	public String financeForm(){
		orderNum = Util.generateOrderNo();
		return "finance_form";
	}
	
	//置顶信息
	private Info info;
	private Integer topDays;
	public String topInfo() {
		if(info != null && info.getId() != null){
			info = commonBiz.getEntityById(Info.class, info.getId());
		}
		if(topDays==null){
			return "info_top";
		}		
		User user = (User) ActionContext.getContext().getSession().get(WebConstants.SESS_USER_OBJ);
		TopPriceSetting priceSetting = commonBiz.getPriceByCateAndArea(info.getCate(), info.getArea());
		double money = topDays * priceSetting.getPrice();
		if(user.getBalance() < money){
			this.setMsg("对不起，你的余额不足，请充值以后进行操作");
			return "info_top";
		}
		info.setIsTop(true);
		info.setTopEndDate(new Date(System.currentTimeMillis()+topDays*24*60*60*1000));
		infoBiz.saveOrUpdateEntity(info);
		user.setBalance(user.getBalance() - money);
		userBiz.saveOrUpdateEntity(user);
		ActionContext.getContext().getSession().put(WebConstants.SESS_USER_OBJ,user);
		this.setMsg("信息置顶成功，本次消费为：" + money);
		return "info_top";
	}

	public UserBiz getUserBiz() {
		return userBiz;
	}

	public void setUserBiz(UserBiz userBiz) {
		this.userBiz = userBiz;
	}

	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
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

	public List<Info> getInfoList() {
		return infoList;
	}

	public void setInfoList(List<Info> infoList) {
		this.infoList = infoList;
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

	public Long[] getInfoIds() {
		return infoIds;
	}

	public void setInfoIds(Long[] infoIds) {
		this.infoIds = infoIds;
	}

	public Contact getContact() {
		return contact;
	}

	public void setContact(Contact contact) {
		this.contact = contact;
	}

	public String getOrderNum() {
		return orderNum;
	}

	public void setOrderNum(String orderNum) {
		this.orderNum = orderNum;
	}

	public InfoBiz getInfoBiz() {
		return infoBiz;
	}

	public void setInfoBiz(InfoBiz infoBiz) {
		this.infoBiz = infoBiz;
	}

	public Info getInfo() {
		return info;
	}

	public void setInfo(Info info) {
		this.info = info;
	}

	public CommonBiz getCommonBiz() {
		return commonBiz;
	}

	public void setCommonBiz(CommonBiz commonBiz) {
		this.commonBiz = commonBiz;
	}

	public Integer getTopDays() {
		return topDays;
	}

	public void setTopDays(Integer topDays) {
		this.topDays = topDays;
	}

}
