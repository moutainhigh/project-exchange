<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.DriverManager"%>
<%@ page language="java" import="java.util.*" pageEncoding="GBK"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%
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
		//���»����
		if(ba02 != null && !"".equals(ba02)){
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
			if(isNew){
				sql = "insert into table0 values(?,?,?,?,?,?,?,?,?,?,?)";
				ps = conn.prepareStatement(sql);
				ps.setString(parameterIndex, x)
			}
		}
		
		
	}catch(Exception ex){
		ex.printStackTrace();
	}finally{
		if(conn != null && !conn.isClosed()){
			conn.close();
		}
	}
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
	<head>
		<title>��ҵ������Ϣ</title>
		<meta http-equiv="Content-Type" content="text/html; charset=GBK" />
		<script type="text/javascript" src="${appPath}/js/jquery.js"></script>
		<script type="text/javascript">
			function saveForm(){
				
			}
		</script>
	</head>
	<body>
		<form name="messageForm" method="post" action="${appPath}/worker.do">
			<input type="hidden" name="user_id" value="test002"/>
			<table width="90%" border="0" cellspacing="1" cellpadding="0" align="center">
			    <tr>
			      <td height="18" align=center>
			        <font class=caption>��ҵ������Ϣ</font>
			      </td>
			    </tr>
			</table>
			<div style="height: 25px;"></div>
			<table width="95%" border="0" cellspacing="1" cellpadding="0" class=table align="center">
				<tr class="list_td_context">
					<td>
						��ҵ���루BA02����
						<input type="text" name="ba02" value=""/>
					</td>
				</tr>
				<tr class="list_td_context">
					<td>
						��ҵ���˴��루BA00����
						<input type="text" name="ba00" value=""/>
					</td>
				</tr>
				<tr class="list_td_context">
					<td>
						��ҵ��ϸ���ƣ����£���BA01����
						<input type="text" name="ba02" value=""/>
					</td>
				</tr>
				<tr class="list_td_context">
					<td>
						��ҵͨѶ��ַ��BA03����
						<input type="text" name="ba02" value=""/>
					</td>
				</tr>
				<tr class="list_td_context">
					<td>
						��ϵ�绰��BA13����
						<input type="text" name="ba02" value=""/>&nbsp;&nbsp;
						�������루BA16����
						<input type="text" name="ba02" value=""/>
					</td>
				</tr>
				<tr class="list_td_context">
					<td>
						��ҵ�����ˣ�
						<input type="text" name="fuze" value=""/>&nbsp;&nbsp;
						����ˣ�ǩ�£���
						<input type="text" name="filler" value=""/>&nbsp;&nbsp;
						�ʱ�䣺
						<input type="text" name="date" value=""/>
					</td>
				</tr>
			</table>
			<table width="90%" border="0" cellspacing="1" cellpadding="0" class=table align="center">
				<tr>
					<td align="center">
						<input type="button" name="" value="�� ��" onclick="saveForm();">
					</td>
				</tr>
			</table>
		</form>
	</body>
</html>
