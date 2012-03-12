package com.throne212.jianzhi8.dao.jdbc;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;
import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;

import com.throne212.jianzhi8.domain.Region;

@Repository("regionDAOJDBC")
public class RegionDAOJDBC {

	private JdbcTemplate jdbcTemplate;
	
	private static List<Region> hotList;
	
	@Autowired
	public void setDataSource(DataSource dataSource) {
		this.jdbcTemplate = new JdbcTemplate(dataSource);
	}
	
	public List<Region> getAllCities(){
		List<Region> list = new ArrayList<Region>();
		String sql = "select * from region_tab limit 0,4 union select * from region_tab where length(city_code) = 4 and parent_id is not null and grade=0";
		list = jdbcTemplate.query(sql, new RowMapper<Region>(){
			public Region mapRow(ResultSet rs, int i) throws SQLException {
				Region city = new Region();
				city.setCityCode(rs.getString("city_code"));
				city.setCityId(rs.getString("city_id"));
				city.setCityName(rs.getString("city_name"));
				city.setGrade(rs.getInt("grade"));
				city.setParentCode(rs.getString("parent_id"));
				return city;
			}});
		return list;
	}
	public List<Region> getHotCities(){
		if(hotList != null && hotList.size() > 0)
			return hotList;
		List<Region> list = new ArrayList<Region>();
		String sql = "select * from region_tab limit 0,4 union select * from region_tab where length(city_code) = 4 and right(city_code,2)='01' and parent_id is not null and grade=0 or city_name='¹ã¶«,ÉîÛÚ' ";
		list = jdbcTemplate.query(sql, new RowMapper<Region>(){
			public Region mapRow(ResultSet rs, int i) throws SQLException {
				Region city = new Region();
				city.setCityCode(rs.getString("city_code"));
				city.setCityId(rs.getString("city_id"));
				city.setCityName(rs.getString("city_name"));
				city.setGrade(rs.getInt("grade"));
				city.setParentCode(rs.getString("parent_id"));
				return city;
			}});
		hotList = list;
		return list;
	}
	
}
