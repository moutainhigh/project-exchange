package com.throne212.jianzhi8.biz.impl.jdbc;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import javax.sql.DataSource;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.throne212.jianzhi8.biz.ViewBiz;
import com.throne212.jianzhi8.common.PageBean;
import com.throne212.jianzhi8.dao.ContentDAO;
import com.throne212.jianzhi8.dao.RegionDAO;
import com.throne212.jianzhi8.dataobject.ContentDO;
import com.throne212.jianzhi8.dataobject.ContentListRowMapper;
import com.throne212.jianzhi8.domain.Content;
import com.throne212.jianzhi8.domain.Region;

@Service("viewBiz")
@Transactional
public class ViewBizImpl implements ViewBiz {

	private Logger logger = Logger.getLogger(this.getClass());

	private JdbcTemplate jdbcTemplate;

	private ContentDAO contentDAO;
	private RegionDAO regionDAO;

	@Autowired
	public void setDataSource(DataSource dataSource) {
		this.jdbcTemplate = new JdbcTemplate(dataSource);
	}

	@Autowired
	public void setRegionDAO(RegionDAO regionDAO) {
		this.regionDAO = regionDAO;
	}

	@Autowired
	public void setContentDAO(ContentDAO contentDAO) {
		this.contentDAO = contentDAO;
	}

	public Content getContentByNo(int ctNo) {
		return contentDAO.findById(ctNo);
	}

	public PageBean<ContentDO> listContent(String kind, String ctClass, String cityCode, String typeId, int pageIndex) {

		PageBean<ContentDO> bean = new PageBean<ContentDO>();

		// 制作参数
		if (pageIndex == 0)
			pageIndex = 1;
		int startIndex = (pageIndex - 1) * 30;

		// 首先计算总行数
		int len = 0;
		String sql = "select count(*)";
		sql += " from content_tab";
		sql += " where ct_ischeck != '0' and ct_city_id=? and ct_kind=?";
		if(ctClass != null)
			sql += " and ct_class='"+ctClass+"'";
		logger.debug("sql:" + sql);
		if (typeId != null) {
			sql += " and ct_type_id like ?";
			len = jdbcTemplate.queryForInt(sql, cityCode, kind, "%" + typeId + "%");
		} else {
			len = jdbcTemplate.queryForInt(sql, cityCode, kind);
		}
		logger.debug("总行数：" + len);
		bean.setTotalRow(len);

		// 计算的到数据
		Object[] params = new Object[] { cityCode, kind, startIndex };
		sql = "select ct_no,ct_title,left(ct_content,45) as sim_con,ct_update,ct_type_name,ct_type_id,ct_isyz,ct_ispay,ct_enddate,u.user_file_name as user_file,ct_class";
		sql += " from content_tab left outer join user_tab u on u.user_id=ct_user_id";
		sql += " where ct_ischeck <> '0' and ct_city_id=? and ct_kind=?";
		if(ctClass != null)
			sql += " and ct_class='"+ctClass+"'";
		if (typeId != null) {
			sql += " and ct_type_id like ?";
			params = new Object[] { cityCode, kind, "%" + typeId + "%", startIndex };
		}
		sql += " order by ct_ispay desc, ct_isyz desc, ct_update desc";
		sql += " limit ?,30";

		logger.debug("sql:" + sql);

		jdbcTemplate.setMaxRows(30);
		List<ContentDO> list = jdbcTemplate.query(sql, params, new ContentListRowMapper());
		bean.setResultList(list);
		bean.setPageIndex(pageIndex);
		bean.setRowPerPage(30);

		return bean;
	}

	public PageBean<ContentDO> listShixiContent(String cityCode, int pageIndex) {
		PageBean<ContentDO> bean = new PageBean<ContentDO>();

		// 制作参数
		if (pageIndex == 0)
			pageIndex = 1;
		int startIndex = (pageIndex - 1) * 30;

		// 首先计算总行数
		int len = 0;
		String sql = "select count(*)";
		sql += " from content_tab";
		sql += " where ct_ischeck != '0' and ct_city_id=? and ct_type_id like ?";
		logger.debug("sql:" + sql);
		len = jdbcTemplate.queryForInt(sql, cityCode, "%K25%");
		logger.debug("总行数：" + len);
		bean.setTotalRow(len);

		// 计算的到数据
		Object[] params = new Object[] { cityCode, "%K25%", startIndex };
		sql = "select ct_no,ct_title,left(ct_content,45) as sim_con,ct_update,ct_type_name,ct_type_id,ct_isyz,ct_ispay,ct_enddate,u.user_file_name as user_file,ct_class";
		sql += " from content_tab left outer join user_tab u on u.user_id=ct_user_id";
		sql += " where ct_ischeck != '0' and ct_city_id=? and ct_type_id like ?";
		sql += " order by ct_ispay desc, ct_isyz desc, ct_update desc";
		sql += " limit ?,30";

		logger.debug("sql:" + sql);

		jdbcTemplate.setMaxRows(30);
		List<ContentDO> list = jdbcTemplate.query(sql, params, new ContentListRowMapper());
		bean.setResultList(list);
		bean.setPageIndex(pageIndex);
		bean.setRowPerPage(30);

		return bean;
	}

