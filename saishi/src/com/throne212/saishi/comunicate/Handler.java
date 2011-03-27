package com.throne212.saishi.comunicate;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.net.Socket;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.List;

import com.throne212.saishi.biz.DataBiz;
import com.throne212.saishi.common.Util;
import com.throne212.saishi.domain.Game;
import com.throne212.saishi.domain.Queue;

public class Handler implements Runnable {
	private Socket socket;
	private String client;
	public static DataBiz dataBiz = null;

	public Handler(Socket socket) {
		this.socket = socket;
		this.client = System.currentTimeMillis()+"";
		MultiThreadServer.list.add(client);
	}

	public String getSaishiMsg() {
		
		try {
			Queue q = dataBiz.getEntityByUnique(Queue.class, "client", client);
			if(q!=null){
				Game game = q.getGame();
				StringBuffer sb = new StringBuffer();
				if (game != null) {
					sb.append(game.getTitle());
					sb.append(" ");
					sb.append("开始时间:");
					sb.append(Util.getDate(game.getStartDate()));
					sb.append(" ");
					sb.append(game.getHour() + "时");
					sb.append(game.getMinute() + "分");
					//删除队列记录
					dataBiz.deleteEntity(Queue.class, q.getId());
					return sb.toString();
				}
			}
			
		} catch (RuntimeException e) {
			e.printStackTrace();
		}
		return "";
	}

	private PrintWriter getWriter(Socket socket) throws IOException {
		OutputStream socketOut = socket.getOutputStream();
		return new PrintWriter(socketOut, true);
	}

	private BufferedReader getReader(Socket socket) throws IOException {
		InputStream socketIn = socket.getInputStream();
		return new BufferedReader(new InputStreamReader(socketIn));
	}

	public String echo(String msg) {
		return msg;
	}

	public void run() {
		try {
			System.out.println("New connection accepted " + socket.getInetAddress() + ":" + socket.getPort());
			BufferedReader br = getReader(socket);
			PrintWriter pw = getWriter(socket);
			String msg = null;
			while ((msg = br.readLine()) != null) {
				System.out.println("收到的信息：["+msg+"]");
				if (msg.equals("0001")) {
					pw.print(echo(msg) + "1" + "ping");
				} else if (msg.equals("0002")) {//获取及时赛事
					pw.print(echo(msg) + "1" + getSaishiMsg());
				} else if (msg.equals("0003")) {//获取今日赛事
					pw.print(echo(msg) + "1" + getSaishiMsg());
				} else if (msg.equals("bye")){
					break;
				} else {
					pw.print("Wrong Command Format " + echo(msg));
				}
				pw.print("\n\r");
				pw.flush();
			}
			MultiThreadServer.list.remove(client);
		} catch (IOException e) {
			e.printStackTrace();
			//意外退出
			MultiThreadServer.list.remove(client);
		} finally {
			try {
				if (socket != null)
					socket.close();
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
	}
}