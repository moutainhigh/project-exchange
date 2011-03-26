package com.throne212.saishi.biz;

import java.util.Date;

import com.throne212.saishi.common.PageBean;
import com.throne212.saishi.domain.Game;
import com.throne212.saishi.domain.Music;
import com.throne212.saishi.domain.News;
import com.throne212.saishi.domain.User;



public interface DataBiz extends BaseBiz {
	
	//用户
	public <T extends User> T saveUser(T user);
	public User deleteUser(User user);
	public PageBean<User> getUserList(User condition,Date fromDate,Date toDate,Integer page,String role,String orderBy,String orderType,int pageSize);

	//赛事
	public  Game saveGame(Game game);
	public Game deleteGame(Game game);
	public PageBean<Game> getGameList(Game condition,Date startDate, Date endDate,Date fromDate, Date toDate, Integer pageIndex, String orderBy, String orderType, int pageSize);
	
	//新闻
	public  News saveNews(News news);
	public News deleteNews(News news);
	public PageBean<News> getNewsList(News condition,Date fromDate, Date toDate, Integer pageIndex, String orderBy, String orderType, int pageSize);
	
	//音乐
	public  Music saveMusic(Music music);
	public Music deleteMusic(Music music);
	public PageBean<Music> getMusicList(Music condition,Date fromDate, Date toDate, Integer pageIndex, String orderBy, String orderType, int pageSize);
	
}
