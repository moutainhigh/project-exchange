package com.throne212.saishi.biz;

import java.util.List;

import com.throne212.saishi.domain.Game;
import com.throne212.saishi.domain.News;
import com.throne212.saishi.domain.Tixing;

public interface FrontBiz extends BaseBiz {

	//新闻
	public List<News> getTopNews();
	
	//最近的赛事
	public List<Game> getTopGames();
	
	//最新的5条提醒
	public List<Tixing> getTopTixing();
	
	//推荐视频
	public Game getGame();
	
}
