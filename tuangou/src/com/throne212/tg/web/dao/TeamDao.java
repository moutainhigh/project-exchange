package com.throne212.tg.web.dao;

import com.throne212.tg.web.common.PageBean;
import com.throne212.tg.web.domain.Teams;

public interface TeamDao extends BaseDao {
	public PageBean<Teams> getAllTeams(int page);
}
