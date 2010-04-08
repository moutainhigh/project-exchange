package sf.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.GregorianCalendar;
import java.util.List;

import org.apache.log4j.Logger;

import sf.common.Constant;
import sf.common.DBUtil;
import sf.pojo.Info;

public class InfoDao {
	
	static SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
	static SimpleDateFormat format30 = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
	
	private Logger log = Logger.getLogger(this.getClass());

	public boolean addInfo(Info info) {
		Connection conn = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		try {
			conn = DBUtil.getConn();
			if (conn != null) {
				
				String sql = "select id from sf_info where serverName=? and time like '"+format.format(new Date(info.getTime().getTime()))+"%' and type=?";
				ps = conn.prepareStatement(sql);
				ps.setString(1, info.getServerName());
				//ps.setTimestamp(2, new Timestamp(info.getTime().getTime()));
				ps.setString(2, info.getType());
				rs = ps.executeQuery();
				if(rs.next()){
					return false;
				}
				rs.close();
				ps.close();
				
				sql = "insert into sf_info(serverName,serverIP,time,areaLine,versionDesc,serviceQQ,website,type) values(?,?,?,?,?,?,?,?)";
				ps = conn.prepareStatement(sql);
				int i = 1;
				// ps.setLong(i++, info.getId());
				ps.setString(i++, info.getServerName());
				ps.setString(i++, info.getServerIP());
				ps.setTimestamp(i++, new Timestamp(info.getTime().getTime()));
				ps.setString(i++, info.getAreaLine());
				ps.setString(i++, info.getVersionDesc());
				ps.setString(i++, info.getServiceQQ());
				ps.setString(i++, info.getWebsite());
				ps.setString(i++, info.getType());
				int rst = ps.executeUpdate();
				log.info("add info succ=" + rst+", info'name = " + info.getServerName());
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

	public boolean updateInfo(Info info) {
		Connection conn = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		try {
			conn = DBUtil.getConn();
			if (conn != null) {
				ps = conn.prepareStatement("update sf_info values(?,?,?,?,?,?,?,?) where id=?");
				int i = 1;
				ps.setString(i++, info.getServerName());
				ps.setString(i++, info.getServerIP());
				ps.setTimestamp(i++, new Timestamp(info.getTime().getTime()));
				ps.setString(i++, info.getAreaLine());
				ps.setString(i++, info.getVersionDesc());
				ps.setString(i++, info.getServiceQQ());
				ps.setString(i++, info.getWebsite());
				ps.setString(i++, info.getType());
				ps.setLong(i++, info.getId());
				int rst = ps.executeUpdate();
				if (rst > 0)
					return true;
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBUtil.release(rs, ps, conn);
		}
		return false;
	}

	public boolean deleteInfoById(Long id) {
		if (id == null || id == 0)
			return false;
		Connection conn = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		try {
			conn = DBUtil.getConn();
			if (conn != null) {
				ps = conn.prepareStatement("delete from sf_info where id=?");
				ps.setLong(1, id);
				int rst = ps.executeUpdate();
				if (rst > 0)
					return true;
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBUtil.release(rs, ps, conn);
		}
		return false;
	}

	public List<Info> getInfoByDate(java.util.Date date) {
		List<Info> list = new ArrayList<Info>();
		Connection conn = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		try {
			conn = DBUtil.getConn();
			if (conn != null) {
				//ps.setString(1, format.format(date));
				String sql = "select * from sf_info where time like '"+format.format(date)+"%' order by time desc,type desc";
				ps = conn.prepareStatement(sql);
				rs = ps.executeQuery();
				while (rs.next()) {
					Info info = new Info();
					int i = 1;
					info.setId(rs.getLong(i++));
					info.setServerName(rs.getString(i++));
					info.setServerIP(rs.getString(i++));
					info.setTime(rs.getDate(i++));
					info.setAreaLine(rs.getString(i++));
					info.setVersionDesc(rs.getString(i++));
					info.setServiceQQ(rs.getString(i++));
					info.setWebsite(rs.getString(i++));
					info.setType(rs.getString(i++));
					list.add(info);
				}
				log.info("get info list , size=" + list.size());
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBUtil.release(rs, ps, conn);
		}
		return list;
	}
	public boolean existByNameIP(String name,String ip,java.util.Date date) {
		boolean exist = false;
		Connection conn = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		try {
			conn = DBUtil.getConn();
			if (conn != null) {
				String sql = "select id from sf_info where time like '"+format.format(date)+"%' and serverName=? and serverIP=?";
				ps = conn.prepareStatement(sql);
				ps.setString(1, name);
				ps.setString(2, ip);
				rs = ps.executeQuery();
				if (rs.next()) {
					exist = true;
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBUtil.release(rs, ps, conn);
		}
		return exist;
	}

	
	public List<Info> getRecentInfo(java.util.Date date) {
		List<Info> list = new ArrayList<Info>();
		Connection conn = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		try {
			conn = DBUtil.getConn();
			if (conn != null) {
				Calendar c = GregorianCalendar.getInstance();
				c.setTime(date);
				long time = c.getTimeInMillis();
				int min = c.get(GregorianCalendar.MINUTE);
				if(min >= 0 && min<= 29){
					int sec = c.get(GregorianCalendar.SECOND);
					int milSec = c.get(GregorianCalendar.MILLISECOND);					
					time -= milSec;
					time -= 1000 * sec;
					time -= 1000 * 60 * min;
				}else if(min >= 30 && min <= 59){
					int sec = c.get(GregorianCalendar.SECOND);
					int milSec = c.get(GregorianCalendar.MILLISECOND);
					time -= milSec;
					time -= 1000 * sec;
					time -= 1000 * 60 * (min - 30);
				}
				String sql = "select * from sf_info where time like '%"+format30.format(new java.util.Date(time))+"%' and type=? order by time desc";
				ps = conn.prepareStatement(sql);
				ps.setString(1, Constant.INFO_TYPE_TIME);
				rs = ps.executeQuery();
				while (rs.next()) {
					Info info = new Info();
					int i = 1;
					info.setId(rs.getLong(i++));
					info.setServerName(rs.getString(i++));
					info.setServerIP(rs.getString(i++));
					info.setTime(new java.util.Date(rs.getTimestamp(i++).getTime()));
					info.setAreaLine(rs.getString(i++));
					info.setVersionDesc(rs.getString(i++));
					info.setServiceQQ(rs.getString(i++));
					info.setWebsite(rs.getString(i++));
					info.setType(rs.getString(i++));
					list.add(info);
				}
				log.info("get recent info list , size=" + list.size());
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBUtil.release(rs, ps, conn);
		}
		return list;
	}
	
	public List<Info> getTodayBeforeInfo(java.util.Date date) {
		List<Info> list = new ArrayList<Info>();
		Connection conn = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		try {
			conn = DBUtil.getConn();
			if (conn != null) {
				Calendar c = GregorianCalendar.getInstance();
				c.setTime(date);
				long time = c.getTimeInMillis();
				int min = c.get(GregorianCalendar.MINUTE);
				if(min >= 0 && min<= 29){
					int sec = c.get(GregorianCalendar.SECOND);
					int milSec = c.get(GregorianCalendar.MILLISECOND);					
					time -= milSec;
					time -= 1000 * sec;
					time -= 1000 * 60 * min;
				}else if(min >= 30 && min <= 59){
					int sec = c.get(GregorianCalendar.SECOND);
					int milSec = c.get(GregorianCalendar.MILLISECOND);
					time -= milSec;
					time -= 1000 * sec;
					time -= 1000 * 60 * (min - 30);
				}
				Calendar c7 = new GregorianCalendar(c.get(GregorianCalendar.YEAR),c.get(GregorianCalendar.MONTH),c.get(GregorianCalendar.DATE),7,0,0);
				String sql = "select * from sf_info where time>= '"+format30.format(new java.util.Date(c7.getTimeInMillis()))+"' and time < '"+format30.format(new java.util.Date(time))+"' and type=? order by time desc";
				ps = conn.prepareStatement(sql);
				ps.setString(1, Constant.INFO_TYPE_TIME);
				rs = ps.executeQuery();
				while (rs.next()) {
					Info info = new Info();
					int i = 1;
					info.setId(rs.getLong(i++));
					info.setServerName(rs.getString(i++));
					info.setServerIP(rs.getString(i++));
					info.setTime(new java.util.Date(rs.getTimestamp(i++).getTime()));
					info.setAreaLine(rs.getString(i++));
					info.setVersionDesc(rs.getString(i++));
					info.setServiceQQ(rs.getString(i++));
					info.setWebsite(rs.getString(i++));
					info.setType(rs.getString(i++));
					list.add(info);
				}
				log.info("get bofore info list , size=" + list.size());
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBUtil.release(rs, ps, conn);
		}
		return list;
	}
	
	public List<Info> getTodayAfterInfo(java.util.Date date) {
		List<Info> list = new ArrayList<Info>();
		Connection conn = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		try {
			conn = DBUtil.getConn();
			if (conn != null) {
				Calendar c = GregorianCalendar.getInstance();
				c.setTime(date);
				long time = c.getTimeInMillis();
				int min = c.get(GregorianCalendar.MINUTE);
				if(min >= 0 && min<= 29){
					int sec = c.get(GregorianCalendar.SECOND);
					int milSec = c.get(GregorianCalendar.MILLISECOND);					
					time -= milSec;
					time -= 1000 * sec;
					time -= 1000 * 60 * min;
				}else if(min >= 30 && min <= 59){
					int sec = c.get(GregorianCalendar.SECOND);
					int milSec = c.get(GregorianCalendar.MILLISECOND);
					time -= milSec;
					time -= 1000 * sec;
					time -= 1000 * 60 * (min - 30);
				}
				long nextTime = time += 30*60*1000;
				Calendar c12 = new GregorianCalendar(c.get(GregorianCalendar.YEAR),c.get(GregorianCalendar.MONTH),c.get(GregorianCalendar.DATE)+1,0,0,0);
				String sql = "select * from sf_info where time< '"+format30.format(new java.util.Date(c12.getTimeInMillis()))+"' and time >= '"+format30.format(new java.util.Date(nextTime))+"' and type=? order by time asc";
				ps = conn.prepareStatement(sql);
				ps.setString(1, Constant.INFO_TYPE_TIME);
				rs = ps.executeQuery();
				while (rs.next()) {
					Info info = new Info();
					int i = 1;
					info.setId(rs.getLong(i++));
					info.setServerName(rs.getString(i++));
					info.setServerIP(rs.getString(i++));
					info.setTime(new java.util.Date(rs.getTimestamp(i++).getTime()));
					info.setAreaLine(rs.getString(i++));
					info.setVersionDesc(rs.getString(i++));
					info.setServiceQQ(rs.getString(i++));
					info.setWebsite(rs.getString(i++));
					info.setType(rs.getString(i++));
					list.add(info);
				}
				log.info("get after info list , size=" + list.size());
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBUtil.release(rs, ps, conn);
		}
		return list;
	}
	
	public List<Info> getTodayAllDayInfo(java.util.Date date) {
		List<Info> list = new ArrayList<Info>();
		Connection conn = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		try {
			conn = DBUtil.getConn();
			if (conn != null) {
				Calendar c = GregorianCalendar.getInstance();
				c.setTime(date);
				long time = c.getTimeInMillis();
				//time += 24 * 60 * 60 * 1000;
				String sql = "select * from sf_info where time like '%"+format.format(new java.util.Date(time))+"%' and type=? order by time desc";
				ps = conn.prepareStatement(sql);
				ps.setString(1, Constant.INFO_TYPE_ALL_DAY);
				rs = ps.executeQuery();
				while (rs.next()) {
					Info info = new Info();
					int i = 1;
					info.setId(rs.getLong(i++));
					info.setServerName(rs.getString(i++));
					info.setServerIP(rs.getString(i++));
					info.setTime(new java.util.Date(rs.getTimestamp(i++).getTime()));
					info.setAreaLine(rs.getString(i++));
					info.setVersionDesc(rs.getString(i++));
					info.setServiceQQ(rs.getString(i++));
					info.setWebsite(rs.getString(i++));
					info.setType(rs.getString(i++));
					list.add(info);
				}
				log.info("get today all day info list , size=" + list.size());
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBUtil.release(rs, ps, conn);
		}
		return list;
	}
	
	public List<Info> getTommorowTongXiaoInfo(java.util.Date date) {
		List<Info> list = new ArrayList<Info>();
		Connection conn = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		try {
			conn = DBUtil.getConn();
			if (conn != null) {
				Calendar c = GregorianCalendar.getInstance();
				c.setTime(date);
				long time = c.getTimeInMillis();
				time += 24 * 60 * 60 * 1000;//加上24小时
				String sql = "select * from sf_info where time like '%"+format.format(new java.util.Date(time))+"%' and type=? order by time desc";
				ps = conn.prepareStatement(sql);
				ps.setString(1, Constant.INFO_TYPE_TONG_XIAO);
				rs = ps.executeQuery();
				while (rs.next()) {
					Info info = new Info();
					int i = 1;
					info.setId(rs.getLong(i++));
					info.setServerName(rs.getString(i++));
					info.setServerIP(rs.getString(i++));
					info.setTime(new java.util.Date(rs.getTimestamp(i++).getTime()));
					info.setAreaLine(rs.getString(i++));
					info.setVersionDesc(rs.getString(i++));
					info.setServiceQQ(rs.getString(i++));
					info.setWebsite(rs.getString(i++));
					info.setType(rs.getString(i++));
					list.add(info);
				}
				log.info("get today tong xiao info list , size=" + list.size());
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBUtil.release(rs, ps, conn);
		}
		return list;
	}
	
	public List<Info> getTodayTongXiaoInfo(java.util.Date date) {
		List<Info> list = new ArrayList<Info>();
		Connection conn = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		try {
			conn = DBUtil.getConn();
			if (conn != null) {
				Calendar c = GregorianCalendar.getInstance();
				c.setTime(date);
				long time = c.getTimeInMillis();
				String sql = "select * from sf_info where time like '%"+format.format(new java.util.Date(time))+"%' and type=? order by time desc";
				ps = conn.prepareStatement(sql);
				ps.setString(1, Constant.INFO_TYPE_TONG_XIAO);
				rs = ps.executeQuery();
				while (rs.next()) {
					Info info = new Info();
					int i = 1;
					info.setId(rs.getLong(i++));
					info.setServerName(rs.getString(i++));
					info.setServerIP(rs.getString(i++));
					info.setTime(new java.util.Date(rs.getTimestamp(i++).getTime()));
					info.setAreaLine(rs.getString(i++));
					info.setVersionDesc(rs.getString(i++));
					info.setServiceQQ(rs.getString(i++));
					info.setWebsite(rs.getString(i++));
					info.setType(rs.getString(i++));
					list.add(info);
				}
				log.info("get today tong xiao info list , size=" + list.size());
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBUtil.release(rs, ps, conn);
		}
		return list;
	}
	
}
