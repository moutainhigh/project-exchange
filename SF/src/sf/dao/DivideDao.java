package sf.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.List;
import java.util.Vector;

import sf.common.DBUtil;
import sf.pojo.Divide;

public class DivideDao {

	public List<Divide> getAllDivide() {
		List<Divide> list = new Vector<Divide>();
		Connection conn = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		try {
			conn = DBUtil.getConn();
			if (conn != null) {
				String sql = "select * from sf_Divide order by orderNum asc,id desc";
				ps = conn.prepareStatement(sql);
				rs = ps.executeQuery();
				while (rs.next()) {
					Divide f = new Divide();
					f.setGroupNum(rs.getString("groupNum"));
					f.setId(rs.getLong("id"));
					f.setIdText(rs.getString("idText"));
					f.setName(rs.getString("name"));
					f.setOrderNum(rs.getInt("orderNum"));
					f.setType(rs.getInt("type"));
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

	public boolean addDivide(Divide f) {
		Connection conn = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		try {
			conn = DBUtil.getConn();
			if (conn != null) {
				String sql = "insert into sf_Divide(name,idText,version,orderNum,type,groupNum) values(?,?,?,?,?,?)";
				ps = conn.prepareStatement(sql);
				int i = 1;
				ps.setString(i++, f.getName());
				ps.setString(i++, f.getIdText());
				ps.setString(i++, f.getVersion());
				ps.setInt(i++, f.getOrderNum());
				ps.setInt(i++, f.getType());
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

	public boolean updateDivide(Divide f) {
		Connection conn = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		try {
			conn = DBUtil.getConn();
			if (conn != null) {
				String sql = "update sf_Divide set name=?,idText=?,version=?,orderNum=?,type=?,groupNum=? where id=?";
				ps = conn.prepareStatement(sql);
				int i = 1;
				ps.setString(i++, f.getName());
				ps.setString(i++, f.getIdText());
				ps.setString(i++, f.getVersion());
				ps.setInt(i++, f.getOrderNum());
				ps.setInt(i++, f.getType());
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

	public boolean deleteDivide(long id) {
		Connection conn = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		try {
			conn = DBUtil.getConn();
			if (conn != null) {
				String sql = "delete from sf_Divide where id=?";
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
	
	public Divide getDivideById(long id) {
		Divide fm = null;
		Connection conn = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		try {
			conn = DBUtil.getConn();
			if (conn != null) {
				String sql = "select * from sf_Divide where id=?";
				ps = conn.prepareStatement(sql);
				ps.setLong(1, id);
				rs = ps.executeQuery();
				if (rs.next()) {
					fm = new Divide();
					fm.setId(id);
					fm.setGroupNum(rs.getString("groupNum"));
					fm.setIdText(rs.getString("idText"));
					fm.setName(rs.getString("name"));
					fm.setOrderNum(rs.getInt("orderNum"));
					fm.setType(rs.getInt("type"));
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
