package com.throne212.saishi.dao;

import java.util.Date;

import com.throne212.saishi.common.PageBean;
import com.throne212.saishi.domain.Game;

public interface GameDao extends BaseDao {

	public PageBean<Game> getGameList(Game condition,Date startDate, Date endDate,Date fromDate,Date toDate,int page,String orderBy,String orderType,int pageSize);

	public void tixing(Game game);
}
