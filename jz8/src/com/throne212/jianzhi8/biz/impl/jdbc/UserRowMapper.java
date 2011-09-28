package com.throne212.jianzhi8.biz.impl.jdbc;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.jdbc.core.RowMapper;

import com.throne212.jianzhi8.domain.User;

public class UserRowMapper implements RowMapper<User>{

	public User mapRow(ResultSet rs, int len) throws SQLException {
		String username = rs.getString("username");
		String password = rs.getString("password");
		String id = rs.getString("id");
		User user = new User();
		
		return user;
	}

}
