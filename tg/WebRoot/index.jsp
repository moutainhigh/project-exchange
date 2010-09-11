<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
	<head>
		<base href="<%=basePath%>">

		<title>通用网页数据抓取程序</title>
		<link type="text/css" href="css/ui-lightness/jquery-ui-1.8.4.custom.css" rel="stylesheet" />	
		<script type="text/javascript" src="js/jquery-1.4.2.min.js"></script>
		<script type="text/javascript" src="js/jquery-ui-1.8.4.custom.min.js"></script>
		<style>
			*{margin:0;padding:0;}
			body{ font: 76.5% "Trebuchet MS", sans-serif; margin: 50px;}
		</style>
		<script type="text/javascript">
			var index = '${index}';
			if(index == ''){
				index = 0;
			}
		</script>
		<script type="text/javascript" src="index.js"></script>
	</head>

	<body>
		<div id="tabs" style="margin-top:-40px;">
			<ul>
				<li><br></li><li><a href="#tabs-1">1.动态建表</a></li>
				<li><a href="#tabs-2">2.生成配置文件</a></li>
				<li><a href="#tabs-3">3.抓取数据</a></li>
				<li><a href="#tabs-4">4.数据展示</a></li>
			</ul>
			<div id="tabs-1">
				<div class="ui-widget" style="margin:-20px auto 10px auto;">
					<div class="ui-state-highlight ui-corner-all" style="margin-top: 20px; padding: 0 .7em;"> 
						<p><span class="ui-icon ui-icon-info" style="float: left; margin-right: .3em;"></span>
							如果表格已建立，则请进入下一步
						</p>
					</div>
				</div>
				<form action="db_createTable.action" method="post">
				<table width="96%" border="1">
					<tr>
						<td colspan="2" align="center">
							请选择数据库：<select id="database" name="database" class="database"></select><a href="javascript:loadDatabases();" style="font-size:12px;color: gray;">加载</a>
						</td>
						<td colspan="2" align="center">表名称：<input type="text" name="tableName" /></td>
					</tr>
					<tr>
						<th>字段名称</th>
						<th>数据类型</th>
						<th>长度</th>
						<th>是否为空</th>
					</tr>
					<script type="text/javascript">
					for(var i=0;i<15;i++){
						document.write('<tr>');
						document.write('	<td><input name="fieldList['+i+'].name"/></td>');
						document.write('	<td><select name="fieldList['+i+'].type"><option value="varchar">varchar</option><option value="int">int</option><option value="double">double</option></select></td>');
						document.write('	<td><input name="fieldList['+i+'].length"/></td>');
						document.write('	<td>是<input type="radio" name="fieldList['+i+'].isNullable" value="true"/>&nbsp;否<input type="radio" name="fieldList['+i+'].isNullable" value="false"/></td>');
						document.write('</tr>');
					}
					</script>
					<tr>
						<td colspan="4" align="center">
							<input type="submit" value="创建"/>
						</td>
					</tr>
				</table>
				</form>
			</div>
			<!-- 生成配置文件 -->
			<div id="tabs-2">
				<form action="fetch_generate.htm" method="post">
				<h1>生成配置文件</h1>
				<table border="1" width="96%">
					<tr>
						<td>标识名</td>
						<td><input name="mappingClass.name"/></td>
						<td>站点地址</td>
						<td><input name="mappingClass.url"/></td>
					</tr>
					<tr>
						<td>字符编码</td>
						<td><input name="mappingClass.encode"/></td>
						<td>数据库表</td>
						<td>
						<select name="mappingClass.database" class="database" onchange="loadTables(this.value);" id="configDatabase"></select>
						<select name="mappingClass.table" class="table" onchange="showConfigTrList($('#configDatabase').val(),this.value);"></select>
						</td>
					</tr>
					<tr>
						<td colspan="4">
							<table border="0" width=100%>
								<tr>
									<th>数据库列</th>
									<th>数据类型</th>
									<th>解析方式</th>
									<th width="50%">解析参数</th>
								</tr>
							</table>
							<table id="configTrList" border="0" width=100%>
								<!--<tr>
									<td><input name="mappingClass.propertyList[${status.count-1}].name" value="${map.key}"/></td>
									<td><input name="mappingClass.propertyList[${status.count-1}].type" value="${map.value}"/></td>
									<td><input name="mappingClass.propertyList[${status.count-1}].value.type"/></td>
									<td>
										解析器类型：<input name="mappingClass.propertyList[${status.count-1}].value.parser.type"/>
										<br/>
										匹配正则：<input name="mappingClass.propertyList[${status.count-1}].value.parser.pattern"/>
										<br/>
										排除正则:<input name="mappingClass.propertyList[${status.count-1}].value.parser.exclude"/>
									</td>
								</tr>-->
							</table>
						</td>
					</tr>					
					<tr>
						<td colspan="4" align="center">
							<input type="submit" value="提交"/>
						</td>
					</tr>
				</table>
				</form>
			</div>
			<!-- 抓取数据 -->
			<div id="tabs-3">
				<h1>抓取数据(<a href="javascript:showConfigLiList();" style="font-size:12px;">更新</a>)</h1>
				<ul id="configUl">
					<!--<form action="fetch_fetch.htm" method="post"><input name="mappingClass.name" value="${map.key}" type="hidden"/>
					<li>${map.value}&nbsp;&nbsp;&nbsp;&nbsp;<input type="submit" value="开始抓取"/></li>
					</form>-->
				</ul>
			</div>
			<!-- 展示数据 -->
			<div id="tabs-4">
				<h1>数据展示</h1>
				<table width="96%" border="1">
					<tr>
						<td colspan="4" align="center">
							请选择数据库表：
							<select class="database" onchange="loadTables(this.value);" id="configDatabase2"></select>
							<select class="table" onchange="showTableData($('#configDatabase2').val(),this.value);"></select>
						</td>
					</tr>
					<tr>
						<td colspan="4">
							<table width="100%" id="dataTable" border="1">
								<tr>
									<th>字段名称1</th>
									<th>字段名称2</th>
									<th>字段名称3</th>
									<th>字段名称4</th>
								</tr>
							</table>
						</td>
					</tr>					
				</table>
			</div>
		</div>
	</body>
</html>

