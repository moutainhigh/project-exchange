package sf.dao;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;

import sf.common.DBUtil;
import sf.pojo.Content;
import sf.pojo.Info;

public class ContentDao {

	public boolean updateContent(Content content) {
		Connection conn = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		try {
			conn = DBUtil.getConn();
			if (conn != null) {
				String sql = "update sf_content set title=?,content=? where id=?";
				ps = conn.prepareStatement(sql);
				ps.setString(1, content.getTitle());
				ps.setString(2, content.getContent());
				ps.setLong(3, content.getId());
				int rst = ps.executeUpdate();
				if (rst > 0) {
					return true;
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBUtil.release(rs, ps, conn);
		}
		return false;
	}

	public Content getContentById(long id) {
		Content content = null;
		Connection conn = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		try {
			conn = DBUtil.getConn();
			if (conn != null) {
				String sql = "select * from sf_content where id=?";
				ps = conn.prepareStatement(sql);
				ps.setLong(1, id);
				rs = ps.executeQuery();
				if (rs.next()) {
					content = new Content();
					content.setId(id);
					content.setTitle(rs.getString("title"));
					content.setContent(rs.getString("content"));
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBUtil.release(rs, ps, conn);
		}
		return content;
	}

}
