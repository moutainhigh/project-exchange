$(function(){	
	// Tabs
	$('#tabs').tabs();			
	$('#tabs').tabs('select',parseInt(index) ); 
	loadDatabases();
	//loadTables();	
	showConfigLiList();
});
//1
function loadDatabases(currDB){
	$.getJSON("ajax_loadDatabases.action", {}, function(json){
	  	var list = json['list'];
	  	$('.database').html('<option value=""></option>');
	  	for(var i=0;i<list.length;i++){
	  		$("<option value="+list[i]+">"+list[i]+"</option>").appendTo(".database");
	  	}
	  	if(currDB){
	  		$('.database').val(currDB);
	  	}
	}); 
}
function loadTables(database,currTable){
	//alert('database='+database);
	$.getJSON("ajax_loadTables.action", {"database":database}, function(json){
	  	var list = json['list'];
	  	if(list == null)
	  		return false;
	  	$('.table').html('<option value=""></option>');
	  	for(var i=0;i<list.length;i++){
	  		$("<option value="+list[i]+">"+list[i]+"</option>").appendTo(".table");
	  	}
	  	if(currTable){
	  		$('.table').val(currTable);
	  	}
	}); 
}
//2
function showConfigTrList(database,table,propertyList){
	if(table == null || table == ''){
		return false;
	}
	$.getJSON("ajax_loadColumns.action", {"database":database,"table":table}, function(json){
	  	var list = json['fieldList'];
	  	if(list == null)
	  		return false;
	  	$('#configTrList').html('');
	  	for(var i=0;i<list.length;i++){	  		
	  		var str = '';
			str += '<tr>';
			str += '	<td style="border-bottom:1px solid #51AD1A"><input name="mappingClass.propertyList['+i+'].name" value="'+list[i]['name']+'"/></td>';
			str += '	<td style="border-bottom:1px solid #51AD1A"><input name="mappingClass.propertyList['+i+'].type" value="'+list[i]['type']+'"/></td>';
			str += '	<td style="border-bottom:1px solid #51AD1A"><select name="mappingClass.propertyList['+i+'].value.type"><option value="">空</option><option value="key">主键</option><option value="parser">parser</option><option value="const">const</option><option value="date">当前时间</option></select></td>';
			str += '	<td style="border-bottom:1px solid #51AD1A">';
			str += '		解析器类型（标签）：<select name="mappingClass.propertyList['+i+'].value.parser.type"><option value=""></option><option value="h1">h1</option><option value="strong">strong</option><option value="td">td</option><option value="img">img</option><option value="span">span</option></select>';
			str += '		<br/>';
			str += '		解析器标签索引：<input name="mappingClass.propertyList['+i+'].value.parser.index"/>(从0开始)';
			str += '		<br/>';
			str += '		匹配正则：<input name="mappingClass.propertyList['+i+'].value.parser.pattern"/>';
			str += '		<br/>';
			str += '		排除正则:<input name="mappingClass.propertyList['+i+'].value.parser.exclude"/>';
			str += '		<br/>';
			str += '		常量默认值:<input name="mappingClass.propertyList['+i+'].value.data"/>';
			str += '	</td>';
			str += '</tr>';
	  		$(str).appendTo("#configTrList");
	  	}
	  	if(propertyList){
	  		for(var i=0;i<propertyList.length;i++){
	  			//$('*[name="mappingClass.propertyList['+i+'].name"]').val(propertyList[i]['name']);
	  			//$('*[name="mappingClass.propertyList['+i+'].type"]').val(propertyList[i]['type']);
	  			$('*[name="mappingClass.propertyList['+i+'].value.type"]').val(propertyList[i]['value']['type']);
	  			$('*[name="mappingClass.propertyList['+i+'].value.parser.type"]').val(propertyList[i]['value']['parser']['type']);
	  			$('*[name="mappingClass.propertyList['+i+'].value.parser.index"]').val(propertyList[i]['value']['parser']['index']);
	  			$('*[name="mappingClass.propertyList['+i+'].value.parser.pattern"]').val(propertyList[i]['value']['parser']['pattern']);
	  			$('*[name="mappingClass.propertyList['+i+'].value.parser.exclude"]').val(propertyList[i]['value']['parser']['exclude']);
	  			$('*[name="mappingClass.propertyList['+i+'].value.data"]').val(propertyList[i]['value']['data']);
	  		}
	  	}
	}); 
}
//3
function showConfigLiList(){
	$.getJSON("ajax_loadConfigs.action", {}, function(json){
	  	var list = json['list'];
	  	if(list == null)
	  		return false;
	  	$('#configUl').html('');
	  	for(var i=0;i<list.length;i++){	  		
	  		var str = '';
	  		str += '<form action="fetch_fetch.htm" method="post"><input name="mappingClass.name" value="'+list[i]+'" type="hidden"/>';
	  		str += '<li><a href="xml/'+list[i]+'.xml" target="_blank">'+list[i]+'.xml</a><input style="margin:auto 20px;" type="submit" value="开始抓取"/><input style="margin:auto 20px;" type="button" value="修改配置" onclick="config(\''+list[i]+'\')"/></li>';
	  		str += '</form>';					
	  		$(str).appendTo("#configUl");
	  	}
	}); 
}
//4
function showTableData(database,table){
	if(table == null || table == ''){
		return false;
	}
	$.getJSON("ajax_loadTableDataMeta.action", {"database":database,"table":table}, function(json){
	  	var fieldList = json['fieldList'];
	  	if(fieldList == null)
	  		return false;
	  	$('#dataTable').html('');
	  	var str = '<tr>';
	  	for(var i=0;i<fieldList.length;i++){
	  		str += '<th>'+fieldList[i]['name']+'</th>';
	  	}
	  	str += "</tr>";
	  	$(str).appendTo("#dataTable");
	  	$.getJSON("ajax_loadTableData.action", {"database":database,"table":table}, function(json){
		  	var dataList = json['dataList'];
		  	if(dataList == null)
		  		return false;
		  	var str = '';
		  	for(var i=0;i<dataList.length;i++){	  		
		  		str = '<tr>';
		  		for(var j=0;j<dataList[i].length;j++){
		  			str += '<td>'+dataList[i][j]+'</td>';
		  		}
		  		str += '</tr>';
		  		$(str).appendTo("#dataTable");
		  	}
		}); 
	}); 
	
}

function config(name){
	$('#tabs').tabs('select', 1);
	$.getJSON("ajax_loadConfigObj.action", {"configName":name}, function(json){
		  if(json)
		  	fillConfig(json['mappingClass']);
	}); 
}
function fillConfig(config){
  	for(var prop in config){
  		if('database' == prop && config['database']){
  			loadDatabases(config['database']);
  		}else if('table' == prop && config['table'] && config['database']){
  			loadTables(config['database'],config['table']);
  			showConfigTrList(config['database'],config['table'],config['propertyList']);
  		}else{
	  		var inputName = "mappingClass." + prop;
	  		$('*[name="'+inputName+'"]').val(config[prop]);
  		}
  	}
}