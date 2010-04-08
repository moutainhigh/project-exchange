package sf.common;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class DBUtil {
	
	static String url = "jdbc:mysql://localhost:3306/sf";
	static String user = "root";
	static String pwd = "123";
	
	static{
		try {
			//Class.forName("org.logicalcobwebs.proxool.ProxoolDriver");// proxool驱动类
			Class.forName("com.mysql.jdbc.Driver");// proxool驱动类  
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		}
	}
	
	public static Connection getConn(){
		Connection conn = null;
		try {
			conn = DriverManager.getConnection(url,user,pwd);
			//conn = DriverManager.getConnection("proxool.auto_pool");
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return conn;
	}
	
	public static void release(ResultSet rs, Statement ps, Connection conn){
		if(rs != null)
			try {
				rs.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		if(ps != null)
			try {
				ps.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		if(conn != null)
			try {
				conn.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
	}
}
