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
		function chooseType(type){
			if('year' == type){
				$('#time').attr('disabled',true);
			}else if('season' == type){
				$('#time').attr('disabled',false);
				var str = '';
				for(var i=1;i<=4;i++){
					str += '<option value="'+i+'">第'+i+'季度</option>';
				}
				$('#time').html(str);
			}else if('month' == type){
				$('#time').attr('disabled',false);
				var str = '';
				for(var i=1;i<=12;i++){
					str += '<option value="'+i+'">第'+i+'月</option>';
				}
				$('#time').html(str);
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
		<form method="get" action="${appPath}report_saveReport2.action" name="searchForm">
			<table width="100%" cellspacing="0" cellpadding="0" border="0" class="tables_search">
				<tbody>
					<tr>
						<td>
							您当前所处页面：报表维护&gt;&gt;工作落实情况统计表
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
							<select name="year" id="year">
								<option value=""></option>
								<option value="2011">2011</option>
								<option value="2012">2012</option>
							</select>
						</td>
						<td width="" class="tables_headercell">
							类型：
							<select name="type" id="reportType" onchange="chooseType(this.value);">
								<option value=""></option>
								<option value="year">年度报表</option>
								<option value="season">季度报表</option>
								<option value="month">月度报表</option>
							</select>
						</td>
						<td width="" class="tables_headercell">
							时间：
							<select name="time" id="time">
								<option value=""></option>
							</select>
						</td>
					</tr>
					<tr>
						<td class="tables_contentcell" colspan="3" align="center">
							<table id="data_table" cellspacing="0" cellpadding="0" border="0" class="tables_table" style="margin: 5px 10px;width:85%;" align="center">
								<tr>
									<td align="center" class="tables_headercell" colspan="4">帮扶资金</td>
								</tr>
								<tr>
									<td class="tables_contentcell" colspan="3">
									帮扶单位
									</td>
									<td class="tables_contentcell" width="50%">
									<input type="text"/>
									</td>
								</tr>
								<tr>
									<td class="tables_contentcell" colspan="3">
									贫困村
									</td>
									<td class="tables_contentcell">
									<input type="text"/>
									</td>
								</tr>
								<tr>
									<td class="tables_contentcell" rowspan="9">
									4
									</td>
									<td class="tables_contentcell" colspan="2">
									规划投入资金（元）
									</td>
									<td class="tables_contentcell">
									<input type="text"/>
									</td>
								</tr>
								<tr>
									<td class="tables_contentcell" colspan="2">
									已投入帮扶资金
									</td>
									<td class="tables_contentcell">
									<input type="text"/>
									</td>
								</tr>
								<tr>
									<td class="tables_contentcell" rowspan="2">
									已投入帮扶资金（元）
									</td>
									<td class="tables_contentcell">
									用于帮扶到户资金(元)
									</td>
									<td class="tables_contentcell">
									<input type="text"/>
									</td>
								</tr>
								<tr>
									<td class="tables_contentcell">
									用于帮扶到村资金(元)
									</td>
									<td class="tables_contentcell">
									<input type="text"/>
									</td>
								</tr>
								<tr>
									<td class="tables_contentcell" rowspan="5">
									已投入帮扶资金构成
									</td>
									<td class="tables_contentcell">
									财政专项(元)
									</td>
									<td class="tables_contentcell">
									<input type="text"/>
									</td>
								</tr>
								<tr>
									<td class="tables_contentcell">
									信贷资金(元)
									</td>
									<td class="tables_contentcell">
									<input type="text"/>
									</td>
								</tr>
								<tr>
									<td class="tables_contentcell">
									单位自筹(元)
									</td>
									<td class="tables_contentcell">
									<input type="text"/>
									</td>
								</tr>
								<tr>
									<td class="tables_contentcell">
									社会募捐（元）
									</td>
									<td class="tables_contentcell">
									<input type="text"/>
									</td>
								</tr>
								<tr>
									<td class="tables_contentcell">
									社会引资（元）
									</td>
									<td class="tables_contentcell">
									<input type="text"/>
									</td>
								</tr>
								<tr>
									<td class="tables_contentcell" colspan="4" style="color:gray;text-align: left;padding-left:30px;">
									注意：
									<br/>
									1.规划投入资金指已列入帮扶规划中的全部资金。
									<br/>
									2.已投入帮扶资金指已使用的帮扶资金。
									<br/>
									3.已投入帮扶资金= 用于帮扶到户资金 + 用于帮扶到村资金
									<br/>
									4.已投入帮扶资金= 财政专项 + 信贷资金 + 单位自筹 + 社会募捐 + 社会引资
									 <br/>
									5.社会引资包括内引和外引。内引指国内引资；外引指国外及港澳台引资。引进外资按人民币汇率折算。
									</td>
								</tr>								
							</table>							
						</td>
					</tr>
					<tr>
						<td align="center" class="tables_contentcell" colspan="3">
						<input type="submit" value="保存" class="button" name="保存">
						</td>
					</tr>
				</tbody>
			</table>
		</form>
	</body>
</html>