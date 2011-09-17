package com.throne212.fupin.action;

import java.util.Date;
import java.util.Iterator;

import org.apache.struts2.ServletActionContext;

import com.throne212.fupin.biz.ZixunBiz;
import com.throne212.fupin.common.PageBean;
import com.throne212.fupin.common.Util;
import com.throne212.fupin.domain.ChengxiaoZhen;
import com.throne212.fupin.domain.Zixun;

public class ZixunAction extends BaseAction{
	
	private PageBean pageBean;
	private Integer pageIndex;
	
	private ZixunBiz zixunBiz;

	public String zixunList(){
		pageBean = zixunBiz.getAllZixun(pageIndex);
		return "list";
	}
	public String  zixunListPass() {
		pageBean=zixunBiz.getAllZixunPass(pageIndex);
		return "reply_list";
	}
	
	public String zixunListFront() {
		pageBean=zixunBiz.getAllZixunPass(pageIndex);
		return "zixun_front_list";
	}
	
	
	private Long[] ids;
	public String deleteZixun(){
		boolean succ = zixunBiz.deleteZixun(ids);
		if(succ){
			this.setMsg("删除业务咨询成功");
		}else{
			this.setMsg("删除失败，请检查是否争取选择需要删除的咨询信息");
		}
		return zixunList();
	}
	public String passZixun() {
		if (ids == null || ids.length < 1) {
			this.setMsg("请选择咨询信息！");
			return zixunList();
		} else {
			for (Long id : ids) {
				zixunBiz.passZixun(id, true);
			}
		}
		this.setMsg("通过审核-----成功！");
		return zixunList();
	}
	
	public String notPassZixun() {

		if (ids == null || ids.length < 1) {
			this.setMsg("请选择咨询信息！");
			return zixunList();
		} else {
			for (Long id : ids) {
				zixunBiz.passZixun(id, false);
			}
		}
		this.setMsg("不通过审核-----成功！");
		return zixunList();
	
	}
	
	public String viewZixun(){
		zixun = zixunBiz.getEntityById(Zixun.class, zixun.getId());
		return "edit";
	}
	
	public String reply(){
		if (zixun==null) {
			this.setMsg("回复失败，参数不完整！");
			return "reply";
			
		}
		if (zixun.getId()!=null&&!Util.isEmpty(zixun.getTitle())) { //回复咨询信息
//			zixun=zixunBiz.replyZixun(zixun.getId(), zixun.getReply());
			Zixun zixunInDB=zixunBiz.getEntityById(Zixun.class, zixun.getId());
			zixunInDB.setReply(zixun.getReply());
			zixunInDB.setReplyDate(new Date());
			zixunBiz.saveOrUpdateEntity(zixunInDB);
			this.setMsg("回复成功！");
			this.setSucc("Y");
			zixun=null;
			return "reply";
		}else if (zixun != null && zixun.getId() != null) {// 查看详情
			zixun = zixunBiz.getEntityById(Zixun.class, zixun.getId());
		}
		return "reply";
	}
	public String viewForReply() {
		zixun = zixunBiz.getEntityById(Zixun.class, zixun.getId());
		return "view";
	}
	//前台
	private Zixun zixun;
	public String index(){
		pageBean = zixunBiz.getAllZixun(pageIndex);
		return "index";
	}
	public String publish(){
		//数据校验
		if(Util.isEmpty(zixun.getContent())){
			this.setMsg("咨询内容不能为空");
			return "zixun_publish";
		}else if(Util.isEmpty(zixun.getTitle())){
			this.setMsg("咨询标题不能为空");
			return "zixun_publish";
		}else if(Util.isEmpty(zixun.getEmail())){
			this.setMsg("Email地址不能为空");
			return "zixun_publish";
		}else if(!zixun.getEmail().matches("^\\w+([-+.]\\w+)*@\\w+([-.]\\w+)*\\.\\w+([-.]\\w+)*$")){
			this.setMsg("Email格式不正确");
			return "zixun_publish";
		}
		//设置IP
		String ip = ServletActionContext.getRequest().getRemoteHost();
		zixun.setIp(ip);
		zixun.setPass(false);
		zixun.setCreateDate(new Date());
		zixunBiz.publicZixun(zixun);
		this.setMsg("成功提交咨询！");
		return zixunListFront();
		//return "zixun_publish";
		//return index();
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

	public ZixunBiz getZixunBiz() {
		return zixunBiz;
	}

	public void setZixunBiz(ZixunBiz zixunBiz) {
		this.zixunBiz = zixunBiz;
	}

	public Long[] getIds() {
		return ids;
	}

	public void setIds(Long[] ids) {
		this.ids = ids;
	}

	public Zixun getZixun() {
		return zixun;
	}

	public void setZixun(Zixun zixun) {
		this.zixun = zixun;
	}
	
	
}
