package yw;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

public class DB {

	public static void main(String[] args) throws Throwable {
		String str = "jdbc:jtds:sqlserver://weben.db.7756033.hostedresource.com:1433/weben";
		String user = "weben";
		String password = "Davice8208";
		
		Class.forName("net.sourceforge.jtds.jdbc.Driver");
		Connection conn = DriverManager.getConnection(str, user, password);
		
		String sql = "select * from cn_product";
		Statement stmt = conn.createStatement();
		ResultSet rs = stmt.executeQuery(sql);
		
		List<Pro> list = new ArrayList<Pro>();
		
		while(rs.next()){
			Long id = rs.getLong(1);
			String photo = rs.getString(3);
			int type = rs.getInt(10);
			Pro p = new Pro();
			p.setId(id);
			p.setName(photo.split("\\.")[0]);
			p.setType(type);
			list.add(p);
		}
		
		conn.close();
		
		
		addToMySQL(list);
	}
	
	
	private static void addToMySQL(List<Pro> list) throws Throwable{
		String str = "jdbc:mysql://localhost:3306/yw";
		String user = "root";
		String password = "123";
		Class.forName(com.mysql.jdbc.Driver.class.getName());
		Connection conn = DriverManager.getConnection(str, user, password);
		String sql = "insert into pro values(?,?,?,?)";
		PreparedStatement ps = conn.prepareStatement(sql);
		for(Pro p : list){
			ps.setLong(1, p.getId());
			ps.setString(2, p.getName());
			ps.setString(3, null);
			ps.setInt(4, p.getType());
			ps.executeUpdate();
		}
		conn.close();
	}
	
	public static List getAllPro() throws Throwable{
		String str = "jdbc:mysql://localhost:3306/yw";
		String user = "root";
		String password = "123";
		Class.forName(com.mysql.jdbc.Driver.class.getName());
		Connection conn = DriverManager.getConnection(str, user, password);
		String sql = "select * from pro";
		PreparedStatement ps = conn.prepareStatement(sql);
		ResultSet rs = ps.executeQuery(sql);
		List<Pro> list = new ArrayList<Pro>();
		
		while(rs.next()){
			Long id = rs.getLong("id");
			int type = rs.getInt("type");
			String name = rs.getString("name"); 
			Pro p = new Pro();
			p.setId(id);
			p.setType(type);
			p.setName(name);
			list.add(p);
		}
		conn.close();
		return list;
	}
	public static List getAllPro(int type) throws Throwable{
		String str = "jdbc:mysql://localhost:3306/yw";
		String user = "root";
		String password = "123";
		Class.forName(com.mysql.jdbc.Driver.class.getName());
		Connection conn = DriverManager.getConnection(str, user, password);
		String sql = "select * from pro where type=" + type;
		PreparedStatement ps = conn.prepareStatement(sql);
		ResultSet rs = ps.executeQuery(sql);
		List<Pro> list = new ArrayList<Pro>();
		
		while(rs.next()){
			Long id = rs.getLong("id");
			String name = rs.getString("name"); 
			Pro p = new Pro();
			p.setId(id);
			p.setType(type);
			p.setName(name);
			list.add(p);
		}
		conn.close();
		return list;
	}
	
	public static Pro getPro(Long id) throws Throwable{
		String str = "jdbc:mysql://localhost:3306/yw";
		String user = "root";
		String password = "123";
		Class.forName(com.mysql.jdbc.Driver.class.getName());
		Connection conn = DriverManager.getConnection(str, user, password);
		String sql = "select * from pro where id=?";
		PreparedStatement ps = conn.prepareStatement(sql);
		ps.setLong(1, id);
		ResultSet rs = ps.executeQuery(sql);
		Pro p = new Pro();
		if(rs.next()){
			id = rs.getLong("id");
			int type = rs.getInt("type");
			String name = rs.getString("name"); 
			p.setId(id);
			p.setType(type);
			p.setName(name);
		}
		conn.close();
		return p;
	}
	
}
