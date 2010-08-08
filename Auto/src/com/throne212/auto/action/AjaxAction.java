package com.throne212.auto.action;

import java.util.ArrayList;
import java.util.List;

import com.opensymphony.xwork2.ActionContext;
import com.throne212.auto.biz.UserBiz;
import com.throne212.auto.common.WebConstants;
import com.throne212.auto.domain.Sale;
import com.throne212.auto.domain.User;

public class AjaxAction extends BaseAction {
	
	private UserBiz userBiz;

	public void setUserBiz(UserBiz userBiz) {
		this.userBiz = userBiz;
	}
	
	public String execute() throws Exception {
		return "index";
	}
	
	private List<Sale> saleList;
	public String getAllSales() throws Exception {
		User user = (User) ActionContext.getContext().getSession().get(WebConstants.SESS_USER_OBJ);
		if(user instanceof Sale){
			saleList = new ArrayList<Sale>();
			saleList.add((Sale) user);
		}else
			saleList = userBiz.getAll(Sale.class);
		return "sale_list";
	}

	public List<Sale> getSaleList() {
		return saleList;
	}

	public void setSaleList(List<Sale> saleList) {
		this.saleList = saleList;
	}

	public UserBiz getUserBiz() {
		return userBiz;
	}

}
