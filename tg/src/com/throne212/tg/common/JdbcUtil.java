package com.throne212.tg.common;

import java.io.File;
import java.io.FileInputStream;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.sql.Types;
import java.util.Date;
import java.util.Properties;

public class JdbcUtil {

	// 数据库连接URL
	private static String url = "jdbc:mysql://localhost:3306/tg";
	// 数据库用户名
	private static String username = "root";
	// 数据库密码
	private static String password = "123";
	
	static{
		Properties prop = new Properties();
		try {
			prop.load(new FileInputStream(Thread.currentThread().getContextClassLoader().getResource("/").getPath()+File.separator+"jdbc.properties"));
		} catch (Exception e) {
			e.printStackTrace();
		} 
		if(!prop.isEmpty()){
			url = prop.getProperty("url");
			username = prop.getProperty("username");
			password = prop.getProperty("password");
		}		
	}

	// 返回数据库连接
	public static Connection getConn() {
		Connection conn = null;
		try {
			Class.forName("com.mysql.jdbc.Driver"); // 加载驱动类
			// 通过驱动管理器获取数据库连接
			conn = DriverManager.getConnection(url, username, password);
			conn.setAutoCommit(false);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return conn;
	}

	// 关闭结果集、会话和连接
	public static void close(Connection conn, Statement stmt, ResultSet rs) {
		if (rs != null) {
			try {
				rs.close(); // 关闭结果集
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		if (stmt != null) {
			try {
				stmt.close(); // 关闭会话
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		if (conn != null) {
			try {
				conn.close(); // 关闭连接
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
	}
	
	public static void rollback(Connection conn){
		if(conn != null)
			try {
				conn.rollback();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
	}
	
	public static String getColumnType(int type){
		switch (type) {
		case Types.BIGINT:
			return Long.class.getName();
		case Types.BIT:
			return Byte.class.getName();
		case Types.BOOLEAN:
			return Boolean.class.getName();
		case Types.CHAR:
			return Character.class.getName();
		case Types.DATE:
			return Date.class.getName();
		case Types.DECIMAL:
			return Double.class.getName();
		case Types.DOUBLE:
			return Double.class.getName();
		case Types.FLOAT:
		case Types.REAL:
			return Float.class.getName();
		case Types.INTEGER:
			return Integer.class.getName();
		case Types.NUMERIC:
			return Double.class.getName();
		case Types.NCHAR:
		case Types.NVARCHAR:
		case Types.VARCHAR:
		case Types.LONGNVARCHAR:
		case Types.LONGVARCHAR:
			return String.class.getName();
		default:
			break;
		}
		return null;
	}

}
