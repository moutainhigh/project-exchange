package com.throne212.tg.web.action;

import com.mysql.jdbc.Util;
import com.opensymphony.xwork2.ActionContext;
import com.throne212.tg.web.biz.CommonBiz;
import com.throne212.tg.web.common.WebConstants;
import com.throne212.tg.web.domain.Comment;
import com.throne212.tg.web.domain.Teams;
import com.throne212.tg.web.domain.User;

public class CommentAction extends BaseAction {
	//添加团购信息评论
	private CommonBiz commonBiz;
	private Comment comment;
	private Teams team;
	Integer pageIndex=0;
	
	public  String execute() {
		User user =(User)ActionContext.getContext().getSession().get(WebConstants.SESS_USER_OBJ);
		if (user==null) {
			this.setMsg("请先登录后在进行评价！");
			return "fail";
		} else {
			team=commonBiz.getEntityById(Teams.class, team.getId());
			if (comment.getContent().length()>512) {
				this.setMsg("评论内容过多！");
				return "comment";
				
			}
			if ("".equals(comment.getContent())) {
				this.setMsg("请输入评论内容！");
				return "comment";
				
			}
			logger.debug(team.getId());
			team.setCommentTimes(team.getCommentTimes()+1);
			comment.setTeam(team);
			commonBiz.saveOrUpdateEntity(team);
			commonBiz.saveOrUpdateEntity(comment);
			this.setMsg("评论成功！");
			
			return "comment";

		}
		
		
	}
	public Teams getTeam() {
		return team;
	}
	public void setTeam(Teams team) {
		this.team = team;
	}
	public CommonBiz getCommonBiz() {
		return commonBiz;
	}
	public void setCommonBiz(CommonBiz commonBiz) {
		this.commonBiz = commonBiz;
	}
	public Comment getComment() {
		return comment;
	}
	public void setComment(Comment comment) {
		this.comment = comment;
	}
	public Integer getPageIndex() {
		return pageIndex;
	}
	public void setPageIndex(Integer pageIndex) {
		this.pageIndex = pageIndex;
	}
}
