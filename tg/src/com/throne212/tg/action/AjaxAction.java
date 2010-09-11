package com.throne212.tg.action;

import java.io.File;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.ResultSetMetaData;
import java.util.ArrayList;
import java.util.List;

import com.throne212.tg.common.JdbcUtil;
import com.throne212.tg.common.WebConstants;
import com.throne212.tg.entity.TableField;

public class AjaxAction {
	private List<String> list;
	public String loadDatabases(){
		String sql = "show databases";
		Connection conn = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		try {
			conn = JdbcUtil.getConn();
			ps = conn.prepareStatement(sql);
			rs = ps.executeQuery();
			list = new ArrayList<String>();
			while(rs.next()){
				list.add(rs.getString(1));
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally{
			JdbcUtil.close(conn, ps, rs);
		}
		return "databases";
	}
	private String database;
	private String table;
	public String loadTables(){
		Connection conn = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		try {
			conn = JdbcUtil.getConn();
			ps = conn.prepareStatement("use "+database);
			ps.execute();
			ps.close();
			
			ps = conn.prepareStatement("show tables");
			rs = ps.executeQuery();
			list = new ArrayList<String>();
			while(rs.next()){
				list.add(rs.getString(1));
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally{
			JdbcUtil.close(conn, ps, rs);
		}
		return "tables";
	}
	private List<TableField> fieldList;
	public String loadColumns(){
		Connection conn = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		ResultSetMetaData rsmd = null;
		try {
			conn = JdbcUtil.getConn();
			ps = conn.prepareStatement("use " +database );
			ps.execute();
			ps.close();
			
			ps = conn.prepareStatement("select * from " + table);
			rsmd = ps.getMetaData();
			int colCount = rsmd.getColumnCount();
			fieldList = new ArrayList<TableField>();
			for (int i = 0; i < colCount; i++) {
				String colName = rsmd.getColumnName(i+1);
				int type = rsmd.getColumnType(i+1);
				System.out.println(JdbcUtil.getColumnType(type)+"\t"+colName+"\t"+type);
				TableField f = new TableField();
				f.setName(colName);
				f.setType(JdbcUtil.getColumnType(type));
				fieldList.add(f);
			}
		} catch (Exception e) {
			e.printStackTrace();
			JdbcUtil.rollback(conn);
		} finally{
			JdbcUtil.close(conn, ps, rs);
		}
		return "columns";
	}
	public String loadConfigs() {
		String xmlpath = WebConstants.xmlpath;
		File dir = new File(xmlpath);
		if (dir.isDirectory()) {
			String[] fileNames = dir.list();
			list = new ArrayList<String>();
			for (String file : fileNames) {
				if (file.contains(".xml")) {
					String name = file.substring(0, file.lastIndexOf("."));
					list.add(name);
				}
			}
		}
		return "configs";
	}
	private List<List<Object>> dataList;
	public String loadTableDataMeta(){
		Connection conn = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		ResultSetMetaData rsmd = null;
		try {
			conn = JdbcUtil.getConn();
			ps = conn.prepareStatement("use " +database );
			ps.execute();
			ps.close();
			
			ps = conn.prepareStatement("select * from " + table);
			rsmd = ps.getMetaData();
			int colCount = rsmd.getColumnCount();
			fieldList = new ArrayList<TableField>();
			for (int i = 0; i < colCount; i++) {
				String colName = rsmd.getColumnName(i+1);
				int type = rsmd.getColumnType(i+1);
				System.out.println(JdbcUtil.getColumnType(type)+"\t"+colName+"\t"+type);
				TableField f = new TableField();
				f.setName(colName);
				f.setType(JdbcUtil.getColumnType(type));
				fieldList.add(f);
			}
			System.out.println("元数据读取完成");
		} catch (Exception e) {
			e.printStackTrace();
			JdbcUtil.rollback(conn);
		} finally{
			JdbcUtil.close(conn, ps, rs);
		}
		return "tableDataMeta";
	}
	public String loadTableData(){
		Connection conn = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		ResultSetMetaData rsmd = null;
		try {
			conn = JdbcUtil.getConn();
			ps = conn.prepareStatement("use " +database );
			ps.execute();
			ps.close();
			
			ps = conn.prepareStatement("select * from " + table);
			rsmd = ps.getMetaData();
			int colCount = rsmd.getColumnCount();
			ps.close();
			
			ps = conn.prepareStatement("select * from " + table);
			rs = ps.executeQuery();
			dataList = new ArrayList<List<Object>>();
			while(rs.next()){
				//Object[] data = new Object[colCount];
				List<Object> data = new ArrayList<Object>();
				for (int i = 0; i < colCount; i++) {
					data.add(rs.getObject(i+1));
				}
				dataList.add(data);
			}
			System.out.println("数据读取完成:"+dataList.size());
		} catch (Exception e) {
			e.printStackTrace();
			JdbcUtil.rollback(conn);
		} finally{
			JdbcUtil.close(conn, ps, rs);
		}
		return "tableData";
	}
	//setter & getter
	public List<String> getList() {
		return list;
	}
	public void setList(List<String> list) {
		this.list = list;
	}
	public String getDatabase() {
		return database;
	}
	public void setDatabase(String database) {
		this.database = database;
	}
	public String getTable() {
		return table;
	}
	public void setTable(String table) {
		this.table = table;
	}
	public List<TableField> getFieldList() {
		return fieldList;
	}
	public void setFieldList(List<TableField> fieldList) {
		this.fieldList = fieldList;
	}
	public List<List<Object>> getDataList() {
		return dataList;
	}
	public void setDataList(List<List<Object>> dataList) {
		this.dataList = dataList;
	}
	
}
	
