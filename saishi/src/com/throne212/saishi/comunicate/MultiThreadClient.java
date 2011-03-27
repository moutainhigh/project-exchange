package com.throne212.saishi.comunicate;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.OutputStream;
import java.net.Socket;
import java.util.concurrent.ExecutorService;
import java.util.concurrent.Executors;

public class MultiThreadClient {
    
    public static void main(String[] args) {
        int numTasks = 1;
        
        ExecutorService exec = Executors.newCachedThreadPool();

        for (int i = 0; i < numTasks; i++) {
            exec.execute(createTask(i));
        }

    }

    // 定义一个简单的任务
    private static Runnable createTask(final int taskID) {
        return new Runnable() {
            private Socket socket = null;
            private int port=2086;

            public void run() {
                System.out.println("Task " + taskID + ":start");
                try {                    
                    socket = new Socket("host1983.com", port);
                    OutputStream socketOut = socket.getOutputStream();
                    BufferedReader br = new BufferedReader(
                            new InputStreamReader(socket.getInputStream()));
                    while(true){
                    	System.out.println("writing...");
                    	 // 发送关闭命令                       
                        socketOut.write("0002\r\n".getBytes());
                        // 接收服务器的反馈                        
                        String msg = null;
                        System.out.println("reading...");
                        if ((msg = br.readLine()) != null)
                            System.out.println(msg);
                        Thread.sleep(3000);
                    }
                   
                } catch (Exception e) {                    
                    e.printStackTrace();
                }
            }

        };
    }
}


