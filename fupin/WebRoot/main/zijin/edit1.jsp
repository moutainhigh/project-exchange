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
		var year = '${z.year}';
		var month = '${z.month}';
		var now = new Date();
		var currYear = now.getYear()<1970?now.getYear() + 1900:now.getYear();
		$(function(){
			for(var i=2012;i<=currYear+1;i++){
				$("#year").append('<option value="'+ i +'">'+ i +'</option>');
			}
			if(year != ''){
				setTimeout(function(){ 
				    $('#year').val(year);
				},1);
			}
			var ms = 12;
			var str = '';
			for(var i=1;i<=ms;i++){
				str += '<option value="'+i+'">第'+i+'月</option>';
			}
			$('#month').html(str);
			if(month != ''){
				setTimeout(function(){ 
				  $('#month').val(month);
				},1);
			}	
		});
		function query(){
			var f = document.forms[0];
			f.action = '${appPath}zijin_edit.action';
			f.submit();
		}
		function tmpSaveReport(){
			var f = document.forms[0];
			f.action = '${appPath}zijin_tmpSave.action';
			f.submit();
		}
		function saveReport(){			
			if(confirm('报表提交后不允许修改，是否提交')){
				var f = document.forms[0];
				f.action = '${appPath}zijin_save.action';
				f.submit();
			}
		}
		function unlockReport(){
			if(confirm('确定需要解锁吗？')){
				var f = document.forms[0];
				f.action = '${appPath}zijin_requstUnlock.action';
				f.submit();
			}
		}
		function excel(){
			var f = document.forms[0];
				f.action = '${appPath}report_excelReport1.action';
				f.submit();
		}
		</script>
		<style>
