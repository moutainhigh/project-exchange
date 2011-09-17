package com.throne212.fupin.action;

import java.util.List;

import com.opensymphony.xwork2.ActionContext;
import com.throne212.fupin.biz.ContactBiz;
import com.throne212.fupin.common.PageBean;
import com.throne212.fupin.common.Util;
import com.throne212.fupin.common.WebConstants;
import com.throne212.fupin.domain.Contact;
import com.throne212.fupin.domain.ContactGroup;
import com.throne212.fupin.domain.User;

public class ContactAction extends BaseAction {
	private Contact contact;
	private PageBean pageBean;
	private Integer pageIndex;
	private ContactBiz contactBiz;

	// 查询联系方式
	public String queryContact() {
		User user = (User) ActionContext.getContext().getSession().get(WebConstants.SESS_USER_OBJ);
		pageBean = contactBiz.getContactOfUser(contact, user.getLoginName(), pageIndex);
		return "query_contact";
	}

	// 保存或修改联系方式
	public String saveContact() {
		if (contact == null) {
			this.setMsg("保存失败，请检查数据是否录入完整");
			return "edit_contact";
		}
		User user = (User) ActionContext.getContext().getSession().get(WebConstants.SESS_USER_OBJ);

		if (contact != null && !Util.isEmpty(contact.getContactName())) {// 添加或更新
			contact = contactBiz.saveContact(user.getLoginName(), contact.getGroup().getId(), contact);
			this.setMsg("保存成功");
			this.setSucc("Y");
			contact = null;
		} else if (contact != null && contact.getId() != null) {// 查看
			contact = contactBiz.getEntityById(Contact.class, contact.getId());
		}

		return "edit_contact";

	}

	// 删除联系方式

	public String deleteContact() {
		String[] ids = (String[]) ActionContext.getContext().getParameters().get("ids");
		if (ids != null && ids.length > 0) {
			for (String idStr : ids) {
				Long id = Long.parseLong(idStr);
				contactBiz.deleteEntity(Contact.class, id);
			}
			this.setMsg("删除通讯录成功");
		}
		return queryContact();
	}

	private List<ContactGroup> gList;

	public String showContacts() {
		gList = contactBiz.getAllContactTree();
		return "choose_contacts";
	}

	//	

	public Contact getContact() {
		return contact;
	}

	public void setContact(Contact contact) {
		this.contact = contact;
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

	public ContactBiz getContactBiz() {
		return contactBiz;
	}

	public void setContactBiz(ContactBiz contactBiz) {
		this.contactBiz = contactBiz;
	}

	public List<ContactGroup> getGList() {
		return gList;
	}

	public void setGList(List<ContactGroup> list) {
		gList = list;
	}
	// public List<Contact> getContactList() {
	// return contactList;
	// }
	// public void setContactList(List<Contact> contactList) {
	// this.contactList = contactList;
	// }

}
