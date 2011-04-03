package com.throne212.fupin.action;

import java.io.ByteArrayInputStream;
import java.io.File;
import java.io.InputStream;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import com.opensymphony.xwork2.ActionContext;
import com.throne212.fupin.biz.MessageBiz;
import com.throne212.fupin.common.PageBean;
import com.throne212.fupin.common.WebConstants;
import com.throne212.fupin.domain.Message;
import com.throne212.fupin.domain.User;


public class MessageAction extends BaseAction {
	
	private Message message;
	private PageBean<Message> pageBean;
	private MessageBiz messageBiz;
	private Integer pageIndex;
	public String showSendMessage() {
		
		return "mes_send";
	}
	public String getAllMessageToUser() {
		User user=(User)ActionContext.getContext().getSession().get(WebConstants.SESS_USER_OBJ);
		pageBean=messageBiz.getAllMessageToUser(pageIndex, user.getLoginName());
		return "mes_list";
		
	}
	public String sendMessage() {

		if (message == null) {
			this.setMsg("通知发送失败，请检查数据是否录入完整");
			return "mes_send";
		}
		if (message != null && message.getTitle() != null) {// 发送通知
			String recieverString = message.getRecieverString();
			String[] reciever = recieverString.split("[+]");
			List<String> notExist = new ArrayList<String>();
			for (String loginName : reciever) {
				logger.debug(loginName);
				User user = messageBiz.getEntityByUnique(User.class,
						"loginName", loginName);
				if (user == null) {
					notExist.add(loginName);
				} else {
					Date sendDate = new Date();
					Message sendMessage = new Message();
					sendMessage.setTitle(message.getTitle());
					sendMessage.setContent(message.getContent());
					sendMessage.setCreateDate(sendDate);
					sendMessage.setReciever(user);
					
					String attach = (String) ActionContext.getContext()
							.getSession().get(WebConstants.SESS_ATTACH);
					if (attach != null) {
						sendMessage.setAttatch(attach);
						ActionContext.getContext().getSession().remove(
								WebConstants.SESS_ATTACH);
					} else {
						
					}
					User currUser = (User) ActionContext.getContext()
							.getSession().get(WebConstants.SESS_USER_OBJ);
					sendMessage.setSender(currUser);
					messageBiz.saveOrUpdateEntity(sendMessage);

				}
			}
			if (notExist != null && notExist.size() > 0) {
				StringBuffer sBuffer = new StringBuffer();
				for (String user : notExist) {
					sBuffer.append(user + "+");

				}
				String sb= sBuffer.toString();
				this.setMsg("通知发送成功,标题【" + message.getTitle()
						+ "】 以下用户不存在:"+sb.substring(0, sb.length()-1)+"请重新填入并发送：" );
			} else {
				this.setMsg("通知发送成功,标题【" + message.getTitle() + "】");
			}
			this.setSucc("Y");
			message = null;

			return "mes_send";
		} else if (message != null && message.getId() != null) {// 查看详情
			message = messageBiz.getEntityById(Message.class, message.getId());
			return "mes_send";
		}
		return "mes_send";
	}
	private Long[] ids;
	public String  deleteMessage() {
		boolean succ = messageBiz.deleteMessage(ids);
		if(succ){
			this.setMsg("删除通知消息成功");
		}else{
			this.setMsg("删除失败，请检查是否选择需要删除的通知消息");
		}
		return getAllMessageToUser();
		
	}
	
	public InputStream getInputStream() throws Exception {

		Message messageInDB= messageBiz.getEntityById(Message.class, message.getId());
		String attach=messageInDB.getAttatch();
		String path = Thread.currentThread().getContextClassLoader().getResource("/").getPath();
		logger.debug(">>>>>>>>>>>>>>>>>>>"+path);
		logger.debug("+++++++++"+Thread.currentThread().getContextClassLoader().getResource("/"));
		path = path.substring(0, path.indexOf("WEB-INF"));
		logger.debug("》》》》》》》》》》》》"+path);
		path += "uploadAttach";
		return new ByteArrayInputStream((path+File.separator+attach).getBytes());

		} 
	
	public String getAttachDownload() throws Exception {
		getInputStream();
		return "download";
		
	}
	

	public Message getMessage() {
		return message;
	}
	public void setMessage(Message message) {
		this.message = message;
	}
	public PageBean<Message> getPageBean() {
		return pageBean;
	}
	public void setPageBean(PageBean<Message> pageBean) {
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
	public Long[] getIds() {
		return ids;
	}
	public void setIds(Long[] ids) {
		this.ids = ids;
	}
	
	
	

}