.tables_search {
	margin: 0px 0px 2px 0px;
	height: 40px;
	background-color: #418FD0;
}
</style>
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
#data_table td{
	text-align: center;
}
#data_table input{
	width: 40px;
}
</style>
<script>
$(function(){
	$('#data_table input').each(function(){
		if(this.name.indexOf('content') > 0 || this.name.indexOf('file') > 0){
			$(this).css('width','150px');
		}
	});
});
</script>
	</head>
	<body>
		<form method="post" action="${appPath}zijin_edit.action" name="searchForm">
			<input type="hidden" name="type" value="${type}"/>
			<c:if test="${not empty msg }">
			<div style="width:70%; padding: 10px 5px; margin: 5px auto; border: 1px solid red; font-size: 14px; font-weight: 600; text-align: center; background-color: yellow;">
			${msg }
			</div>
			</c:if>
			<table cellspacing="0" cellpadding="0" border="0" class="tables_table">
				<tbody>
					<tr align="center">
						<td width="" class="tables_headercell">
							年度：
							<select name="year" id="year" style="width: 60px;">
								<option value=""></option>
							</select>
						</td>
						<td width="" class="tables_headercell">
							月份：
							<select name="month" id="month">
								<option value=""></option>
							</select>
						</td>
						<td width="" class="tables_headercell">
							<input type="button" value="按条件查询" class="button" name="查询" onclick="query();">
							<c:if test="${empty z.status || z.status==0}">
							<input type="button" value="保存" class="button" name="保存" onclick="saveReport();">
							<input type="button" value="暂存" class="button" name="暂存" onclick="tmpSaveReport();">
							</c:if>
							<c:if test="${z.status==1}">
							<input type="button" value="请求解锁" class="button" name="请求解锁" onclick="unlockReport();">
							</c:if>
						</td>
					</tr>
				</tbody>
			</table>
			<p style="padding-left: 20px;">贫困村：${cun.zhen.area.name } ${cun.zhen.name } ${cun.name }</p>
			<table id="data_table" cellspacing="0" cellpadding="0" border="0" class="tables_table" align="center" width="1800px">
				<tr>
					<td class="tables_headercell" rowspan="2">
					序号
					</td>
					<td class="tables_headercell" rowspan="2" width="200">
					项目名称
					</td>
					<td class="tables_headercell" rowspan="2" width="200">
					文件依据
					</td>
					<td class="tables_headercell" rowspan="2" width="200">
					项目主要内容
					</td>
					<td class="tables_headercell" colspan="5">
					本级农村扶贫开发专项资金使用情况
					</td>
					<td class="tables_headercell" colspan="4">
					区专项资金
					</td>
					<td class="tables_headercell" colspan="4">
					县级市专项资金
					</td>
					<td class="tables_headercell" colspan="4">
					企业帮扶资金
					</td>
					<td class="tables_headercell" colspan="4">
					其他帮扶资金
					</td>
					<td class="tables_headercell" colspan="4">
					合计
					</td>
				</tr>
				<tr>
					<td class="tables_headercell">
					下达数
					</td>
					<td class="tables_headercell">
					支付数
					</td>
					<td class="tables_headercell">
					支出率
					</td>
					<td class="tables_headercell">
					预计支出数
					</td>
					<td class="tables_headercell">
					待安排项目
					</td>
					<td class="tables_headercell">
					计划数
					</td>
					<td class="tables_headercell">
					到账数
					</td>
					<td class="tables_headercell">
					支付数
					</td>
					<td class="tables_headercell">
					支出率
					</td>
					<td class="tables_headercell">
					计划数
					</td>
					<td class="tables_headercell">
					到账数
					</td>
					<td class="tables_headercell">
					支付数
					</td>
					<td class="tables_headercell">
					支出率
					</td>
					<td class="tables_headercell">
					计划数
					</td>
					<td class="tables_headercell">
					到账数
					</td>
					<td class="tables_headercell">
					支付数
					</td>
					<td class="tables_headercell">
					支出率
					</td>
					<td class="tables_headercell">
					计划数
					</td>
					<td class="tables_headercell">
					到账数
					</td>
					<td class="tables_headercell">
					支付数
					</td>
					<td class="tables_headercell">
					支出率
					</td>
					<td class="tables_headercell">
					计划数
					</td>
					<td class="tables_headercell">
					到账数
					</td>
					<td class="tables_headercell">
					支付数
					</td>
					<td class="tables_headercell">
					支出率
					</td>
				</tr>
				<tr>
					<td class="tables_contentcell">
					1
					</td>
					<td class="tables_contentcell">
					危破房改造资金
					</td>
					<td class="tables_contentcell">
					<input type="text" name="z1.file" value="${z1.file}" />
					</td>
					<td class="tables_contentcell">
					<input type="text" name="z1.content" value="${z1.content}" />
					</td>
					<td class="tables_contentcell">
					<input type="text" name="z1.item1" value="${z1.item1}" />
					</td>
					<td class="tables_contentcell">
					<input type="text" name="z1.item2" value="${z1.item2}" />
					</td>
					<td class="tables_contentcell">
					<input type="text" name="z1.item3" value="${z1.item3}" />
					</td>
					<td class="tables_contentcell">
					<input type="text" name="z1.item4" value="${z1.item4}" />
					</td>
					<td class="tables_contentcell">
					<input type="text" name="z1.item5" value="${z1.item5}" />
					</td>
					<td class="tables_contentcell">
					<input type="text" name="z1.item6" value="${z1.item6}" />
					</td>
					<td class="tables_contentcell">
					<input type="text" name="z1.item7" value="${z1.item7}" />
					</td>
					<td class="tables_contentcell">
					<input type="text" name="z1.item8" value="${z1.item8}" />
					</td>
					<td class="tables_contentcell">
					<input type="text" name="z1.item9" value="${z1.item9}" />
					</td>
					<td class="tables_contentcell">
					<input type="text" name="z1.item10" value="${z1.item10}" />
					</td>
					<td class="tables_contentcell">
					<input type="text" name="z1.item11" value="${z1.item11}" />
					</td>
					<td class="tables_contentcell">
					<input type="text" name="z1.item12" value="${z1.item12}" />
					</td>
					<td class="tables_contentcell">
					<input type="text" name="z1.item13" value="${z1.item13}" />
					</td>
					<td class="tables_contentcell">
					<input type="text" name="z1.item14" value="${z1.item14}" />
					</td>
					<td class="tables_contentcell">
					<input type="text" name="z1.item15" value="${z1.item15}" />
					</td>
					<td class="tables_contentcell">
					<input type="text" name="z1.item16" value="${z1.item16}" />
					</td>
					<td class="tables_contentcell">
					<input type="text" name="z1.item17" value="${z1.item17}" />
					</td>
					<td class="tables_contentcell">
					<input type="text" name="z1.item18" value="${z1.item18}" />
					</td>
					<td class="tables_contentcell">
					<input type="text" name="z1.item19" value="${z1.item19}" />
					</td>
					<td class="tables_contentcell">
					<input type="text" name="z1.item20" value="${z1.item20}" />
					</td>
					<td class="tables_contentcell">
					<input type="text" name="z1.item21" value="${z1.item21}" />
					</td>
					<td class="tables_contentcell">
					<input type="text" name="z1.item22" value="${z1.item22}" />
					</td>
					<td class="tables_contentcell">
					<input type="text" name="z1.item23" value="${z1.item23}" />
					</td>
					<td class="tables_contentcell">
					<input type="text" name="z1.item24" value="${z1.item24}" />
					</td>
					<td class="tables_contentcell">
					<input type="text" name="z1.item25" value="${z1.item25}" />
					</td>
				</tr>
				<tr>
					<td class="tables_contentcell">
					2
					</td>
					<td class="tables_contentcell">
					教育资金
					</td>
					<td class="tables_contentcell">
					<input type="text" name="z2.file" value="${z2.file}" />
					</td>
					<td class="tables_contentcell">
					<input type="text" name="z2.content" value="${z2.content}" />
					</td>
					<td class="tables_contentcell">
					<input type="text" name="z2.item1" value="${z2.item1}" />
					</td>
					<td class="tables_contentcell">
					<input type="text" name="z2.item2" value="${z2.item2}" />
					</td>
					<td class="tables_contentcell">
					<input type="text" name="z2.item3" value="${z2.item3}" />
					</td>
					<td class="tables_contentcell">
					<input type="text" name="z2.item4" value="${z2.item4}" />
					</td>
					<td class="tables_contentcell">
					<input type="text" name="z2.item5" value="${z2.item5}" />
					</td>
					<td class="tables_contentcell">
					<input type="text" name="z2.item6" value="${z2.item6}" />
					</td>
					<td class="tables_contentcell">
					<input type="text" name="z2.item7" value="${z2.item7}" />
					</td>
					<td class="tables_contentcell">
					<input type="text" name="z2.item8" value="${z2.item8}" />
					</td>
					<td class="tables_contentcell">
					<input type="text" name="z2.item9" value="${z2.item9}" />
					</td>
					<td class="tables_contentcell">
					<input type="text" name="z2.item10" value="${z2.item10}" />
					</td>
					<td class="tables_contentcell">
					<input type="text" name="z2.item11" value="${z2.item11}" />
					</td>
					<td class="tables_contentcell">
					<input type="text" name="z2.item12" value="${z2.item12}" />
					</td>
					<td class="tables_contentcell">
					<input type="text" name="z2.item13" value="${z2.item13}" />
					</td>
					<td class="tables_contentcell">
					<input type="text" name="z2.item14" value="${z2.item14}" />
					</td>
					<td class="tables_contentcell">
					<input type="text" name="z2.item15" value="${z2.item15}" />
					</td>
					<td class="tables_contentcell">
					<input type="text" name="z2.item16" value="${z2.item16}" />
					</td>
					<td class="tables_contentcell">
					<input type="text" name="z2.item17" value="${z2.item17}" />
					</td>
					<td class="tables_contentcell">
					<input type="text" name="z2.item18" value="${z2.item18}" />
					</td>
					<td class="tables_contentcell">
					<input type="text" name="z2.item19" value="${z2.item19}" />
					</td>
					<td class="tables_contentcell">
					<input type="text" name="z2.item20" value="${z2.item20}" />
					</td>
					<td class="tables_contentcell">
					<input type="text" name="z2.item21" value="${z2.item21}" />
					</td>
					<td class="tables_contentcell">
					<input type="text" name="z2.item22" value="${z2.item22}" />
					</td>
					<td class="tables_contentcell">
					<input type="text" name="z2.item23" value="${z2.item23}" />
					</td>
					<td class="tables_contentcell">
					<input type="text" name="z2.item24" value="${z2.item24}" />
					</td>
					<td class="tables_contentcell">
					<input type="text" name="z2.item25" value="${z2.item25}" />
					</td>
				</tr>
				<tr>
					<td class="tables_contentcell">
					3
					</td>
					<td class="tables_contentcell">
					购买新农合资金
					</td>
					<td class="tables_contentcell">
					<input type="text" name="z3.file" value="${z3.file}" />
					</td>
					<td class="tables_contentcell">
					<input type="text" name="z3.content" value="${z3.content}" />
					</td>
					<td class="tables_contentcell">
					<input type="text" name="z3.item1" value="${z3.item1}" />
					</td>
					<td class="tables_contentcell">
					<input type="text" name="z3.item2" value="${z3.item2}" />
					</td>
					<td class="tables_contentcell">
					<input type="text" name="z3.item3" value="${z3.item3}" />
					</td>
					<td class="tables_contentcell">
					<input type="text" name="z3.item4" value="${z3.item4}" />
					</td>
					<td class="tables_contentcell">
					<input type="text" name="z3.item5" value="${z3.item5}" />
					</td>
					<td class="tables_contentcell">
					<input type="text" name="z3.item6" value="${z3.item6}" />
					</td>
					<td class="tables_contentcell">
					<input type="text" name="z3.item7" value="${z3.item7}" />
					</td>
					<td class="tables_contentcell">
					<input type="text" name="z3.item8" value="${z3.item8}" />
					</td>
					<td class="tables_contentcell">
					<input type="text" name="z3.item9" value="${z3.item9}" />
					</td>
					<td class="tables_contentcell">
					<input type="text" name="z3.item10" value="${z3.item10}" />
					</td>
					<td class="tables_contentcell">
					<input type="text" name="z3.item11" value="${z3.item11}" />
					</td>
					<td class="tables_contentcell">
					<input type="text" name="z3.item12" value="${z3.item12}" />
					</td>
					<td class="tables_contentcell">
					<input type="text" name="z3.item13" value="${z3.item13}" />
					</td>
					<td class="tables_contentcell">
					<input type="text" name="z3.item14" value="${z3.item14}" />
					</td>
					<td class="tables_contentcell">
					<input type="text" name="z3.item15" value="${z3.item15}" />
					</td>
					<td class="tables_contentcell">
					<input type="text" name="z3.item16" value="${z3.item16}" />
					</td>
					<td class="tables_contentcell">
					<input type="text" name="z3.item17" value="${z3.item17}" />
					</td>
					<td class="tables_contentcell">
					<input type="text" name="z3.item18" value="${z3.item18}" />
					</td>
					<td class="tables_contentcell">
					<input type="text" name="z3.item19" value="${z3.item19}" />
					</td>
					<td class="tables_contentcell">
					<input type="text" name="z3.item20" value="${z3.item20}" />
					</td>
					<td class="tables_contentcell">
					<input type="text" name="z3.item21" value="${z3.item21}" />
					</td>
					<td class="tables_contentcell">
					<input type="text" name="z3.item22" value="${z3.item22}" />
					</td>
					<td class="tables_contentcell">
					<input type="text" name="z3.item23" value="${z3.item23}" />
					</td>
					<td class="tables_contentcell">
					<input type="text" name="z3.item24" value="${z3.item24}" />
					</td>
					<td class="tables_contentcell">
					<input type="text" name="z3.item25" value="${z3.item25}" />
					</td>
				</tr>
				<tr>
					<td class="tables_contentcell">
					4
					</td>
					<td class="tables_contentcell">
					购买新农保资金
					</td>
					<td class="tables_contentcell">
					<input type="text" name="z4.file" value="${z4.file}" />
					</td>
					<td class="tables_contentcell">
					<input type="text" name="z4.content" value="${z4.content}" />
					</td>
					<td class="tables_contentcell">
					<input type="text" name="z4.item1" value="${z4.item1}" />
					</td>
					<td class="tables_contentcell">
					<input type="text" name="z4.item2" value="${z4.item2}" />
					</td>
					<td class="tables_contentcell">
					<input type="text" name="z4.item3" value="${z4.item3}" />
					</td>
					<td class="tables_contentcell">
					<input type="text" name="z4.item4" value="${z4.item4}" />
					</td>
					<td class="tables_contentcell">
					<input type="text" name="z4.item5" value="${z4.item5}" />
					</td>
					<td class="tables_contentcell">
					<input type="text" name="z4.item6" value="${z4.item6}" />
					</td>
					<td class="tables_contentcell">
					<input type="text" name="z4.item7" value="${z4.item7}" />
					</td>
					<td class="tables_contentcell">
					<input type="text" name="z4.item8" value="${z4.item8}" />
					</td>
					<td class="tables_contentcell">
					<input type="text" name="z4.item9" value="${z4.item9}" />
					</td>
					<td class="tables_contentcell">
					<input type="text" name="z4.item10" value="${z4.item10}" />
					</td>
					<td class="tables_contentcell">
					<input type="text" name="z4.item11" value="${z4.item11}" />
					</td>
					<td class="tables_contentcell">
					<input type="text" name="z4.item12" value="${z4.item12}" />
					</td>
					<td class="tables_contentcell">
					<input type="text" name="z4.item13" value="${z4.item13}" />
					</td>
					<td class="tables_contentcell">
					<input type="text" name="z4.item14" value="${z4.item14}" />
					</td>
					<td class="tables_contentcell">
					<input type="text" name="z4.item15" value="${z4.item15}" />
					</td>
					<td class="tables_contentcell">
					<input type="text" name="z4.item16" value="${z4.item16}" />
					</td>
					<td class="tables_contentcell">
					<input type="text" name="z4.item17" value="${z4.item17}" />
					</td>
					<td class="tables_contentcell">
					<input type="text" name="z4.item18" value="${z4.item18}" />
					</td>
					<td class="tables_contentcell">
					<input type="text" name="z4.item19" value="${z4.item19}" />
					</td>
					<td class="tables_contentcell">
					<input type="text" name="z4.item20" value="${z4.item20}" />
					</td>
					<td class="tables_contentcell">
					<input type="text" name="z4.item21" value="${z4.item21}" />
					</td>
					<td class="tables_contentcell">
					<input type="text" name="z4.item22" value="${z4.item22}" />
					</td>
					<td class="tables_contentcell">
					<input type="text" name="z4.item23" value="${z4.item23}" />
					</td>
					<td class="tables_contentcell">
					<input type="text" name="z4.item24" value="${z4.item24}" />
					</td>
					<td class="tables_contentcell">
					<input type="text" name="z4.item25" value="${z4.item25}" />
					</td>
				</tr>
				<tr>
					<td class="tables_contentcell">
					5
					</td>
					<td class="tables_contentcell">
					村（社）道资金
					</td>
					<td class="tables_contentcell">
					<input type="text" name="z5.file" value="${z5.file}" />
					</td>
					<td class="tables_contentcell">
					<input type="text" name="z5.content" value="${z5.content}" />
					</td>
					<td class="tables_contentcell">
					<input type="text" name="z5.item1" value="${z5.item1}" />
					</td>
					<td class="tables_contentcell">
					<input type="text" name="z5.item2" value="${z5.item2}" />
					</td>
					<td class="tables_contentcell">
					<input type="text" name="z5.item3" value="${z5.item3}" />
					</td>
					<td class="tables_contentcell">
					<input type="text" name="z5.item4" value="${z5.item4}" />
					</td>
					<td class="tables_contentcell">
					<input type="text" name="z5.item5" value="${z5.item5}" />
					</td>
					<td class="tables_contentcell">
					<input type="text" name="z5.item6" value="${z5.item6}" />
					</td>
					<td class="tables_contentcell">
					<input type="text" name="z5.item7" value="${z5.item7}" />
					</td>
					<td class="tables_contentcell">
					<input type="text" name="z5.item8" value="${z5.item8}" />
					</td>
					<td class="tables_contentcell">
					<input type="text" name="z5.item9" value="${z5.item9}" />
					</td>
					<td class="tables_contentcell">
					<input type="text" name="z5.item10" value="${z5.item10}" />
					</td>
					<td class="tables_contentcell">
					<input type="text" name="z5.item11" value="${z5.item11}" />
					</td>
					<td class="tables_contentcell">
					<input type="text" name="z5.item12" value="${z5.item12}" />
					</td>
					<td class="tables_contentcell">
					<input type="text" name="z5.item13" value="${z5.item13}" />
					</td>
					<td class="tables_contentcell">
					<input type="text" name="z5.item14" value="${z5.item14}" />
					</td>
					<td class="tables_contentcell">
					<input type="text" name="z5.item15" value="${z5.item15}" />
					</td>
					<td class="tables_contentcell">
					<input type="text" name="z5.item16" value="${z5.item16}" />
					</td>
					<td class="tables_contentcell">
					<input type="text" name="z5.item17" value="${z5.item17}" />
					</td>
					<td class="tables_contentcell">
					<input type="text" name="z5.item18" value="${z5.item18}" />
					</td>
					<td class="tables_contentcell">
					<input type="text" name="z5.item19" value="${z5.item19}" />
					</td>
					<td class="tables_contentcell">
					<input type="text" name="z5.item20" value="${z5.item20}" />
					</td>
					<td class="tables_contentcell">
					<input type="text" name="z5.item21" value="${z5.item21}" />
					</td>
					<td class="tables_contentcell">
					<input type="text" name="z5.item22" value="${z5.item22}" />
					</td>
					<td class="tables_contentcell">
					<input type="text" name="z5.item23" value="${z5.item23}" />
					</td>
					<td class="tables_contentcell">
					<input type="text" name="z5.item24" value="${z5.item24}" />
					</td>
					<td class="tables_contentcell">
					<input type="text" name="z5.item25" value="${z5.item25}" />
					</td>
				</tr>
				<tr>
					<td class="tables_contentcell">
					6
					</td>
					<td class="tables_contentcell">
					路灯资金
					</td>
					<td class="tables_contentcell">
					<input type="text" name="z6.file" value="${z6.file}" />
					</td>
					<td class="tables_contentcell">
					<input type="text" name="z6.content" value="${z6.content}" />
					</td>
					<td class="tables_contentcell">
					<input type="text" name="z6.item1" value="${z6.item1}" />
					</td>
					<td class="tables_contentcell">
					<input type="text" name="z6.item2" value="${z6.item2}" />
					</td>
					<td class="tables_contentcell">
					<input type="text" name="z6.item3" value="${z6.item3}" />
					</td>
					<td class="tables_contentcell">
					<input type="text" name="z6.item4" value="${z6.item4}" />
					</td>
					<td class="tables_contentcell">
					<input type="text" name="z6.item5" value="${z6.item5}" />
					</td>
					<td class="tables_contentcell">
					<input type="text" name="z6.item6" value="${z6.item6}" />
					</td>
					<td class="tables_contentcell">
					<input type="text" name="z6.item7" value="${z6.item7}" />
					</td>
					<td class="tables_contentcell">
					<input type="text" name="z6.item8" value="${z6.item8}" />
					</td>
					<td class="tables_contentcell">
					<input type="text" name="z6.item9" value="${z6.item9}" />
					</td>
					<td class="tables_contentcell">
					<input type="text" name="z6.item10" value="${z6.item10}" />
					</td>
					<td class="tables_contentcell">
					<input type="text" name="z6.item11" value="${z6.item11}" />
					</td>
					<td class="tables_contentcell">
					<input type="text" name="z6.item12" value="${z6.item12}" />
					</td>
					<td class="tables_contentcell">
					<input type="text" name="z6.item13" value="${z6.item13}" />
					</td>
					<td class="tables_contentcell">
					<input type="text" name="z6.item14" value="${z6.item14}" />
					</td>
					<td class="tables_contentcell">
					<input type="text" name="z6.item15" value="${z6.item15}" />
					</td>
					<td class="tables_contentcell">
					<input type="text" name="z6.item16" value="${z6.item16}" />
					</td>
					<td class="tables_contentcell">
					<input type="text" name="z6.item17" value="${z6.item17}" />
					</td>
					<td class="tables_contentcell">
					<input type="text" name="z6.item18" value="${z6.item18}" />
					</td>
					<td class="tables_contentcell">
					<input type="text" name="z6.item19" value="${z6.item19}" />
					</td>
					<td class="tables_contentcell">
					<input type="text" name="z6.item20" value="${z6.item20}" />
					</td>
					<td class="tables_contentcell">
					<input type="text" name="z6.item21" value="${z6.item21}" />
					</td>
					<td class="tables_contentcell">
					<input type="text" name="z6.item22" value="${z6.item22}" />
					</td>
					<td class="tables_contentcell">
					<input type="text" name="z6.item23" value="${z6.item23}" />
					</td>
					<td class="tables_contentcell">
					<input type="text" name="z6.item24" value="${z6.item24}" />
					</td>
					<td class="tables_contentcell">
					<input type="text" name="z6.item25" value="${z6.item25}" />
					</td>
				</tr>
				<tr>
					<td class="tables_contentcell">
					7
					</td>
					<td class="tables_contentcell">
					二次改水和污水处理资金
					</td>
					<td class="tables_contentcell">
					<input type="text" name="z7.file" value="${z7.file}" />
					</td>
					<td class="tables_contentcell">
					<input type="text" name="z7.content" value="${z7.content}" />
					</td>
					<td class="tables_contentcell">
					<input type="text" name="z7.item1" value="${z7.item1}" />
					</td>
					<td class="tables_contentcell">
					<input type="text" name="z7.item2" value="${z7.item2}" />
					</td>
					<td class="tables_contentcell">
					<input type="text" name="z7.item3" value="${z7.item3}" />
					</td>
					<td class="tables_contentcell">
					<input type="text" name="z7.item4" value="${z7.item4}" />
					</td>
					<td class="tables_contentcell">
					<input type="text" name="z7.item5" value="${z7.item5}" />
					</td>
					<td class="tables_contentcell">
					<input type="text" name="z7.item6" value="${z7.item6}" />
					</td>
					<td class="tables_contentcell">
					<input type="text" name="z7.item7" value="${z7.item7}" />
					</td>
					<td class="tables_contentcell">
					<input type="text" name="z7.item8" value="${z7.item8}" />
					</td>
					<td class="tables_contentcell">
					<input type="text" name="z7.item9" value="${z7.item9}" />
					</td>
					<td class="tables_contentcell">
					<input type="text" name="z7.item10" value="${z7.item10}" />
					</td>
					<td class="tables_contentcell">
					<input type="text" name="z7.item11" value="${z7.item11}" />
					</td>
					<td class="tables_contentcell">
					<input type="text" name="z7.item12" value="${z7.item12}" />
					</td>
					<td class="tables_contentcell">
					<input type="text" name="z7.item13" value="${z7.item13}" />
					</td>
					<td class="tables_contentcell">
					<input type="text" name="z7.item14" value="${z7.item14}" />
					</td>
					<td class="tables_contentcell">
					<input type="text" name="z7.item15" value="${z7.item15}" />
					</td>
					<td class="tables_contentcell">
					<input type="text" name="z7.item16" value="${z7.item16}" />
					</td>
					<td class="tables_contentcell">
					<input type="text" name="z7.item17" value="${z7.item17}" />
					</td>
					<td class="tables_contentcell">
					<input type="text" name="z7.item18" value="${z7.item18}" />
					</td>
					<td class="tables_contentcell">
					<input type="text" name="z7.item19" value="${z7.item19}" />
					</td>
					<td class="tables_contentcell">
					<input type="text" name="z7.item20" value="${z7.item20}" />
					</td>
					<td class="tables_contentcell">
					<input type="text" name="z7.item21" value="${z7.item21}" />
					</td>
					<td class="tables_contentcell">
					<input type="text" name="z7.item22" value="${z7.item22}" />
					</td>
					<td class="tables_contentcell">
					<input type="text" name="z7.item23" value="${z7.item23}" />
					</td>
					<td class="tables_contentcell">
					<input type="text" name="z7.item24" value="${z7.item24}" />
					</td>
					<td class="tables_contentcell">
					<input type="text" name="z7.item25" value="${z7.item25}" />
					</td>
				</tr>
				<tr>
					<td class="tables_contentcell">
					8
					</td>
					<td class="tables_contentcell">
					农田（鱼塘）标准化建设资金
					</td>
					<td class="tables_contentcell">
					<input type="text" name="z8.file" value="${z8.file}" />
					</td>
					<td class="tables_contentcell">
					<input type="text" name="z8.content" value="${z8.content}" />
					</td>
					<td class="tables_contentcell">
					<input type="text" name="z8.item1" value="${z8.item1}" />
					</td>
					<td class="tables_contentcell">
					<input type="text" name="z8.item2" value="${z8.item2}" />
					</td>
					<td class="tables_contentcell">
					<input type="text" name="z8.item3" value="${z8.item3}" />
					</td>
					<td class="tables_contentcell">
					<input type="text" name="z8.item4" value="${z8.item4}" />
					</td>
					<td class="tables_contentcell">
					<input type="text" name="z8.item5" value="${z8.item5}" />
					</td>
					<td class="tables_contentcell">
					<input type="text" name="z8.item6" value="${z8.item6}" />
					</td>
					<td class="tables_contentcell">
					<input type="text" name="z8.item7" value="${z8.item7}" />
					</td>
					<td class="tables_contentcell">
					<input type="text" name="z8.item8" value="${z8.item8}" />
					</td>
					<td class="tables_contentcell">
					<input type="text" name="z8.item9" value="${z8.item9}" />
					</td>
					<td class="tables_contentcell">
					<input type="text" name="z8.item10" value="${z8.item10}" />
					</td>
					<td class="tables_contentcell">
					<input type="text" name="z8.item11" value="${z8.item11}" />
					</td>
					<td class="tables_contentcell">
					<input type="text" name="z8.item12" value="${z8.item12}" />
					</td>
					<td class="tables_contentcell">
					<input type="text" name="z8.item13" value="${z8.item13}" />
					</td>
					<td class="tables_contentcell">
					<input type="text" name="z8.item14" value="${z8.item14}" />
					</td>
					<td class="tables_contentcell">
					<input type="text" name="z8.item15" value="${z8.item15}" />
					</td>
					<td class="tables_contentcell">
					<input type="text" name="z8.item16" value="${z8.item16}" />
					</td>
					<td class="tables_contentcell">
					<input type="text" name="z8.item17" value="${z8.item17}" />
					</td>
					<td class="tables_contentcell">
					<input type="text" name="z8.item18" value="${z8.item18}" />
					</td>
					<td class="tables_contentcell">
					<input type="text" name="z8.item19" value="${z8.item19}" />
					</td>
					<td class="tables_contentcell">
					<input type="text" name="z8.item20" value="${z8.item20}" />
					</td>
					<td class="tables_contentcell">
					<input type="text" name="z8.item21" value="${z8.item21}" />
					</td>
					<td class="tables_contentcell">
					<input type="text" name="z8.item22" value="${z8.item22}" />
					</td>
					<td class="tables_contentcell">
					<input type="text" name="z8.item23" value="${z8.item23}" />
					</td>
					<td class="tables_contentcell">
					<input type="text" name="z8.item24" value="${z8.item24}" />
					</td>
					<td class="tables_contentcell">
					<input type="text" name="z8.item25" value="${z8.item25}" />
					</td>
				</tr>
				<tr>
					<td class="tables_contentcell">
					9
					</td>
					<td class="tables_contentcell">
					公共服务设施（村）资金
					</td>
					<td class="tables_contentcell">
					<input type="text" name="z9.file" value="${z9.file}" />
					</td>
					<td class="tables_contentcell">
					<input type="text" name="z9.content" value="${z9.content}" />
					</td>
					<td class="tables_contentcell">
					<input type="text" name="z9.item1" value="${z9.item1}" />
					</td>
					<td class="tables_contentcell">
					<input type="text" name="z9.item2" value="${z9.item2}" />
					</td>
					<td class="tables_contentcell">
					<input type="text" name="z9.item3" value="${z9.item3}" />
					</td>
					<td class="tables_contentcell">
					<input type="text" name="z9.item4" value="${z9.item4}" />
					</td>
					<td class="tables_contentcell">
					<input type="text" name="z9.item5" value="${z9.item5}" />
					</td>
					<td class="tables_contentcell">
					<input type="text" name="z9.item6" value="${z9.item6}" />
					</td>
					<td class="tables_contentcell">
					<input type="text" name="z9.item7" value="${z9.item7}" />
					</td>
					<td class="tables_contentcell">
					<input type="text" name="z9.item8" value="${z9.item8}" />
					</td>
					<td class="tables_contentcell">
					<input type="text" name="z9.item9" value="${z9.item9}" />
					</td>
					<td class="tables_contentcell">
					<input type="text" name="z9.item10" value="${z9.item10}" />
					</td>
					<td class="tables_contentcell">
					<input type="text" name="z9.item11" value="${z9.item11}" />
					</td>
					<td class="tables_contentcell">
					<input type="text" name="z9.item12" value="${z9.item12}" />
					</td>
					<td class="tables_contentcell">
					<input type="text" name="z9.item13" value="${z9.item13}" />
					</td>
					<td class="tables_contentcell">
					<input type="text" name="z9.item14" value="${z9.item14}" />
					</td>
					<td class="tables_contentcell">
					<input type="text" name="z9.item15" value="${z9.item15}" />
					</td>
					<td class="tables_contentcell">
					<input type="text" name="z9.item16" value="${z9.item16}" />
					</td>
					<td class="tables_contentcell">
					<input type="text" name="z9.item17" value="${z9.item17}" />
					</td>
					<td class="tables_contentcell">
					<input type="text" name="z9.item18" value="${z9.item18}" />
					</td>
					<td class="tables_contentcell">
					<input type="text" name="z9.item19" value="${z9.item19}" />
					</td>
					<td class="tables_contentcell">
					<input type="text" name="z9.item20" value="${z9.item20}" />
					</td>
					<td class="tables_contentcell">
					<input type="text" name="z9.item21" value="${z9.item21}" />
					</td>
					<td class="tables_contentcell">
					<input type="text" name="z9.item22" value="${z9.item22}" />
					</td>
					<td class="tables_contentcell">
					<input type="text" name="z9.item23" value="${z9.item23}" />
					</td>
					<td class="tables_contentcell">
					<input type="text" name="z9.item24" value="${z9.item24}" />
					</td>
					<td class="tables_contentcell">
					<input type="text" name="z9.item25" value="${z9.item25}" />
					</td>
				</tr>
				<tr>
					<td class="tables_contentcell">
					10
					</td>
					<td class="tables_contentcell">
					基层组织建设资金
					</td>
					<td class="tables_contentcell">
					<input type="text" name="z10.file" value="${z10.file}" />
					</td>
					<td class="tables_contentcell">
					<input type="text" name="z10.content" value="${z10.content}" />
					</td>
					<td class="tables_contentcell">
					<input type="text" name="z10.item1" value="${z10.item1}" />
					</td>
					<td class="tables_contentcell">
					<input type="text" name="z10.item2" value="${z10.item2}" />
					</td>
					<td class="tables_contentcell">
					<input type="text" name="z10.item3" value="${z10.item3}" />
					</td>
					<td class="tables_contentcell">
					<input type="text" name="z10.item4" value="${z10.item4}" />
					</td>
					<td class="tables_contentcell">
					<input type="text" name="z10.item5" value="${z10.item5}" />
					</td>
					<td class="tables_contentcell">
					<input type="text" name="z10.item6" value="${z10.item6}" />
					</td>
					<td class="tables_contentcell">
					<input type="text" name="z10.item7" value="${z10.item7}" />
					</td>
					<td class="tables_contentcell">
					<input type="text" name="z10.item8" value="${z10.item8}" />
					</td>
					<td class="tables_contentcell">
					<input type="text" name="z10.item9" value="${z10.item9}" />
					</td>
					<td class="tables_contentcell">
					<input type="text" name="z10.item10" value="${z10.item10}" />
					</td>
					<td class="tables_contentcell">
					<input type="text" name="z10.item11" value="${z10.item11}" />
					</td>
					<td class="tables_contentcell">
					<input type="text" name="z10.item12" value="${z10.item12}" />
					</td>
					<td class="tables_contentcell">
					<input type="text" name="z10.item13" value="${z10.item13}" />
					</td>
					<td class="tables_contentcell">
					<input type="text" name="z10.item14" value="${z10.item14}" />
					</td>
					<td class="tables_contentcell">
					<input type="text" name="z10.item15" value="${z10.item15}" />
					</td>
					<td class="tables_contentcell">
					<input type="text" name="z10.item16" value="${z10.item16}" />
					</td>
					<td class="tables_contentcell">
					<input type="text" name="z10.item17" value="${z10.item17}" />
					</td>
					<td class="tables_contentcell">
					<input type="text" name="z10.item18" value="${z10.item18}" />
					</td>
					<td class="tables_contentcell">
					<input type="text" name="z10.item19" value="${z10.item19}" />
					</td>
					<td class="tables_contentcell">
					<input type="text" name="z10.item20" value="${z10.item20}" />
					</td>
					<td class="tables_contentcell">
					<input type="text" name="z10.item21" value="${z10.item21}" />
					</td>
					<td class="tables_contentcell">
					<input type="text" name="z10.item22" value="${z10.item22}" />
					</td>
					<td class="tables_contentcell">
					<input type="text" name="z10.item23" value="${z10.item23}" />
					</td>
					<td class="tables_contentcell">
					<input type="text" name="z10.item24" value="${z10.item24}" />
					</td>
					<td class="tables_contentcell">
					<input type="text" name="z10.item25" value="${z10.item25}" />
					</td>
				</tr>
				<tr>
					<td class="tables_contentcell">
					11
					</td>
					<td class="tables_contentcell">
					惠民活动资金
					</td>
					<td class="tables_contentcell">
					<input type="text" name="z11.file" value="${z11.file}" />
					</td>
					<td class="tables_contentcell">
					<input type="text" name="z11.content" value="${z11.content}" />
					</td>
					<td class="tables_contentcell">
					<input type="text" name="z11.item1" value="${z11.item1}" />
					</td>
					<td class="tables_contentcell">
					<input type="text" name="z11.item2" value="${z11.item2}" />
					</td>
					<td class="tables_contentcell">
					<input type="text" name="z11.item3" value="${z11.item3}" />
					</td>
					<td class="tables_contentcell">
					<input type="text" name="z11.item4" value="${z11.item4}" />
					</td>
					<td class="tables_contentcell">
					<input type="text" name="z11.item5" value="${z11.item5}" />
					</td>
					<td class="tables_contentcell">
					<input type="text" name="z11.item6" value="${z11.item6}" />
					</td>
					<td class="tables_contentcell">
					<input type="text" name="z11.item7" value="${z11.item7}" />
					</td>
					<td class="tables_contentcell">
					<input type="text" name="z11.item8" value="${z11.item8}" />
					</td>
					<td class="tables_contentcell">
					<input type="text" name="z11.item9" value="${z11.item9}" />
					</td>
					<td class="tables_contentcell">
					<input type="text" name="z11.item10" value="${z11.item10}" />
					</td>
					<td class="tables_contentcell">
					<input type="text" name="z11.item11" value="${z11.item11}" />
					</td>
					<td class="tables_contentcell">
					<input type="text" name="z11.item12" value="${z11.item12}" />
					</td>
					<td class="tables_contentcell">
					<input type="text" name="z11.item13" value="${z11.item13}" />
					</td>
					<td class="tables_contentcell">
					<input type="text" name="z11.item14" value="${z11.item14}" />
					</td>
					<td class="tables_contentcell">
					<input type="text" name="z11.item15" value="${z11.item15}" />
					</td>
					<td class="tables_contentcell">
					<input type="text" name="z11.item16" value="${z11.item16}" />
					</td>
					<td class="tables_contentcell">
					<input type="text" name="z11.item17" value="${z11.item17}" />
					</td>
					<td class="tables_contentcell">
					<input type="text" name="z11.item18" value="${z11.item18}" />
					</td>
					<td class="tables_contentcell">
					<input type="text" name="z11.item19" value="${z11.item19}" />
					</td>
					<td class="tables_contentcell">
					<input type="text" name="z11.item20" value="${z11.item20}" />
					</td>
					<td class="tables_contentcell">
					<input type="text" name="z11.item21" value="${z11.item21}" />
					</td>
					<td class="tables_contentcell">
					<input type="text" name="z11.item22" value="${z11.item22}" />
					</td>
					<td class="tables_contentcell">
					<input type="text" name="z11.item23" value="${z11.item23}" />
					</td>
					<td class="tables_contentcell">
					<input type="text" name="z11.item24" value="${z11.item24}" />
					</td>
					<td class="tables_contentcell">
					<input type="text" name="z11.item25" value="${z11.item25}" />
					</td>
				</tr>
				<tr>
					<td class="tables_contentcell">
					12
					</td>
					<td class="tables_contentcell">
					产业扶贫（农户）资金
					</td>
					<td class="tables_contentcell">
					<input type="text" name="z12.file" value="${z12.file}" />
					</td>
					<td class="tables_contentcell">
					<input type="text" name="z12.content" value="${z12.content}" />
					</td>
					<td class="tables_contentcell">
					<input type="text" name="z12.item1" value="${z12.item1}" />
					</td>
					<td class="tables_contentcell">
					<input type="text" name="z12.item2" value="${z12.item2}" />
					</td>
					<td class="tables_contentcell">
					<input type="text" name="z12.item3" value="${z12.item3}" />
					</td>
					<td class="tables_contentcell">
					<input type="text" name="z12.item4" value="${z12.item4}" />
					</td>
					<td class="tables_contentcell">
					<input type="text" name="z12.item5" value="${z12.item5}" />
					</td>
					<td class="tables_contentcell">
					<input type="text" name="z12.item6" value="${z12.item6}" />
					</td>
					<td class="tables_contentcell">
					<input type="text" name="z12.item7" value="${z12.item7}" />
					</td>
					<td class="tables_contentcell">
					<input type="text" name="z12.item8" value="${z12.item8}" />
					</td>
					<td class="tables_contentcell">
					<input type="text" name="z12.item9" value="${z12.item9}" />
					</td>
					<td class="tables_contentcell">
					<input type="text" name="z12.item10" value="${z12.item10}" />
					</td>
					<td class="tables_contentcell">
					<input type="text" name="z12.item11" value="${z12.item11}" />
					</td>
					<td class="tables_contentcell">
					<input type="text" name="z12.item12" value="${z12.item12}" />
					</td>
					<td class="tables_contentcell">
					<input type="text" name="z12.item13" value="${z12.item13}" />
					</td>
					<td class="tables_contentcell">
					<input type="text" name="z12.item14" value="${z12.item14}" />
					</td>
					<td class="tables_contentcell">
					<input type="text" name="z12.item15" value="${z12.item15}" />
					</td>
					<td class="tables_contentcell">
					<input type="text" name="z12.item16" value="${z12.item16}" />
					</td>
					<td class="tables_contentcell">
					<input type="text" name="z12.item17" value="${z12.item17}" />
					</td>
					<td class="tables_contentcell">
					<input type="text" name="z12.item18" value="${z12.item18}" />
					</td>
					<td class="tables_contentcell">
					<input type="text" name="z12.item19" value="${z12.item19}" />
					</td>
					<td class="tables_contentcell">
					<input type="text" name="z12.item20" value="${z12.item20}" />
					</td>
					<td class="tables_contentcell">
					<input type="text" name="z12.item21" value="${z12.item21}" />
					</td>
					<td class="tables_contentcell">
					<input type="text" name="z12.item22" value="${z12.item22}" />
					</td>
					<td class="tables_contentcell">
					<input type="text" name="z12.item23" value="${z12.item23}" />
					</td>
					<td class="tables_contentcell">
					<input type="text" name="z12.item24" value="${z12.item24}" />
					</td>
					<td class="tables_contentcell">
					<input type="text" name="z12.item25" value="${z12.item25}" />
					</td>
				</tr>
				<tr>
					<td class="tables_contentcell">
					13
					</td>
					<td class="tables_contentcell">
					产业扶贫（集体）资金
					</td>
					<td class="tables_contentcell">
					<input type="text" name="z13.file" value="${z13.file}" />
					</td>
					<td class="tables_contentcell">
					<input type="text" name="z13.content" value="${z13.content}" />
					</td>
					<td class="tables_contentcell">
					<input type="text" name="z13.item1" value="${z13.item1}" />
					</td>
					<td class="tables_contentcell">
					<input type="text" name="z13.item2" value="${z13.item2}" />
					</td>
					<td class="tables_contentcell">
					<input type="text" name="z13.item3" value="${z13.item3}" />
					</td>
					<td class="tables_contentcell">
					<input type="text" name="z13.item4" value="${z13.item4}" />
					</td>
					<td class="tables_contentcell">
					<input type="text" name="z13.item5" value="${z13.item5}" />
					</td>
					<td class="tables_contentcell">
					<input type="text" name="z13.item6" value="${z13.item6}" />
					</td>
					<td class="tables_contentcell">
					<input type="text" name="z13.item7" value="${z13.item7}" />
					</td>
					<td class="tables_contentcell">
					<input type="text" name="z13.item8" value="${z13.item8}" />
					</td>
					<td class="tables_contentcell">
					<input type="text" name="z13.item9" value="${z13.item9}" />
					</td>
					<td class="tables_contentcell">
					<input type="text" name="z13.item10" value="${z13.item10}" />
					</td>
					<td class="tables_contentcell">
					<input type="text" name="z13.item11" value="${z13.item11}" />
					</td>
					<td class="tables_contentcell">
					<input type="text" name="z13.item12" value="${z13.item12}" />
					</td>
					<td class="tables_contentcell">
					<input type="text" name="z13.item13" value="${z13.item13}" />
					</td>
					<td class="tables_contentcell">
					<input type="text" name="z13.item14" value="${z13.item14}" />
					</td>
					<td class="tables_contentcell">
					<input type="text" name="z13.item15" value="${z13.item15}" />
					</td>
					<td class="tables_contentcell">
					<input type="text" name="z13.item16" value="${z13.item16}" />
					</td>
					<td class="tables_contentcell">
					<input type="text" name="z13.item17" value="${z13.item17}" />
					</td>
					<td class="tables_contentcell">
					<input type="text" name="z13.item18" value="${z13.item18}" />
					</td>
					<td class="tables_contentcell">
					<input type="text" name="z13.item19" value="${z13.item19}" />
					</td>
					<td class="tables_contentcell">
					<input type="text" name="z13.item20" value="${z13.item20}" />
					</td>
					<td class="tables_contentcell">
					<input type="text" name="z13.item21" value="${z13.item21}" />
					</td>
					<td class="tables_contentcell">
					<input type="text" name="z13.item22" value="${z13.item22}" />
					</td>
					<td class="tables_contentcell">
					<input type="text" name="z13.item23" value="${z13.item23}" />
					</td>
					<td class="tables_contentcell">
					<input type="text" name="z13.item24" value="${z13.item24}" />
					</td>
					<td class="tables_contentcell">
					<input type="text" name="z13.item25" value="${z13.item25}" />
					</td>
				</tr>
				<tr>
					<td class="tables_contentcell">
					14
					</td>
					<td class="tables_contentcell">
					其他资金
					</td>
					<td class="tables_contentcell">
					<input type="text" name="z14.file" value="${z14.file}" />
					</td>
					<td class="tables_contentcell">
					<input type="text" name="z14.content" value="${z14.content}" />
					</td>
					<td class="tables_contentcell">
					<input type="text" name="z14.item1" value="${z14.item1}" />
					</td>
					<td class="tables_contentcell">
					<input type="text" name="z14.item2" value="${z14.item2}" />
					</td>
					<td class="tables_contentcell">
					<input type="text" name="z14.item3" value="${z14.item3}" />
					</td>
					<td class="tables_contentcell">
					<input type="text" name="z14.item4" value="${z14.item4}" />
					</td>
					<td class="tables_contentcell">
					<input type="text" name="z14.item5" value="${z14.item5}" />
					</td>
					<td class="tables_contentcell">
					<input type="text" name="z14.item6" value="${z14.item6}" />
					</td>
					<td class="tables_contentcell">
					<input type="text" name="z14.item7" value="${z14.item7}" />
					</td>
					<td class="tables_contentcell">
					<input type="text" name="z14.item8" value="${z14.item8}" />
					</td>
					<td class="tables_contentcell">
					<input type="text" name="z14.item9" value="${z14.item9}" />
					</td>
					<td class="tables_contentcell">
					<input type="text" name="z14.item10" value="${z14.item10}" />
					</td>
					<td class="tables_contentcell">
					<input type="text" name="z14.item11" value="${z14.item11}" />
					</td>
					<td class="tables_contentcell">
					<input type="text" name="z14.item12" value="${z14.item12}" />
					</td>
					<td class="tables_contentcell">
					<input type="text" name="z14.item13" value="${z14.item13}" />
					</td>
					<td class="tables_contentcell">
					<input type="text" name="z14.item14" value="${z14.item14}" />
					</td>
					<td class="tables_contentcell">
					<input type="text" name="z14.item15" value="${z14.item15}" />
					</td>
					<td class="tables_contentcell">
					<input type="text" name="z14.item16" value="${z14.item16}" />
					</td>
					<td class="tables_contentcell">
					<input type="text" name="z14.item17" value="${z14.item17}" />
					</td>
					<td class="tables_contentcell">
					<input type="text" name="z14.item18" value="${z14.item18}" />
					</td>
					<td class="tables_contentcell">
					<input type="text" name="z14.item19" value="${z14.item19}" />
					</td>
					<td class="tables_contentcell">
					<input type="text" name="z14.item20" value="${z14.item20}" />
					</td>
					<td class="tables_contentcell">
					<input type="text" name="z14.item21" value="${z14.item21}" />
					</td>
					<td class="tables_contentcell">
					<input type="text" name="z14.item22" value="${z14.item22}" />
					</td>
					<td class="tables_contentcell">
					<input type="text" name="z14.item23" value="${z14.item23}" />
					</td>
					<td class="tables_contentcell">
					<input type="text" name="z14.item24" value="${z14.item24}" />
					</td>
					<td class="tables_contentcell">
					<input type="text" name="z14.item25" value="${z14.item25}" />
					</td>
				</tr>
				<tr>
					<td class="tables_contentcell">
					15
					</td>
					<td class="tables_contentcell">
					待定项目资金
					</td>
					<td class="tables_contentcell">
					<input type="text" name="z15.file" value="${z15.file}" />
					</td>
					<td class="tables_contentcell">
					<input type="text" name="z15.content" value="${z15.content}" />
					</td>
					<td class="tables_contentcell">
					<input type="text" name="z15.item1" value="${z15.item1}" />
					</td>
					<td class="tables_contentcell">
					<input type="text" name="z15.item2" value="${z15.item2}" />
					</td>
					<td class="tables_contentcell">
					<input type="text" name="z15.item3" value="${z15.item3}" />
					</td>
					<td class="tables_contentcell">
					<input type="text" name="z15.item4" value="${z15.item4}" />
					</td>
					<td class="tables_contentcell">
					<input type="text" name="z15.item5" value="${z15.item5}" />
					</td>
					<td class="tables_contentcell">
					<input type="text" name="z15.item6" value="${z15.item6}" />
					</td>
					<td class="tables_contentcell">
					<input type="text" name="z15.item7" value="${z15.item7}" />
					</td>
					<td class="tables_contentcell">
					<input type="text" name="z15.item8" value="${z15.item8}" />
					</td>
					<td class="tables_contentcell">
					<input type="text" name="z15.item9" value="${z15.item9}" />
					</td>
					<td class="tables_contentcell">
					<input type="text" name="z15.item10" value="${z15.item10}" />
					</td>
					<td class="tables_contentcell">
					<input type="text" name="z15.item11" value="${z15.item11}" />
					</td>
					<td class="tables_contentcell">
					<input type="text" name="z15.item12" value="${z15.item12}" />
					</td>
					<td class="tables_contentcell">
					<input type="text" name="z15.item13" value="${z15.item13}" />
					</td>
					<td class="tables_contentcell">
					<input type="text" name="z15.item14" value="${z15.item14}" />
					</td>
					<td class="tables_contentcell">
					<input type="text" name="z15.item15" value="${z15.item15}" />
					</td>
					<td class="tables_contentcell">
					<input type="text" name="z15.item16" value="${z15.item16}" />
					</td>
					<td class="tables_contentcell">
					<input type="text" name="z15.item17" value="${z15.item17}" />
					</td>
					<td class="tables_contentcell">
					<input type="text" name="z15.item18" value="${z15.item18}" />
					</td>
					<td class="tables_contentcell">
					<input type="text" name="z15.item19" value="${z15.item19}" />
					</td>
					<td class="tables_contentcell">
					<input type="text" name="z15.item20" value="${z15.item20}" />
					</td>
					<td class="tables_contentcell">
					<input type="text" name="z15.item21" value="${z15.item21}" />
					</td>
					<td class="tables_contentcell">
					<input type="text" name="z15.item22" value="${z15.item22}" />
					</td>
					<td class="tables_contentcell">
					<input type="text" name="z15.item23" value="${z15.item23}" />
					</td>
					<td class="tables_contentcell">
					<input type="text" name="z15.item24" value="${z15.item24}" />
					</td>
					<td class="tables_contentcell">
					<input type="text" name="z15.item25" value="${z15.item25}" />
					</td>
				</tr>
			</table>
		</form>
	</body>
</html>