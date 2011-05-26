package com.throne212.saishi.domain;

import java.util.Date;

//最近的提醒
public class Tixing extends MyEntity {
	private Game game;
	private Date date;

	public Game getGame() {
		return game;
	}

	public void setGame(Game game) {
		this.game = game;
	}

	public Date getDate() {
		return date;
	}

	public void setDate(Date date) {
		this.date = date;
	}

}
