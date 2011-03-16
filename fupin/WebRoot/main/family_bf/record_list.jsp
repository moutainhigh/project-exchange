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
<link rel="stylesheet" type="text/css" href="${appPath}css/jquery.datepick.css" />
		<script src="${appPath}js/jquery.js" language="javascript"></script>
		<script src="${appPath}js/validateForm.js" language="javascript"></script>
		<script src="${appPath}js/sel_style.js" language="javascript"></script>
		<script src="${appPath}js/common.js" language="javascript"></script>
		<script src="${appPath}js/jquery.datepick.js" language="javascript"></script>
		<script src="${appPath}js/jquery.datepick-zh-CN.js" language="javascript"></script>
<script language="javascript">
$(function(){
	//初始化日期输入数据
	$('.datetime').datepick({dateFormat: 'yy-mm-dd'}); 
});
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
				document.forms[0].action = '${appPath}family_bf_deleteRecord.action';
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

</script>
<style>
	.tables_search {
		margin: 0px 0px 2px 0px;
		height: 40px;
		background-color: #418FD0;
	}
</style>
</head><body>
<form method="get" action="${appPath}family_bf_recordList.action" name="searchForm">
	

	<table cellspacing="0" cellpadding="0" border="0" width="100%" class="tables_search">
	<tbody><tr>
		<td>
			您当前所处页面：户帮扶维护&gt;&gt;帮扶记录
		</td>
		<td align="right">
			
	
			<label>审核状态: </label>
	<select name="record.status" size="1">
		<option value="">--------------</option>
		<option value="未提交">未提交</option>
		<option value="审核中">审核中</option>
		<option value="审核通过">审核通过</option>
		<option value="审核不通过">审核不通过</option>
	</select>
	
	<label>贫困户姓名: </label>
	<input type="text" style="width: 90px;" value="" name="record.family.name" id="textfield"> 

		<input type="submit" class="button" value="查询" name="查询">
		<input type="button" onclick="winOpen('${appPath}main/family_bf/record_edit.jsp',600,390);" class="button" value="新增">
		<input type="button" onclick="deleteInfo();" class="button" value="删除">
		
		</td>
		<td align="right" width="5px"></td>
		</tr>
	</tbody></table>
<!-- SearchBox -->
        <div style="width: 100%; display: block;" id="ads" class="boxwrap">
	<div class="tl">&nbsp;</div>
	<div class="tr">&nbsp;</div>
	<div style="text-align: right;" class="content">
		<div class="p">
			<ul type="square">			 
			 <li>
			 <span>
               到户日期：
			从<input type="text" class="datetime" value="${param.fromDate}" name="fromDate" id="_brq"> 
			 到<input type="text" class="datetime" value="${param.toDate}" name="toDate" id="_erq"> 
			 </span>
                
<input type="submit" id="a11" value="查询" name="a11" class="button">
&nbsp;&nbsp;|&nbsp;&nbsp;
<input type="button" onclick="location.href='${appPath}family_bf_recordList.action'" id="b11" title="清除条件并重新查询" value="清除条件，返回全部" name="b11" class="button">
	 
			 </li>			 
			</ul>			
		</div>
		
	</div>
	 <div class="bl">&nbsp;</div>
	 <div class="br">&nbsp;</div>
   </div>
<!-- SearchBox:End -->
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
						扶持内容
					</td>
					<td width="10%" class="tables_headercell">
						状态
					</td>
					<!--<td width="10%" class="tables_headercell">
						审核状态
					</td>
					-->
					<td width="4%" class="tables_headercell">
						查看
					</td>
					<td width="4%" class="tables_headercell">
						修改
					</td>
				</tr>
				<c:forEach items="${pageBean.resultList}" var="f">
				<tr>
					<td height="25" align="center" class="tables_contentcell">
					<input type="checkbox" value="${f.id}" name="record_ids" class="record_ids">
					</td>
				<td height="25" align="center" class="tables_contentcell">	${f.id }</td>
					<td height="25" align="center" class="tables_contentcell">
						&nbsp;<fmt:formatDate value="${f.recordDate}" pattern="yyyy-MM-dd"/></td>
					<td height="25" align="center" class="tables_contentcell">
						&nbsp;${f.family.name}</td>
					<td height="25" align="center" class="tables_contentcell">
						<span title="${f.family.leaderNames }">${f.family.leaderNames }</span>
						</td>
					<td height="25" align="center" class="tables_contentcell">
						&nbsp;
                       <a style="text-decoration: underline;" href="#" class="tip">${f.shortContent } <span><p></p></span></a><b>...</b>
                                 
					</td>
					<td height="25" align="center" class="tables_contentcell">
				    <c:if test="${f.status=='未提交'}">
						<a href="${appPath}family_bf_confirmRecord.action?record.id=${f.id}" >确认后提交</a>
					</c:if>
					<c:if test="${f.status!='未提交'}">
						${f.status }
					</c:if>
                    </td>
                    <td height="25" align="center" class="tables_contentcell">
                    <a href="#" onclick="winOpen('${appPath}family_bf_saveOrUpdateRecord.action?record.id=${f.id}',600,390);">查看</a>
					</td>
					<td height="25" align="center" class="tables_contentcell">
					<c:if test="${f.status=='未提交'}">
						<a href="#" onclick="winOpen('${appPath}family_bf_saveOrUpdateRecord.action?record.id=${f.id}',600,390);">修改</a>
					 </c:if>
					 <c:if test="${f.status!='未提交'}">
						不能修改
					 </c:if>
		</td>
				</tr>
					</c:forEach>
				<tr>
					<td height="25" align="right" class="tables_contentcell" colspan="9">
						<jsp:include page="../../pager.jsp"></jsp:include>
					</td>
				</tr>
			</tbody></table>
		</form>
	</body></html>
