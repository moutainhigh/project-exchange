package com.throne212.fupin.action;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.HashSet;
import java.util.Iterator;
import java.util.List;
import java.util.Set;

import org.apache.struts2.ServletActionContext;

import com.opensymphony.xwork2.ActionContext;
import com.throne212.fupin.biz.AdminBiz;
import com.throne212.fupin.biz.BaseBiz;
import com.throne212.fupin.biz.ContactBiz;
import com.throne212.fupin.common.Util;
import com.throne212.fupin.common.WebConstants;
import com.throne212.fupin.domain.Admin;
import com.throne212.fupin.domain.Area;
import com.throne212.fupin.domain.AreaWorkOrg;
import com.throne212.fupin.domain.Contact;
import com.throne212.fupin.domain.ContactGroup;
import com.throne212.fupin.domain.Cun;
import com.throne212.fupin.domain.Diqu;
import com.throne212.fupin.domain.Family;
import com.throne212.fupin.domain.Leader;
import com.throne212.fupin.domain.LeaderHelp;
import com.throne212.fupin.domain.Org;
import com.throne212.fupin.domain.Shi;
import com.throne212.fupin.domain.ShiWorkOrg;
import com.throne212.fupin.domain.User;
import com.throne212.fupin.domain.WorkTeam;
import com.throne212.fupin.domain.Zhen;
import com.throne212.fupin.domain.ZhenWorkOrg;

public class AjaxAction extends BaseAction {

	private AdminBiz adminBiz;
	private BaseBiz baseBiz;
	private ContactBiz contactBiz;

	public String test() {
		return "msg";
	}

	private List list;

	// private List listTree;//用于显示树形通讯组

	// 获取所有市
	public String getAllShi() {
		list = adminBiz.getAll(Shi.class, "id", "asc");
		return "shi_list";
	}

	private Long parentId;

	public String getAllArea() {
		if (parentId != null)
			list = adminBiz.getEntitiesByColumn(Area.class, "shi", adminBiz.getEntityById(Shi.class, parentId));
		else
			list = adminBiz.getAll(Area.class);
		return "list";
	}

	public String getAllZhen() {
		// 判断是不是div
		User user = (User) ActionContext.getContext().getSession().get(WebConstants.SESS_USER_OBJ);
		if ("Y".equals(user.getIsDiv())) {
			Area area = adminBiz.getEntityByUnique(Area.class, "name", "白云区");
			parentId = area == null ? null : area.getId();
		}

		if (parentId != null)
			list = adminBiz.getEntitiesByColumn(Zhen.class, "area", adminBiz.getEntityById(Area.class, parentId));
		else
			list = adminBiz.getAll(Zhen.class);
		return "list";
	}

	public String getAllCun() {
		User user = (User) ActionContext.getContext().getSession().get(WebConstants.SESS_USER_OBJ);
		if (user instanceof WorkTeam) {
			if (parentId != null)
				list = adminBiz.getEntitiesByTwoColumn(Cun.class, "zhen.id", parentId, "team.id", user.getId());
			else
				list = adminBiz.getEntitiesByColumn(Cun.class, "team.id", user.getId());
		} else {
			if (parentId != null)
				list = adminBiz.getEntitiesByColumn(Cun.class, "zhen", adminBiz.getEntityById(Zhen.class, parentId));
			else
				list = adminBiz.getAll(Cun.class);
		}
		return "list";
	}

	// 根据市扶贫单位查找区县
	private Long shiWorkOrgId;

	public String getAreaByShiWorkOrg() {
		ShiWorkOrg shiWorkOrg = baseBiz.getEntityById(ShiWorkOrg.class, shiWorkOrgId);
		Shi shi = shiWorkOrg.getShi();
		list = baseBiz.getEntitiesByColumn(Area.class, "shi", shi);
		return "shi_areas";

	}

	// 获取所有市扶贫单位
	public String getAllShiWorkOrg() {

		list = baseBiz.getAll(ShiWorkOrg.class, "id", "asc");

		return "shiworkorg_list";

	}

