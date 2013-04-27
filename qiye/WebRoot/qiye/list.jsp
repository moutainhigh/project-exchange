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
	}
	String q_name = request.getParameter("q_name");
	
	
	try{
		PreparedStatement ps = null;
		ResultSet rs = null;
		String sql = "select t0.ba01,(select count(*) from table1 where t0.user_id=user_id and year="+year+"),"
						+"(select count(*) from table2 where t0.user_id=user_id and year="+year+"),"
						+"(select count(*) from table3 where t0.user_id=user_id and year="+year+"),"
						+"(select count(*) from table4 where t0.user_id=user_id and year="+year+"),"
						+"(select count(*) from table5 where t0.user_id=user_id and year="+year+"),t0.user_id "
						+"from table0 t0";
		if(q_name==null||"".equals(q_name)){
			q_name = "";
		}else{
			sql += " where t0.ba01 like '%"+q_name+"%'";
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
			function gotoPage(pageIndex,url){
				if(!url){
					url = self.location.href;
				}
				if(url.indexOf("?") > 0){
					if(url.indexOf("pageIndex=") > 0){
						url = url.replace(/pageIndex=\d*/g,'');
						//alert(url);
						url = url.replace(/&{2,}/g,'&');
					}
					url += '&';
				}else{
					url += '?';
				}
				url += "pageIndex=" + pageIndex;
				self.location.href = url;
			}
		</script>
	</head>
	<body>
		<form name="messageForm" method="get" action="list.jsp">
			<table width="90%" border="0" cellspacing="1" cellpadding="0" align="center">
			    <tr>
			      <td height="18" align=center>
			        <font class=caption>企业信息填报查询</font>
			      </td>
			    </tr>
			</table>
			<table width="90%" border="0" cellspacing="1" cellpadding="0" align="center">
			    <tr>
			      <td align=center>
			        <fieldset style="border: 1px solid #CCCCCC; margin: 10px auto 0px auto; width: 600px; display: block; " class="cx_oper allborder">
					    <legend style="font-size: 12px; font-weight: 600; color: #556379; margin: 0 5px;"> 查询条件 </legend>
					     <table width="100%" class="cx_tabble">
					       <tbody>
					       <tr>
					         <td width="80" align="right">企业名称：</td>
					         <td align="left" >
					         	<input type="text" name="q_name" value="<%=q_name %>"/>
					         </td>
					         <td width="80" align="right">年度：</td>
					         <td align="left">
								
								<select name="year">
									<%for(int i=2010;i<=new Date().getYear()+1900+1;i++){ %>
									<option value="<%=i %>" <%if(Integer.parseInt(year)==i){ %>selected="selected"<%} %>><%=i %></option>
									<%} %>
								</select>
								年
							 </td>
							</tr>
					       <tr>
					         <td align="right" colspan="4">
					         	<input type="submit" value=" 筛  选 " style="width: 80px;margin-right: 30px;"/>
					         </td>
					       </tr>
					     </tbody>
					     </table>	 
					  </fieldset>
			      </td>
			    </tr>
			</table>
			<div style="height: 25px;"></div>
			<table width="90%" border="0" cellspacing="1" cellpadding="0" class=table align="center">
				<tr class="list_td_title">					
					<td align="center">
						序号
					</td>
					<td align="center">
						单位名称				
					</td>
					<td align="center">
						企业概况
					</td>
					<td align="center">
						人员概况
					</td>
					<td align="center">
						收支概况
					</td>
					<td align="center">
						主要产品
					</td>
					<td align="center">
						专利概况 
					</td>
				</tr>
<%
ps = conn.prepareStatement(sql);
		rs = ps.executeQuery();
		int i=1;
		while(rs.next()){
 %>
				<tr class="list_td_context">
					<td>
						<%=i++ %>
					</td>
					<td>
						<%=rs.getString(1) %>
					</td>
					<%for(int j=1;j<=5;j++) {%>
					<td>
						<%if(rs.getInt(j+1)>0){ %>
						<a href="table<%=j %>.jsp?year=<%=year %>&user_id=<%=rs.getString("user_id") %>">详细</a><%} %>
						&nbsp;
					</td>
					<%} %>
				</tr>
<%} %>
			</table>
			<!--  
			<table cellspacing="0" cellpadding="0" border="0" align="center" style="margin-top: 5px;">
				<tbody>
					<tr>
						<td>
							第&nbsp;
							<font color="blue">${pageBean.pageIndex }</font>&nbsp;页/总&nbsp;${pageBean.maxPage }&nbsp;页
						</td>
						<td>
							&nbsp;
						</td>
						<td>
							每页&nbsp;${pageBean.rowPerPage }&nbsp;条&nbsp;&nbsp;
						</td>
						<td>
							总共&nbsp;${pageBean.totalRow }&nbsp;条记录&nbsp;&nbsp;
						</td>
						<td>
							<c:choose>
								<c:when test="${!pageBean.isFirstPage}">
									<a href="javascript:gotoPage(1);">[首页]</a>
								</c:when>
								<c:otherwise>
									[首页]
								</c:otherwise>
							</c:choose>
						</td>
						<td>
							&nbsp;
						</td>
						<td>
							<c:choose>
								<c:when test="${!pageBean.isFirstPage}">
									<a href="javascript:gotoPage(${pageBean.prePageIndex });">[前一页]</a>
								</c:when>
								<c:otherwise>
									[前一页]
								</c:otherwise>
							</c:choose>
						</td>
						<td>
							&nbsp;
						</td>
						<td>
							<c:choose>
								<c:when test="${!pageBean.isLastPage}">
									<a href="javascript:gotoPage(${pageBean.nextPageIndex });">[后一页]</a>
								</c:when>
								<c:otherwise>
									[后一页]
								</c:otherwise>
							</c:choose>
						</td>
						<td>
							&nbsp;
						</td>
						<td>
							<c:choose>
								<c:when test="${!pageBean.isLastPage}">
									<a href="javascript:gotoPage(${pageBean.maxPage });">[尾页]</a>
								</c:when>
								<c:otherwise>
									[尾页]
								</c:otherwise>
							</c:choose>
						</td>
					</tr>
				</tbody>
			</table>
			-->
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
