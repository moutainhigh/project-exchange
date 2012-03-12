package com.throne212.jianzhi8.biz.impl.jdbc;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import javax.sql.DataSource;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Service;

import com.throne212.jianzhi8.biz.ViewBiz;
import com.throne212.jianzhi8.common.MasterDBUtil;
import com.throne212.jianzhi8.common.PageBean;
import com.throne212.jianzhi8.common.Util;
import com.throne212.jianzhi8.common.WordToSpell;
import com.throne212.jianzhi8.dao.ContentDAO;
import com.throne212.jianzhi8.dataobject.ContentDO;
import com.throne212.jianzhi8.dataobject.ResumeDO;
import com.throne212.jianzhi8.domain.Content;
import com.throne212.jianzhi8.domain.User;

@Service("viewBiz")
public class ViewBizImpl implements ViewBiz {

	private Logger logger = Logger.getLogger(this.getClass());

	private JdbcTemplate jdbcTemplate;

	private ContentDAO contentDAO;

	@Autowired
	public void setDataSource(DataSource dataSource) {
		this.jdbcTemplate = new JdbcTemplate(dataSource);
	}

	@Autowired
	public void setContentDAO(ContentDAO contentDAO) {
		this.contentDAO = contentDAO;
	}

	public Content getContentByNo(int ctNo) {
		return contentDAO.findById(ctNo);
	}

	public PageBean<ContentDO> listContent(String kind, String ctClass, String cityCode, String typeId, String jobdate, String unitype, boolean yz, String key, int pageIndex) {

		PageBean<ContentDO> bean = new PageBean<ContentDO>();

		// 制作参数
		if (pageIndex == 0)
			pageIndex = 1;
		int startIndex = (pageIndex - 1) * 30;

		// 首先计算总行数
		Object[] params = new Object[] { cityCode, kind};
		int len = 0;
		String sql = " from content_tab left outer join user_tab u on u.user_id=ct_user_id left outer join region_tab r on r.city_code=ct_city_id";
		sql += " where ct_ischeck <> '0' and ct_city_id=? and ct_kind=?";
		if(!Util.isEmpty(ctClass))
			sql += " and ct_class='"+ctClass+"'";
		if (!Util.isEmpty(typeId)) {
			sql += " and ct_type_id like '%"+typeId+"%'";
		}
		if (!Util.isEmpty(jobdate)) {
			sql += " and ct_jobdate = '"+jobdate+"'";
		}
		if (!Util.isEmpty(unitype)) {
			sql += " and ct_unittype = '"+unitype+"'";
		}
		if (!Util.isEmpty(key)) {
			sql += " and ct_title like ?";
			params = new Object[] { cityCode, kind, "%" + key + "%"};
		}
		if (yz) {
			sql += " and ct_isyz='1'";
		}
		len = jdbcTemplate.queryForInt("select count(ct_no)" + sql, params);
		logger.debug("总行数：" + len);
		bean.setTotalRow(len);

		// 计算的到数据
		sql = "select ct_no,ct_title,ct_update,ct_type_id,ct_isyz,ct_ispay,ct_enddate,u.user_file_name as user_file,ct_class,r.city_code city_code, r.city_name city_name, u.user_company_name company_name, ct_salary, u.user_age age, u.user_sex sex, u.user_id user_id" + sql;
		sql += " order by ct_enddate desc";
		sql += " limit " + startIndex +",30";

		logger.debug("sql:" + sql);

		jdbcTemplate.setMaxRows(30);
		@SuppressWarnings("unchecked")
		List<ContentDO> list = jdbcTemplate.query(sql, params, new RowMapper(){
			public Object mapRow(ResultSet rs, int i) throws SQLException {
				ContentDO c = new ContentDO();
				c.setCtNo(rs.getString("ct_no"));
				c.setTitle(rs.getString("ct_title"));
				c.setDate(rs.getDate("ct_update"));
				c.setTypeId(rs.getString("ct_type_id"));
				c.setIsPay(rs.getString("ct_ispay"));
				c.setIsYz(rs.getString("ct_isyz"));
				c.setEnddate(rs.getDate("ct_enddate"));
				c.setUserFile(rs.getString("user_file"));
				c.setCtClass(rs.getString("ct_class"));
				c.setCityCode(rs.getString("city_code"));
				c.setCityName(rs.getString("city_name"));
				c.setCompanyName(rs.getString("company_name"));
				c.setSalary(rs.getString("ct_salary"));
				c.setAge(rs.getString("age"));
				c.setSex(rs.getString("sex"));
				c.setUserId(rs.getString("user_id"));
				return c;
			}
		});
		bean.setResultList(list);
		bean.setPageIndex(pageIndex);
		bean.setRowPerPage(30);

		return bean;
	}
	
