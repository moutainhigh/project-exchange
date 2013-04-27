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
	String pe1010 = request.getParameter("pe1010");
	String pe1011 = request.getParameter("pe1011");
	String pe1012 = request.getParameter("pe1012");
	String pe1013 = request.getParameter("pe1013");
	String pe1020 = request.getParameter("pe1020");
	String pe1021 = request.getParameter("pe1021");
	String pa0 = request.getParameter("pa0");
	String pa1 = request.getParameter("pa1");
	String pa2 = request.getParameter("pa2");
	String pa3 = request.getParameter("pa3");
	String pa4 = request.getParameter("pa4");
	String pe01 = request.getParameter("pe01");
	String pe02 = request.getParameter("pe02");
	String pe04 = request.getParameter("pe04");
	String pe05 = request.getParameter("pe05");
	try{
		PreparedStatement ps = null;
		ResultSet rs = null;
		//判断是否已经存在于库里了
		boolean isNew = true;
		String sql = "select * from table2 where user_id=? and year=?";
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
		if(pe1010 != null && !"".equals(pe1010)){
			if(isNew){
				sql = "insert into table2(pe1010,pe1011,pe1012,pe1013,pe1020,pe1021,pa0,pa1,pa2,pa3,pa4,pe01,pe02,pe04,pe05,year,user_id) values(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)";
			}else{
				sql = "update table2 set pe1010=?,pe1011=?,pe1012=?,pe1013=?,pe1020=?,pe1021=?,pa0=?,pa1=?,pa2=?,pa3=?,pa4=?,pe01=?,pe02=?,pe04=?,pe05=? where year=? and user_id=?";
			}
			ps = conn.prepareStatement(sql);
			int i=1;
			ps.setString(i++,pe1010);
			ps.setString(i++,pe1011);
			ps.setString(i++,pe1012);
			ps.setString(i++,pe1013);
			ps.setString(i++,pe1020);
			ps.setString(i++,pe1021);
			ps.setString(i++,pa0);
			ps.setString(i++,pa1);
			ps.setString(i++,pa2);
			ps.setString(i++,pa3);
			ps.setString(i++,pa4);
			ps.setString(i++,pe01);
			ps.setString(i++,pe02);
			ps.setString(i++,pe04);
			ps.setString(i++,pe05);
			ps.setString(i++,year);
			ps.setString(i++,user_id);
			int rst = ps.executeUpdate();
			if(rst > 0)
				request.setAttribute("msg","保存成功");
			ps.close();
		}
		//找出数据
		sql = "select * from table2 where user_id=? and year=?";
		ps = conn.prepareStatement(sql);
		ps.setString(1, user_id);
		ps.setInt(2, Integer.valueOf(year).intValue());
		rs = ps.executeQuery();
		if(rs.next()){
			pe1010 = rs.getString("pe1010");
			pe1011 = rs.getString("pe1011");
			pe1012 = rs.getString("pe1012");
			pe1013 = rs.getString("pe1013");
			pe1020 = rs.getString("pe1020");
			pe1021 = rs.getString("pe1021");		
			pa0 = rs.getString("pa0");
			pa1 = rs.getString("pa1");
			pa2 = rs.getString("pa2");
			pa3 = rs.getString("pa3");
			pa4 = rs.getString("pa4");	
			pe01 = rs.getString("pe01");
			pe02 = rs.getString("pe02");
			pe04 = rs.getString("pe04");
			pe05 = rs.getString("pe05");			
			year = rs.getString("year");
			user_id = rs.getString("user_id");	
		}
		pe1010 = pe1010==null?"":pe1010;
		pe1011 = pe1011==null?"":pe1011;
		pe1012 = pe1012==null?"":pe1012;
		pe1013 = pe1013==null?"":pe1013;
		pe1020 = pe1020==null?"":pe1020;
		pe1021 = pe1021==null?"":pe1021;
		pa0 = pa0==null?"":pa0;
		pa1 = pa1==null?"":pa1;
		pa2 = pa2==null?"":pa2;
		pa3 = pa3==null?"":pa3;
		pa4 = pa4==null?"":pa4;
		pe01 = pe01==null?"":pe01;
		pe02 = pe02==null?"":pe02;
		pe04 = pe04==null?"":pe04;
		pe05 = pe05==null?"":pe05;
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
		<form name="messageForm" method="get" action="table2.jsp">
			<input type="hidden" name="user_id" value="<%=user_id%>"/>
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
					<td colspan="9">
						年度：
						<select name="year" onchange="self.location.href='table2.jsp?user_id=<%=user_id%>&year='+this.value;">
							<%for(int i=2010;i<=new Date().getYear()+1900+1;i++){ %>
							<option value="<%=i %>" <%if(Integer.parseInt(year)==i){ %>selected="selected"<%} %>><%=i %></option>
							<%} %>
						</select>
						年
					</td>
				</tr>
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
					<td><input type="text" name="pe1010" value="<%=pe1010%>"/>人</td>
					<td>博  士</td>
					<td>PA0</td>
					<td><input type="text" name="pa0" value="<%=pa0%>"/>人</td>
					<td>性    别</td>
					<td>PE01</td>
					<td><input type="text" name="pe01" value="<%=pe01%>"/></td>
				</tr>
				<tr class="list_td_context">
					<td>其中：高级职称</td>
					<td>PE1011</td>
					<td><input type="text" name="pe1011" value="<%=pe1011%>"/>人</td>
					<td>硕  士</td>
					<td>PA1</td>
					<td><input type="text" name="pa1" value="<%=pa1%>"/>人</td>
					<td>出生年份</td>
					<td>PE02</td>
					<td><input type="text" name="pe02" value="<%=pe02%>"/></td>
				</tr>
				<tr class="list_td_context">
					<td>中级职称</td>
					<td>PE1012</td>
					<td><input type="text" name="pe1012" value="<%=pe1012%>"/>人</td>
					<td>大  学</td>
					<td>PA2</td>
					<td><input type="text" name="pa2" value="<%=pa2%>"/>人</td>
					<td>文化程度</td>
					<td>PE04</td>
					<td><input type="text" name="pe04" value="<%=pe04%>"/></td>
				</tr>
				<tr class="list_td_context">
					<td>初级职称</td>
					<td>PE1013</td>
					<td><input type="text" name="pe1013" value="<%=pe1013%>"/>人</td>
					<td>大  专</td>
					<td>PA3</td>
					<td><input type="text" name="pa3" value="<%=pa3%>"/>人</td>
					<td>所学专业</td>
					<td>PE05</td>
					<td><input type="text" name="pe05" value="<%=pe05%>"/></td>
				</tr>
				<tr class="list_td_context">
					<td>其中：从事科技活动人员</td>
					<td>PE1020</td>
					<td><input type="text" name="pe1020" value="<%=pe1020%>"/>人</td>
					<td>中  专</td>
					<td>PA4</td>
					<td><input type="text" name="pa4" value="<%=pa4%>"/>人</td>
					<td>&nbsp;</td>
					<td>&nbsp;</td>
					<td>&nbsp;</td>
				</tr>
				<tr class="list_td_context">
					<td>其中：研究与试验发展人员</td>
					<td>PE1021</td>
					<td><input type="text" name="pe1021" value="<%=pe1021%>"/>人年</td>
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
						<input type="button" name="" value="返 回" onclick="history.go(-1)">
					</td>
				</tr>
			</table>
		</form>
	</body>
</html>
