package sf.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import sf.common.DBUtil;
import sf.pojo.Catalog;

public class CatalogDao {

	public boolean addCatalog(String name, String url,int orderby) {
		Connection conn = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		try {
			conn = DBUtil.getConn();
			if (conn != null) {
				String sql = "insert into sf_catalog(name,url,order) values(?,?,?)";
				ps = conn.prepareStatement(sql);
				ps.setString(1, name);
				ps.setString(2, url);
				ps.setInt(3, orderby);
				return ps.executeUpdate() > 0;
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBUtil.release(rs, ps, conn);
		}
		return false;
	}

	public List<Catalog> getAllCatalogs() {
		List<Catalog> list = new ArrayList<Catalog>();
		Connection conn = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		try {
			conn = DBUtil.getConn();
			if (conn != null) {
				String sql = "select * from sf_catalog order by orderby";
				ps = conn.prepareStatement(sql);
				rs = ps.executeQuery();
				while (rs.next()) {
					Catalog c = new Catalog();
					int i = 0;
					c.setId(rs.getLong(i++));
					c.setName(rs.getString(i++));
					c.setUrl(rs.getString(i++));
					c.setOrder(rs.getInt(i++));
					list.add(c);
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBUtil.release(rs, ps, conn);
		}
		return list;
	}

}
