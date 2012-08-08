package com.throne212.fupin.action;

import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

import com.opensymphony.xwork2.ActionContext;
import com.throne212.fupin.biz.AdminBiz;
import com.throne212.fupin.biz.MessageBiz;
import com.throne212.fupin.biz.OrgBiz;
import com.throne212.fupin.common.PageBean;
import com.throne212.fupin.common.Util;
import com.throne212.fupin.common.WebConstants;
import com.throne212.fupin.domain.AreaWorkOrg;
import com.throne212.fupin.domain.Contact;
import com.throne212.fupin.domain.ContactGroup;
import com.throne212.fupin.domain.Leader;
import com.throne212.fupin.domain.Org;
import com.throne212.fupin.domain.SMS;
import com.throne212.fupin.domain.User;
import com.throne212.fupin.domain.WorkTeam;
import com.throne212.fupin.domain.ZhenWorkOrg;

public class SMSAction extends BaseAction {

	private PageBean<SMS> pageBean;
	private MessageBiz messageBiz;
	private Integer pageIndex;
	private SMS sms;
	private AdminBiz adminBiz;
	private OrgBiz orgBiz;

	public String getAllSMS() {
		User user = (User) ActionContext.getContext().getSession().get(WebConstants.SESS_USER_OBJ);
		pageBean = messageBiz.getAllSMS(pageIndex, user.getLoginName());
		return "sms_list";
	}
	
