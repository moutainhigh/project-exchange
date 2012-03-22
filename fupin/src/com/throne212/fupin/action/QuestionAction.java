package com.throne212.fupin.action;

import com.opensymphony.xwork2.ActionContext;
import com.throne212.fupin.biz.QuestionBiz;
import com.throne212.fupin.common.PageBean;
import com.throne212.fupin.common.QuestionStatDO;
import com.throne212.fupin.common.WebConstants;
import com.throne212.fupin.domain.Question1;
import com.throne212.fupin.domain.Question2;


public class QuestionAction extends BaseAction {
	
	private PageBean pageBean;
	private Integer pageIndex;
	private Long areaId;
	private Long zhenId;
	private Long cunId;
	private String familyName;
	
	private Question1 q1;
	private Question2 q2;
	private QuestionStatDO q;
	
	private QuestionBiz questionBiz;
	
	private String isShow;
	
	//一
	public String list1(){
		pageBean = questionBiz.listQuestion1(areaId, zhenId, cunId, pageIndex);
		return "list1";
	}
	public String uploadQuestion1(){
		String fileName = (String) ActionContext.getContext().getSession().get(WebConstants.SESS_IMAGE);
		if(fileName!=null){
			String msg = null;
			try {
				msg = questionBiz.importQuestion1(fileName);
				this.setSucc("Y");
				this.setMsg("数据导入成功\\n"+msg);
			} catch (Exception e) {
				e.printStackTrace();
				this.setMsg("数据导入失败\\n"+e.getMessage());
			}
		}
		return "upload1";
	}
	public String deleteQuestion1(){
		if(q1!=null && q1.getId() != null){
			questionBiz.deleteEntity(Question1.class, q1.getId());
			this.setMsg("删除成功");
		}else{
			String[] ids = (String[]) ActionContext.getContext().getParameters().get("ids");
			if(ids != null && ids.length > 0){
				for(String idStr : ids){
					Long id = Long.parseLong(idStr);
					Question1 q = questionBiz.getEntityById(Question1.class, id);
					if(q != null){
						questionBiz.deleteEntity(Question1.class, id);
						this.setMsg("删除成功");
					}
				}
			}
		}
		return list1();
	}
	public String show1(){
		if(q1!=null && q1.getId() != null){
			q1 = questionBiz.getEntityById(Question1.class, q1.getId());
		}
		isShow = "Y";
		return "show1";
	}
	public String stat1(){
		if(areaId != null || zhenId != null)
			q = questionBiz.statQuestion1(areaId, zhenId);
		return "stat1";
	}
	
	//二
	public String list2(){
		pageBean = questionBiz.listQuestion2(areaId, zhenId, cunId,familyName, pageIndex);
		return "list2";
	}
	public String uploadQuestion2(){
		String fileName = (String) ActionContext.getContext().getSession().get(WebConstants.SESS_IMAGE);
		if(fileName!=null){
			String msg = null;
			try {
				msg = questionBiz.importQuestion2(fileName);
				this.setSucc("Y");
				this.setMsg("数据导入成功\\n"+msg);
			} catch (Exception e) {
				e.printStackTrace();
				this.setMsg("数据导入失败\\n"+e.getMessage());
			}
		}
		return "upload2";
	}
	public String deleteQuestion2(){
		if(q2!=null && q2.getId() != null){
			questionBiz.deleteEntity(Question2.class, q2.getId());
			this.setMsg("删除成功");
		}else{
			String[] ids = (String[]) ActionContext.getContext().getParameters().get("ids");
			if(ids != null && ids.length > 0){
				for(String idStr : ids){
					Long id = Long.parseLong(idStr);
					Question2 q = questionBiz.getEntityById(Question2.class, id);
					if(q != null){
						questionBiz.deleteEntity(Question2.class, id);
						this.setMsg("删除成功");
					}
				}
			}
		}
		return list2();
	}
	public String show2(){
		if(q2!=null && q2.getId() != null){
			q2 = questionBiz.getEntityById(Question2.class, q2.getId());
		}
		isShow = "Y";
		return "show2";
	}
	public String stat2(){
		if(areaId != null || zhenId != null || cunId != null)
			q = questionBiz.statQuestion2(areaId, zhenId, cunId);
		return "stat2";
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

	public Long getAreaId() {
		return areaId;
	}

	public void setAreaId(Long areaId) {
		this.areaId = areaId;
	}

	public Long getZhenId() {
		return zhenId;
	}

	public void setZhenId(Long zhenId) {
		this.zhenId = zhenId;
	}

	public Long getCunId() {
		return cunId;
	}

	public void setCunId(Long cunId) {
		this.cunId = cunId;
	}

	public Question1 getQ1() {
		return q1;
	}

	public void setQ1(Question1 q1) {
		this.q1 = q1;
	}

	public Question2 getQ2() {
		return q2;
	}

	public void setQ2(Question2 q2) {
		this.q2 = q2;
	}

	public QuestionBiz getQuestionBiz() {
		return questionBiz;
	}

	public void setQuestionBiz(QuestionBiz questionBiz) {
		this.questionBiz = questionBiz;
	}

	public String getFamilyName() {
		return familyName;
	}

	public void setFamilyName(String familyName) {
		this.familyName = familyName;
	}
	public String getIsShow() {
		return isShow;
	}
	public void setIsShow(String isShow) {
		this.isShow = isShow;
	}
	public QuestionStatDO getQ() {
		return q;
	}
	public void setQ(QuestionStatDO q) {
		this.q = q;
	}
	
}
