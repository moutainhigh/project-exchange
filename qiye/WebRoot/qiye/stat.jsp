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
	try{
		PreparedStatement ps = null;
		ResultSet rs = null;
		String sql = "select "+
"(select count(user_id) from table0), "+
"(select sum(fi300) from table3 where YEAR="+year+"), "+
"(select sum(fi310) from table3 where YEAR="+year+"), "+
"(select sum(fi100) from table3 where YEAR="+year+"), "+
"(select sum(fi110) from table3 where YEAR="+year+"), "+
"(select sum(gong_zengjia) from table4 where YEAR="+year+"), "+
"(select sum(pe1020) from table2 where YEAR="+year+"), "+
"(select sum(fe120) from table3 where YEAR="+year+"), "+
"(select sum(fi400) from table3 where YEAR="+year+"), "+
"(select sum(fe130) from table3 where YEAR="+year+"), "+
"(select sum(fi200) from table3 where YEAR="+year+"), "+
"(select count(user_id) from table1 where YEAR="+year+" and is_yanfa='��'), "+
"0, "+
"0, "+
"0, "+
"0, "+
"(select sum(pt1) from table5 where YEAR="+year+"), "+
"(select sum(pt2) from table5 where YEAR="+year+"), "+
"(select count(user_id) from table1_plan where YEAR="+year+" and grade='���Ҽ�'), "+
"(select count(user_id) from table1_plan where YEAR="+year+" and grade='ʡ��'), "+
"(select count(user_id) from table1_plan where YEAR="+year+" and grade='�м�'), "+
"(select count(user_id) from table1_plan where YEAR="+year+" and grade='����'), "+
"(select sum(pro_money) from table1_plan where YEAR="+year+") "+
"from dual";
		ps = conn.prepareStatement(sql);
		rs = ps.executeQuery();
		int i=1;
		rs.next();
	
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
	<head>
		<title>��ҵ������Ϣ</title>
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
		<form name="messageForm" method="get" action="stat.jsp">
			<table width="90%" border="0" cellspacing="1" cellpadding="0" align="center">
			    <tr>
			      <td height="18" align=center>
			        <font class=caption><%=year %>����Ӫ�Ƽ�԰ͳ�ƻ��ܱ�</font>
			      </td>
			    </tr>
			</table>
			<div style="height: 25px;"></div>
			<table width="300" border="0" cellspacing="1" cellpadding="0" class=table align="center">
				<tr class="list_td_context">
					<td colspan="3">
						��ȣ�<input type="text" name="year" value="<%=year%>"/>��,
						<input type="button" name="" value="��ѯ" onclick="saveForm();">
					</td>
				</tr>
				<tr class="list_td_context">
					<td colspan="2">1.��ҵ����</td>
					<td><%=rs.getInt(i++) %></td>
				</tr>
				<tr class="list_td_context">
					<td colspan="2">2.��ҵ�ܲ�ֵ</td>
					<td><%=rs.getInt(i++) %></td>
				</tr>
				<tr class="list_td_context">
					<td colspan="2">3.��ҵ����ֵ</td>
					<td><%=rs.getInt(i++) %></td>
				</tr>
				<tr class="list_td_context">
					<td colspan="2">4.������</td>
					<td><%=rs.getInt(i++) %></td>
				</tr>
				<tr class="list_td_context">
					<td colspan="2">5.���¼�����Ʒ��ֵ</td>
					<td><%=rs.getInt(i++) %></td>
				</tr>
				<tr class="list_td_context">
					<td colspan="2">6.���¼�����ҵ����ֵ</td>
					<td><%=rs.getInt(i++) %></td>
				</tr>
				<tr class="list_td_context">
					<td colspan="2">7.���¿Ƽ���Ա��</td>
					<td><%=rs.getInt(i++) %></td>
				</tr>
				<tr class="list_td_context">
					<td colspan="2">8.�Ƽ������</td>
					<td><%=rs.getInt(i++) %></td>
				</tr>
				<tr class="list_td_context">
					<td colspan="2">9.�����ܶ�</td>
					<td><%=rs.getInt(i++) %></td>
				</tr>
				<tr class="list_td_context">
					<td colspan="2">10.�Ͻ�˰���ܶ�</td>
					<td><%=rs.getInt(i++) %></td>
				</tr>
				<tr class="list_td_context">
					<td colspan="2">11.�����ܶ�</td>
					<td><%=rs.getInt(i++) %></td>
				</tr>
				<tr class="list_td_context">
					<td colspan="2">12.���¼�����ҵ��</td>
					<td><%=rs.getInt(i++) %></td>
				</tr>
				<tr class="list_td_context">
					<td colspan="2">13.ʡ��Ӫ�Ƽ���ҵ��</td>
					<td><%=rs.getInt(i++) %></td>
				</tr>
				<tr class="list_td_context">
					<td rowspan="3">14.����������</td>
					<td>���Ҽ�</td>
					<td><%=rs.getInt(i++) %></td>
				</tr>
				<tr class="list_td_context">
					<td>ʡ��</td>
					<td><%=rs.getInt(i++) %></td>
				</tr>
				<tr class="list_td_context">
					<td>�м�</td>
					<td><%=rs.getInt(i++) %></td>
				</tr>
				<tr class="list_td_context">
					<td colspan="2">15.ר��������</td>
					<td><%=rs.getInt(i++) %></td>
				</tr>
				<tr class="list_td_context">
					<td colspan="2">16.ר����Ȩ��</td>
					<td><%=rs.getInt(i++) %></td>
				</tr>
				<tr class="list_td_context">
					<td rowspan="4">17.�е������Ƽ��ƻ���</td>
					<td>���Ҽ�</td>
					<td><%=rs.getInt(i++) %></td>
				</tr>
				<tr class="list_td_context">
					<td>ʡ��</td>
					<td><%=rs.getInt(i++) %></td>
				</tr>
				<tr class="list_td_context">
					<td>�м�</td>
					<td><%=rs.getInt(i++) %></td>
				</tr>
				<tr class="list_td_context">
					<td>�ؼ�</td>
					<td><%=rs.getInt(i++) %></td>
				</tr>
				<tr class="list_td_context">
					<td colspan="2">18.�����Ŀ�����ܶ�</td>
					<td><%=rs.getInt(i++) %></td>
				</tr>
				
			</table>
		</form>
	</body>
</html>
<%
	}catch(Exception ex){
		ex.printStackTrace();
	}finally{
		if(conn != null && !conn.isClosed()){
			conn.close();
		}
	}
%>
