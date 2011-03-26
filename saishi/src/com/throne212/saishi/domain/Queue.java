package com.throne212.saishi.domain;


public class Queue extends MyEntity {
	private String client;
	private Game game;

	public String getClient() {
		return client;
	}

	public void setClient(String client) {
		this.client = client;
	}

	public Game getGame() {
		return game;
	}

	public void setGame(Game game) {
		this.game = game;
	}

}
