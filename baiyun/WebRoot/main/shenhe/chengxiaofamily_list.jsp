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
<link href="${appPath}css/roundborder.css" rel="stylesheet">
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
				document.forms[0].action = '${appPath}family_bf_deleteChengxiaoFamily.action';
				document.forms[0].submit();
			}
		}
function displayAction(sid) {

	whichEl = eval("submenu" + sid);
	if (whichEl.style.display == "none") {
		eval("submenu" + sid + ".style.display=\"\";");
	} else {
		eval("submenu" + sid + ".style.display=\"none\";");
	}
}
function pass(){
			if(confirm('您确定通过审核吗？') && $('input:checked').length>0){
				document.forms[0].action = '${appPath}shenhe_passAllChengxiaoFamily.action';
				document.forms[0].submit();
			}
		}
			function notpass(){
			if(confirm('您确定不通过审核吗？') && $('input:checked').length>0){
				document.forms[0].action = '${appPath}shenhe_notpassAllChengxiaoFamily.action';
				document.forms[0].submit();
			}
		}
</script>
<style>
	.tables_search {
		margin: 0px 0px 2px 0px;
		height: 40px;
		background-color: #418FD0;
	}
</style>
</head><body>
<form method="get" action="${appPath}shenhe_showAllChengxiaoFamilyInPro.action" name="searchForm">
	

	<table cellspacing="0" cellpadding="0" border="0" width="100%" class="tables_search">
	<tbody><tr>
		<td>
			您当前所处页面：审核&gt;&gt;户帮扶成效审核
		</td>
		<td align="right">
		<input type="button" onclick="pass();" class="button" value="通过">
	<input type="button" onclick="notpass();" class="button" value="不通过">
		</td>
		<td align="right" width="5px"></td>
		</tr>
	</tbody></table>
		<table cellspacing="0" cellpadding="0" border="0" width="100%" class="tables_table">
				<tbody><tr align="center">
					<td height="28" width="3%" class="tables_headercell">
						<input type="checkbox" onclick="checkAll(this);">
					</td>
				<td height="28" width="4%" class="tables_headercell">编号</td>
<td width="6%" class="tables_headercell">
						年度
					</td>
					<td width="8%" class="tables_headercell">
						贫困户名称
					</td>
					<td width="19%" class="tables_headercell">
						干部名称
					</td>
					<td width="15%" class="tables_headercell">
						帮扶成效
					</td>
					
					<td width="10%" class="tables_headercell">
						审核状态
					</td>
				<td width="10%" class="tables_headercell">
						审核
					</td>
				</tr>
				<c:forEach items="${pageBean.resultList}" var="f">
				<tr>
					<td height="25" align="center" class="tables_contentcell">
					<input type="checkbox" value="${f.id}" name="chengxiaoFamily_ids" class="chengxiaoFamily_ids">
					</td>
				<td height="25" align="center" class="tables_contentcell">	${f.id }</td>
					<td height="25" align="center" class="tables_contentcell">
						&nbsp;${f.year }</td>
					<td height="25" align="center" class="tables_contentcell">
						&nbsp;${f.family.name}</td>
					<td height="25" align="center" class="tables_contentcell">
						<span title="${f.family.leaderNames }">${f.family.leaderNames }</span>
						</td>
					<td height="25" align="center" class="tables_contentcell">
						&nbsp;
                       <a style="text-decoration: underline;" href="#" class="tip">${f.shortContent } <span><p>${f.content }</p></span></a><b>...</b>
                                 
					</td>
					<td height="25" align="center" class="tables_contentcell">
				    
						${f.status }
					
                    </td>
					<td height="25" align="center" class="tables_contentcell">
					<a href="${appPath}shenhe_passChengxiaoFamily.action?chengxiaoFamily.id=${f.id}" >通过</a>
					<a href="${appPath}shenhe_notpassChengxiaoFamily.action?chengxiaoFamily.id=${f.id}" >不通过</a>
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