	// 根据区扶贫办获取镇
	private Long areaWorkOrgId;

	public String getZhenByAreaWorkOrg() {
		AreaWorkOrg areaWorkOrg = baseBiz.getEntityById(AreaWorkOrg.class, areaWorkOrgId);
		Area area = areaWorkOrg.getArea();
		list = baseBiz.getEntitiesByColumn(Zhen.class, "area", area);
		return "area_zhens";
	}

	// 根据市扶贫办获取区扶贫办
	public String getAreaWorkOrgByShiOrg() {

		ShiWorkOrg shiOrg = baseBiz.getEntityById(ShiWorkOrg.class, shiWorkOrgId);
		list = baseBiz.getEntitiesByColumn(AreaWorkOrg.class, "shiWorkOrg", shiOrg);
		System.out.print("_+_+_+_+_+_+" + list);
		return "shiorg_areaorgs";
	}

	// 根据单位对应的村查找所有贫困户
	public String getAllFamilyByCun() {
		User user = (User) ActionContext.getContext().getSession().get(WebConstants.SESS_USER_OBJ);
		Org org = (Org) user;
		list = baseBiz.getEntitiesByColumn(Family.class, "cun", org.getCun());
		return "cun_family";
	}

	// 根据单位对应的村查找所有指定了帮扶干部的贫困户
	public String getAllFamilyByCunWithLeader() {
		User user = (User) ActionContext.getContext().getSession().get(WebConstants.SESS_USER_OBJ);
		if (user instanceof Org) {
			Org org = (Org) user;
			list = baseBiz.getEntitiesByColumn(Family.class, "cun", org.getCun());
		} else {
			list = baseBiz.getAll(Family.class);
		}
		List<Family> list2 = new ArrayList<Family>();
		for (Object o : list) {
			Family f = (Family) o;
			List<Leader> leaderList = baseBiz.getEntitiesByColumn(Leader.class, "family", f);
			if (leaderList != null && leaderList.size() > 0) {
				list2.add(f);
			} else {
				// 从映射表里再找一次
				List<LeaderHelp> helpList = baseBiz.getEntitiesByColumn(LeaderHelp.class, "family", f);
				if (helpList != null && helpList.size() > 0) {
					list2.add(f);
				}
			}
		}
		list = list2;
		return "cun_family";
	}

	// 根据单位查找所有干部
	public String getAllLeaderByOrg() {
		User user = (User) ActionContext.getContext().getSession().get(WebConstants.SESS_USER_OBJ);
		Org org = (Org) user;
		list = baseBiz.getEntitiesByColumn(Leader.class, "org", org);
		return "org_leader";
	}

	// 地区树形
	private String root;