	public PageBean<ContentDO> search(String cityCode, String key, int pageIndex) {
		PageBean<ContentDO> bean = new PageBean<ContentDO>();
		// 制作参数
		if (pageIndex == 0)
			pageIndex = 1;
		int startIndex = (pageIndex - 1) * 30;

		// 首先计算总行数
		Object[] params = new Object[] { cityCode, "%" + key + "%"};
		int len = 0;
		String sql = " from content_tab";
		sql += " where ct_ischeck <> '0' and ct_city_id=? and ct_title like ?";
		len = jdbcTemplate.queryForInt("select count(ct_no)" + sql, params);
		logger.debug("总行数：" + len);
		bean.setTotalRow(len);

		// 计算的到数据
		sql = "select ct_no,ct_title,ct_update,ct_isyz,ct_ispay,ct_enddate,ct_class,left(ct_type_id,3) type_id,ct_type_name" + sql;
		sql += " order by ct_enddate desc";
		sql += " limit "+startIndex+",30";

		logger.debug("sql:" + sql);

		jdbcTemplate.setMaxRows(30);
		@SuppressWarnings("unchecked")
		List<ContentDO> list = jdbcTemplate.query(sql, params, new RowMapper(){
			public Object mapRow(ResultSet rs, int i) throws SQLException {
				ContentDO c = new ContentDO();
				c.setCtNo(rs.getString("ct_no"));
				c.setTitle(rs.getString("ct_title"));
				c.setDate(rs.getDate("ct_update"));
				c.setIsPay(rs.getString("ct_ispay"));
				c.setIsYz(rs.getString("ct_isyz"));
				c.setEnddate(rs.getDate("ct_enddate"));
				c.setCtClass(rs.getString("ct_class"));
				c.setTypeId(rs.getString("type_id"));
				c.setTypeName(rs.getString("ct_type_name"));
				return c;
			}
		});
		bean.setResultList(list);
		bean.setPageIndex(pageIndex);
		bean.setRowPerPage(30);

		return bean;
	}
	
	public PageBean<ResumeDO> listResume(String cityCode, String typeId, String jobdate, String key,int pageIndex) {

		PageBean<ResumeDO> bean = new PageBean<ResumeDO>();

		// 制作参数
		if (pageIndex == 0)
			pageIndex = 1;
		int startIndex = (pageIndex - 1) * 30;

		// 首先计算总行数
		Object[] params = new Object[] { cityCode};
		int len = 0;
		String sql = " from user_tab left outer join region_tab c on c.city_code=user_city_id";
		sql += " where user_ischeck<>'0' and user_islock<>'1' and user_city_id=? and user_kind='0'";
		if (!Util.isEmpty(typeId)) {
			sql += " and user_type_id like '%"+typeId+"%'";
		}
		if (!Util.isEmpty(key)) {
			sql += " and (user_pingjia like ? or user_brief like ?)";
			params = new Object[] { cityCode, "%" + key + "%" , "%" + key + "%"};
		}
		len = jdbcTemplate.queryForInt("select count(user_no)" + sql, params);
		logger.debug("简历总行数：" + len);
		bean.setTotalRow(len);

		// 计算的到数据
		sql = "select user_no,user_id,user_name,user_update,user_age,user_sex,user_type_name,user_class,user_kind,user_shenfen,user_city_id,c.city_name city_name" + sql;
		sql += " order by user_update desc";
		sql += " limit "+startIndex+",30";

		logger.debug("sql:" + sql);

		jdbcTemplate.setMaxRows(30);
		@SuppressWarnings("unchecked")
		List<ResumeDO> list = jdbcTemplate.query(sql, params, new RowMapper(){
			public Object mapRow(ResultSet rs, int i) throws SQLException {
				ResumeDO r = new ResumeDO();
				r.setAge(rs.getString("user_age"));
				r.setCityCode(rs.getString("user_city_id"));
				r.setCityName(rs.getString("city_name"));
				r.setDate(rs.getTimestamp("user_update"));
				r.setSex(rs.getString("user_sex"));
				r.setShenfen(rs.getString("user_shenfen"));
				r.setTypeName(rs.getString("user_type_name"));
				r.setUserClass(rs.getString("user_class"));
				r.setUserId(rs.getString("user_id"));
				r.setUserKind(rs.getString("user_kind"));
				r.setUserName(rs.getString("user_name"));
				r.setUserNo(rs.getString("user_no"));
				return r;
			}
		});
		bean.setResultList(list);
		bean.setPageIndex(pageIndex);
		bean.setRowPerPage(30);

		return bean;
	}

