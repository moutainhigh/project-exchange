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
		<form method="get" action="${appPath}report_saveReport1.action" name="searchForm">
			<table width="100%" cellspacing="0" cellpadding="0" border="0" class="tables_table">
				<tbody>
					<tr align="center">
						<td width="" class="tables_headercell">
							年度：
							<select name="r.year" id="year">
								<option value=""></option>
								<option value="2011">2011</option>
							</select>
						</td>
						<td width="" class="tables_headercell">
							类型：
							<select name="r.type" id="reportType" onchange="chooseType(this.value);">
								<option value=""></option>
								<option value="year">年度报表</option>
								<option value="season">季度报表</option>
								<option value="month">月度报表</option>
							</select>
						</td>
						<td width="" class="tables_headercell">
							时间：
							<select name="r.time" id="time">
								<option value=""></option>
							</select>
						</td>
						<td width="" class="tables_headercell">
						&nbsp;
						</td>
					</tr>
					<tr>
						<td class="tables_contentcell" colspan="4" align="center">
							<table id="data_table" cellspacing="0" cellpadding="0" border="0" class="tables_table" style="margin: 5px 10px;width:85%;" align="center">
								<tr>
									<td align="center" class="tables_headercell" colspan="4">结对帮扶低收入户</td>
								</tr>
								<tr>
									<td class="tables_contentcell" colspan="3">
									帮扶单位
									</td>
									<td class="tables_contentcell" width="50%">
									${r.cun.org.orgName }
									</td>
								</tr>
								<tr>
									<td class="tables_contentcell" colspan="3">
									贫困村
									</td>
									<td class="tables_contentcell">
									${r.cun.name }
									</td>
								</tr>
								<tr>
									<td class="tables_contentcell" rowspan="3" colspan="2">
									受帮扶低收入户情况
									</td>
									<td class="tables_contentcell" colspan="1">
									户数
									</td>
									<td class="tables_contentcell">
									<input type="text" name="r.item1" value="${r.item1}" />
									</td>
								</tr>
								<tr>
									<td class="tables_contentcell" colspan="1">
									人数
									</td>
									<td class="tables_contentcell">
									<input type="text" name="r.item2" value="${r.item2}" />
									</td>
								</tr>
								<tr>
									<td class="tables_contentcell">
									有劳动能力人数
									</td>
									<td class="tables_contentcell">
									<input type="text" name="r.item3" value="${r.item3}" />
									</td>
								</tr>
								<tr>
									<td class="tables_contentcell" rowspan="6" colspan="2">
									帮扶方式
									</td>
									<td class="tables_contentcell">
									是否安排就业
									</td>
									<td class="tables_contentcell">
									<input type="text" name="r.item4" value="${r.item4}" />
									</td>
								</tr>
								<tr>
									<td class="tables_contentcell">
									是否纳入低保
									</td>
									<td class="tables_contentcell">
									<input type="text" name="r.item5" value="${r.item5}" />
									</td>
								</tr>
								<tr>
									<td class="tables_contentcell">
									是否购买社保
									</td>
									<td class="tables_contentcell">
									<input type="text" name="r.item6" value="${r.item6}" />
									</td>
								</tr>
								<tr>
									<td class="tables_contentcell">
									是否帮助就学
									</td>
									<td class="tables_contentcell">
									<input type="text" name="r.item7" value="${r.item7}" />
									</td>
								</tr>
								<tr>
									<td class="tables_contentcell">
									是否参加新农合
									</td>
									<td class="tables_contentcell">
									<input type="text" name="r.item8" value="${r.item8}" />
									</td>
								</tr>
								<tr>
									<td class="tables_contentcell">
									其他
									</td>
									<td class="tables_contentcell">
									<input type="text" name="r.item9" value="${r.item9}" />
									</td>
								</tr>
								<tr>
									<td class="tables_contentcell" colspan="3">
									累计投入帮扶资金
									</td>
									<td class="tables_contentcell">
									<input type="text" name="r.item10" value="${r.item10}"/>
									</td>
								</tr>
								<tr>
									<td class="tables_contentcell" rowspan="2">
									到户情况
									</td>
									<td class="tables_contentcell" colspan="2">
									帮扶单位领导到村次数
									</td>
									<td class="tables_contentcell">
									<input type="text" name="r.item11" value="${r.item11}"/>
									</td>
								</tr>
								<tr>
									<td class="tables_contentcell" colspan="2">
									帮扶单位结对干部到户次数
									</td>
									<td class="tables_contentcell">
									<input type="text" name="r.item12" value="${r.item12}"/>
									</td>
								</tr>
								<tr>
									<td class="tables_contentcell" rowspan="12">
									帮扶成效
									</td>
									<td class="tables_contentcell" rowspan="2">
									安排就业
									</td>
									<td class="tables_contentcell">
									户数
									</td>
									<td class="tables_contentcell">
									<input type="text" name="r.item13" value="${r.item13}"/>
									</td>
								</tr>
								<tr>
									<td class="tables_contentcell">
									人数
									</td>
									<td class="tables_contentcell">
									<input type="text" name="r.item14" value="${r.item14}"/>
									</td>
								</tr>
								<tr>
									<td class="tables_contentcell" rowspan="2">
									落实低保
									</td>
									<td class="tables_contentcell">
									户数
									</td>
									<td class="tables_contentcell">
									<input type="text" name="r.item15" value="${r.item15}"/>
									</td>
								</tr>
								<tr>
									<td class="tables_contentcell">
									人数
									</td>
									<td class="tables_contentcell">
									<input type="text" name="r.item16" value="${r.item16}"/>
									</td>
								</tr>
								<tr>
									<td class="tables_contentcell" rowspan="2">
									购买社保
									</td>
									<td class="tables_contentcell">
									户数
									</td>
									<td class="tables_contentcell">
									<input type="text" name="r.item17" value="${r.item17}"/>
									</td>
								</tr>
								<tr>
									<td class="tables_contentcell">
									人数
									</td>
									<td class="tables_contentcell">
									<input type="text" name="r.item18" value="${r.item18}"/>
									</td>
								</tr>
								<tr>
									<td class="tables_contentcell" rowspan="2">
									参加新农合
									</td>
									<td class="tables_contentcell">
									户数
									</td>
									<td class="tables_contentcell">
									<input type="text" name="r.item19" value="${r.item19}"/>
									</td>
								</tr>
								<tr>
									<td class="tables_contentcell">
									人数
									</td>
									<td class="tables_contentcell">
									<input type="text" name="r.item20" value="${r.item20}"/>
									</td>
								</tr>
								<tr>
									<td class="tables_contentcell" rowspan="2">
									帮助就学
									</td>
									<td class="tables_contentcell">
									户数
									</td>
									<td class="tables_contentcell">
									<input type="text" name="r.item21" value="${r.item21}"/>
									</td>
								</tr>
								<tr>
									<td class="tables_contentcell">
									人数
									</td>
									<td class="tables_contentcell">
									<input type="text" name="r.item22" value="${r.item22}"/>
									</td>
								</tr>
								<tr>
									<td class="tables_contentcell" rowspan="2">
									其他
									</td>
									<td class="tables_contentcell">
									户数
									</td>
									<td class="tables_contentcell">
									<input type="text" name="r.item23" value="${r.item23}"/>
									</td>
								</tr>
								<tr>
									<td class="tables_contentcell">
									人数
									</td>
									<td class="tables_contentcell">
									<input type="text" name="r.item24" value="${r.item24}"/>
									</td>
								</tr>
								
								<tr>
									<td class="tables_contentcell" rowspan="2">
									受帮扶低收入户当年增收情况
									</td>
									<td class="tables_contentcell" colspan="2">
									帮扶前人均纯收入（元）
									</td>
									<td class="tables_contentcell">
									<input type="text" name="r.item25" value="${r.item25}"/>
									</td>
								</tr>
								<tr>
									<td class="tables_contentcell" colspan="2">
									帮扶后累计人均增加收入（元）
									</td>
									<td class="tables_contentcell">
									<input type="text" name="r.item26" value="${r.item26}"/>
									</td>
								</tr>
								
								<tr>
									<td class="tables_contentcell" colspan="3">
									备注
									</td>
									<td class="tables_contentcell">
									<input type="text" name="r.item27" value="${r.item27}"/>
									</td>
								</tr>
							</table>							
						</td>
					</tr>
					<tr>
						<td align="center" class="tables_contentcell" colspan="4">&nbsp;
						<input type="button" value="关闭" class="button" name="关闭" onclick="self.close();">
						</td>
					</tr>
				</tbody>
			</table>
		</form>
	</body>
</html>