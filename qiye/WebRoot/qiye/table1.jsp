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
	String ba06 = request.getParameter("ba06");
	String ba50 = request.getParameter("ba50");
	String ba60 = request.getParameter("ba60");
	String ba07 = request.getParameter("ba07");
	String ba08 = request.getParameter("ba08");
	String ba18 = request.getParameter("ba18");
	String is_gaoxin = request.getParameter("is_gaoxin");
	String rending_time = request.getParameter("rending_time");
	String zhengshu = request.getParameter("zhengshu");
	String is_yanfa = request.getParameter("is_yanfa");
	String yanfa_type = request.getParameter("yanfa_type");
	String yanfa_name = request.getParameter("yanfa_name");
	String ba20 = request.getParameter("ba20");
	String ba21 = request.getParameter("ba21");
	String ba22 = request.getParameter("ba22");
	String ba23 = request.getParameter("ba23");
	String d100 = request.getParameter("d100");
	String d110 = request.getParameter("d110");
	String d120 = request.getParameter("d120");
	String e100 = request.getParameter("e100");
	
	String piwen = request.getParameter("piwen");
	String zhuanti_name = request.getParameter("zhuanti_name");
	String bianhao = request.getParameter("bianhao");
	String pro_name = request.getParameter("pro_name");
	String pro_money = request.getParameter("pro_money");
	String grade = request.getParameter("grade");
	
	try{
		PreparedStatement ps = null;
		ResultSet rs = null;
		//判断是否已经存在于库里了
		boolean isNew = true;
		String sql = "select * from table1 where user_id=? and year=?";
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
		if(ba06 != null && !"".equals(ba06)){
			if(isNew){
				sql = "insert into table1(ba06,ba50,ba60,ba07,ba08,ba18,is_gaoxin,rending_time,zhengshu,is_yanfa,yanfa_type,yanfa_name,"
						+"ba20,ba21,ba22,ba23,d100,d110,d120,e100,year,user_id) values(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)";
			}else{
				sql = "update table1 set ba06=?,ba50=?,ba60=?,ba07=?,ba08=?,ba18=?,is_gaoxin=?,rending_time=?,zhengshu=?,is_yanfa=?,yanfa_type=?,yanfa_name=?,"
						+"ba20=?,ba21=?,ba22=?,ba23=?,d100=?,d110=?,d120=?,e100=? where year=? and user_id=?";
			}
			ps = conn.prepareStatement(sql);
			int i=1;
			ps.setInt(i++,Integer.valueOf(ba06).intValue());
			ps.setInt(i++,Integer.valueOf(ba50).intValue());
			ps.setInt(i++,Integer.valueOf(ba60).intValue());
			ps.setInt(i++,Integer.valueOf(ba07).intValue());
			ps.setInt(i++,Integer.valueOf(ba08).intValue());
			ps.setInt(i++,Integer.valueOf(ba18).intValue());
			ps.setString(i++,is_gaoxin);
			ps.setString(i++,rending_time);
			ps.setString(i++,zhengshu);
			ps.setString(i++,is_yanfa);
			ps.setString(i++,yanfa_type);
			ps.setString(i++,yanfa_name);
			ps.setInt(i++,Integer.valueOf(ba20).intValue());
			ps.setInt(i++,Integer.valueOf(ba21).intValue());
			ps.setInt(i++,Integer.valueOf(ba22).intValue());
			ps.setInt(i++,Integer.valueOf(ba23).intValue());
			ps.setInt(i++,Integer.valueOf(d100).intValue());
			ps.setInt(i++,Integer.valueOf(d110).intValue());
			ps.setInt(i++,Integer.valueOf(d120).intValue());
			ps.setInt(i++,Integer.valueOf(e100).intValue());
			ps.setInt(i++,Integer.valueOf(year).intValue());
			ps.setString(i++,user_id);
			int rst = ps.executeUpdate();
			if(rst > 0)
				request.setAttribute("msg","保存成功");
			ps.close();
			if(piwen != null && !"".equals(piwen)){
				sql = "insert into table1_plan(piwen,zhuanti_name,bianhao,pro_name,pro_money,grade,user_id,year) values(?,?,?,?,?,?,?,?)";
				ps = conn.prepareStatement(sql);
				i=1;
				ps.setString(i++,piwen);
				ps.setString(i++,zhuanti_name);
				ps.setString(i++,bianhao);
				ps.setString(i++,pro_name);
				ps.setString(i++,pro_money);
				ps.setString(i++,grade);
				ps.setString(i++,user_id);
				ps.setString(i++,year);
				rst = ps.executeUpdate();
				if(rst > 0)
					request.setAttribute("msg","保存成功");
				ps.close();
			}
		}
		//找出数据
		sql = "select * from table1 where user_id=? and year=?";
		ps = conn.prepareStatement(sql);
		ps.setString(1, user_id);
		ps.setInt(2, Integer.valueOf(year).intValue());
		rs = ps.executeQuery();
		if(rs.next()){
			ba06 = rs.getString("ba06");
			ba50 = rs.getString("ba50");
			ba60 = rs.getString("ba60");
			ba07 = rs.getString("ba07");
			ba08 = rs.getString("ba08");
			ba18 = rs.getString("ba18");		
			is_gaoxin = rs.getString("is_gaoxin");
			rending_time = rs.getString("rending_time");
			zhengshu = rs.getString("zhengshu");
			is_yanfa = rs.getString("is_yanfa");
			yanfa_type  = rs.getString("yanfa_type");
			yanfa_name = rs.getString("yanfa_name");
			ba20 = rs.getString("ba20");
			ba21 = rs.getString("ba21");
			ba22 = rs.getString("ba22");
			ba23 = rs.getString("ba23");
			d100 = rs.getString("d100");
			d110 = rs.getString("d110");
			d120 = rs.getString("d120");
			e100 = rs.getString("e100");
			year = rs.getString("year");
			user_id = rs.getString("user_id");	
		}
		ba06 = ba06==null?"":ba06;
		ba50 = ba50==null?"":ba50;
		ba60 = ba60==null?"":ba60;
		ba07 = ba07==null?"":ba07;
		ba08 = ba08==null?"":ba08;
		ba18 = ba18==null?"":ba18;
		is_gaoxin = is_gaoxin==null?"":is_gaoxin;
		rending_time = rending_time==null?"":rending_time;
		zhengshu = zhengshu==null?"":zhengshu;
		is_yanfa = is_yanfa==null?"":is_yanfa;
		yanfa_type = yanfa_type==null?"":yanfa_type;
		yanfa_name = yanfa_name==null?"":yanfa_name;
		ba20 = ba20==null?"":ba20;
		ba21 = ba21==null?"":ba21;
		ba22 = ba22==null?"":ba22;
		ba23 = ba23==null?"":ba23;
		d100 = d100==null?"":d100;
		d110 = d110==null?"":d110;
		d120 = d120==null?"":d120;
		e100 = e100==null?"":e100;
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
		<form name="messageForm" method="get" action="table1.jsp">
			<input type="hidden" name="user_id" value="<%=user_id%>"/>
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
						年度：<input type="text" name="year" value="<%=year%>"/>年
					</td>
				</tr>
				<tr class="list_td_context">
					<td>
						成立时间（BA06）：<input type="text" name="ba06" value="<%=ba06%>"/>年,&nbsp;
						长期职工（BA50）：<input type="text" name="ba50" value="<%=ba50%>"/>人,&nbsp;
						总收入（BA60）：<input type="text" name="ba60" value="<%=ba60%>"/>千元
					</td>
				</tr>
				<tr class="list_td_context">
					<td>
						国民经济行业(BA07): <input type="text" name="ba07" value="<%=ba07%>"/> 指本企业从事的国民经济行业，按2007年“科技统计工作文件”中“《国民经济行业分类和代码》（GB/T4754-2002）”填写。
					</td>
				</tr>
				<tr class="list_td_context">
					<td>
						企业登记注册类型（BA08）：
						<input type="text" name="ba08" value="<%=ba08%>"/>按说明填写 
						&nbsp;
						单位性质（BA18）：
						<input type="text" name="ba18" value="<%=ba18%>"/>按说明填写 
					</td>
				</tr>
				<tr class="list_td_context">
					<td>
						是否高新企业：
						<input type="text" name="is_gaoxin" value="<%=is_gaoxin%>"/>&nbsp;
						 认定时间：<input type="text" name="rending_time" value="<%=rending_time%>"/>&nbsp;
						 证书编号：    <input type="text" name="zhengshu" value="<%=zhengshu%>"/>
					</td>
				</tr>
				<tr class="list_td_context">
					<td>
						是否组建科技研发中心：<input type="text" name="is_yanfa" value="<%=is_yanfa%>"/>&nbsp;       
						中心类别：<input type="text" name="yanfa_type" value="<%=yanfa_type%>"/>&nbsp;             
						中心名称：<input type="text" name="yanfa_name" value="<%=yanfa_name%>"/>
					</td>
				</tr>
				<tr class="list_td_context">
					<td>
						<table border="1">
							<tr>
								<td>年末资产总额</td><td>BA20</td><td><input type="text" name="ba20" value="<%=ba20%>"/>（千元）</td>
								<td>年末负债总额</td><td>D100</td><td><input type="text" name="d100" value="<%=d100%>"/>（千元）</td>
							</tr>
							<tr>
								<td>其中：固定资产</td><td>BA21</td><td><input type="text" name="ba21" value="<%=ba21%>"/>（千元）</td>
								<td>其中：流动负债</td><td>D110</td><td><input type="text" name="d110" value="<%=d110%>"/>（千元）</td>
							</tr>
							<tr>
								<td>无形资产</td><td>BA22</td><td><input type="text" name="ba22" value="<%=ba22%>"/>（千元）</td>
								<td>长期负债</td><td>D120</td><td><input type="text" name="d120" value="<%=d120%>"/>（千元）</td>
							</tr>
							<tr>
								<td>流动资产</td><td>BA23</td><td><input type="text" name="ba23" value="<%=ba23%>"/>（千元）</td>
								<td>年末所有者权益</td><td>E100</td><td><input type="text" name="e100" value="<%=e100%>"/>（千元）</td>
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
<% 
	Connection conn2 = DriverManager.getConnection("jdbc:oracle:oci8:@ora9i", "mzoanew", "mzoanew");
	try{
		PreparedStatement ps2 = null;
		ResultSet rs2 = null;
		String sql2 = "select * from table1_plan where user_id=? and year=?";
		ps2 = conn2.prepareStatement(sql2);
		ps2.setString(1, user_id);
		ps2.setInt(2, Integer.valueOf(year).intValue());
		rs2 = ps2.executeQuery();
		int index = 0;
		while(rs2.next()){
%>
							<tr>
								<td><%=++index %></td><td><%=rs2.getString("piwen") %></td><td><%=rs2.getString("zhuanti_name") %></td>
								<td><%=rs2.getString("bianhao") %></td><td><%=rs2.getString("pro_name") %></td>
								<td><%=rs2.getString("pro_money") %></td><td><%=rs2.getString("grade") %></td>
							</tr>
<%
		}
	}catch(Exception ex){
		ex.printStackTrace();
	}finally{
		if(conn2 != null && !conn2.isClosed()){
			conn2.close();
		}
	}
%>
							<tr>
								<td>&nbsp;</td>
								<td><input type="text" name="piwen" value=""/></td>
								<td><input type="text" name="zhuanti_name" value=""/></td>
								<td><input type="text" name="bianhao" value=""/></td>
								<td><input type="text" name="pro_name" value=""/></td>
								<td><input type="text" name="pro_money" value=""/></td>
								<td><input type="text" name="grade" value=""/></td>
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
