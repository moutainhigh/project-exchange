package sf.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.List;
import java.util.Vector;

import sf.common.DBUtil;
import sf.pojo.Pic;

public class PicDao {

	public List<Pic> getAllPic() {
		List<Pic> list = new Vector<Pic>();
		Connection conn = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		try {
			conn = DBUtil.getConn();
			if (conn != null) {
				String sql = "select * from sf_Pic order by time desc";
				ps = conn.prepareStatement(sql);
				rs = ps.executeQuery();
				while (rs.next()) {
					Pic d = new Pic();
					d.setId(rs.getLong("id"));
					d.setFilePath(rs.getString("filePath"));
					d.setTime(rs.getDate("time"));
					d.setTitle(rs.getString("title"));
					list.add(d);
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBUtil.release(rs, ps, conn);
		}
		return list;
	}

	public boolean addPic(Pic d) {
		Connection conn = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		try {
			conn = DBUtil.getConn();
			if (conn != null) {
				String sql = "insert into sf_Pic(title,filePath,time) values(?,?,?)";
				ps = conn.prepareStatement(sql);
				int i = 1;
				ps.setString(i++, d.getTitle());
				ps.setString(i++, d.getFilePath());
				ps.setDate(i++, new java.sql.Date(d.getTime().getTime()));
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

	public boolean updatePic(Pic d) {
		Connection conn = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		try {
			conn = DBUtil.getConn();
			if (conn != null) {
				String sql = "update sf_Pic set title=?,time=?,filePath=?,where id=?";
				ps = conn.prepareStatement(sql);
				int i = 1;
				ps.setString(i++, d.getTitle());
				ps.setDate(i++, new java.sql.Date(d.getTime().getTime()));
				ps.setString(i++, d.getFilePath());
				ps.setLong(i++, d.getId());
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

	public boolean deletePic(long id) {
		Connection conn = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		try {
			conn = DBUtil.getConn();
			if (conn != null) {
				String sql = "delete from sf_Pic where id=?";
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

	public Pic getPicById(long id) {
		Pic d = null;
		Connection conn = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		try {
			conn = DBUtil.getConn();
			if (conn != null) {
				String sql = "select * from sf_Pic where id=?";
				ps = conn.prepareStatement(sql);
				ps.setLong(1, id);
				rs = ps.executeQuery();
				if (rs.next()) {
					d = new Pic();
					d.setId(rs.getLong("id"));
					d.setFilePath(rs.getString("filePath"));
					d.setTime(rs.getDate("time"));
					d.setTitle(rs.getString("title"));
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBUtil.release(rs, ps, conn);
		}
		return d;
	}

}
