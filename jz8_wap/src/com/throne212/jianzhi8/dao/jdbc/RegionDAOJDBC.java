package com.throne212.jianzhi8.dao.jdbc;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;

import com.throne212.jianzhi8.domain.Region;

@Repository("regionDAOJDBC")
public class RegionDAOJDBC {

	private JdbcTemplate jdbcTemplate;
	
	@Autowired
	public void setDataSource(DataSource dataSource) {
		this.jdbcTemplate = new JdbcTemplate(dataSource);
	}
	
	private static List<Region> ALL_CITIES = null;
	private static List<Region> HOT_CITIES = null;
	private static List<Region> PRO_CITIES = null;
	
	public List<Region> getAllCities(){
		if(ALL_CITIES != null)
			return ALL_CITIES;
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
		ALL_CITIES = list;
		return list;
	}
	public List<Region> getHotCities(){
		if(HOT_CITIES != null && HOT_CITIES.size() > 0)
			return HOT_CITIES;
		List<Region> list = new ArrayList<Region>();
		String sql = "select * from region_tab limit 0,4 union select * from region_tab where length(city_code) = 4 and right(city_code,2)='01' and parent_id is not null and grade=0 or city_name='广东,深圳' ";
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
		HOT_CITIES = list;
		return list;
	}
	
	public List<Region> getHot_Cities(){
		List<Region> list = new ArrayList<Region>();
				Region city = new Region();
//				city.setCityCode("0100");
				city.setCityId("bj");
				city.setCityName("北京");
				list.add(city);
				city = new Region();
				city.setCityId("suzhou");
				city.setCityName("苏州");
				list.add(city);
				city = new Region();
				city.setCityId("sh");
				city.setCityName("上海");				
				list.add(city);
				city = new Region();
				city.setCityId("fz");
				city.setCityName("福州");				
				list.add(city);
				city = new Region();
				city.setCityId("tj");
				city.setCityName("天津");				
				list.add(city);
				city = new Region();
				city.setCityId("xa");
				city.setCityName("西安");				
				list.add(city);
				city = new Region();
				city.setCityId("cq");
				city.setCityName("重庆");				
				list.add(city);
				city = new Region();
				city.setCityId("gz");
				city.setCityName("广州");				
				list.add(city);
				city = new Region();
				city.setCityId("cs");
				city.setCityName("长沙");				
				list.add(city);
				city = new Region();
				city.setCityId("sz");
				city.setCityName("深圳");				
				list.add(city);
				city = new Region();
				city.setCityId("nc");
				city.setCityName("南昌");				
				list.add(city);
				city = new Region();
				city.setCityId("cd");
				city.setCityName("成都");				
				list.add(city);
				city = new Region();
				city.setCityId("heb");
				city.setCityName("哈尔滨");				
				list.add(city);
				city = new Region();
				city.setCityId("hz");
				city.setCityName("杭州");				
				list.add(city);
				city = new Region();
				city.setCityId("zz");
				city.setCityName("郑州");				
				list.add(city);
				city = new Region();
				city.setCityId("nj");
				city.setCityName("南京");				
				list.add(city);
				city = new Region();
				city.setCityId("dl");
				city.setCityName("大连");				
				list.add(city);
				
		return list;
	}
	
	public List<Region> getProCityList(){
		if(PRO_CITIES != null){
			return PRO_CITIES;
		}
		String sql = "select * from region_tab where right(city_code,2)='00' and city_code not in ('0100','0200','0300','0400','3500') and city_name not in ('香港','澳门','台湾')";
		List<Region> list = jdbcTemplate.query(sql, new RowMapper<Region>(){
			public Region mapRow(ResultSet rs, int i) throws SQLException {
				Region pro = new Region();
				pro.setCityCode(rs.getString("city_code"));
				pro.setCityId(rs.getString("city_id"));
				pro.setCityName(rs.getString("city_name"));
				pro.setGrade(rs.getInt("grade"));
				pro.setParentCode(rs.getString("parent_id"));
				String csql = "select * from region_tab where parent_id=?";
				List<Region> clist = jdbcTemplate.query(csql,new Object[]{pro.getCityCode()}, new RowMapper<Region>(){
					public Region mapRow(ResultSet rs, int i) throws SQLException {
						Region city = new Region();
						city.setCityCode(rs.getString("city_code"));
						city.setCityId(rs.getString("city_id"));
						city.setCityName(rs.getString("city_name"));
						city.setGrade(rs.getInt("grade"));
						city.setParentCode(rs.getString("parent_id"));
						return city;
				}});
				pro.setChilds(clist);
				return pro;
			}});
		PRO_CITIES = list;
		return list;
	}
	
	
	public List<Region> getAllCityandAreas(){
		String sql = "select * from region_tab";
		List<Region> list = jdbcTemplate.query(sql, new RowMapper<Region>(){
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
	
}
