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
		var year = '${year}';
		var type = '${r.type}';
		var time = '${month}';
		var lock = '${r.lock}';
		var maxYear = '${maxYear}';
		var maxMonth = '${maxMonth}';
		var maxSeason = '${maxSeason}';
		var now = new Date();
		var currYear = now.getYear()<1970?now.getYear() + 1900:now.getYear();
		maxYear = maxYear==''?currYear:parseInt(maxYear);
		maxMonth = maxMonth==''?12:parseInt(maxMonth);
		maxSeason = maxSeason==''?4:parseInt(maxSeason);
		$(function(){
			for(var i=2011;i<=maxYear;i++){
				$("#year").append('<option value="'+ i +'">'+ i +'</option>');
			}
			if(year != ''){
				setTimeout(function(){ 
				    $('#year').val(year);
				},1);
			}
			chooseType();
			//加锁，禁止修改
			if(lock == '1' || lock == '2' || type=='year' || type=='season'){
				$('input[type="text"]').not('.cun_remark').attr("readonly",true);
				$('.yesno').attr("disabled",true);
			}	
			//自动地区数据灰化
			$('.auto_readonly').css('background','#EBEBE4');
		});
		function chooseType(){
			//2011年，去掉月度报表的第1 -7月，8月份之后的月份正常显示。
			$('#time').attr('disabled',false);
			var str = '';
			var ms = maxMonth;
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
		function query(){
			var f = document.forms[0];
			f.action = '${appPath}report_sumReport1.action';
			f.submit();
		}
		
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
			<input type="hidden" name="r.id" id="rId"/>
			<table width="100%" cellspacing="0" cellpadding="0" border="0" class="tables_search">
				<tbody>
					<tr>
						<td>
							您当前所处页面："结对帮扶低收入户"工作落实情况统计表 - 汇总
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
						<td width="" class="tables_headercell">
							年度：
							<select name="year" id="year" onchange="chooseType();" style="width: 60px;">
								<option value=""></option>
							</select>
						</td>
						<td width="" class="tables_headercell">
							时间：
							<select name="month" id="time">
								<option value=""></option>
							</select>
						</td>
						<td width="" class="tables_headercell">
							<span class="STYLE1">镇：</span>
			 			<select id="zhenId" name="zhenId" onchange="selectZhen(this.value);">
									<option value="">----------</option>
								 </select>
						<span class="STYLE1">&nbsp;村：</span>
						<select id="cunId2" name="cunId">
									<option value="">-----------</option>
									</select>
						</td>
						<td width="" class="tables_headercell">
							<input type="button" value="按条件查询" class="button" name="查询" onclick="query();">
						</td>
					</tr>
					<tr>
						<td class="tables_contentcell" colspan="4" align="center">
							<table id="data_table" cellspacing="0" cellpadding="0" border="0" class="tables_table" style="margin: 5px 10px;width:95%;" align="center">
								<tr>
									<td align="center" class="tables_headercell" rowspan="2">序号</td>
									<td align="center" class="tables_headercell" rowspan="2">镇</td>
									<td align="center" class="tables_headercell" rowspan="2">村</td>
									<td align="center" class="tables_headercell" colspan="3">受帮扶低收入户情况</td>
									<td align="center" class="tables_headercell" rowspan="2">累计投入帮扶资金</td>
									<td align="center" class="tables_headercell" colspan="2">到户情况</td>
									<td align="center" class="tables_headercell" colspan="12">帮扶成效</td>
									<td align="center" class="tables_headercell" colspan="2">受帮扶低收入户当年增收情况</td>
								</tr>
								<tr>
									<td align="center" class="tables_headercell">户数</td>
									<td align="center" class="tables_headercell">人数</td>
									<td align="center" class="tables_headercell">有劳动能力人数 </td>
									<td align="center" class="tables_headercell">帮扶单位领导到村次数  </td>
									<td align="center" class="tables_headercell">帮扶单位结对干部到户次数  </td>
									<td align="center" class="tables_headercell">安排就业 (户数)</td>
									<td align="center" class="tables_headercell">安排就业 (人数)</td>
									<td align="center" class="tables_headercell">落实低保  (户数)</td>
									<td align="center" class="tables_headercell">落实低保 (人数)</td>
									<td align="center" class="tables_headercell">购买社保  (户数)</td>
									<td align="center" class="tables_headercell">购买社保  (人数)</td>
									<td align="center" class="tables_headercell">参加新农合  (户数)</td>
									<td align="center" class="tables_headercell">参加新农合  (人数)</td>
									<td align="center" class="tables_headercell">帮助就学  (户数)</td>
									<td align="center" class="tables_headercell">帮助就学  (人数)</td>
									<td align="center" class="tables_headercell">其他  (户数)</td>
									<td align="center" class="tables_headercell">其他  (人数)</td>
									<td align="center" class="tables_headercell">帮扶前人均纯收入（元） </td>
									<td align="center" class="tables_headercell">帮扶后累计人均增加收入（元）  </td>
								</tr>
								<c:forEach items="${report1List }" var="r" varStatus="status">
								<tr>
									<td class="tables_contentcell">
									${status.count }
									</td>
									<td class="tables_contentcell">
									${r.cun.zhen.name }
									</td>
									<td class="tables_contentcell">
									${r.cun.name }
									</td>
									<td class="tables_contentcell">
									${r.item1 }
									</td>
									<td class="tables_contentcell">
									${r.item2 }
									</td>
									<td class="tables_contentcell">
									${r.item3 }
									</td>
									<td class="tables_contentcell">
									${r.item10 }
									</td>
									<td class="tables_contentcell">
									${r.item11 }
									</td>
									<td class="tables_contentcell">
									${r.item12 }
									</td>
									<td class="tables_contentcell">
									${r.item13 }
									</td>
									<td class="tables_contentcell">
									${r.item14 }
									</td>
									<td class="tables_contentcell">
									${r.item15 }
									</td>
									<td class="tables_contentcell">
									${r.item16 }
									</td>
									<td class="tables_contentcell">
									${r.item17 }
									</td>
									<td class="tables_contentcell">
									${r.item18 }
									</td>
									<td class="tables_contentcell">
									${r.item19 }
									</td>
									<td class="tables_contentcell">
									${r.item20 }
									</td>
									<td class="tables_contentcell">
									${r.item21 }
									</td>
									<td class="tables_contentcell">
									${r.item22 }
									</td>
									<td class="tables_contentcell">
									${r.item23 }
									</td>
									<td class="tables_contentcell">
									${r.item24 }
									</td>
									<td class="tables_contentcell">
									${r.item25 }
									</td>
									<td class="tables_contentcell">
									${r.item26 }
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
									&nbsp;
									</td>
									<c:forEach items="${heji }" var="i">
									<td class="tables_contentcell">
									${i}
									</td>
									</c:forEach>
								</tr>
							</table>
						</td>
					</tr>
				</tbody>
			</table>
		</form>
	</body>
</html>