	public void addLoonum(int ctNo){
//		String sql = "update content_tab set ct_looknum=ct_looknum+1 where ct_no=?";
//		int rst = jdbcTemplate.update(sql, ctNo);
//		logger.info("add look num rst : " + rst);
		Connection conn = null;
		try {
			conn = MasterDBUtil.getConn();
			String sql = "update content_tab set ct_looknum=ct_looknum+1 where ct_no=?";
			int rst = MasterDBUtil.exeUpdate(conn, sql, ctNo);
			logger.info("update ct_looknum : " + ctNo + ", succ len=" + rst);
		} catch (Exception e) {
			e.printStackTrace();
		} finally{
			MasterDBUtil.closeConn(conn);
		}
	}
	
	public void addResumeLoonum(int ctNo){
		String sql = "update user_tab set user_looknum=user_looknum+1 where user_no=?";
		int rst = jdbcTemplate.update(sql, ctNo);
		logger.info("add resume look num rst : " + rst);
	}
	
	//fen首页专用的biz
	public List<ContentDO> indexZhaopinRegdateListContent(String cityCode) {
		Object[] params = new Object[] { cityCode, "1"};
		String sql = "select ct_no,ct_title,ct_regdate,ct_type_id,t.type_name type_name";
		sql += " from content_tab left outer join type_tab t on t.type_code=ct_type_id";
		sql += " where ct_ischeck <> '0' and ct_city_id=? and ct_kind=? and t.type_name is not null";
		sql += " order by ct_regdate desc";
		logger.debug("index list sql:" + sql);
		jdbcTemplate.setMaxRows(50);
		List<ContentDO> list = jdbcTemplate.query(sql, params, new RowMapper(){
			public ContentDO mapRow(ResultSet rs, int len) throws SQLException {
				ContentDO c = new ContentDO();
				c.setCtNo(rs.getString("ct_no"));
				c.setTitle(rs.getString("ct_title"));
				c.setRegdate(rs.getDate("ct_regdate"));
				c.setTypeId(rs.getString("ct_type_id"));
				c.setTypeName(rs.getString("type_name"));
				return c;
			}
		});
		return list;
	}
	
	public List<ContentDO> indexZhaopinEnddateListContent(String cityCode) {
		Object[] params = new Object[] { cityCode, "1"};
		String sql = "select ct_no,ct_title,ct_enddate,ct_ispay";
		sql += " from content_tab";
		sql += " where ct_ischeck <> '0' and ct_city_id=? and ct_kind=?";
		sql += " order by ct_enddate desc";
		logger.debug("index list sql:" + sql);
		jdbcTemplate.setMaxRows(15);
		List<ContentDO> list = jdbcTemplate.query(sql, params, new RowMapper(){
			public ContentDO mapRow(ResultSet rs, int len) throws SQLException {
				ContentDO c = new ContentDO();
				c.setCtNo(rs.getString("ct_no"));
				c.setTitle(rs.getString("ct_title"));
				c.setEnddate(rs.getTimestamp("ct_enddate"));
				c.setIsPay(rs.getString("ct_ispay"));
				return c;
			}
		});
		return list;
	}
	
	public List<ContentDO> indexQiuzhiUpdateListContent(String cityCode) {
		Object[] params = new Object[] { cityCode, "0"};
		String sql = "select ct_no,ct_title";
		sql += " from content_tab";
		sql += " where ct_ischeck <> '0' and ct_city_id=? and ct_kind=?";
		sql += " order by ct_update desc";
		logger.debug("index list sql:" + sql);
		jdbcTemplate.setMaxRows(11);
		List<ContentDO> list = jdbcTemplate.query(sql, params, new RowMapper(){
			public ContentDO mapRow(ResultSet rs, int len) throws SQLException {
				ContentDO c = new ContentDO();
				c.setCtNo(rs.getString("ct_no"));
				c.setTitle(rs.getString("ct_title"));
				return c;
			}
		});
		return list;
	}
	
	public List<User> indexRencaiUpdateListContent(String cityCode) {
		Object[] params = new Object[] { cityCode};
		String sql = "select user_no,user_name";
		sql += " from user_tab";
		sql += " where user_islock='0' and user_city_id=? and user_kind='0'";
		sql += " order by user_lastdate desc";
		logger.debug("index list sql:" + sql);
		jdbcTemplate.setMaxRows(11);
		List<User> list = jdbcTemplate.query(sql, params, new RowMapper(){
			public User mapRow(ResultSet rs, int len) throws SQLException {
				User u = new User();
				u.setUserNo(rs.getInt("user_no"));
				u.setUserName(rs.getString("user_name"));
				return u;
			}
		});
		return list;
	}
	
}
