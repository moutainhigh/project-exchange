<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html xmlns="http://www.w3.org/1999/xhtml"><head>
<meta content="text/html; charset=utf-8" http-equiv="Content-Type">
<style type="text/css">

.tip{
    position:relative;
    color:#00c;
    text-decoration:none;    
    padding:5px;
    z-index:0;
}
.tip:hover{
    background:none;
    text-decoration:none;
    color:#000;
    z-index:1;
}
.tip span {
    display: none;
    text-decoration:none;
}
.tip:hover span{
    display:block;
    position:absolute;top:20px;left:10px;
    border-bottom:0px solid #eee;
    text-decoration:none;
    border-right:0px solid #eee;
    width:300px;
}
.tip:hover span p {
    
    text-align:left;
    text-decoration:none;
    padding:5px;   
    border:1px solid #ccc;
    background:#cff;
}
</style>
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
		function deleteInfo(){
			if(confirm('您确定删除吗？') && $('input:checked').length>0){
				document.forms[0].action = '${appPath}cun_bf_deleteCuoshiCun.action';
				document.forms[0].submit();
			}
		}
			function pass(){
			if(confirm('您确定通过审核吗？') && $('input:checked').length>0){
				document.forms[0].action = '${appPath}shenhe_passAllCuoshiCun.action';
				document.forms[0].submit();
			}
		}
			function notpass(){
			if(confirm('您确定不通过审核吗？') && $('input:checked').length>0){
				document.forms[0].action = '${appPath}shenhe_notpassAllCuoshiCun.action';
				document.forms[0].submit();
			}
		}
</script>
</head><body>

<form method="get" action="${appPath}shenhe_showAllCuoshiCunInPro.action" name="searchForm">

<table width="100%" cellspacing="0" cellpadding="0" border="0" class="tables_search">
	<tbody><tr>
	<td>您当前所处页面：审核&gt;&gt;村帮扶措施审核 </td>
	<td align="right">
	<input type="button" onclick="pass();" class="button" value="通过">
	<input type="button" onclick="notpass();" class="button" value="不通过">
</td>
	<td width="5px" align="right"></td>
	</tr>
</tbody></table>
<table width="100%" cellspacing="0" cellpadding="0" border="0" class="tables_table">
	
	<tbody><tr align="center">
	<td height="28" width="6%" class="tables_headercell">
		<input type="checkbox" onclick="checkAll(this);"></td>
		<td width="" class="tables_headercell">编号</td>
		<td width="" class="tables_headercell">类型</td>
		<td width="" class="tables_headercell">时间</td>
		<td class="tables_headercell">贫困村名</td>
		<td class="tables_headercell">帮扶措施</td>
		<td width="" class="tables_headercell">审核状态</td>
		<td width="" class="tables_headercell">审核</td>
	</tr>
	<c:forEach items="${pageBean.resultList}" var="f">
		<tr>
		<td height="25" align="center" class="tables_contentcell">
		<input type="checkbox" value="${f.id}" name="cuoshiCun_ids" class="cuoshiCun_ids">
		</td>
		<td height="25" align="center" class="tables_contentcell">
			${f.id }
		</td>
		<td height="25" align="center" class="tables_contentcell">
			${f.type }
		</td>
		<td height="25" align="center" class="tables_contentcell">&nbsp;
			${f.year }
		</td>
		<td height="25" align="center" class="tables_contentcell">&nbsp;
			${f.cun.name }
		</td>
		<td height="25" align="center" class="tables_contentcell">
						&nbsp;
                       <a style="text-decoration: underline;" href="#" class="tip">${f.shortContent } <span><p>${f.content }</p></span></a><b>...</b>
                                 
			</td>
		<td height="25" align="center" class="tables_contentcell">&nbsp;
			${f.status }
		</td>
		<td height="25" align="center" class="tables_contentcell">
		<a href="${appPath}shenhe_passCuoshiCun.action?cuoshiCun.id=${f.id}" >通过</a>
		<a href="${appPath}shenhe_notpassCuoshiCun.action?cuoshiCun.id=${f.id}" >不通过</a>
		</td>
		</tr>
			</c:forEach>
	<tr>
		<td height="25" align="right" class="tables_contentcell" colspan="8">
		<jsp:include page="../../pager.jsp"></jsp:include>
		</td>
	</tr>
</tbody></table>
</form>
</body></html>
