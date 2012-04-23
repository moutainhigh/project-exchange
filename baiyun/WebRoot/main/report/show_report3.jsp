<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<meta content="text/html; charset=utf-8" http-equiv="Content-Type">
		<link href="${appPath}main/main_data/manage.css" rel="stylesheet">
		<script src="${appPath}js/jquery.js" language="javascript"></script>
		<script src="${appPath}js/validateForm.js" language="javascript"></script>
		<script src="${appPath}js/sel_style.js" language="javascript"></script>
		<script src="${appPath}js/common.js" language="javascript"></script>
		<script language="javascript">
		var msg = '${msg}';
		if(msg != ''){
			alert(msg);
		}
		var year = '${r.year}';
		var type = '${r.type}';
		var time = '${r.time}';
		var lock = '${r.lock}';
		var maxMonth = '${maxMonth}';
		var maxSeason = '${maxSeason}';
		maxMonth = maxMonth==''?12:parseInt(maxMonth);
		maxSeason = maxSeason==''?4:parseInt(maxSeason);
		$(function(){
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
			//自动地区数据灰化
			$('.auto_readonly').css('background','#EBEBE4');
			//input type length
			$('input[type="text"]').css("width",'100px');
		});
		function chooseType(type){
			if('year' == type){
				$('#time').attr('disabled',true);
			}else if('season' == type){
				$('#time').attr('disabled',false);
				var str = '';
				for(var i=1;i<=maxSeason;i++){
					if(($('#year').val()==2011 || year == '2011') && i<=2){
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
				//2011年，去掉月度报表的第1 -7月，8月份之后的月份正常显示。
				$('#time').attr('disabled',false);
				var str = '';
				for(var i=1;i<=maxMonth;i++){
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
			f.action = '${appPath}report_viewReport1.action';
			f.submit();
		}
		function tmpSaveReport(){
			if(Validator.Validate(document.forms[0])){
				var f = document.forms[0];
				f.action = '${appPath}report_tmpSaveReport1.action';
				f.submit();
			}
		}
		function saveReport(){
			if(Validator.Validate(document.forms[0]) && confirm('报表提交后不允许修改，是否提交')){
				var f = document.forms[0];
				f.action = '${appPath}report_saveReport1.action';
				f.submit();
			}
		}
		function unlockReport(){
			if(confirm('确定需要解锁吗？')){
				var f = document.forms[0];
				f.action = '${appPath}report_requstUnlock1.action';
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
</style>
	</head>
	<body>
		<form method="get" action="${appPath}report_saveReport3.action" name="searchForm">
			<table id="data_table" cellspacing="0" cellpadding="0" border="0" class="tables_table" style="margin: 5px;" align="center">
				<tr>
					<td align="center" class="tables_headercell" colspan="4">资金下拨</td>
					<td align="center" class="tables_headercell" colspan="3">资金支出</td>
					<td align="center" class="tables_headercell" colspan="1" rowspan="2">备注</td>
				</tr>
				<tr>
					<td align="center" class="tables_headercell" colspan="1">帮扶单位</td>
					<td align="center" class="tables_headercell" colspan="1">被帮扶村</td>
					<td align="center" class="tables_headercell" colspan="1">项目资金（万元）</td>
					<td align="center" class="tables_headercell" colspan="1">到账时间</td>
					<td align="center" class="tables_headercell" colspan="1">项目名称</td>
					<td align="center" class="tables_headercell" colspan="1">项目资金（万元）</td>
					<td align="center" class="tables_headercell" colspan="1">下拨时间</td>
				</tr>
				<c:forEach items="${r3.items}" var="f" varStatus="s">
				<tr>
					<td class="tables_contentcell">
					<input type="hidden" name="r3.items[${s.count-1}].id" value="${f.id}"/>
					&nbsp;${f.proCun.org.orgName}
					</td>
					<td class="tables_contentcell">
					&nbsp;${f.proCun.cun.name}
					</td>
					<td class="tables_contentcell">
					&nbsp;<input name="r3.items[${s.count-1}].reachMoney" type="text" value="${f.reachMoney}"/>
					</td>
					<td class="tables_contentcell">
					&nbsp;<input name="r3.items[${s.count-1}].reachDate" type="text" class="datetime" value="${f.reachDate}"/>
					</td>
					<td class="tables_contentcell">
					&nbsp;${f.proCun.name}
					</td>
					<td class="tables_contentcell">
					&nbsp;<input name="r3.items[${s.count-1}].payMoney" type="text" value="${f.payMoney}"/>
					</td>
					<td class="tables_contentcell">
					&nbsp;<input name="r3.items[${s.count-1}].payDate" type="text" class="datetime" value="${f.payDate}"/>
					</td>
					<td class="tables_contentcell">
					&nbsp;<input name="r3.items[${s.count-1}].comment" type="text" value="${f.comment }"/>
					</td>
				</tr>
				</c:forEach>
				<tr>
					<td align="center" class="tables_contentcell" colspan="8">&nbsp;
					<input type="button" value="关闭" class="button" name="关闭" onclick="self.close();">
					</td>
				</tr>
			</table>							
		</form>
	</body>
</html>