package com.throne212.saishi.biz.impl;

import java.util.List;

import com.throne212.saishi.biz.FrontBiz;
import com.throne212.saishi.dao.GameDao;
import com.throne212.saishi.dao.NewsDao;
import com.throne212.saishi.domain.Game;
import com.throne212.saishi.domain.News;
import com.throne212.saishi.domain.Tixing;

public class FrontBizImpl extends BaseBizImpl implements FrontBiz {
	
	private GameDao gameDao;
	private NewsDao newsDao;
	
	public GameDao getGameDao() {
		return gameDao;
	}

	public void setGameDao(GameDao gameDao) {
		this.gameDao = gameDao;
	}

	public Game getGame() {
		return gameDao.getGame();
	}

	public List<Game> getTopGames() {
		return gameDao.getTopGames();
	}

	public List<News> getTopNews() {
		return newsDao.getTopNews("普通新闻");
	}

	public List<Tixing> getTopTixing() {
		return gameDao.getTopTixing();
	}


}
