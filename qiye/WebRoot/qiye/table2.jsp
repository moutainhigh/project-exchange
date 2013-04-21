<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.DriverManager"%>
<%@ page language="java" import="java.util.*" pageEncoding="GBK"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%
	Class.forName("com.mysql.jdbc.Driver");
	Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/qiye", "root", "123");
	String ba02 = request.getParameter("ba02");
	String ba00 = request.getParameter("ba00");
	String ba01 = request.getParameter("ba01");
	String ba03 = request.getParameter("ba03");
	String ba13 = request.getParameter("ba13");
	String ba16 = request.getParameter("ba16");
	String fuze = request.getParameter("fuze");
	String filler = request.getParameter("filler");
	String date = request.getParameter("date");
	String user_id = request.getParameter("user_id");
	try{
		PreparedStatement ps = null;
		ResultSet rs = null;
		//判断是否已经存在于库里了
		boolean isNew = true;
		String sql = "select * from table0 where user_id=?";
		ps = conn.prepareStatement(sql);
		ps.setString(1, user_id);
		rs = ps.executeQuery();
		if(rs.next()){
			isNew = false;
		}
		rs.close();
		ps.close();
		//更新或添加
		if(ba02 != null && !"".equals(ba02)){
			if(isNew){
				sql = "insert into table0 values(?,?,?,?,?,?,?,?,?,?)";
			}else{
				sql = "update table0 set ba02=?,ba00=?,ba01=?,ba03=?,ba13=?,ba16=?,fuze=?,filler=?,date=?,user_id=?";
			}
			ps = conn.prepareStatement(sql);
			int i=1;
			ps.setString(i++,ba02);
			ps.setString(i++,ba00);
			ps.setString(i++,ba01);
			ps.setString(i++,ba03);
			ps.setString(i++,ba13);
			ps.setString(i++,ba16);
			ps.setString(i++,fuze);
			ps.setString(i++,filler);
			ps.setString(i++,date);
			ps.setString(i++,user_id);
			int rst = ps.executeUpdate();
			if(rst > 0)
				request.setAttribute("msg","保存成功");
			ps.close();
		}
		//找出数据
		sql = "select * from table0 where user_id=?";
		ps = conn.prepareStatement(sql);
		ps.setString(1, user_id);
		rs = ps.executeQuery();
		if(rs.next()){
			ba02 = rs.getString("ba02");
			ba00 = rs.getString("ba00");
			ba01 = rs.getString("ba01");
			ba03 = rs.getString("ba03");
			ba13 = rs.getString("ba13");
			ba16 = rs.getString("ba16");
			fuze = rs.getString("fuze");
			filler = rs.getString("filler");
			date = rs.getString("date");
		}
		ba02 = ba02==null?"":ba02;
		ba00 = ba00==null?"":ba00;
		ba01 = ba01==null?"":ba01;
		ba03 = ba03==null?"":ba03;
		ba13 = ba13==null?"":ba13;
		ba16 = ba16==null?"":ba16;
		fuze = fuze==null?"":fuze;
		filler = filler==null?"":filler;
		date = date==null?"":date;
	}catch(Exception ex){
		ex.printStackTrace();
		request.setAttribute("msg","保存成功");
	}finally{
		if(conn != null && !conn.isClosed()){
			conn.close();
		}
	}
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
	<head>
		<title>企业基础信息</title>
		<meta http-equiv="Content-Type" content="text/html; charset=GBK" />
		<link rel="stylesheet" type="text/css" href="../css/styles.css">
		<script type="text/javascript" src="../js/jquery.js"></script>
		<script type="text/javascript">
			var msg = '${msg}';
			if(msg != '')
				alert(msg);
			function saveForm(){
				document.forms[0].submit();
			}
		</script>
	</head>
	<body>
		<form name="messageForm" method="get" action="table0.jsp">
			<input type="hidden" name="user_id" value="test002"/>
			<table width="90%" border="0" cellspacing="1" cellpadding="0" align="center">
			    <tr>
			      <td height="18" align=center>
			        <font class=caption>人员概况</font>
			      </td>
			    </tr>
			</table>
			<div style="height: 25px;"></div>
			<table width="95%" border="0" cellspacing="1" cellpadding="0" class=table align="center">
				<tr class="list_td_context">
					<td colspan="3">长期职工、技术职称及企业科技人员</td>
					<td>文化程度构成</td>
					<td>&nbsp;</td>
					<td>&nbsp;</td>
					<td colspan="3">企业负责人（法人代表）情况</td>
				</tr>
				<tr class="list_td_context">
					<td>长期职工总数</td>
					<td>PE1010</td>
					<td><input type="text" name="FI200" value=""/>人</td>
					<td>博  士</td>
					<td>PA0</td>
					<td><input type="text" name="FI200" value=""/>人</td>
					<td>性    别</td>
					<td>PE01</td>
					<td><input type="text" name="FI200" value=""/></td>
				</tr>
				<tr class="list_td_context">
					<td>其中：高级职称</td>
					<td>PE1011</td>
					<td><input type="text" name="FI200" value=""/>人</td>
					<td>硕  士</td>
					<td>PA1</td>
					<td><input type="text" name="FI200" value=""/>人</td>
					<td>出生年份</td>
					<td>PE02</td>
					<td><input type="text" name="FI200" value=""/></td>
				</tr>
				<tr class="list_td_context">
					<td>中级职称</td>
					<td>PE1012</td>
					<td><input type="text" name="FI200" value=""/>人</td>
					<td>大  学</td>
					<td>PA2</td>
					<td><input type="text" name="FI200" value=""/>人</td>
					<td>文化程度</td>
					<td>PE04</td>
					<td><input type="text" name="FI200" value=""/></td>
				</tr>
				<tr class="list_td_context">
					<td>初级职称</td>
					<td>PE1013</td>
					<td><input type="text" name="FI200" value=""/>人</td>
					<td>大  专</td>
					<td>PA3</td>
					<td><input type="text" name="FI200" value=""/>人</td>
					<td>所学专业</td>
					<td>PE05</td>
					<td><input type="text" name="FI200" value=""/></td>
				</tr>
				<tr class="list_td_context">
					<td>其中：从事科技活动人员</td>
					<td>PE1020</td>
					<td><input type="text" name="FI200" value=""/>人</td>
					<td>中  专</td>
					<td>PA4</td>
					<td><input type="text" name="FI200" value=""/>人</td>
					<td>&nbsp;</td>
					<td>&nbsp;</td>
					<td>&nbsp;</td>
				</tr>
				<tr class="list_td_context">
					<td>其中：研究与试验发展人员</td>
					<td>PE1021</td>
					<td><input type="text" name="FI200" value=""/>人年</td>
					<td>&nbsp;</td>
					<td>&nbsp;</td>
					<td>&nbsp;</td>
					<td>&nbsp;</td>
					<td>&nbsp;</td>
					<td>&nbsp;</td>
				</tr>
			</table>
			<table width="90%" border="0" cellspacing="1" cellpadding="0" class=table align="center">
				<tr>
					<td align="center">
						<input type="button" name="" value="保 存" onclick="saveForm();">
					</td>
				</tr>
			</table>
		</form>
	</body>
</html>
