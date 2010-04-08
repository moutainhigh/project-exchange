package sf.dao;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.List;
import java.util.Vector;

import sf.common.DBUtil;
import sf.pojo.Download;

public class DownloadDao {

	public List<Download> getAllDownload() {
		List<Download> list = new Vector<Download>();
		Connection conn = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		try {
			conn = DBUtil.getConn();
			if (conn != null) {
				String sql = "select * from sf_download order by up desc,id desc";
				ps = conn.prepareStatement(sql);
				rs = ps.executeQuery();
				while (rs.next()) {
					Download d = new Download();
					d.setId(rs.getLong("id"));
					d.setComment(rs.getInt("comment"));
					d.setFilePath(rs.getString("filePath"));
					d.setName(rs.getString("name"));
					d.setSize(rs.getLong("size"));
					d.setTime(rs.getDate("time"));
					d.setUp(rs.getLong("up"));
					d.setDesc(rs.getString("description"));
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

	public boolean addDownload(Download d) {
		Connection conn = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		try {
			conn = DBUtil.getConn();
			if (conn != null) {
				String sql = "insert into sf_download(name,up,time,size,comment,filePath,description) values(?,?,?,?,?,?,?)";
				ps = conn.prepareStatement(sql);
				int i = 1;
				ps.setString(i++, d.getName());
				ps.setLong(i++, 0);
				ps.setDate(i++, new java.sql.Date(d.getTime().getTime()));
				ps.setLong(i++, d.getSize());
				ps.setInt(i++, d.getComment());
				ps.setString(i++, d.getFilePath());
				ps.setString(i++,d.getDesc());
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

	public boolean updateDownload(Download d) {
		Connection conn = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		try {
			conn = DBUtil.getConn();
			if (conn != null) {
				String sql = "update sf_download set name=?,up=?,time=?,size=?,comment=?,filePath=?,description=? where id=?";
				ps = conn.prepareStatement(sql);
				int i = 1;
				ps.setString(i++, d.getName());
				ps.setLong(i++, d.getUp());
				ps.setDate(i++, new java.sql.Date(d.getTime().getTime()));
				ps.setLong(i++, d.getSize());
				ps.setInt(i++, d.getComment());
				ps.setString(i++, d.getFilePath());
				ps.setString(i++, d.getDesc());
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

	public boolean deleteDownload(long id) {
		Connection conn = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		try {
			conn = DBUtil.getConn();
			if (conn != null) {
				String sql = "delete from sf_download where id=?";
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

	public Download getDownloadById(long id) {
		Download d = null;
		Connection conn = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		try {
			conn = DBUtil.getConn();
			if (conn != null) {
				String sql = "select * from sf_download where id=?";
				ps = conn.prepareStatement(sql);
				ps.setLong(1, id);
				rs = ps.executeQuery();
				if (rs.next()) {
					d = new Download();
					d.setId(id);
					d.setComment(rs.getInt("comment"));
					d.setFilePath(rs.getString("filePath"));
					d.setName(rs.getString("name"));
					d.setSize(rs.getLong("size"));
					d.setTime(rs.getDate("time"));
					d.setUp(rs.getLong("up"));
					d.setDesc(rs.getString("description"));
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
