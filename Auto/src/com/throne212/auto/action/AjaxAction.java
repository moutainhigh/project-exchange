package com.throne212.auto.action;

import java.util.ArrayList;
import java.util.List;

import org.apache.struts2.ServletActionContext;

import com.opensymphony.xwork2.ActionContext;
import com.throne212.auto.biz.NewsBiz;
import com.throne212.auto.biz.UserBiz;
import com.throne212.auto.common.Util;
import com.throne212.auto.common.WebConstants;
import com.throne212.auto.domain.Brand;
import com.throne212.auto.domain.Sale;
import com.throne212.auto.domain.User;

public class AjaxAction extends BaseAction {
	
	private UserBiz userBiz;
	private NewsBiz newsBiz;

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
	
	private List<Brand> brandList;
	public String getTopBrands() throws Exception {
		brandList = newsBiz.getTopBrandList();
		return "brand_list";
	}
	public String getChildBrands() throws Exception {
		String brandId = ServletActionContext.getRequest().getParameter("id");
		if(!Util.isEmpty(brandId)){
			try {
				brandList = newsBiz.getChildBrandList(Long.parseLong(brandId));
			} catch (RuntimeException e) {
				e.printStackTrace();
			}
		}		
		return "brand_list";
	}
	public String getAllBrands() throws Exception {
		brandList = newsBiz.getBrandList();
		for(Brand b : brandList){
			if(b.getParentBrand() != null){
				b.setName(" &nbsp;&nbsp;--"+b.getName());
			}
		}
		return "brand_list";
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

	public NewsBiz getNewsBiz() {
		return newsBiz;
	}

	public void setNewsBiz(NewsBiz newsBiz) {
		this.newsBiz = newsBiz;
	}

	public List<Brand> getBrandList() {
		return brandList;
	}

	public void setBrandList(List<Brand> brandList) {
		this.brandList = brandList;
	}

}
