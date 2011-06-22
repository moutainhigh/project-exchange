package com.throne212.saishi.action;

import java.util.Date;
import java.util.List;

import org.apache.struts2.ServletActionContext;

import com.throne212.saishi.biz.DataBiz;
import com.throne212.saishi.domain.Content;
import com.throne212.saishi.domain.Game;
import com.throne212.saishi.domain.InstallLog;
import com.throne212.saishi.domain.News;
import com.throne212.saishi.domain.Tixing;


public class FrontAction extends BaseAction {
	private DataBiz dataBiz;

	public String news() {
		
		return "news";
	}

	private Content c;
	private List<News> newsList;
	private List<Tixing> tixingList;
	public String index() {
		List<Content> list = dataBiz.getAll(Content.class);
		if(list != null && list.size() > 0)
			c = list.get(0);
		newsList = dataBiz.getTop10News();
		tixingList = dataBiz.getTop5Tixing();
		return "index";
	}
	
	public String install(){
		String ip = ServletActionContext.getRequest().getRemoteHost();
		InstallLog log = new InstallLog();
		log.setIp(ip);
		log.setType("安装");
		log.setDate(new Date());
		dataBiz.saveOrUpdateEntity(log);
		return "install";
	}
	
	public String uninstall(){
		String ip = ServletActionContext.getRequest().getRemoteHost();
		InstallLog log = new InstallLog();
		log.setIp(ip);
		log.setType("卸载");
		log.setDate(new Date());
		dataBiz.saveOrUpdateEntity(log);
		return "uninstall";
	}
	private Long gameId;
	private Game game;
	public String info(){
		if(gameId==null)
			return null;
		game = dataBiz.getEntityById(Game.class, gameId);
		return "info";
	}
	
	public Content getC() {
		return c;
	}
	public void setC(Content c) {
		this.c = c;
	}


	public List<News> getNewsList() {
		return newsList;
	}

	public void setNewsList(List<News> newsList) {
		this.newsList = newsList;
	}

	public DataBiz getDataBiz() {
		return dataBiz;
	}

	public void setDataBiz(DataBiz dataBiz) {
		this.dataBiz = dataBiz;
	}

	public List<Tixing> getTixingList() {
		return tixingList;
	}

	public void setTixingList(List<Tixing> tixingList) {
		this.tixingList = tixingList;
	}

	public Long getGameId() {
		return gameId;
	}

	public void setGameId(Long gameId) {
		this.gameId = gameId;
	}

	public Game getGame() {
		return game;
	}

	public void setGame(Game game) {
		this.game = game;
	}
}
