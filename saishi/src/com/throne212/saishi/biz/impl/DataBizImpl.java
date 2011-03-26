package com.throne212.saishi.biz.impl;

import java.util.Date;

import com.throne212.saishi.biz.DataBiz;
import com.throne212.saishi.common.PageBean;
import com.throne212.saishi.dao.GameDao;
import com.throne212.saishi.dao.MusicDao;
import com.throne212.saishi.dao.NewsDao;
import com.throne212.saishi.dao.UserDao;
import com.throne212.saishi.domain.Game;
import com.throne212.saishi.domain.Music;
import com.throne212.saishi.domain.News;
import com.throne212.saishi.domain.User;

public class DataBizImpl extends BaseBizImpl implements DataBiz {
	private UserDao userDao;
	private GameDao gameDao;
	private NewsDao newsDao;
	private MusicDao musicDao;
	//用户管理
	public <T extends User> T saveUser(T user) {
		// 判断是否为新的用户
		if (user.getId() == null) {
			user.setCreateDate(new Date());
			baseDao.saveOrUpdate(user);
			logger.info("添加用户【" + user.getLoginName() + "】成功");
		} else {
			User userInDB = baseDao.getEntityById(User.class, user.getId());
			user.setCreateDate(userInDB.getCreateDate());
			user.setCreateName(userInDB.getCreateName());
			baseDao.saveOrUpdate(user);
			logger.info("更新用户【" + user.getLoginName() + "】成功");
		}
		return user;
	}

	public User deleteUser(User user) {
		user = baseDao.getEntityById(User.class, user.getId());
		baseDao.delete(user);
		logger.info("删除用户【" + user.getLoginName() + "】成功");
		return user;
	}

	public PageBean<User> getUserList(User condition, Date fromDate, Date toDate, Integer page, String role,String orderBy,String orderType,int pageSize) {
		int pageIndex = 1;
		if (page != null) {
			pageIndex = page.intValue();
		}
		return userDao.getUserList(condition, fromDate, toDate, pageIndex, role, orderBy,orderType,pageSize);
	}

	public Game deleteGame(Game game) {
		game = baseDao.getEntityById(Game.class, game.getId());
		baseDao.delete(game);
		logger.info("删除赛事【" + game.getType() + "】成功");
		return game;
	}

	public PageBean<Game> getGameList(Game condition, Date startDate, Date endDate, Date fromDate, Date toDate, Integer page, String orderBy, String orderType, int pageSize) {
		int pageIndex = 1;
		if (page != null) {
			pageIndex = page.intValue();
		}
		return gameDao.getGameList(condition, startDate, endDate, fromDate, toDate, pageIndex, orderBy, orderType, pageSize);
	}

	public Game saveGame(Game game) {
		// 判断是否为新的赛事
		if (game.getId() == null) {
			game.setCreateDate(new Date());
			baseDao.saveOrUpdate(game);
			logger.info("添加赛事类型【" + game.getType() + "】成功");
		} else {
			Game gameInDB = baseDao.getEntityById(Game.class, game.getId());
			game.setCreateDate(gameInDB.getCreateDate());
			game.setCreateName(gameInDB.getCreateName());
			baseDao.saveOrUpdate(game);
			logger.info("更新赛事类型【" + game.getType() + "】成功");
		}
		return game;
	
	}
	

	public News saveNews(News news) {
		// 判断是否为新的新闻
		if (news.getId() == null) {
			news.setCreateDate(new Date());
			baseDao.saveOrUpdate(news);
			logger.info("添加新闻【" + news.getTitle() + "】成功");
		} else {
			News newsInDB = baseDao.getEntityById(News.class, news.getId());
			news.setCreateDate(newsInDB.getCreateDate());
			news.setCreateName(newsInDB.getCreateName());
			baseDao.saveOrUpdate(news);
			logger.info("更新新闻【" + news.getTitle() + "】成功");
		}
		return news;
	}
	
	public PageBean<News> getNewsList(News condition, Date fromDate, Date toDate, Integer page, String orderBy, String orderType, int pageSize) {
		int pageIndex = 1;
		if (page != null) {
			pageIndex = page.intValue();
		}
		return newsDao.getNewsList(condition, fromDate, toDate, pageIndex, orderBy, orderType, pageSize);
	}

	public News deleteNews(News news) {
		news = baseDao.getEntityById(News.class, news.getId());
		baseDao.delete(news);
		logger.info("删除新闻【" + news.getTitle() + "】成功");
		return news;
	}

//音乐管理
	public PageBean<Music> getMusicList(Music condition, Date fromDate,
			Date toDate, Integer page, String orderBy, String orderType,
			int pageSize) {
		int pageIndex = 1;
		if (page != null) {
			pageIndex = page.intValue();
		}
		return musicDao.getMusicList(condition, fromDate, toDate, pageIndex, orderBy, orderType, pageSize);
	}
	//保存音乐
	public Music saveMusic(Music music) {

		if (music.getId() == null) {
			music.setCreateDate(new Date());
			baseDao.saveOrUpdate(music);
			logger.info("上传成功");
		} else {
			baseDao.saveOrUpdate(music);
			logger.info("更新成功");
		}
		return music;
	
	}	
	//删除音乐
	public Music deleteMusic(Music music) {
		music = baseDao.getEntityById(Music.class, music.getId());
		baseDao.delete(music);
		logger.info("删除音乐【" + music.getSongName() + "】成功");
		return music;
	}
	
	//提醒
	public void tixing(Long gameId){
		Game game = userDao.getEntityById(Game.class, gameId);
		gameDao.tixing(game);
	}

	public UserDao getUserDao() {
		return userDao;
	}

	public void setUserDao(UserDao userDao) {
		this.userDao = userDao;
	}

	public GameDao getGameDao() {
		return gameDao;
	}

	public void setGameDao(GameDao gameDao) {
		this.gameDao = gameDao;
	}

	public NewsDao getNewsDao() {
		return newsDao;
	}

	public void setNewsDao(NewsDao newsDao) {
		this.newsDao = newsDao;
	}

	public MusicDao getMusicDao() {
		return musicDao;
	}

	public void setMusicDao(MusicDao musicDao) {
		this.musicDao = musicDao;
	}


}
