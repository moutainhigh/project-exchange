package com.throne212.jianzhi8.biz.impl.jdbc;

import java.util.List;
import java.util.UUID;

import javax.sql.DataSource;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.throne212.jianzhi8.biz.UserBiz;
import com.throne212.jianzhi8.dao.UserDAO;
import com.throne212.jianzhi8.domain.User;

@Service("userBiz")
@Transactional
public class UserBizImpl implements UserBiz {

	private Logger logger = Logger.getLogger(this.getClass());
	
	private JdbcTemplate jdbcTemplate;
	private UserDAO userDao;

	@Autowired
	public void setDataSource(DataSource dataSource) {
		this.jdbcTemplate = new JdbcTemplate(dataSource);
	}
	
	@Autowired
	public void setUserDao(UserDAO userDao) {
		this.userDao = userDao;
	}


	public User login(String username, String password) {
		System.out.println(userDao);
		String sql = "select * from user";
		List<User> list = jdbcTemplate.query(sql, new UserRowMapper());
		if (list != null && list.size() > 0) {
			return list.get(0);
		}
		return null;
	}

	public User reg(String username, String password) {
		String sql = "insert into user values(?,?,?)";
		int len = jdbcTemplate.update(sql, UUID.randomUUID().toString(), username, password);
		if(len == 1){
			return login(username, password);
		}
		return null;
	}

}
