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
			        <font class=caption>企业概况</font>
			      </td>
			    </tr>
			</table>
			<div style="height: 25px;"></div>
			<table width="95%" border="0" cellspacing="1" cellpadding="0" class=table align="center">
				<tr class="list_td_context">
					<td>
						成立时间（BA06）：<input type="text" name="ba02" value="<%=ba02%>"/>年,&nbsp;
						长期职工（BA50）：<input type="text" name="ba02" value="<%=ba02%>"/>人,&nbsp;
						总收入（BA60）：<input type="text" name="ba02" value="<%=ba02%>"/>千元
					</td>
				</tr>
				<tr class="list_td_context">
					<td>
						国民经济行业(BA07): <input type="text" name="ba02" value="<%=ba02%>"/> 指本企业从事的国民经济行业，按2007年“科技统计工作文件”中“《国民经济行业分类和代码》（GB/T4754-2002）”填写。
					</td>
				</tr>
				<tr class="list_td_context">
					<td>
						企业登记注册类型（BA08）：
						<input type="text" name="ba01" value="<%=ba01%>"/>按说明填写 
						&nbsp;
						单位性质（BA18）：
						<input type="text" name="ba01" value="<%=ba01%>"/>按说明填写 
					</td>
				</tr>
				<tr class="list_td_context">
					<td>
						是否高新企业：
						<input type="text" name="ba03" value="<%=ba03%>"/>&nbsp;
						 认定时间：<input type="text" name="ba02" value="<%=ba02%>"/>&nbsp;
						 证书编号：    <input type="text" name="ba02" value="<%=ba02%>"/>
					</td>
				</tr>
				<tr class="list_td_context">
					<td>
						是否组建科技研发中心：<input type="text" name="ba02" value="<%=ba02%>"/>&nbsp;       
						中心类别：<input type="text" name="ba02" value="<%=ba02%>"/>&nbsp;             
						中心名称：<input type="text" name="ba02" value="<%=ba02%>"/>
					</td>
				</tr>
				<tr class="list_td_context">
					<td>
						<table border="1">
							<tr>
								<td>年末资产总额</td><td>BA20</td><td><input type="text" name="ba02" value="<%=ba02%>"/>（千元）</td>
								<td>年末负债总额</td><td>D100</td><td><input type="text" name="ba02" value="<%=ba02%>"/>（千元）</td>
							</tr>
							<tr>
								<td>其中：固定资产</td><td>BA21</td><td><input type="text" name="ba02" value="<%=ba02%>"/>（千元）</td>
								<td>其中：流动负债</td><td>D110</td><td><input type="text" name="ba02" value="<%=ba02%>"/>（千元）</td>
							</tr>
							<tr>
								<td>无形资产</td><td>BA22</td><td><input type="text" name="ba02" value="<%=ba02%>"/>（千元）</td>
								<td>长期负债</td><td>D120</td><td><input type="text" name="ba02" value="<%=ba02%>"/>（千元）</td>
							</tr>
							<tr>
								<td>流动资产</td><td>BA23</td><td><input type="text" name="ba02" value="<%=ba02%>"/>（千元）</td>
								<td>年末所有者权益</td><td>E100</td><td><input type="text" name="ba02" value="<%=ba02%>"/>（千元）</td>
							</tr>
						</table>
					</td>
				</tr>
				<tr class="list_td_context">
					<td>
						<table border="1">
							<caption>承担各级科技计划情况</caption>
							<tr>
								<td>序号</td><td>批文号</td><td>专题名称</td>
								<td>项目编号</td><td>项目名称</td><td>项目经费</td><td>级别</td>
							</tr>
							<tr>
								<td><input type="text" name="FI200" value=""/></td>
								<td><input type="text" name="FI200" value=""/></td>
								<td><input type="text" name="FI200" value=""/></td>
								<td><input type="text" name="FI200" value=""/></td>
								<td><input type="text" name="FI200" value=""/></td>
								<td><input type="text" name="FI200" value=""/></td>
								<td><input type="text" name="FI200" value=""/></td>
							</tr>
						</table>
					</td>
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
