var typeDataArr = new Array();
typeDataArr[0] = ["recent","#FFFF00","#FFCCFF",true];
typeDataArr[1] = ["allday","#FFFFFF","#FFCCFF",false];
typeDataArr[2] = ["before","#F4F8B1","#FF9933",false];
typeDataArr[3] = ["after","#FFFFFF","#FFCCFF",false];
typeDataArr[4] = ["tx","#FFFF00","#FFCCFF",false];

$(function(){
	//if(1 == 1)
	//	return false;	
	var now = new Date();
	var h = now.getHours();
	if(h >= 0 && h <7){//night
		typeDataArr[0][0] = 'tx';
		typeDataArr[1][0] = 'allday';
		typeDataArr[2][0] = 'after';
		typeDataArr.length = 3;
		initTable(0);
	}else{//day
		initTable(0);
	}  	
	window['timer'] = window.setInterval('reload()',1000*60*10);
	window.status = "本页面10分钟自动刷新一次";
});

function reload(){
	//alert('we');
	window.location.reload();
}

function initTable(index){
	if(index < 0 || index >= typeDataArr.length)
		return false;
	var currType = typeDataArr[index];
	//$.get("json", { type: currType[0], time: new Date().getTime() }, function(data){
	$.get("json/"+currType[0]+".txt", { type: currType[0], time: new Date().getTime() }, function(data){
    	//alert("Data Loaded: [" + data + "]");
    	if(data == ''){
			if(++index > 0 && index < typeDataArr.length){
				initTable(index);
				return false;
			}
    	}
    	var json = eval('('+data+')');
  		//alert(json.length);
  		//if(json == null || json.length == 0)
  		//	return false;
  		if(json != null && json.length >0 && typeDataArr[index][3]){
  			var arr = new Array(json.length);
  			var len = json.length;
  			for(var j=0;j<len;++j){
  				var rNum = 0;
  				while(true){
  					rNum = parseInt(Math.random() * len);
  					if(arr[rNum]){
  						continue;
  					}else{
  						arr[rNum] = json[j];
  						break;
  					}
  				}
  			}
  			json = arr;
  		}
		var str = '';  	
		for(var i=0;i<json.length;++i){
			var info = json[i];
			str += ('<tr style="background-color:'+currType[1]+'" onmouseover="this.style.backgroundColor=\''+currType[2]+'\';" onmouseout="this.style.backgroundColor=\''+currType[1]+'\';">');
			str +=('  <td width="107"><a href="'+info.website+'" target="_blank">'+info.serverName+'</a></td>');
			str +=('  <td width="117"><a href="'+info.website+'" target="_blank">'+info.serverIP+'</a></td>');
			str +=('  <td width="150" style="color:red;">'+info.timeText+'</td>');
			str +=('  <td width="90">'+info.areaLine+' </td>');
			str +=('  <td width="330"><div>'+info.versionDesc+'<font color="red">推荐</font></div></td>');
			str +=('  <td width="138">'+info.serviceQQ+'</td>');
			str +=('  <td width="69"><a href="'+info.website+'" target="_blank">[点击查看]</a></td>');
			str +=('</tr>');			
		}
		//str += '</table>';  	
		//$("#dataTable").html($("#dataTable").html()+str);
		$("#dataTable").append(str);
		index++;
		if(index > 0 && index < typeDataArr.length){
			initTable(index);
		}		
	}); 
}