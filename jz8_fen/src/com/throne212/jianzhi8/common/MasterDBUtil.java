package com.throne212.jianzhi8.common;

import java.io.InputStream;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.Properties;

public class MasterDBUtil {

	public static Connection getConn(){
		try {
			//»ñÈ¡ÅäÖÃ
			Properties props = new Properties();
			InputStream in = MasterDBUtil.class.getClassLoader().getResourceAsStream("jdbc_master.properties"); 
			props.load(in);
			String url = props.getProperty("jdbc.url");
			String user = props.getProperty("jdbc.username");
			String password = props.getProperty("jdbc.password");
			String driverName = props.getProperty("jdbc.driverClassName");
			
			Class.forName(driverName);
			Connection conn = DriverManager.getConnection(url, user, password);
			return conn;
		} catch (Exception e) {
			e.printStackTrace();
			throw new RuntimeException(e.getMessage());
		}
	}
	
	public static int exeUpdate(Connection conn, String sql, Object... params){
		try {
			PreparedStatement ps = conn.prepareStatement(sql);
			if(params != null && params.length > 0){
				int i = 1;
				for(Object param : params){
					ps.setObject(i++, param);
				}
			}
			return ps.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
			throw new RuntimeException(e.getMessage());
		}
	}
	
	public static void closeConn(Connection conn){
		try {
			if(conn != null && !conn.isClosed())
				conn.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	
}