	public PageBean<ContentDO> searchContent(String key, String cityCode, int pageIndex, String kind) {

		PageBean<ContentDO> bean = new PageBean<ContentDO>();

		// 制作参数
		if (pageIndex == 0)
			pageIndex = 1;
		int startIndex = (pageIndex - 1) * 30;

		// 首先计算总行数
		int len = 0;
		String sql = "select count(*)";
		sql += " from content_tab";
		sql += " where ct_ischeck != '0' and ct_city_id=? and (ct_title like ? or ct_content like ?)";
		if (kind != null)
			sql += " and ct_kind='" + kind + "'";
		logger.debug("sql:" + sql);
		len = jdbcTemplate.queryForInt(sql, cityCode, "%" + key + "%", "%" + key + "%");
		logger.debug("总行数：" + len);
		bean.setTotalRow(len);

		// 计算的到数据
		Object[] params = new Object[] { cityCode, "%" + key + "%", "%" + key + "%", startIndex };
		sql = "select ct_no,ct_title,left(ct_content,45) as sim_con,ct_update,ct_type_name,ct_type_id,ct_isyz,ct_ispay,ct_enddate,u.user_file_name as user_file,ct_class";
		sql += " from content_tab left outer join user_tab u on u.user_id=ct_user_id";
		sql += " where ct_ischeck != '0' and ct_city_id=? and (ct_title like ? or ct_content like ?)";
		if (kind != null)
			sql += " and ct_kind='" + kind + "'";
		sql += " order by ct_ispay desc, ct_isyz desc, ct_update desc";
		sql += " limit ?,30";

		logger.debug("sql:" + sql);

		jdbcTemplate.setMaxRows(30);
		List<ContentDO> list = jdbcTemplate.query(sql, params, new ContentListRowMapper());
		bean.setResultList(list);
		bean.setPageIndex(pageIndex);
		bean.setRowPerPage(30);

		return bean;
	}
	
	public void addLoonum(int ctNo){
		String sql = "update content_tab set ct_looknum=ct_looknum+1 where ct_no=?";
		int rst = jdbcTemplate.update(sql, ctNo);
		logger.info("add look num rst : " + rst);
	}
	
	public PageBean<ContentDO> listYzContent(String ctClass, String cityCode, String typeId, int pageIndex){
		PageBean<ContentDO> bean = new PageBean<ContentDO>();

		// 制作参数
		if (pageIndex == 0)
			pageIndex = 1;
		int startIndex = (pageIndex - 1) * 30;

		// 首先计算总行数
		int len = 0;
		String sql = "select count(*)";
		sql += " from content_tab";
		sql += " where ct_ischeck != '0' and ct_city_id=? and ct_kind='0' and ct_isyz='1'";
		if(ctClass != null)
			sql += " and ct_class='"+ctClass+"'";
		logger.debug("sql:" + sql);
		if (typeId != null) {
			sql += " and ct_type_id like ?";
			len = jdbcTemplate.queryForInt(sql, cityCode, "%" + typeId + "%");
		} else {
			len = jdbcTemplate.queryForInt(sql, cityCode);
		}
		logger.debug("总行数：" + len);
		bean.setTotalRow(len);

		// 计算的到数据
		Object[] params = new Object[] { cityCode, startIndex };
		sql = "select ct_no,ct_title,left(ct_content,45) as sim_con,ct_update,ct_type_name,ct_type_id,ct_isyz,ct_ispay,ct_enddate,u.user_file_name as user_file,ct_class";
		sql += " from content_tab left outer join user_tab u on u.user_id=ct_user_id";
		sql += " where ct_ischeck <> '0' and ct_city_id=? and ct_kind='0' and ct_isyz='1'";
		if(ctClass != null)
			sql += " and ct_class='"+ctClass+"'";
		if (typeId != null) {
			sql += " and ct_type_id like ?";
			params = new Object[] { cityCode, "%" + typeId + "%", startIndex };
		}
		sql += " order by ct_ispay desc, ct_isyz desc, ct_update desc";
		sql += " limit ?,30";

		logger.debug("sql:" + sql);

		jdbcTemplate.setMaxRows(30);
		List<ContentDO> list = jdbcTemplate.query(sql, params, new ContentListRowMapper());
		bean.setResultList(list);
		bean.setPageIndex(pageIndex);
		bean.setRowPerPage(30);

		return bean;
	}
}
