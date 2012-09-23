<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<meta content="text/html; charset=utf-8" http-equiv="Content-Type">
		<link href="${appPath}main/main_data/manage.css" rel="stylesheet">
		<script src="${appPath}js/jquery.js" language="javascript"></script>
		<script src="${appPath}js/sel_style.js" language="javascript"></script>
		<script src="${appPath}js/common.js" language="javascript"></script>
		<script language="javascript">
		var msg = '${msg}';
		if(msg != ''){
			alert(msg);
		}
		function checkAll(obj){
			if($(obj).attr('checked')){
				$('input[type="checkbox"]').attr('checked',true);
			}else{
				$('input[type="checkbox"]').attr('checked',false);
			}
		}
		function unlockInfo(){
			if($('input:checked').length>0 && confirm('您确定解锁吗？')){
				document.forms[0].action = '${appPath}dang_report_unlock.action';
				document.forms[0].submit();
			}
		}
		function query(){
			document.forms[0].action = '${appPath}people_peopleList.action';
			document.forms[0].submit();
		}
		</script>
		<style>
.tables_search {
	margin: 0px 0px 2px 0px;
	height: 40px;
	background-color: #418FD0;
}
.content{background-color: rgb(239, 247, 255);margin:2px auto;width:90%;border:1px solid rgb(65, 143, 208);text-align: center;}
</style>
	</head>
	<body>
		<form method="get" action="${appPath}people_peopleList.action" name="searchForm">
			<table width="100%" cellspacing="0" cellpadding="0" border="0" class="tables_search">
				<tbody>
					<tr>
						<td>
							您当前所处页面：民意调查表填报
						</td>
						<td align="right">
						<select name="year">
							<c:forEach var="s" items="${settingList }">
							<option value="${s.year }" <c:if test="${year==s.year}">selected="selected"</c:if>>${s.year }</option>
							</c:forEach>
						</select>年度
						<input type="button" class="button" value="查询" onclick="query();">
						<input type="button" class="button" value="新增" onclick="winOpen('${appPath}people_viewPeople.action',600,500);">
						</td>
						<td width="5px"></td>
					</tr>
				</tbody>
			</table>
			
<DIV class=content>
<DIV id=statinfo>
待提交 的 调查表：${ps.mount-pageBean.total}份&nbsp;│&nbsp;已 提 交 的 调查表：${pageBean.total}份&nbsp;│&nbsp;离${ps.mount}份<FONT color=red><B>还差</B></FONT><FONT color=red><B>${ps.mount-pageBean.total}</B></FONT>份（备注：调查表必须填写并确认提交才算数）
</DIV>
</DIV>
			<table width="100%" cellspacing="0" cellpadding="0" border="0" class="tables_table">
				<tbody>
					<tr align="center">
						<td height="28" width="" class="tables_headercell">
							序号
						</td>
						<td width="" class="tables_headercell">
							编号
						</td>
						<td width="" class="tables_headercell">
							贫困村名称
						</td>
						<td width="" class="tables_headercell">
							被调查人姓名
						</td>
						<td width="" class="tables_headercell">
							年度
						</td>				
						<td width="" class="tables_headercell">
							状态
						</td>
						<td width="" class="tables_headercell">
							操作
						</td>
					</tr>
					<c:forEach items="${pageBean.resultList}" var="f" varStatus="status">
						<tr>
							<td height="25" align="center" class="tables_contentcell">
								${status.count }
							</td>
							<td height="25" align="center" class="tables_contentcell">
								&nbsp; ${f.id}
							</td>
							<td height="25" align="center" class="tables_contentcell">
								&nbsp; ${f.cun.name}
							</td>
							<td height="25" align="center" class="tables_contentcell">
								&nbsp; ${f.targetName }
							</td>
							<td height="25" align="center" class="tables_contentcell">
								&nbsp; ${f.year }
							</td>
							<td height="25" align="center" class="tables_contentcell">
								&nbsp; ${f.statusTxt }
							</td>
							<td height="25" align="center" class="tables_contentcell">
								<a href="#" onclick="winOpen('${appPath}people_viewPeople.action?p.id=${f.id}',600,500);">查看</a>
							</td>
						</tr>
					</c:forEach>
					<tr>
						<td height="25" align="right" class="tables_contentcell" colspan="7">
							<jsp:include page="../../pager.jsp"></jsp:include>
						</td>
					</tr>
				</tbody>
			</table>
		</form>
	</body>
</html>