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
	String p1 = request.getParameter("p1");
	String p2 = request.getParameter("p2");
	String p3 = request.getParameter("p3");
	String p4 = request.getParameter("p4");
	String p5 = request.getParameter("p5");
	String p6 = request.getParameter("p6");
	String p7 = request.getParameter("p7");
	String p8 = request.getParameter("p8");
	String p9 = request.getParameter("p9");
	String is_high = request.getParameter("is_high");
	String gong_zengjia = request.getParameter("gong_zengjia");
	String type_no = request.getParameter("type_no");
	String lingyu = request.getParameter("lingyu");
	
	List list = new ArrayList();
	
	try{
		PreparedStatement ps = null;
		ResultSet rs = null;
		//更新或添加
		if(p1 != null && !"".equals(p1)){
			String sql = "insert into table4(p1,p2,p3,p4,p5,p6,p7,p8,p9,is_high,gong_zengjia,type_no,lingyu,year,user_id) values(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)";
			ps = conn.prepareStatement(sql);
			int i=1;
			ps.setString(i++,p1);
			ps.setString(i++,p2);
			ps.setString(i++,p3);
			ps.setString(i++,p4);
			ps.setString(i++,p5);
			ps.setString(i++,p6);
			ps.setString(i++,p7);
			ps.setString(i++,p8);
			ps.setString(i++,p9);
			ps.setString(i++,is_high);
			ps.setString(i++,gong_zengjia);
			ps.setString(i++,type_no);
			ps.setString(i++,lingyu);
			ps.setString(i++,year);
			ps.setString(i++,user_id);			
			int rst = ps.executeUpdate();
			if(rst > 0)
				request.setAttribute("msg","保存成功");
			ps.close();
		}
		//找出数据
		
		String sql = "select * from table4 where user_id=? and year=?";
		ps = conn.prepareStatement(sql);
		ps.setString(1, user_id);
		ps.setInt(2, Integer.valueOf(year).intValue());
		rs = ps.executeQuery();
		while(rs.next()){
			String[] arr = new String[15]; 
			for(int i=0;i<arr.length;i++)
				arr[i] = rs.getString(i + 1);
			list.add(arr);
		}
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
			function add(){
				
			}
		</script>
	</head>
	<body>
		<form name="messageForm" method="get" action="table4.jsp">
			<input type="hidden" name="user_id" value="<%=user_id%>"/>
			<table width="90%" border="0" cellspacing="1" cellpadding="0" align="center">
			    <tr>
			      <td height="18" align=center>
			        <font class=caption>主要产品及专利概况</font>
			      </td>
			    </tr>
			    <tr class="list_td_context">
					<td colspan="1">
						年度：<input type="text" name="year" value="<%=year%>"/>年
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
				<%
				for(int i=0;i<list.size();i++){
					String[] a = (String[])list.get(i);
					int j=0;
				%>
				<tr class="list_td_context">
					<td><%=i+1%></td><td><%=a[j++]%></td><td><%=a[j++]%></td><td><%=a[j++]%></td>
					<td><%=a[j++]%></td><td><%=a[j++]%></td><td><%=a[j++]%></td><td><%=a[j++]%></td>
					<td><%=a[j++]%></td><td><%=a[j++]%></td>
					<td><%=a[j++]%></td><td><%=a[j++]%></td><td><%=a[j++]%></td><td><%=a[j++]%></td>
				</tr>
				<%}%>
				<tr class="list_td_context">
					<td>&nbsp;</td>
					<td><input type="text" name="p1" size="10"/></td>
					<td><input type="text" name="p2" size="10"/></td>
					<td><input type="text" name="p3" size="10"/></td>
					<td><input type="text" name="p4" size="10"/></td>
					<td><input type="text" name="p5" size="10"/></td>
					<td><input type="text" name="p6" size="10"/></td>
					<td><input type="text" name="p7" size="10"/></td>
					<td><input type="text" name="p8" size="10"/></td>
					<td><input type="text" name="p9" size="10"/></td>
					<td><input type="text" name="is_high" size="10"/></td>
					<td><input type="text" name="gong_zengjia" size="10"/></td>
					<td><input type="text" name="type_no" size="10"/></td>
					<td><input type="text" name="lingyu" size="10"/></td>
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