	public String treeView() {
		if ("source".equals(root)) {
			String str = "[{'text':'test','id':'440500000000','hasChildren': true,'classes':'folder','href':'session.jsp?id=440500000000','target':'detailFrame'}]";
			PrintWriter out;
			try {
				out = ServletActionContext.getResponse().getWriter();
				ServletActionContext.getResponse().setContentType("text/json; charset=utf8");
				ServletActionContext.getResponse().setCharacterEncoding("UTF8");
				out.print(str);
				out.flush();
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			return null;
		}
		Diqu diqu = baseBiz.getEntityById(Diqu.class, Long.parseLong(root));
		StringBuffer sb = new StringBuffer();
		sb.append("[");
		if (diqu != null && diqu instanceof Area) {
			Area area = (Area) diqu;
			List<Zhen> zhenList = baseBiz.getEntitiesByColumn(Zhen.class, "area", area);
			for (Zhen zhen : zhenList) {
				sb.append("{");
				sb.append("'text':'" + zhen.getName() + "',");
				sb.append("'id':'" + zhen.getId() + "',");
				sb.append("'hasChildren':" + true + ",");
				sb.append("'classes':'folder',");
				sb.append("'href':'session.jsp?id='" + zhen.getId() + ",");
				sb.append("'target':'detailFarame',");
				sb.append("}");
				sb.append(",");
			}
			if (sb.charAt(sb.length() - 1) == ',') {
				sb.deleteCharAt(sb.length() - 1);
			}
			sb.append("]");
		} else if (diqu != null && diqu instanceof Zhen) {
			Zhen zhen = (Zhen) diqu;
			List<Cun> cunList = baseBiz.getEntitiesByColumn(Cun.class, "zhen", zhen);
			for (Cun cun : cunList) {
				sb.append("{");
				sb.append("'text':'" + cun.getName() + "',");
				sb.append("'id':'" + cun.getId() + "',");
				sb.append("'hasChildren':" + false + ",");
				sb.append("'classes':'file',");
				sb.append("'href':'session.jsp?id='" + cun.getId() + ",");
				sb.append("'target':'detailFarame',");
				sb.append("}");
				sb.append(",");
			}
			if (sb.charAt(sb.length() - 1) == ',') {
				sb.deleteCharAt(sb.length() - 1);
			}
			sb.append("]");
		}
		PrintWriter out;
		try {
			out = ServletActionContext.getResponse().getWriter();
			out.print(sb.toString());
			out.flush();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return null;
	}

	private String q;

	public String queryCunByPinyin() {
		if (!Util.isEmpty(q)) {
			list = adminBiz.getCunListByLike(q.toLowerCase());
		}
		return "pinyin";
	}

	public String queryOrgByPinyin() {
		if (!Util.isEmpty(q)) {
			list = adminBiz.getAllLike(Org.class, "pinyin", q.toLowerCase());
		}
		return "pinyin2";
	}

	// 通过户名得到帮扶干部
	private Long familyId;

	public String getLeaderByFamily() {
		if (familyId != null) {
			Family family = baseBiz.getEntityById(Family.class, familyId);
			list = baseBiz.getEntitiesByColumn(Leader.class, "family", family);
			if (list == null || list.size() == 0) {
				// 从映射表里再找一次
				List<LeaderHelp> helpList = baseBiz.getEntitiesByColumn(LeaderHelp.class, "family", family);
				if (helpList != null && helpList.size() > 0) {
					list = new ArrayList<Leader>();
					list.add(helpList.get(0).getLeader());
				}
			}
		}
		return "org_leader";
	}

	// 根据贫困户名模糊匹配多个贫困户
	public String queryFamilyByName() {
		String[] param = (String[]) ActionContext.getContext().getParameters().get("q");
		if (param != null && param.length > 0) {
			String q = param[0];
			// list = baseBiz.getAllLike(Family.class, "name", q);
			getAllFamilyByCunWithLeader();
			if (list != null && list.size() > 0) {
				List newList = new ArrayList();
				for (Object o : list) {
					Family f = (Family) o;
					if (f.getName().contains(q))
						newList.add(f);
				}
				list = newList;
			}
		}
		return "query_family";
	}

	// 树形用户结构
	private String item;

	public String getUserIds() {
		if (!Util.isEmpty(item)) {
			String[] arr = item.split("-");
			String type = arr[1];
			StringBuffer sb = new StringBuffer();
			if ("0".equals(type)) {
				List<User> userList = adminBiz.getAll(User.class);
				for (User u : userList) {
					if (!(u instanceof Admin)) {
						sb.append(u.getLoginName());
						sb.append("+");
					}
				}
			} else if ("2".equals(type)) {
				Long id = Long.parseLong(arr[2]);
				AreaWorkOrg area = adminBiz.getEntityById(AreaWorkOrg.class, id);
				sb.append(area.getLoginName());
				sb.append("+");
				// 驻扎镇得工作组
				WorkTeam team = adminBiz.getEntityByUnique(WorkTeam.class, "area", area.getArea());
				if (team != null) {
					sb.append(team.getLoginName());
					sb.append("+");
				}
				// 获得zhen列表
				List<ZhenWorkOrg> zhenList = adminBiz.getEntitiesByColumn(ZhenWorkOrg.class, "zhen.area", area.getArea());
				for (ZhenWorkOrg zhen : zhenList) {
					sb.append(zhen.getLoginName());
					sb.append("+");
				}
				// 获得直属单位列表
				List<Org> orgList = adminBiz.getEntitiesByColumn(Org.class, "area", area.getArea());
				for (Org o : orgList) {
					sb.append(o.getLoginName());
					sb.append("+");
				}
			} else if ("3".equals(type) || "4".equals(type) || "1".equals(type)) {
				Long id = Long.parseLong(arr[2]);
				User user = adminBiz.getEntityById(User.class, id);
				sb.append(user.getLoginName());
				sb.append("+");
			}
			item = sb.toString();
		}
		return "user_ids";
	}

	// 获取用户的通讯组
	// private List<String> treeLists=new ArrayList<String>();

	public String getAllGroupOfUser() {

		list = new ArrayList<ContactGroup>();

		List<ContactGroup> rootGroupList = null;
		User user = (User) ActionContext.getContext().getSession().get(WebConstants.SESS_USER_OBJ);
		rootGroupList = baseBiz.getEntitiesSecondColIsNull(ContactGroup.class, "userName", user.getLoginName(), "parentGroup.id");
		if (rootGroupList != null) {
			for (ContactGroup contactGroup : rootGroupList) {
				contactGroup.setShowTreeName(contactGroup.getGroupName());
				list.add(contactGroup);
				getGroupTreeList(contactGroup, 1);
			}

		}

		return "list_group";
	}

	private void getGroupTreeList(ContactGroup parentGroup, int level) {

		StringBuffer strPre = new StringBuffer("");
		for (int i = 0; i < level * 2; i++) {
			strPre.append("-");
		}
		List<ContactGroup> childList = baseBiz.getEntitiesByColumn(ContactGroup.class, "parentGroup", parentGroup);
		for (ContactGroup contactGroup : childList) {
			contactGroup.setShowTreeName(strPre + contactGroup.getGroupName());
			list.add(contactGroup);
			getGroupTreeList(contactGroup, level + 1);
		}
	}

	// 获取用户选择的通信录

	private String choosedIds;
	private String telNo;

	public String getSelectedContacts() {
		ContactGroup groupSel = null;
		List<ContactGroup> groupSelectList = new ArrayList<ContactGroup>();
		List<ContactGroup> groupList = new ArrayList<ContactGroup>();
		List<Contact> contactList = new ArrayList<Contact>();
		String[] ids = (String[]) choosedIds.substring(1).split("[+]");

		List<Long> gIdList = new ArrayList<Long>();
		List<Long> cIdList = new ArrayList<Long>();
		if (ids != null && ids.length > 0) {
			for (String idStr : ids) {
				System.out.println("id:" + idStr);
				if (idStr.charAt(0) == 'g') {
					Long idLong = Long.parseLong(idStr.substring(2));
					gIdList.add(idLong);
					System.out.println(idLong);
				}
				if (idStr.charAt(0) == 'c') {
					Long idLong = Long.parseLong(idStr.substring(2));
					cIdList.add(idLong);
					System.out.println(idLong);
				}
			}

			for (Long gId : gIdList) {
				groupSel = baseBiz.getEntityById(ContactGroup.class, gId);
				groupSelectList.add(groupSel);
			}
			for (ContactGroup contactGroup : groupSelectList) {
				groupList.add(contactGroup);
				getChildGroup(contactGroup, groupList);
			}
			try {
				groupList = removeRepeatElement(groupList);
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			for (ContactGroup contactGroup : groupList) {
				contactList.addAll(baseBiz.getEntitiesByColumn(Contact.class, "group", contactGroup));
			}
			for (Long cId : cIdList) {
				contactList.add(baseBiz.getEntityById(Contact.class, cId));
			}
			try {
				contactList = removeRepeatElement(contactList);
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			StringBuffer sBuffer = new StringBuffer();
			for (Contact contact : contactList) {
				sBuffer.append(contact.getTelNo() + "+");
			}
			String telNoStr = sBuffer.toString();
			if (telNoStr.length() > 0)
				telNo = telNoStr.substring(0, telNoStr.length() - 1);
			System.out.println(telNo);
		}
		return "select_contacts";

	}

	private void getChildGroup(ContactGroup parentGroup, List<ContactGroup> list) {

		List<ContactGroup> childList = baseBiz.getEntitiesByColumn(ContactGroup.class, "parentGroup", parentGroup);
		for (ContactGroup contactGroup : childList) {
			list.add(contactGroup);
			getChildGroup(contactGroup, list);
		}

	}

	public static List removeRepeatElement(List l) throws Exception {

		Set set = new HashSet();
		List list = new ArrayList();
		System.out.println(l.size() + "传入的List的长度");
		for (int i = 0; i < l.size(); i++) {
			set.add(l.get(i));
		}
		System.out.println(set.size() + "处理后set的长度");
		for (Iterator it = set.iterator(); it.hasNext();) {
			list.add(it.next());
		}
		System.out.println(list.size() + "返回的list的长度");
		return list;
	}

	// 根据组获得所有下属的联系人
	private Long gId;

	public String getContactsByGroup() {
		list = contactBiz.getContactsInGroup(gId);
		return "contacts_in_group";
	}

	private Long cunId;

	public String getOrgByCun() {
		list = adminBiz.getEntitiesByColumn(Org.class, "cun.id", cunId);
		return "org_list";
	}

	public AdminBiz getAdminBiz() {
		return adminBiz;
	}

	public void setAdminBiz(AdminBiz adminBiz) {
		this.adminBiz = adminBiz;
	}

	public List getList() {
		return list;
	}

	public void setList(List list) {
		this.list = list;
	}

	public Long getParentId() {
		return parentId;
	}

	public void setParentId(Long parentId) {
		this.parentId = parentId;
	}

	public BaseBiz getBaseBiz() {
		return baseBiz;
	}

	public void setBaseBiz(BaseBiz baseBiz) {
		this.baseBiz = baseBiz;
	}

	public Long getShiWorkOrgId() {
		return shiWorkOrgId;
	}

	public void setShiWorkOrgId(Long shiWorkOrgId) {
		this.shiWorkOrgId = shiWorkOrgId;
	}

	public Long getAreaWorkOrgId() {
		return areaWorkOrgId;
	}

	public void setAreaWorkOrgId(Long areaWorkOrgId) {
		this.areaWorkOrgId = areaWorkOrgId;
	}

	public String getRoot() {
		return root;
	}

	public void setRoot(String root) {
		this.root = root;
	}

	public String getQ() {
		return q;
	}

	public void setQ(String q) {
		this.q = q;
	}

	public Long getFamilyId() {
		return familyId;
	}

	public void setFamilyId(Long familyId) {
		this.familyId = familyId;
	}

	public String getItem() {
		return item;
	}

	public void setItem(String item) {
		this.item = item;
	}

	public String getChoosedIds() {
		return choosedIds;
	}

	public void setChoosedIds(String choosedIds) {
		this.choosedIds = choosedIds;
	}

	public String getTelNo() {
		return telNo;
	}

	public void setTelNo(String telNo) {
		this.telNo = telNo;
	}

	public ContactBiz getContactBiz() {
		return contactBiz;
	}

	public void setContactBiz(ContactBiz contactBiz) {
		this.contactBiz = contactBiz;
	}

	public Long getgId() {
		return gId;
	}

	public void setgId(Long gId) {
		this.gId = gId;
	}

	public Long getCunId() {
		return cunId;
	}

	public void setCunId(Long cunId) {
		this.cunId = cunId;
	}

}
