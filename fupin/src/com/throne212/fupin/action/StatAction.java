package com.throne212.fupin.action;

import com.opensymphony.xwork2.ActionContext;
import com.throne212.fupin.biz.StatBiz;
import com.throne212.fupin.common.FamilyTypeStatDO;
import com.throne212.fupin.common.PageBean;
import com.throne212.fupin.common.WebConstants;
import com.throne212.fupin.domain.User;

public class StatAction extends BaseAction {

	private StatBiz statBiz;

	private PageBean<FamilyTypeStatDO> pageBean;

	private Integer pageIndex;

	public String familyTypeList() {
		User user = (User) ActionContext.getContext().getSession().get(WebConstants.SESS_USER_OBJ);
		pageBean = statBiz.getFamilyTypeByUser(user, pageIndex);
		return "family_type_stat";
	}

	public StatBiz getStatBiz() {
		return statBiz;
	}

	public void setStatBiz(StatBiz statBiz) {
		this.statBiz = statBiz;
	}

	public PageBean<FamilyTypeStatDO> getPageBean() {
		return pageBean;
	}

	public void setPageBean(PageBean<FamilyTypeStatDO> pageBean) {
		this.pageBean = pageBean;
	}

	public Integer getPageIndex() {
		return pageIndex;
	}

	public void setPageIndex(Integer pageIndex) {
		this.pageIndex = pageIndex;
	}

}