	public String sendSMS(){
		if (sms == null) {
			this.setMsg("通知发送失败，请检查数据是否录入完整");
			return "sms_edit";
		}
		if (sms.getContent()!=null && sms.getContent().length()>120){
			this.setMsg("短信内容过长，请注意不要超过120个汉字");
			return "sms_edit";
		}
		StringBuffer sb = new StringBuffer();
		if (sms != null && sms.getTel() != null) {// 发送短信
			String recieverString = sms.getTel();
			Set<String> set = new HashSet<String>();
			if(recieverString.contains("+")){
				String[] reciever = recieverString.split("[+]");
				for (String loginName : reciever) {//排除重复
					set.add(loginName);
				}
			}else{
				set.add(recieverString);
			}
			User user = (User) ActionContext.getContext().getSession().get(WebConstants.SESS_USER_OBJ);
			for (String tel : set) {
				logger.info("正在发送短信给：" + tel);
				int rst = -1;
				try {
					rst = Util.sendMessage(tel, sms.getContent(), user.getLoginName(), user.getId().intValue());//0为成功
					if(rst == 0){
						sb.append("("+tel+")发送成功.\\n");
						this.setSucc("Y");
						logger.info("成功发送短信给：" + tel);
					}else if(rst == -108){
						sb.append("发送失败，短息服务连接失败，请联系管理员.");
						logger.warn("发送短信失败,短息服务连接失败");
						this.setSucc(null);
						break;
					}else{
						sb.append("("+tel+")发送失败.\\n");
						this.setSucc(null);
					}
				} catch (Exception e) {
					logger.warn("发送短信失败", e);
					sb.append("发送失败，短息服务连接失败，请联系管理员.");
					this.setSucc(null);
					break;
				}				
			}
		} else{
			sb.append("发送失败，参数缺失.");
		}
		if(Util.isEmpty(this.getSucc())){
			this.setSucc("N");
		}
		this.setMsg(sb.toString());
		return "sms_edit";
	}
	
	
	private List<ContactGroup> gList;
	public String batchSMS(){
		//市级
		ContactGroup shiGroup = new ContactGroup();
		shiGroup.setGroupName("全广州市扶贫系统");
		shiGroup.setShowTreeName("全广州市扶贫系统");
		shiGroup.setUserName("全广州市扶贫系统");
		shiGroup.setChilds(new ArrayList<ContactGroup>());
		
		//县级group
		PageBean bean = adminBiz.getAreaWorkOrgBean(1);
		if(bean != null && bean.getResultList() != null && bean.getResultList().size() > 0){
			List<AreaWorkOrg> newList = new ArrayList<AreaWorkOrg>();
			List<String> needList = new ArrayList<String>();
			needList.add("nsqfpb_admin");
			needList.add("zcfpb_admin");
			needList.add("lgqfpb_admin");
			needList.add("chfpb_admin");
			needList.add("baiyun");
			for(Object o : bean.getResultList()){
				AreaWorkOrg areaWorkOrg = (AreaWorkOrg) o;
				if(needList.contains(areaWorkOrg.getLoginName())){
					newList.add(areaWorkOrg);
				}
			}
			for(AreaWorkOrg a : newList){
				ContactGroup xianGroup = new ContactGroup();
				xianGroup.setGroupName(a.getOrgName());
				xianGroup.setShowTreeName(a.getOrgName());
				xianGroup.setUserName(a.getOrgName());
				xianGroup.setParentGroup(shiGroup);
				xianGroup.setIsLeaf(false);
				shiGroup.getChilds().add(xianGroup);
				xianGroup.setChilds(new ArrayList<ContactGroup>());
				xianGroup.setContactList(new ArrayList<Contact>());
				Contact c = new Contact();
				c.setContactName(a.getOrgName());
				c.setGroup(xianGroup);
				c.setTelNo(xianGroup.getSegment3());
				xianGroup.getContactList().add(c);
				if(a.getOrgName().contains("增城")){
					Contact c2 = new Contact();
					c2.setContactName("增城扶贫队");
					c2.setGroup(xianGroup);
					c2.setTelNo(xianGroup.getSegment4());
					xianGroup.getContactList().add(c2);
				}
				if(a.getOrgName().contains("从化")){
					Contact c2 = new Contact();
					c2.setContactName("从化扶贫队");
					c2.setGroup(xianGroup);
					c2.setTelNo(xianGroup.getSegment4());
					xianGroup.getContactList().add(c2);
				}
				List<ZhenWorkOrg> zList = adminBiz.getZhenWorkOrgList(a.getId());
				for(ZhenWorkOrg z : zList){
					ContactGroup zhenGroup = new ContactGroup();
					xianGroup.getChilds().add(zhenGroup);
					zhenGroup.setGroupName(z.getOrgName());
					zhenGroup.setShowTreeName(z.getOrgName());
					zhenGroup.setUserName(z.getOrgName());
					zhenGroup.setParentGroup(xianGroup);
					zhenGroup.setChilds(new ArrayList<ContactGroup>());
					zhenGroup.setContactList(new ArrayList<Contact>());
					zhenGroup.setIsLeaf(false);
					Contact c2 = new Contact();
					c2.setContactName(z.getOrgName());
					c2.setGroup(zhenGroup);
					c2.setTelNo(zhenGroup.getSegment3());
					zhenGroup.getContactList().add(c2);
					WorkTeam team = adminBiz.getEntityByUnique(WorkTeam.class, "zhen.id", z.getZhen().getId());
					if(team != null){
						Contact c3 = new Contact();
						c3.setContactName(team.getZhen().getName()+ "帮扶组");
						c3.setGroup(zhenGroup);
						c3.setTelNo(team.getSegment3());
						zhenGroup.getContactList().add(c3);
					}
					List<Org> orgList = orgBiz.getAllOrg(z.getZhen().getId());
					for(Org org : orgList){
						ContactGroup orgGroup = new ContactGroup();
						zhenGroup.getChilds().add(orgGroup);
						orgGroup.setGroupName(org.getOrgName());
						orgGroup.setShowTreeName(org.getOrgName());
						orgGroup.setUserName(org.getOrgName());
						orgGroup.setParentGroup(zhenGroup);
						orgGroup.setIsLeaf(true);
						orgGroup.setContactList(new ArrayList<Contact>());
						List<Leader> leaderList = orgBiz.getAllLeader(org);
						for(Leader l : leaderList){
							Contact c3 = new Contact();
							c3.setContactName(l.getLeaderName());
							c3.setGroup(orgGroup);
							c3.setTelNo(l.getTel());
							orgGroup.getContactList().add(c3);
						}
					}
				}
			}
		}
		
		return "batch_sms";
	}

	public String sendMessage() {
		return "mes_send";
	}

	public PageBean<SMS> getPageBean() {
		return pageBean;
	}

	public void setPageBean(PageBean<SMS> pageBean) {
		this.pageBean = pageBean;
	}

	public MessageBiz getMessageBiz() {
		return messageBiz;
	}

	public void setMessageBiz(MessageBiz messageBiz) {
		this.messageBiz = messageBiz;
	}

	public Integer getPageIndex() {
		return pageIndex;
	}

	public void setPageIndex(Integer pageIndex) {
		this.pageIndex = pageIndex;
	}

	public SMS getSms() {
		return sms;
	}

	public void setSms(SMS sms) {
		this.sms = sms;
	}

	public List<ContactGroup> getgList() {
		return gList;
	}

	public void setgList(List<ContactGroup> gList) {
		this.gList = gList;
	}

	public AdminBiz getAdminBiz() {
		return adminBiz;
	}

	public void setAdminBiz(AdminBiz adminBiz) {
		this.adminBiz = adminBiz;
	}

	public OrgBiz getOrgBiz() {
		return orgBiz;
	}

	public void setOrgBiz(OrgBiz orgBiz) {
		this.orgBiz = orgBiz;
	}

}
