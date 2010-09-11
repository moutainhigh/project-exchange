$(function(){	
	// Tabs
	$('#tabs').tabs();			
	$('#tabs').tabs('select',parseInt(index) ); 
	loadDatabases();
	//loadTables();	
	showConfigLiList();
});
//1
function loadDatabases(){
	$.getJSON("ajax_loadDatabases.action", {}, function(json){
	  	var list = json['list'];
	  	$('.database').html('<option value=""></option>');
	  	for(var i=0;i<list.length;i++){
	  		$("<option value="+list[i]+">"+list[i]+"</option>").appendTo(".database");
	  	}
	}); 
}
function loadTables(database){
	//alert('database='+database);
	$.getJSON("ajax_loadTables.action", {"database":database}, function(json){
	  	var list = json['list'];
	  	if(list == null)
	  		return false;
	  	$('.table').html('<option value=""></option>');
	  	for(var i=0;i<list.length;i++){
	  		$("<option value="+list[i]+">"+list[i]+"</option>").appendTo(".table");
	  	}
	}); 
}
//2
function showConfigTrList(database,table){
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
			str += '	<td style="border-bottom:1px solid #51AD1A"><select name="mappingClass.propertyList['+i+'].value.type"><option value="">空</option><option value="key">主键</option><option value="parser">parser</option><option value="const">const</option></select></td>';
			str += '	<td style="border-bottom:1px solid #51AD1A">';
			str += '		解析器类型（标签）：<select name="mappingClass.propertyList['+i+'].value.parser.type"><option value=""></option><option value="h1">h1</option><option value="strong">strong</option><option value="td">td</option><option value="img">img</option></select>';
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
	  		str += '<li><a href="xml/'+list[i]+'.xml" target="_blank">'+list[i]+'.xml</a>&nbsp;&nbsp;&nbsp;&nbsp;<input type="submit" value="开始抓取"/></li>';
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