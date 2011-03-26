package com.throne212.saishi.comunicate;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.net.ServerSocket;
import java.net.Socket;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.concurrent.ExecutorService;
import java.util.concurrent.Executors;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import com.throne212.saishi.biz.DataBiz;
import com.throne212.saishi.domain.Game;

public class MultiThreadServer {
	private int port = 8821;
	private ServerSocket serverSocket;
	private ExecutorService executorService;// 线程池

	public MultiThreadServer() throws IOException {
		serverSocket = new ServerSocket(port);
		// Runtime的availableProcessor()方法返回当前系统的CPU数目.
		executorService = Executors.newCachedThreadPool();
		System.out.println("服务器启动");
	}

	public void service() {
		while (true) {
			Socket socket = null;
			try {
				// 接收客户连接,只要客户进行了连接,就会触发accept();从而建立连接
				socket = serverSocket.accept();
				executorService.execute(new Handler(socket));

			} catch (Exception e) {
				e.printStackTrace();
			}
		}
	}

	public static void main(String[] args) throws IOException {
		new MultiThreadServer().service();
	}

}

class Handler implements Runnable {
	private Socket socket;
	private static DataBiz dataBiz = null;
	static {
		ApplicationContext ac = new ClassPathXmlApplicationContext("spring*.xml");
		dataBiz = (DataBiz) ac.getBean("dataBiz");
	}

	public Handler(Socket socket) {
		this.socket = socket;
	}

	public String getSaishiMsg() {

		List<Game> gameList = dataBiz.getAll(Game.class);
		Game gameBack = gameList.get(0);
		DateFormat df = new SimpleDateFormat("yyyy-MM-dd");
		StringBuffer sb = new StringBuffer();
		if (gameBack != null) {
			sb.append("开始时间:");
			sb.append(df.format(gameBack.getStartDate()));
			sb.append(" ");
			sb.append(gameBack.getHour() + "时");
			sb.append(gameBack.getMinute() + "分");
			sb.append("|");
			sb.append("选手:");
			sb.append(gameBack.getPlayer());
			sb.append("|");
			sb.append("类型:");
			sb.append(gameBack.getType());
			sb.append("|");
			sb.append("时长:");
			sb.append(gameBack.getDuration());
			sb.append("|");
			sb.append("链接:");
			sb.append(gameBack.getUrl());
			sb.append("|");
			sb.append("简介:");
			sb.append(gameBack.getIntro());
			sb.append("\n");
			return sb.toString();
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
				System.out.println(msg);
				if (msg.equals("0001")) {
					pw.println(echo(msg) + "1" + "ping");
				} else if (msg.equals("0002")) {//获取及时赛事
					pw.println(echo(msg) + "1" + getSaishiMsg());
				} else if (msg.equals("0003")) {//获取今日赛事
					pw.println(echo(msg) + "1" + getSaishiMsg());
				} else if (msg.equals("bye"))
					break;
				else {
					pw.println("Wrong Command Format " + echo(msg));
				}
				pw.flush();
			}
		} catch (IOException e) {
			e.printStackTrace();
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
