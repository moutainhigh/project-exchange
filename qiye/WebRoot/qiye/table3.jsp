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
	String fi300 = request.getParameter("fi300");
	String fi310 = request.getParameter("fi310");
	String fi100 = request.getParameter("fi100");
	String fi110 = request.getParameter("fi110");
	String fi120 = request.getParameter("fi120");
	String fi130 = request.getParameter("fi130");
	String fi140 = request.getParameter("fi140");
	String fi200 = request.getParameter("fi200");
	String fi400 = request.getParameter("fi400");
	String fe100 = request.getParameter("fe100");
	String fe120 = request.getParameter("fe120");
	String fe122 = request.getParameter("fe122");
	String fe130 = request.getParameter("fe130");
	String fe132 = request.getParameter("fe132");
	String fe134 = request.getParameter("fe134");
	String fe139 = request.getParameter("fe139");
	String fe140 = request.getParameter("fe140");
	try{
		PreparedStatement ps = null;
		ResultSet rs = null;
		//�ж��Ƿ��Ѿ������ڿ�����
		boolean isNew = true;
		String sql = "select * from table3 where user_id=? and year=?";
		ps = conn.prepareStatement(sql);
		ps.setString(1, user_id);
		ps.setInt(2, Integer.valueOf(year).intValue());
		rs = ps.executeQuery();
		if(rs.next()){
			isNew = false;
		}
		rs.close();
		ps.close();
		//���»����
		if(fi300 != null && !"".equals(fi300)){
			if(isNew){
				sql = "insert into table3(fi300,fi310,fi100,fi110,fi120,fi130,fi140,fi200,fi400,fe100,fe120,fe122,fe130,fe132,fe134,fe139,fe140,year,user_id) values(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)";
			}else{
				sql = "update table3 set fi300=?,fi310=?,fi100=?,fi110=?,fi120=?,fi130=?,fi140=?,fi200=?,fi400=?,fe100=?,fe120=?,fe122=?,fe130=?,fe132=?,fe134=?,fe139=?,fe140=? where year=? and user_id=?";
			}
			ps = conn.prepareStatement(sql);
			int i=1;
			ps.setString(i++,fi300);
			ps.setString(i++,fi310);
			ps.setString(i++,fi100);
			ps.setString(i++,fi110);
			ps.setString(i++,fi120);
			ps.setString(i++,fi130);
			ps.setString(i++,fi140);
			ps.setString(i++,fi200);
			ps.setString(i++,fi400);
			ps.setString(i++,fe100);
			ps.setString(i++,fe120);
			ps.setString(i++,fe122);
			ps.setString(i++,fe130);
			ps.setString(i++,fe132);
			ps.setString(i++,fe134);
			ps.setString(i++,fe139);
			ps.setString(i++,fe140);
			ps.setString(i++,year);
			ps.setString(i++,user_id);
			int rst = ps.executeUpdate();
			if(rst > 0)
				request.setAttribute("msg","����ɹ�");
			ps.close();
		}
		//�ҳ�����
		sql = "select * from table3 where user_id=? and year=?";
		ps = conn.prepareStatement(sql);
		ps.setString(1, user_id);
		ps.setInt(2, Integer.valueOf(year).intValue());
		rs = ps.executeQuery();
		if(rs.next()){
			fi300 = rs.getString("fi300");
			fi310 = rs.getString("fi310");
			fi100 = rs.getString("fi100");
			fi110 = rs.getString("fi110");
			fi120 = rs.getString("fi120");
			fi130 = rs.getString("fi130");
			fi140 = rs.getString("fi140");
			fi200 = rs.getString("fi200");
			fi400 = rs.getString("fi400");
			fe100 = rs.getString("fe100");
			fe120 = rs.getString("fe120");
			fe122 = rs.getString("fe122");
			fe130 = rs.getString("fe130");
			fe132 = rs.getString("fe132");
			fe134 = rs.getString("fe134");
			fe139 = rs.getString("fe139");
			fe140 = rs.getString("fe140");
			year = rs.getString("year");
			user_id = rs.getString("user_id");	
		}
		fi300 = fi300==null?"":fi300;
		fi310 = fi310==null?"":fi310;
		fi100 = fi100==null?"":fi100;
		fi110 = fi110==null?"":fi110;
		fi120 = fi120==null?"":fi120;
		fi130 = fi130==null?"":fi130;
		fi140 = fi140==null?"":fi140;
		fi200 = fi200==null?"":fi200;
		fi400 = fi400==null?"":fi400;
		fe100 = fe100==null?"":fe100;
		fe120 = fe120==null?"":fe120;
		fe122 = fe122==null?"":fe122;
		fe130 = fe130==null?"":fe130;
		fe132 = fe132==null?"":fe132;
		fe134 = fe134==null?"":fe134;
		fe139 = fe139==null?"":fe139;
		fe140 = fe140==null?"":fe140;
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
		<form name="messageForm" method="get" action="table3.jsp">
			<input type="hidden" name="user_id" value="<%=user_id%>"/>
			<table width="90%" border="0" cellspacing="1" cellpadding="0" align="center">
			    <tr>
			      <td height="18" align=center>
			        <font class=caption>��ҵ��֧���</font>
			      </td>
			    </tr>
			</table>
			<div style="height: 25px;"></div>
			<table width="95%" border="0" cellspacing="1" cellpadding="0" class=table align="center">
				<tr class="list_td_context">
					<td colspan="6">
						��ȣ�<input type="text" name="year" value="<%=year%>"/>��
					</td>
				</tr>
				<tr class="list_td_context">
					<td>&nbsp;</td>
					<td>��  ��</td>
					<td>��    ��</td>
					<td>&nbsp;</td>
					<td>��  ��</td>
					<td>��    ��</td>
				</tr>
				<tr class="list_td_context">
					<td>��ҵ�ܲ�ֵ</td>
					<td>FI300</td>
					<td><input type="text" name="fi300" value="<%=fi300%>"/></td>
					<td>��֧��</td>
					<td>FE100</td>
					<td><input type="text" name="fe100" value="<%=fe100%>"/></td>
				</tr>
				<tr class="list_td_context">
					<td>��ҵ����ֵ</td>
					<td>FI310</td>
					<td><input type="text" name="fi310" value="<%=fi310%>"/></td>
					<td>�Ƽ������</td>
					<td>FE120</td>
					<td><input type="text" name="fe120" value="<%=fe120%>"/></td>
				</tr>
				<tr class="list_td_context">
					<td>������</td>
					<td>FI100</td>
					<td><input type="text" name="fi100" value="<%=fi100%>"/></td>
					<td>��ѧ�о������鷢չ����</td>
					<td>FE122</td>
					<td><input type="text" name="fe122" value="<%=fe122%>"/></td>
				</tr>
				<tr class="list_td_context">
					<td>����������</td>
					<td>FI110</td>
					<td><input type="text" name="fi110" value="<%=fi110%>"/></td>
					<td>�Ͻ�˰���ܶ�</td>
					<td>FE130</td>
					<td><input type="text" name="fe130" value="<%=fe130%>"/></td>
				</tr>
				<tr class="list_td_context">
					<td>��Ʒ��������</td>
					<td>FI120</td>
					<td><input type="text" name="fi120" value="<%=fi120%>"/></td>
					<td>����˰</td>
					<td>FE134</td>
					<td><input type="text" name="fe134" value="<%=fe134%>"/></td>
				</tr>
				<tr class="list_td_context">
					<td>��Ʒ��������</td>
					<td>FI130</td>
					<td><input type="text" name="fi130" value="<%=fi130%>"/></td>
					<td>��ֵ˰</td>
					<td>FE132</td>
					<td><input type="text" name="fe132" value="<%=fe132%>"/></td>
				</tr>
				<tr class="list_td_context">
					<td>��������</td>
					<td>FI140</td>
					<td><input type="text" name="fi140" value="<%=fi140%>"/></td>
					<td>����˰</td>
					<td>FE139</td>
					<td><input type="text" name="fe139" value="<%=fe139%>"/></td>
				</tr>
				<tr class="list_td_context">
					<td>������</td>
					<td>FI400</td>
					<td><input type="text" name="fi400" value="<%=fi400%>"/></td>
					<td>����֧��</td>
					<td>FE140</td>
					<td><input type="text" name="fe140" value="<%=fe140%>"/></td>
				</tr>
				<tr class="list_td_context">
					<td>���ڴ���ǧ��Ԫ��</td>
					<td>FI200</td>
					<td><input type="text" name="fi200" value="<%=fi200%>"/></td>
					<td>&nbsp;</td>
					<td>&nbsp;</td>
					<td>&nbsp;</td>
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
