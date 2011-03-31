package com.throne212.fupin.action;

import org.apache.struts2.ServletActionContext;

import com.throne212.fupin.biz.ZixunBiz;
import com.throne212.fupin.common.PageBean;
import com.throne212.fupin.common.Util;
import com.throne212.fupin.domain.Zixun;

public class ZixunAction extends BaseAction{
	
	private PageBean pageBean;
	private Integer pageIndex;
	
	private ZixunBiz zixunBiz;

	public String zixunList(){
		pageBean = zixunBiz.getAllZixun(pageIndex);
		return "list";
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
	
	public String viewZixun(){
		zixun = zixunBiz.getEntityById(Zixun.class, zixun.getId());
		return "edit";
	}
	
	public String reply(){
		
		return "reply";
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
		}else if(Util.isEmpty(zixun.getTitle())){
			this.setMsg("咨询标题不能为空");
		}else if(Util.isEmpty(zixun.getEmail())){
			this.setMsg("Email地址不能为空");
		}else if(!zixun.getEmail().matches("^\\w+([-+.]\\w+)*@\\w+([-.]\\w+)*\\.\\w+([-.]\\w+)*$")){
			this.setMsg("Email格式不正确");
		}
		//设置IP
		String ip = ServletActionContext.getRequest().getRemoteHost();
		zixun.setIp(ip);
		zixunBiz.publicZixun(zixun);
		return index();
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
