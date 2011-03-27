package com.throne212.saishi.dao;

import java.util.Date;
import java.util.List;

import com.throne212.saishi.common.PageBean;
import com.throne212.saishi.domain.Game;
import com.throne212.saishi.domain.Queue;

public interface GameDao extends BaseDao {

	public PageBean<Game> getGameList(Game condition,Date startDate, Date endDate,Date fromDate,Date toDate,int page,String orderBy,String orderType,int pageSize);

	public void tixing(Game game);
	
	//最近的赛事
	public List<Game> getTopGames();
	
	//最新的5条提醒
	public List<Queue> getTopTixing();
	
	//推荐视频
	public Game getGame();
}
