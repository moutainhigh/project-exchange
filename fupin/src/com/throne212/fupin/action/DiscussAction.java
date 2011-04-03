package com.throne212.fupin.action;

import java.util.Date;

import com.opensymphony.xwork2.ActionContext;
import com.throne212.fupin.biz.DiscussBiz;
import com.throne212.fupin.common.PageBean;
import com.throne212.fupin.common.Util;
import com.throne212.fupin.common.WebConstants;
import com.throne212.fupin.domain.Discuss;
import com.throne212.fupin.domain.User;

public class DiscussAction extends BaseAction {
	
	private PageBean<Discuss> pageBean;
	private Integer pageIndex;
	private Discuss discuss;
	private DiscussBiz discussBiz;
	
	//显示发布新帖页面
public String showPublish() {
		
		return "show_dis_publish";
	}
	
//获取所有主题帖
	public String getAllDiscuss() {
		
		pageBean=discussBiz.getAllDiscuss(pageIndex);
		return "discuss_list";
		
	}
//发布新帖
	public String publishDiscuss() {
		if (discuss==null) {
			this.setMsg("发布失败，参数不完整！");
			return "publish";
			
		}
		User user=(User)ActionContext.getContext().getSession().get(WebConstants.SESS_USER_OBJ);
		discuss.setPublisher(user);
		discuss.setPid(0L);
		discuss.setRootId(0L);
		discuss.setCreateDate(new Date());
		discussBiz.publishDiscuss(discuss);
		this.setMsg("发布成功！");
		this.setSucc("Y");
		discuss=null;
		return "publish";
		
		
	}
	//回复
	public String reply(){
		User user=(User)ActionContext.getContext().getSession().get(WebConstants.SESS_USER_OBJ);
		if (discuss!=null&&discuss.getId()!=null&&!Util.isEmpty(discuss.getContent())) {//回复
			discussBiz.reply(discuss.getId(), discuss.getContent(), user);
			this.setMsg("回复成功！");
			this.setSucc("Y");
//			discuss=null;
			return showDiscussReply();
		}else if (discuss!=null&&discuss.getId()!=null) {//显示回复页面
			discuss=discussBiz.getEntityById(Discuss.class, discuss.getId());
		}else {
			this.setMsg("回复失败");
			return showDiscussReply();
		}
		return showDiscussReply();
	}
	
	
	
	
	
	//显示回复
	public String showDiscussReply() {
		if (discuss!=null&&discuss.getId()!=null) {
			discuss=discussBiz.getEntityById(Discuss.class, discuss.getId());
		}
		pageBean=discussBiz.getAllReplyOfDiscuss(pageIndex,discuss.getId());
		
		
		
		return "show_discuss_reply";
	}
	
	//删除帖子
	private Long[] ids;
	public String deleteDiscuss(){
		boolean succ = discussBiz.deleteDiscuss(ids);
		if(succ){
			this.setMsg("删除帖子成功");
		}else{
			this.setMsg("删除失败，请检查是否选择需要删除的主题帖");
		}
		return getAllDiscuss();
	}

	public PageBean<Discuss> getPageBean() {
		return pageBean;
	}

	public void setPageBean(PageBean<Discuss> pageBean) {
		this.pageBean = pageBean;
	}

	public Integer getPageIndex() {
		return pageIndex;
	}

	public void setPageIndex(Integer pageIndex) {
		this.pageIndex = pageIndex;
	}

	public Discuss getDiscuss() {
		return discuss;
	}

	public void setDiscuss(Discuss discuss) {
		this.discuss = discuss;
	}

	public DiscussBiz getDiscussBiz() {
		return discussBiz;
	}

	public void setDiscussBiz(DiscussBiz discussBiz) {
		this.discussBiz = discussBiz;
	}

	public Long[] getIds() {
		return ids;
	}

	public void setIds(Long[] ids) {
		this.ids = ids;
	}
	
	
	
	
	
	
	
}
