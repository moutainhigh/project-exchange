package com.throne212.fupin.action;

import java.util.ArrayList;
import java.util.Date;
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
import com.throne212.fupin.domain.BatchSMS;
import com.throne212.fupin.domain.Contact;
import com.throne212.fupin.domain.ContactGroup;
import com.throne212.fupin.domain.Leader;
import com.throne212.fupin.domain.Org;
import com.throne212.fupin.domain.SMS;
import com.throne212.fupin.domain.User;
import com.throne212.fupin.domain.UserContact;
import com.throne212.fupin.domain.WorkTeam;
import com.throne212.fupin.domain.ZhenWorkOrg;

public class SMSAction extends BaseAction {

	private PageBean pageBean;
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
		if(1 == 1)
			return "batch_sms";
		
		if(ActionContext.getContext().getSession().get("gList") != null){
			gList = (List<ContactGroup>) ActionContext.getContext().getSession().get("gList");
			return "batch_sms";
		}
		long i = 0;
		//市级
		ContactGroup shiGroup = new ContactGroup();
		shiGroup.setId(i++);
		shiGroup.setGroupName("全广州市扶贫系统");
		shiGroup.setShowTreeName("全广州市扶贫系统");
		shiGroup.setUserName("全广州市扶贫系统");
		shiGroup.setShowTreeName("全广州市扶贫系统");
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
				xianGroup.setId(i++);
				xianGroup.setGroupName(a.getArea().getName());
				xianGroup.setShowTreeName(a.getArea().getName());
				xianGroup.setUserName(a.getArea().getName());
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
				List<ZhenWorkOrg> zList = adminBiz.getZhenWorkOrgList(a.getArea().getId());
				for(ZhenWorkOrg z : zList){
					ContactGroup zhenGroup = new ContactGroup();
					zhenGroup.setId(i++);
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
						orgGroup.setId(i++);
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
		gList = new ArrayList<ContactGroup>();
		gList.add(shiGroup);
		fillContactGroup(shiGroup, gList, 1);
		ActionContext.getContext().getSession().put("gList", gList);
		return "batch_sms";
	}
	
	private void fillContactGroup(ContactGroup g, List<ContactGroup> list, int level){
		if(g.getChilds() == null || g.getChilds().size() == 0)
			return;
		String blank = "";
		for (int i = 0; i < level; i++)
			blank += "&nbsp;&nbsp;";
		for(ContactGroup cg : g.getChilds()){
			cg.setShowTreeName(blank + cg.getGroupName());
			list.add(cg);
			fillContactGroup(cg, list, level+1);
		}
	}
	
	
	private String receiver;
	private String content;
	public String sendBatchSMS(){
		if(Util.isEmpty(receiver) || Util.isEmpty(content)){
			this.setMsg("请输入完整信息和选择接收人信息");
			return "batch_sms";
		}
		if (content.length()>120){
			this.setMsg("短信内容过长，请注意不要超过120个汉字");
			return "batch_sms";
		}
		
//		try {
//			Thread.sleep(10000);
//		} catch (InterruptedException e1) {
//			// TODO Auto-generated catch block
//			e1.printStackTrace();
//		}
		
		User user = (User) ActionContext.getContext().getSession().get(WebConstants.SESS_USER_OBJ);
		int sum = 0;
		String[] reArr = receiver.split(",");
		for (String s : reArr) {
			String mobile = null;
			if(s.contains("user_")){
				String[] arr = s.split("_");
				Long id = Long.parseLong(arr[arr.length - 1]);
				UserContact c = adminBiz.getEntityById(UserContact.class, id);
				if(c != null)
					mobile = c.getMobile();
			}
			if(s.contains("leader_")){
				Leader leader = adminBiz.getEntityById(Leader.class, Long.parseLong(s.split("_")[1]));
				if(leader != null)
					mobile = leader.getTel();
			}
			if(mobile == null)
				continue;
			logger.info("正在发送短信给：" + mobile);
			int rst = -1;
			try {
				rst = Util.sendMessage(mobile, content, user.getLoginName(), user.getId().intValue());//0为成功
				if(rst == 0){
					sum++;
					logger.info("成功发送短信给：" + mobile);
				}else if(rst == -108){
					logger.warn("发送短信失败,短息服务连接失败");
					break;
				}else{
					//ignore
				}
			} catch (Exception e) {
				logger.warn("发送短信失败", e);
				break;
			}
		}
		if(sum == 0){
			this.setMsg("短信发送失败，请检查与短信服务器之间的连接");
		}else{
			this.setMsg("成功发送短信"+sum+"条");
			BatchSMS s = new BatchSMS();
			s.setContent(content);
			s.setDate(new Date());
			s.setReceiver(receiver);
			adminBiz.saveOrUpdateEntity(s);
		}		
		return "batch_sms";
	}
	
	public String batchList(){
		pageBean = messageBiz.getAllBatchSMS(pageIndex);
		return "batch_list";
	}
	
	public String sendMessage() {
		return "mes_send";
	}

	public PageBean getPageBean() {
		return pageBean;
	}

	public void setPageBean(PageBean pageBean) {
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

	public String getReceiver() {
		return receiver;
	}

	public void setReceiver(String receiver) {
		this.receiver = receiver;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

}
