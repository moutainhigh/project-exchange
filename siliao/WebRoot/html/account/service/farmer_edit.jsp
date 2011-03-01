<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
	<head>
		<title>${appTitle}</title>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
		<link href="${appPath}html/css/style.css" rel="stylesheet" type="text/css">
		<script src="${appPath}html/script/jquery.js"></script>
		<script src="${appPath}html/script/common.js"></script>
		<script type="text/javascript">
			var currFarmId = '${farmer.id}';
			var currArea = '${farmer.area.id}';
			$(function(){
				$.getJSON("${appPath}ajax/getAllArea?time="+new Date().getTime(), {}, function(json){
					if(json && json['list'] && json['list'].length){
						$('#area').html('');
						for(var i=0;i<json['list'].length;i++){
							var str = '<option value="'+json['list'][i]['id']+'">'+json['list'][i]['name']+'</option>';
							$('#area').append(str);
						}
						if(currArea != ''){
							$('#area').val(currArea);
						}
					}
				});
			});
			function submitFarmer(){
				if($('#farmerName').val() == null || $('#farmerName').val()==''){
					alert('养殖户的姓名不能为空');
					return false;
				}else{
					document.forms[0].submit();
				}
			}
		</script>
	</head>
	<body>
		<div class="page_title">
			饲料管理系统 > 数据设定 > 农户编辑
		</div>
		<jsp:include page="../../../msg.jsp"></jsp:include>
		<br />
		新建养殖户
		<form action="${appPath}data_saveFarmer.htm" method="get">
			<input type="hidden" name="farmer.id" value="${farmer.id}"/>
			<table class="query_form_table">
				<tr>
					<th>
						养殖户姓名
					</th>
					<td>
						<input value="${farmer.name}" name="farmer.name" id="farmerName" />
						<span class="red_star">*</span>
					</td>
					<th>
						所属管区
					</th>
					<td>
						<select id="area" name="farmer.area.id"></select>
					</td>
				</tr>
				<tr>
					<th>
						手机号码
					</th>
					<td>
						<input value="${farmer.tel }" name="farmer.tel" id="tel"/>
						<span class="red_star">(养殖户联系方式)</span>
					</td>
					<th>
						塘口号
					</th>
					<td>
						<input value="${farmer.no }" name="farmer.no" id="farmerNo"/>
					</td>
				</tr>
				<tr>
					<th>
						邮箱地址
					</th>
					<td>
						<input value="${farmer.email}" name="farmer.email" id="email"/>
						<span class="red_star"></span>
					</td>
					<th>
						备注
					</th>
					<td>
						<input value="${farmer.remark}" name="farmer.remark" id="remark" />
					</td>
				</tr>
			</table>
			<br />
			操作记录：
			<table class="data_list_table">
				<tr>
					<th>编号</th>
					<th>操作人</th>
					<th>操作时间</th>
					<th>操作过程</th>
					<th>养殖户姓名</th>
					<th>管区号</th>
					<th>手机号码</th>
					<th>塘口号</th>
					<th>邮箱地址</th>
					<th>备注</th>
				</tr>
				<c:forEach items="${logList}" var="l" varStatus="s">
				<tr>
					<td class="list_data_text">${s.count }</td>
					<td class="list_data_text">${l.byWho.name }</td>
					<td class="list_data_text"><fmt:formatDate value="${l.logTime}" pattern="yyyy-MM-dd"/></td>
					<td class="list_data_text">${l.msg }</td>
					<td class="list_data_text">${l.farmer.name }</td>
					<td class="list_data_text">${l.farmer.area.name }</td>
					<td class="list_data_text">${l.farmer.tel }</td>
					<td class="list_data_text">${l.farmer.no }</td>
					<td class="list_data_text">${l.farmer.tel }</td>
					<td class="list_data_text">${l.farmer.remark }</td>
				</tr>
				</c:forEach>
			</table>
						
			<div class="button_bar">
				<button class="common_button" onclick="back();">
					返回
				</button>
				<button class="common_button" onclick="return submitFarmer();">
					保存
				</button>
			</div>
		</form>
	</body>
</html>
