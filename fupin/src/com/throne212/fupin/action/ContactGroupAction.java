package com.throne212.fupin.action;

import java.util.ArrayList;
import java.util.HashSet;
import java.util.Iterator;
import java.util.List;
import java.util.Set;

import com.opensymphony.xwork2.ActionContext;
import com.throne212.fupin.biz.ContactGroupBiz;
import com.throne212.fupin.common.PageBean;
import com.throne212.fupin.common.Util;
import com.throne212.fupin.common.WebConstants;
import com.throne212.fupin.domain.Contact;
import com.throne212.fupin.domain.ContactGroup;
import com.throne212.fupin.domain.User;

public class ContactGroupAction extends BaseAction {

	private ContactGroup group;
	private PageBean pageBean;
	private Integer pageIndex;

	private Long groupId;
	private ContactGroupBiz groupBiz;
	private String queryKey;

	public String saveGroup() {
		if (group == null) {
			this.setMsg("保存失败，请检查数据是否录入完整");
			return "edit_group";
		}
		User user = (User) ActionContext.getContext().getSession().get(WebConstants.SESS_USER_OBJ);
		if (group != null && !Util.isEmpty(group.getGroupName())) {// 添加或更新
			group = groupBiz.saveGroup(user.getLoginName(), groupId, group);
			this.setMsg("保存成功");
			this.setSucc("Y");
			group = null;
		} else if (group != null && group.getId() != null) {// 查看
			group = groupBiz.getEntityById(ContactGroup.class, group.getId());
		}
		return "edit_group";

	}

	public String groupList() {
		User user = (User) ActionContext.getContext().getSession().get(WebConstants.SESS_USER_OBJ);
		pageBean = groupBiz.getGroupOfUser(queryKey, user.getLoginName(), pageIndex);

		return "list_group";
	}

	public String deleteGroup() {
		List<ContactGroup> groupSelectList = new ArrayList<ContactGroup>();
		List<ContactGroup> groupDelList = new ArrayList<ContactGroup>();
		List<Contact> contactDelList = new ArrayList<Contact>();
		ContactGroup groupDel;
		String[] ids = (String[]) ActionContext.getContext().getParameters().get("ids");
		if (ids != null && ids.length > 0) {
			for (String idStr : ids) {
				Long id = Long.parseLong(idStr);

				groupDel = groupBiz.getEntityById(ContactGroup.class, id);
				groupSelectList.add(groupDel);
				// groupBiz.deleteEntity(Contact.class, id);
			}

			for (ContactGroup contactGroup : groupSelectList) {
				groupDelList.add(contactGroup);
				getChildGroup(contactGroup, groupDelList);

			}
			// for (ContactGroup contactGroup : groupDelList) {
			// System.out.println("去除重复之前：");
			// System.out.println(contactGroup.getGroupName());
			//
			// }

			try {
				groupDelList = removeRepeatElement(groupDelList);
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			// for (ContactGroup contactGroup : groupDelList) {
			// System.out.println("去除重复之后：");
			// System.out.println(contactGroup.getGroupName());
			//
			// }

			for (ContactGroup contactGroup : groupDelList) {
				contactDelList = groupBiz.getEntitiesByColumn(Contact.class, "group", contactGroup);
				for (Contact contact : contactDelList) {

					System.out.println("删除通讯录...." + contact.getContactName());
					groupBiz.deleteEntity(Contact.class, contact.getId());
				}

			}

			for (ContactGroup contactGroup : groupDelList) {
				if(contactGroup == null)
					continue;
				logger.debug("删除通讯组....");
				deleteChild(contactGroup);

			}

			this.setMsg("删除通讯组成功");
		}

		return groupList();
	}

	private void deleteChild(ContactGroup parentGroup) {

		List<ContactGroup> childList = null;

		childList = groupBiz.getEntitiesByColumn(ContactGroup.class, "parentGroup", parentGroup);

		for (ContactGroup contactGroup : childList) {

			deleteChild(contactGroup);
		}
		
		logger.debug("删除...." + parentGroup.getGroupName());
		groupBiz.deleteEntity(ContactGroup.class, parentGroup.getId());

	}

	private void getChildGroup(ContactGroup parentGroup, List<ContactGroup> list) {

		List<ContactGroup> childList = groupBiz.getEntitiesByColumn(ContactGroup.class, "parentGroup", parentGroup);
		for (ContactGroup contactGroup : childList) {
			list.add(contactGroup);
			getChildGroup(contactGroup, list);
		}

	}

	public static List<ContactGroup> removeRepeatElement(List<ContactGroup> l) throws Exception {

		Set<ContactGroup> set = new HashSet<ContactGroup>();
		List<ContactGroup> list = new ArrayList<ContactGroup>();
		for (int i = 0; i < l.size(); i++) {
			set.add(l.get(i));
		}
		for (Iterator<ContactGroup> it = set.iterator(); it.hasNext();) {
			list.add(it.next());
		}
		return list;
	}

	public ContactGroup getGroup() {
		return group;
	}

	public void setGroup(ContactGroup group) {
		this.group = group;
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

	public Long getGroupId() {
		return groupId;
	}

	public void setGroupId(Long groupId) {
		this.groupId = groupId;
	}

	public ContactGroupBiz getGroupBiz() {
		return groupBiz;
	}

	public void setGroupBiz(ContactGroupBiz groupBiz) {
		this.groupBiz = groupBiz;
	}

	public String getQueryKey() {
		return queryKey;
	}

	public void setQueryKey(String queryKey) {
		this.queryKey = queryKey;
	}

}
