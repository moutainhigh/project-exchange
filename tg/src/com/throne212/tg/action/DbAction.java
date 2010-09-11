package com.throne212.tg.action;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.ResultSetMetaData;
import java.util.List;
import java.util.Map;
import java.util.TreeMap;

import com.throne212.tg.common.JdbcUtil;
import com.throne212.tg.common.Util;
import com.throne212.tg.entity.TableField;

public class DbAction {
	public static void main(String[] args) {
		new DbAction().show();
	}
	private Integer index;
	private Map<String,String> maps = new TreeMap<String, String>();
	public String show(){
		Connection conn = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		ResultSetMetaData rsmd = null;
		try {
			conn = JdbcUtil.getConn();
			ps = conn.prepareStatement("use tg");
			ps.execute();
			ps.close();
			
			ps = conn.prepareStatement("show tables");
			rs = ps.executeQuery();
			while(rs.next()){
				System.out.println(rs.getString(1));
			}
			ps.close();
			
			ps = conn.prepareStatement("select * from teams");
			rsmd = ps.getMetaData();
			int colCount = rsmd.getColumnCount();
			
			for (int i = 0; i < colCount; i++) {
				String colName = rsmd.getColumnName(i+1);
				int type = rsmd.getColumnType(i+1);
				System.out.println(JdbcUtil.getColumnType(type)+"\t"+colName+"\t"+type);
				maps.put(colName, JdbcUtil.getColumnType(type));
			}
		} catch (Exception e) {
			e.printStackTrace();
			JdbcUtil.rollback(conn);
		} finally{
			JdbcUtil.close(conn, ps, rs);
		}
		
		return "db_show";
	}
	public Map<String, String> getMaps() {
		return maps;
	}
	public void setMaps(Map<String, String> maps) {
		this.maps = maps;
	}
	
	private String database;
	private String tableName;
	private List<TableField> fieldList;
	
	//建表
	public String createTable(){
		Connection conn = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		try {
			conn = JdbcUtil.getConn();
			conn.setAutoCommit(true);
			ps = conn.prepareStatement("use "+database);
			ps.execute();
			ps.close();
			
			StringBuffer sb = new StringBuffer();
			sb.append("CREATE TABLE ");
			sb.append(tableName);
			sb.append("(");
			for(TableField f : fieldList){
				if(f != null && !Util.isEmpty(f.getName()) && !Util.isEmpty(f.getType())){
					String tmp = "";
					if("varchar".equals(f.getType())){
						tmp = f.getName()+" "+f.getType()+"("+f.getLength()+")";
						tmp += f.getIsNullable()!=null&&f.getIsNullable()==false?"NOT NULL,":",";
					}else if("int".equals(f.getType())){
						tmp = f.getName()+" "+f.getType();
						tmp += f.getIsNullable()!=null&&f.getIsNullable()==false?"NOT NULL,":",";
					}else if("double".equals(f.getType())){
						tmp = f.getName()+" "+f.getType();
						tmp += f.getIsNullable()!=null&&f.getIsNullable()==false?"NOT NULL,":",";
					}
					sb.append(tmp);
				}
			}
			if(sb.charAt(sb.length()-1) == ','){
				sb.deleteCharAt(sb.length()-1);
			}
			sb.append(")");
			System.out.println("sql="+sb.toString());
			
			ps = conn.prepareStatement(sb.toString());
			ps.executeUpdate();
			System.out.println("数据库【"+database+"】，建表【"+tableName+"】 成功");
		} catch (Exception e) {
			e.printStackTrace();
			JdbcUtil.rollback(conn);
		} finally{
			JdbcUtil.close(conn, ps, rs);
		}
		index = 1;
		return "index";
	}

	public String getDatabase() {
		return database;
	}
	public void setDatabase(String database) {
		this.database = database;
	}
	public List<TableField> getFieldList() {
		return fieldList;
	}
	public void setFieldList(List<TableField> fieldList) {
		this.fieldList = fieldList;
	}
	public String getTableName() {
		return tableName;
	}
	public void setTableName(String tableName) {
		this.tableName = tableName;
	}
	public Integer getIndex() {
		return index;
	}
	public void setIndex(Integer index) {
		this.index = index;
	}
	
}
