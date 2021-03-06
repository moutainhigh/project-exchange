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
		
		$(function(){
			selectArea(2);
		});
		var paramZhenId = '${param.zhenId}';
		function selectArea(val){
			if(!document.getElementById('zhenId')){
				var zhenId = '';
				<c:if test="${userObj.roleType=='镇级管理员'}">
				zhenId = '${userObj.zhen.id}';
				</c:if>
				selectZhen(zhenId);
			}else if(val){
				$.getJSON("${appPath}ajax/getAllZhen?time="+new Date().getTime(), {'parentId':val}, function(json){
					if(json && json['list'] && json['list'].length){
						$('#zhenId').html('<option value=""></option>');
						for(var i=0;i<json['list'].length;i++)
							$('#zhenId').append('<option value="'+json['list'][i]['id']+'">'+json['list'][i]['name']+'</option>');
						if(paramZhenId!=''){
							setTimeout(function(){
								$('#zhenId').val(paramZhenId);
								selectZhen(paramZhenId);
							},1);
						}
					}
				});
			}
		}
		var paramCunId = '${param.cunId}';
		function selectZhen(val){
			if(val){
				$.getJSON("${appPath}ajax/getAllCun?time="+new Date().getTime(), {'parentId':val}, function(json){
					if(json && json['list'] && json['list'].length){
						$('#cunId2').html('<option value=""></option>');
						for(var i=0;i<json['list'].length;i++)
							$('#cunId2').append('<option value="'+json['list'][i]['id']+'">'+json['list'][i]['name']+'</option>');
						if(paramCunId!=''){
							setTimeout(function(){
								$('#cunId2').val(paramCunId);
							},1);
						}
					}
				});
			}
		}
		
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
				<form method="get" action="${appPath}report_viewReport3.action" name="searchForm">
					<tr align="center">
						<td width="" class="tables_headercell" colspan="2">
							年度：
							<select name="r3.year" id="year" onchange="chooseType();" style="width: 60px;">
								<option value=""></option>
							</select>
							<input type="hidden" name="r3.type" value="month" id="reportType"/>
						</td>
						<td width="" class="tables_headercell" colspan="2">
							月份：
							<select name="r3.time" id="time">
								<option value=""></option>
							</select>
						</td>
						<td width="" class="tables_headercell" colspan="2">
							帮扶单位:
							<select name="orgId" id="orgId">
								<option value="">==不限==</option>
								<c:forEach items="${orgList }" var="o">
								<option value="${o.id }" <c:if test="${o.id==param['orgId']}">selected="selected"</c:if>>${o.orgName }</option>
								</c:forEach>
							</select>
							&nbsp;
							受帮扶单位:
							<span class="STYLE1">镇：</span>
			 			<select id="zhenId" name="zhenId" onchange="selectZhen(this.value);">
									<option value="">----------</option>
								 </select>
						<span class="STYLE1">&nbsp;村：</span>
						<select id="cunId2" name="cunId">
									<option value="">-----------</option>
									</select>
							<br/>
							项目名称：
							<input type="text" style="width:100px;" name="proName" id="proName" value="${param.proName }"/>
							&nbsp;
							<input type="button" value="按条件查询" class="button" name="查询" onclick="query();">
							<input type="button" value="Excel导出" class="button" name="Excel导出" onclick="excel();">
						</td>
					</tr>
					</form>
					<tr>
						<td class="tables_contentcell" colspan="8" align="center">
							<table id="data_table" cellspacing="0" cellpadding="0" border="0" class="tables_table" style="margin: 5px 10px;width:95%;" align="center">
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
									<td align="center" class="tables_headercell" colspan="1">数据月份</td>
								</tr>
								<c:forEach items="${pageBean.resultList}" var="f" varStatus="s">
								<tr <c:if test="${f.r.year!=r3.year || f.r.time!=r3.time }">style="background-color: PINK;"</c:if>>
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
									<td class="tables_contentcell">
									&nbsp;${f.r.year }-${f.r.time }
									</td>
								</tr>
								</c:forEach>
								<tr>
									<td class="tables_contentcell">
									合计
									</td>
									<td class="tables_contentcell">
									&nbsp;
									</td>
									<td class="tables_contentcell">
									&nbsp;${pageBean.total[0] }
									</td>
									<td class="tables_contentcell">
									&nbsp;${pageBean.total[1] }
									</td>
									<td class="tables_contentcell">
									&nbsp;
									</td>
									<td class="tables_contentcell">
									&nbsp;
									</td>
									<td class="tables_contentcell">
									&nbsp;
									</td>
									<td class="tables_contentcell">
									&nbsp;
									</td>
									<td class="tables_contentcell">
									&nbsp;
									</td>
									<td class="tables_contentcell">
									&nbsp;
									</td>
								</tr>
							</table>			
						</td>
					</tr>
				</tbody>
			</table>
	</body>
</html>