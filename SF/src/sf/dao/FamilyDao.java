package sf.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.List;
import java.util.Vector;

import sf.common.DBUtil;
import sf.pojo.Content;
import sf.pojo.Family;

public class FamilyDao {

	public List<Family> getAllFamliy() {
		List<Family> list = new Vector<Family>();
		Connection conn = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		try {
			conn = DBUtil.getConn();
			if (conn != null) {
				String sql = "select * from sf_family order by orderNum asc,id desc";
				ps = conn.prepareStatement(sql);
				rs = ps.executeQuery();
				while (rs.next()) {
					Family f = new Family();
					f.setGroupNum(rs.getString("groupNum"));
					f.setId(rs.getLong("id"));
					f.setIdText(rs.getString("idText"));
					f.setName(rs.getString("name"));
					f.setOrderNum(rs.getInt("orderNum"));
					f.setPopular(rs.getInt("popular"));
					f.setVersion(rs.getString("version"));
					list.add(f);
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBUtil.release(rs, ps, conn);
		}
		return list;
	}

	public boolean addFamliy(Family f) {
		Connection conn = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		try {
			conn = DBUtil.getConn();
			if (conn != null) {
				String sql = "insert into sf_family(name,idText,version,orderNum,popular,groupNum) values(?,?,?,?,?,?)";
				ps = conn.prepareStatement(sql);
				int i = 1;
				ps.setString(i++, f.getName());
				ps.setString(i++, f.getIdText());
				ps.setString(i++, f.getVersion());
				ps.setInt(i++, f.getOrderNum());
				ps.setInt(i++, 0);
				ps.setString(i++, f.getGroupNum());
				int rst = ps.executeUpdate();
				return rst > 0;
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBUtil.release(rs, ps, conn);
		}
		return false;
	}

	public boolean updateFamliy(Family f) {
		Connection conn = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		try {
			conn = DBUtil.getConn();
			if (conn != null) {
				String sql = "update sf_family set name=?,idText=?,version=?,orderNum=?,popular=?,groupNum=? where id=?";
				ps = conn.prepareStatement(sql);
				int i = 1;
				ps.setString(i++, f.getName());
				ps.setString(i++, f.getIdText());
				ps.setString(i++, f.getVersion());
				ps.setInt(i++, f.getOrderNum());
				ps.setInt(i++, f.getPopular());
				ps.setString(i++, f.getGroupNum());
				ps.setLong(i++, f.getId());
				int rst = ps.executeUpdate();
				return rst > 0;
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBUtil.release(rs, ps, conn);
		}
		return false;
	}

	public boolean deleteFamliy(long id) {
		Connection conn = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		try {
			conn = DBUtil.getConn();
			if (conn != null) {
				String sql = "delete from sf_family where id=?";
				ps = conn.prepareStatement(sql);
				ps.setLong(1, id);
				return ps.executeUpdate() > 0;
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBUtil.release(rs, ps, conn);
		}
		return false;
	}
	
	public Family getFamilyById(long id) {
		Family fm = null;
		Connection conn = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		try {
			conn = DBUtil.getConn();
			if (conn != null) {
				String sql = "select * from sf_family where id=?";
				ps = conn.prepareStatement(sql);
				ps.setLong(1, id);
				rs = ps.executeQuery();
				if (rs.next()) {
					fm = new Family();
					fm.setId(id);
					fm.setGroupNum(rs.getString("groupNum"));
					fm.setIdText(rs.getString("idText"));
					fm.setName(rs.getString("name"));
					fm.setOrderNum(rs.getInt("orderNum"));
					fm.setPopular(rs.getInt("popular"));
					fm.setVersion(rs.getString("version"));
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBUtil.release(rs, ps, conn);
		}
		return fm;
	}

}
