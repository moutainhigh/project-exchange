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
			function add(){
				
			}
		</script>
	</head>
	<body>
		<form name="messageForm" method="get" action="table0.jsp">
			<input type="hidden" name="user_id" value="test002"/>
			<table width="90%" border="0" cellspacing="1" cellpadding="0" align="center">
			    <tr>
			      <td height="18" align=center>
			        <font class=caption>主要产品及专利概况</font>
			      </td>
			    </tr>
			</table>
			<div style="height: 25px;"></div>
			<table width="95%" border="0" cellspacing="1" cellpadding="0" class=table align="center">
				<tr class="list_td_context">
					<td>序号</td><td>产品名称</td><td>技术水平</td>
					<td>技术领域</td><td>专利状况</td><td>技术开发形式</td><td>投产时间</td>
					<td>年产值（千元）</td><td>年销售收入（千元）</td><td>出口创汇额（千美元）</td><td>是否高新技术产品</td>
					<td>产品工业增加值</td><td>产品类别代码</td><td>所属高新技术领域</td>
				</tr>
				<tr class="list_td_context">
					<td>P0</td><td>P0</td><td>P0</td><td>P0</td><td>P0</td><td>P0</td><td>P0</td><td>P0</td><td>P0</td><td>P0</td>
					<td>&nbsp;</td><td>&nbsp;</td><td>&nbsp;</td><td>&nbsp;</td>
				</tr>
				<tr class="list_td_context">
					<td><input type="text" name="p0"/></td>
					<td><input type="text" name="p0"/></td>
					<td><input type="text" name="p0"/></td>
					<td><input type="text" name="p0"/></td>
					<td><input type="text" name="p0"/></td>
					<td><input type="text" name="p0"/></td>
					<td><input type="text" name="p0"/></td>
					<td><input type="text" name="p0"/></td>
					<td><input type="text" name="p0"/></td>
					<td><input type="text" name="p0"/></td>
					<td><input type="text" name="p0"/></td>
					<td><input type="text" name="p0"/></td>
					<td><input type="text" name="p0"/></td>
					<td><input type="text" name="p0"/></td>
				</tr>
			</table>
			<table width="90%" border="0" cellspacing="1" cellpadding="0" class=table align="center">
				<tr>
					<td align="center">
						<input type="button" name="" value="保 存" onclick="saveForm();">
						<input type="button" name="" value="增加一行" onclick="add();">
					</td>
				</tr>
			</table>
		</form>
	</body>
</html>
