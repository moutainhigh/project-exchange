package com.throne212.tg.web.dao;

import com.throne212.tg.web.common.PageBean;
import com.throne212.tg.web.domain.Comment;

public interface CommentDao extends BaseDao {
	public PageBean<Comment> getAllCommentsByTeamId(int page,long teamId);
	public PageBean<Comment> getAllComments(int page);

}
