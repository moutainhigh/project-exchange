<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.DriverManager"%>
<%@ page language="java" import="java.util.*" pageEncoding="GBK"%>
<%
	Class.forName("oracle.jdbc.driver.OracleDriver");
	Connection conn = DriverManager.getConnection("jdbc:oracle:oci8:@ora9i", "mzoanew", "mzoanew");
	String year = request.getParameter("year");
	if(year==null||"".equals(year)){
		year = (new Date().getYear()+1900) + "";
		System.out.println("year="+year);
	}
	String user_id = request.getParameter("user_id");
	if(user_id == null || user_id.equals("")){
		user_id = (String)session.getAttribute("userid");
	}
	String pt1 = request.getParameter("pt1");
	String pt11 = request.getParameter("pt11");
	String pt2 = request.getParameter("pt2");
	String pt21 = request.getParameter("pt21");
	try{
		PreparedStatement ps = null;
		ResultSet rs = null;
		//判断是否已经存在于库里了
		boolean isNew = true;
		String sql = "select * from table5 where user_id=? and year=?";
		ps = conn.prepareStatement(sql);
		ps.setString(1, user_id);
		ps.setInt(2, Integer.valueOf(year).intValue());
		rs = ps.executeQuery();
		if(rs.next()){
			isNew = false;
		}
		rs.close();
		ps.close();
		//更新或添加
		if(pt1 != null && !"".equals(pt1)){
			if(isNew){
				sql = "insert into table5(pt1,pt11,pt2,pt21,year,user_id) values(?,?,?,?,?,?)";
			}else{
				sql = "update table5 set pt1=?,pt11=?,pt2=? ,pt21=? where year=? and user_id=?";
			}
			ps = conn.prepareStatement(sql);
			int i=1;
			ps.setString(i++,pt1);
			ps.setString(i++,pt11);
			ps.setString(i++,pt2);
			ps.setString(i++,pt21);
			ps.setString(i++,year);
			ps.setString(i++,user_id);
			int rst = ps.executeUpdate();
			if(rst > 0)
				request.setAttribute("msg","保存成功");
			ps.close();
		}
		//找出数据
		sql = "select * from table5 where user_id=? and year=?";
		ps = conn.prepareStatement(sql);
		ps.setString(1, user_id);
		ps.setInt(2, Integer.valueOf(year).intValue());
		rs = ps.executeQuery();
		if(rs.next()){
			pt1 = rs.getString("pt1");
			pt11 = rs.getString("pt11");
			pt2 = rs.getString("pt2");
			pt21 = rs.getString("pt21");
			year = rs.getString("year");
			user_id = rs.getString("user_id");	
		}
		pt1 = pt1==null?"":pt1;
		pt11 = pt11==null?"":pt11;
		pt2 = pt2==null?"":pt2;
		pt21 = pt21==null?"":pt21;
		year = year==null?"":year;
		user_id = user_id==null?"":user_id;
	}catch(Exception ex){
		ex.printStackTrace();
		request.setAttribute("msg",ex.getMessage().trim());
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
		<link rel="stylesheet" type="text/css" href="../css/qiye.css">
		<script type="text/javascript" src="../js/jquery.js"></script>
		<script type="text/javascript">
			var msg = '<%=request.getAttribute("msg")%>';
			if(msg != '' && msg != 'null')
				alert(msg);
			function saveForm(){
				document.forms[0].submit();
			}
		</script>
	</head>
	<body>
		<form name="messageForm" method="get" action="table5.jsp">
			<input type="hidden" name="user_id" value="<%=user_id%>"/>
			<table width="90%" border="0" cellspacing="1" cellpadding="0" align="center">
			    <tr>
			      <td height="18" align=center>
			        <font class=caption>专利</font>
			      </td>
			    </tr>
			</table>
			<div style="height: 25px;"></div>
			<table width="95%" border="0" cellspacing="1" cellpadding="0" class=table align="center">
				<tr class="list_td_context">
					<td colspan="6">
						年度：
						<select name="year" onchange="self.location.href='table5.jsp?user_id=<%=user_id%>&year='+this.value;">
							<%for(int i=2010;i<=new Date().getYear()+1900+1;i++){ %>
							<option value="<%=i %>" <%if(Integer.parseInt(year)==i){ %>selected="selected"<%} %>><%=i %></option>
							<%} %>
						</select>
						年
					</td>
				</tr>
				<tr class="list_td_context">
					<td>专利申请数</td>
					<td>PT1</td>
					<td><input type="text" name="pt1" value="<%=pt1%>"/></td>
					<td>专利授权数</td>
					<td>PT2</td>
					<td><input type="text" name="pt2" value="<%=pt2%>"/></td>
				</tr>
				<tr class="list_td_context">
					<td>其中：发明专利申请数</td>
					<td>PT11</td>
					<td><input type="text" name="pt11" value="<%=pt11%>"/></td>
					<td>其中：发明专利授权数</td>
					<td>PT21</td>
					<td><input type="text" name="pt21" value="<%=pt21%>"/></td>
				</tr>
			</table>
			<table width="90%" border="0" cellspacing="1" cellpadding="0" class=table align="center">
				<tr>
					<td align="center">
						<input type="button" name="" value="保 存" onclick="saveForm();">
						<input type="button" name="" value="返 回" onclick="history.go(-1)">
					</td>
				</tr>
			</table>
		</form>
	</body>
</html>
