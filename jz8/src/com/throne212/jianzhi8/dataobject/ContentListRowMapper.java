package com.throne212.jianzhi8.dataobject;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.jdbc.core.RowMapper;

public class ContentListRowMapper implements RowMapper<ContentDO>{

	public ContentDO mapRow(ResultSet rs, int len) throws SQLException {
		ContentDO c = new ContentDO();
		c.setCtNo(rs.getString("ct_no"));
		c.setTitle(rs.getString("ct_title"));
		c.setSimpleDes(rs.getString("sim_con"));
		c.setDate(rs.getDate("ct_update"));
		c.setTypes(rs.getString("ct_type_name"));
		c.setTypeId(rs.getString("ct_type_id"));
		c.setIsPay(rs.getString("ct_ispay"));
		c.setIsYz(rs.getString("ct_isyz"));
		c.setDate(rs.getDate("ct_update"));
		c.setEnddate(rs.getDate("ct_enddate"));
		c.setUserFile(rs.getString("user_file"));
		c.setCtClass(rs.getString("ct_class"));
		return c;
	}

}
