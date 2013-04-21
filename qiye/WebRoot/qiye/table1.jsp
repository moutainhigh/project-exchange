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
		//�ж��Ƿ��Ѿ������ڿ�����
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
		//���»����
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
				request.setAttribute("msg","����ɹ�");
			ps.close();
		}
		//�ҳ�����
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
		request.setAttribute("msg","����ɹ�");
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
			        <font class=caption>��ҵ�ſ�</font>
			      </td>
			    </tr>
			</table>
			<div style="height: 25px;"></div>
			<table width="95%" border="0" cellspacing="1" cellpadding="0" class=table align="center">
				<tr class="list_td_context">
					<td>
						����ʱ�䣨BA06����<input type="text" name="ba02" value="<%=ba02%>"/>��,&nbsp;
						����ְ����BA50����<input type="text" name="ba02" value="<%=ba02%>"/>��,&nbsp;
						�����루BA60����<input type="text" name="ba02" value="<%=ba02%>"/>ǧԪ
					</td>
				</tr>
				<tr class="list_td_context">
					<td>
						���񾭼���ҵ(BA07): <input type="text" name="ba02" value="<%=ba02%>"/> ָ����ҵ���µĹ��񾭼���ҵ����2007�ꡰ�Ƽ�ͳ�ƹ����ļ����С������񾭼���ҵ����ʹ��롷��GB/T4754-2002������д��
					</td>
				</tr>
				<tr class="list_td_context">
					<td>
						��ҵ�Ǽ�ע�����ͣ�BA08����
						<input type="text" name="ba01" value="<%=ba01%>"/>��˵����д 
						&nbsp;
						��λ���ʣ�BA18����
						<input type="text" name="ba01" value="<%=ba01%>"/>��˵����д 
					</td>
				</tr>
				<tr class="list_td_context">
					<td>
						�Ƿ������ҵ��
						<input type="text" name="ba03" value="<%=ba03%>"/>&nbsp;
						 �϶�ʱ�䣺<input type="text" name="ba02" value="<%=ba02%>"/>&nbsp;
						 ֤���ţ�    <input type="text" name="ba02" value="<%=ba02%>"/>
					</td>
				</tr>
				<tr class="list_td_context">
					<td>
						�Ƿ��齨�Ƽ��з����ģ�<input type="text" name="ba02" value="<%=ba02%>"/>&nbsp;       
						�������<input type="text" name="ba02" value="<%=ba02%>"/>&nbsp;             
						�������ƣ�<input type="text" name="ba02" value="<%=ba02%>"/>
					</td>
				</tr>
				<tr class="list_td_context">
					<td>
						<table border="1">
							<tr>
								<td>��ĩ�ʲ��ܶ�</td><td>BA20</td><td><input type="text" name="ba02" value="<%=ba02%>"/>��ǧԪ��</td>
								<td>��ĩ��ծ�ܶ�</td><td>D100</td><td><input type="text" name="ba02" value="<%=ba02%>"/>��ǧԪ��</td>
							</tr>
							<tr>
								<td>���У��̶��ʲ�</td><td>BA21</td><td><input type="text" name="ba02" value="<%=ba02%>"/>��ǧԪ��</td>
								<td>���У�������ծ</td><td>D110</td><td><input type="text" name="ba02" value="<%=ba02%>"/>��ǧԪ��</td>
							</tr>
							<tr>
								<td>�����ʲ�</td><td>BA22</td><td><input type="text" name="ba02" value="<%=ba02%>"/>��ǧԪ��</td>
								<td>���ڸ�ծ</td><td>D120</td><td><input type="text" name="ba02" value="<%=ba02%>"/>��ǧԪ��</td>
							</tr>
							<tr>
								<td>�����ʲ�</td><td>BA23</td><td><input type="text" name="ba02" value="<%=ba02%>"/>��ǧԪ��</td>
								<td>��ĩ������Ȩ��</td><td>E100</td><td><input type="text" name="ba02" value="<%=ba02%>"/>��ǧԪ��</td>
							</tr>
						</table>
					</td>
				</tr>
				<tr class="list_td_context">
					<td>
						<table border="1">
							<caption>�е������Ƽ��ƻ����</caption>
							<tr>
								<td>���</td><td>���ĺ�</td><td>ר������</td>
								<td>��Ŀ���</td><td>��Ŀ����</td><td>��Ŀ����</td><td>����</td>
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
						<input type="button" name="" value="�� ��" onclick="saveForm();">
					</td>
				</tr>
			</table>
		</form>
	</body>
</html>
