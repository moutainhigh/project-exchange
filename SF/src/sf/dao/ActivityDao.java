package sf.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.List;
import java.util.Vector;

import sf.common.DBUtil;
import sf.pojo.Activity;

public class ActivityDao {

	public List<Activity> getAllActivity() {
		List<Activity> list = new Vector<Activity>();
		Connection conn = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		try {
			conn = DBUtil.getConn();
			if (conn != null) {
				String sql = "select * from sf_Activity order by time desc";
				ps = conn.prepareStatement(sql);
				rs = ps.executeQuery();
				while (rs.next()) {
					Activity d = new Activity();
					d.setId(rs.getLong("id"));
					d.setContent(rs.getString("Content"));
					d.setTitle(rs.getString("title"));
					d.setTime(new java.util.Date(rs.getDate("time").getTime()));
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

	public boolean addActivity(Activity d) {
		Connection conn = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		try {
			conn = DBUtil.getConn();
			if (conn != null) {
				String sql = "insert into sf_Activity(title,time,content) values(?,?,?)";
				ps = conn.prepareStatement(sql);
				int i = 1;
				ps.setString(i++, d.getTitle());
				ps.setDate(i++, new java.sql.Date(d.getTime().getTime()));
				ps.setString(i++,d.getContent());
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

	public boolean updateActivity(Activity d) {
		Connection conn = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		try {
			conn = DBUtil.getConn();
			if (conn != null) {
				String sql = "update sf_Activity set title=?,time=?,content=? where id=?";
				ps = conn.prepareStatement(sql);
				int i = 1;
				ps.setString(i++, d.getTitle());
				ps.setDate(i++, new java.sql.Date(d.getTime().getTime()));
				ps.setString(i++, d.getContent());
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

	public boolean deleteActivity(long id) {
		Connection conn = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		try {
			conn = DBUtil.getConn();
			if (conn != null) {
				String sql = "delete from sf_Activity where id=?";
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

	public Activity getActivityById(long id) {
		Activity d = null;
		Connection conn = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		try {
			conn = DBUtil.getConn();
			if (conn != null) {
				String sql = "select * from sf_Activity where id=?";
				ps = conn.prepareStatement(sql);
				ps.setLong(1, id);
				rs = ps.executeQuery();
				if (rs.next()) {
					d = new Activity();
					d.setId(rs.getLong("id"));
					d.setContent(rs.getString("Content"));
					d.setTitle(rs.getString("title"));
					d.setTime(new java.util.Date(rs.getDate("time").getTime()));
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
