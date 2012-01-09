<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<meta content="text/html; charset=utf-8" http-equiv="Content-Type">
		<link href="${appPath}main/main_data/manage.css" rel="stylesheet">
		<link rel="stylesheet" type="text/css" href="${appPath}css/jquery.datepick.css" />
		<script src="${appPath}js/jquery.js" language="javascript"></script>
		<script src="${appPath}js/sel_style.js" language="javascript"></script>
		<script src="${appPath}js/common.js" language="javascript"></script>
		<script type="text/javascript" src="${appPath}js/jquery.datepick.js"></script>
		<script type="text/javascript" src="${appPath}js/jquery.datepick-zh-CN.js"></script>
		<script language="javascript">
		var msg = '${msg}';
		if(msg != ''){
			alert(msg);
		}
		var year = '${r3.year}';
		var type = '${r3.type}';
		var time = '${r3.time}';
		var lock = '${r3.lock}';
		var maxYear = '${maxYear}';
		var maxMonth = '${maxMonth}';
		var maxSeason = '${maxSeason}';
		var now = new Date();
		var currYear = now.getYear()<1970?now.getYear() + 1900:now.getYear();
		maxYear = maxYear==''?currYear:parseInt(maxYear);
		maxMonth = maxMonth==''?12:parseInt(maxMonth);
		maxSeason = maxSeason==''?4:parseInt(maxSeason);
		$(function(){
			$('.datetime').datepick({dateFormat: 'yy-mm-dd'}); 
		
			for(var i=2011;i<=maxYear;i++){
				$("#year").append('<option value="'+ i +'">'+ i +'</option>');
			}
			if(year != ''){
				setTimeout(function(){ 
				    $('#year').val(year);
				},1);
			}
			if(type != ''){
				setTimeout(function(){ 
				   $('#reportType').val(type);
				},1);
				chooseType(type);
			}		
			//加锁，禁止修改
			if(lock == '1' || lock == '2' || type=='year' || type=='season'){
				$('input[type="text"]').attr("readonly",true);
			}
		});
		function chooseType(type){
			if(!type){
				type = $('#reportType').val();
			}
			if('year' == type){
				$('#time').attr('disabled',true);
			}else if('season' == type){
				$('#time').attr('disabled',false);
				var str = '';
				var ms = maxSeason;
				if(currYear > $('#year').val())
					ms = 4;
				for(var i=1;i<=ms;i++){
					if(($('#year').val()==2011 || year == '2011') && i==1){
						continue;
					}else{
						str += '<option value="'+i+'">第'+i+'季度</option>';
					}
				}
				$('#time').html(str);
				if(time != ''){
					setTimeout(function(){ 
					  $('#time').val(time);
					},1);
				}
			}else if('month' == type){
				$('#time').attr('disabled',false);
				var str = '';
				if(currYear > $('#year').val())
					ms = 12;
				for(var i=1;i<=ms;i++){
					if($('#year').val()==2011 || year == '2011'){
						if(i<=7)
							continue;
						str += '<option value="'+i+'">第'+i+'月</option>';
					}else{
						str += '<option value="'+i+'">第'+i+'月</option>';
					}
				}
				$('#time').html(str);
				if(time != ''){
					setTimeout(function(){ 
					  $('#time').val(time);
					},1);
				}
			}
		}
		function query(){
			var f = document.forms[0];
			f.action = '${appPath}report_viewReport3.action';
			f.submit();
		}
		function tmpSaveReport(){
			var f = document.forms[0];
			f.action = '${appPath}report_tmpSaveReport3.action';
			f.submit();
		}
		function saveReport(){
			if(confirm('报表提交后不允许修改，是否提交')){
				var f = document.forms[0];
				f.action = '${appPath}report_saveReport3.action';
				f.submit();
			}
		}
		function unlockReport(){
			if(confirm('确定需要解锁吗？')){
				var f = document.forms[0];
				f.action = '${appPath}report_requstUnlock3.action';
				f.submit();
			}
		}
		function excel(){
			//alert("excel导出暂时不可用");
			//var f = document.forms[0];
			//f.action = '${appPath}report_excelReport3.action';
			//f.submit();
			exportExcel('data_table');
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
</style>
	</head>
	<body>
		<form method="get" action="${appPath}report_saveReport3.action" name="searchForm">
			<table width="100%" cellspacing="0" cellpadding="0" border="0" class="tables_search">
				<tbody>
					<tr>
						<td>
							您当前所处页面：对口帮扶低收入村项目建设及资金下拨明细表
						</td>
						<td align="right">&nbsp;
						</td>
						<td width="5px">&nbsp;</td>
					</tr>
				</tbody>
			</table>
			<table width="100%" cellspacing="0" cellpadding="0" border="0" class="tables_table">
				<tbody>
					<tr align="center">
						<td width="" class="tables_headercell" colspan="2">
							年度：
							<select name="r3.year" id="year" onchange="chooseType();" style="width: 60px;">
								<option value=""></option>
							</select>
						</td>
						<td width="" class="tables_headercell" colspan="2">
							类型：
							<select name="r3.type" id="reportType" onchange="chooseType(this.value);">
								<option value=""></option>
								<option value="year">年度报表</option>
								<option value="season">季度报表</option>
								<option value="month">月度报表</option>
							</select>
						</td>
						<td width="" class="tables_headercell" colspan="2">
							时间：
							<select name="r3.time" id="time">
								<option value=""></option>
							</select>
						</td>
						<td width="" class="tables_headercell" colspan="2">
							<input type="button" value="按条件查询" class="button" name="查询" onclick="query();">
							<input type="button" value="Excel导出" class="button" name="Excel导出" onclick="excel();">
						</td>
					</tr>
					<tr>
						<td class="tables_contentcell" colspan="8" align="center">
							<c:forEach items="${r3List}" var="r" varStatus="s">
							<table id="data_table" cellspacing="0" cellpadding="0" border="0" class="tables_table" style="margin: 5px 10px;width:95%;" align="center">
								<tr>
									<td align="center" class="tables_headercell" colspan="9">${r.zhen.name }</td>
								</tr>
								<tr>
									<td align="center" class="tables_headercell" colspan="1">帮扶单位</td>
									<td align="center" class="tables_headercell" colspan="1">被帮扶村</td>
									<td align="center" class="tables_headercell" colspan="1">总金额（万元）</td>
									<td align="center" class="tables_headercell" colspan="1">到帐金额（万元）</td>
									<td align="center" class="tables_headercell" colspan="1">到账时间</td>
									<td align="center" class="tables_headercell" colspan="1">项目名称</td>
									<td align="center" class="tables_headercell" colspan="1">核拨资金（万元）</td>
									<td align="center" class="tables_headercell" colspan="1">下拨时间</td>
									<td align="center" class="tables_headercell" colspan="1">备注</td>
								</tr>
								<c:forEach items="${r.items}" var="f" varStatus="s">
								<tr>
									<td class="tables_contentcell">
									<input type="hidden" name="r.items[${s.count-1}].id" value="${f.id}"/>
									&nbsp;${f.proCun.org.orgName}
									</td>
									<td class="tables_contentcell">
									&nbsp;${f.proCun.cun.name}
									</td>
									<td class="tables_contentcell">
									&nbsp;<input name="r.items[${s.count-1}].proCun.money" type="text" value="${f.proCun.money}"/>
									</td>
									<td class="tables_contentcell">
									&nbsp;<input name="r.items[${s.count-1}].reachMoney" type="text" value="${f.reachMoney}"/>
									</td>
									<td class="tables_contentcell">
									&nbsp;<input name="r.items[${s.count-1}].reachDate" type="text" class="datetime" value="${f.reachDate}"/>
									</td>
									<td class="tables_contentcell">
									&nbsp;${f.proCun.name}
									</td>
									<td class="tables_contentcell">
									&nbsp;<input name="r.items[${s.count-1}].payMoney" type="text" value="${f.payMoney}"/>
									</td>
									<td class="tables_contentcell">
									&nbsp;<input name="r.items[${s.count-1}].payDate" type="text" class="datetime" value="${f.payDate}"/>
									</td>
									<td class="tables_contentcell">
									&nbsp;<input name="r.items[${s.count-1}].comment" type="text" value="${f.comment }"/>
									</td>
								</tr>
								</c:forEach>
							</table>			
							</c:forEach>				
						</td>
					</tr>
				</tbody>
			</table>
		</form>
	</body>
</html>