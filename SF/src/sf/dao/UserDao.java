package sf.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import sf.common.DBUtil;
import sf.pojo.User;

public class UserDao {

	public User login(String name,String pwd){
			Connection conn = null;
			PreparedStatement ps = null;
			ResultSet rs = null;
			try {
				conn = DBUtil.getConn();
				if (conn != null) {
					String sql = "select * from sf_user where loginName=? and password=?";
					ps = conn.prepareStatement(sql);
					ps.setString(1, name);
					ps.setString(2, pwd);
					rs = ps.executeQuery();
					if(rs.next()){
						User user = new User();
						user.setLoginName(rs.getString("loginName"));
						user.setId(rs.getLong("id"));
						user.setPassword(rs.getString("password"));
						return user;
					}
				}
			} catch (Exception e) {
				e.printStackTrace();
			} finally {
				DBUtil.release(rs, ps, conn);
			}
			return null;
	}
	
}
