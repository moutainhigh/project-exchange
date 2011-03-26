package com.throne212.saishi.comunicate;

import java.io.IOException;
import java.net.ServerSocket;
import java.net.Socket;
import java.util.ArrayList;
import java.util.List;
import java.util.concurrent.ExecutorService;
import java.util.concurrent.Executors;

public class MultiThreadServer implements Runnable{
	public static List<String> list = new ArrayList<String>();
	private int port = 2086;
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

	public void run() {
		// TODO Auto-generated method stub
		service();
	}

}

