function reload(){
	window.location.reload();
}
function help(msg){
	//alert('欢迎使用'+msg);
}

function to(url){
	self.location.href=url;
}
function back(){
	history.go(-1);
}
function save(url){
	
}
function add(url){
	alert('新建成功！');
	to(url);
}
function del(msg){
	if (window.confirm("确认删除"+msg+"？")){
		reload();
	}
}
function setCurTime(oid){
	var now=new Date();
	var year=now.getYear();
	var month=now.getMonth();
	var day=now.getDate();
	var hours=now.getHours();
	var minutes=now.getMinutes();
	var seconds=now.getSeconds();
	var timeString = year+"-"+month+"-"+day+" "+hours+":"+minutes+":"+seconds;
	var oCtl = document.getElementById(oid);
	oCtl.value = timeString;
}


function gotoPage(pageIndex,pageSize,url){
	if(!pageIndex || pageIndex==''){
		alert('Please enter page index!');
		return false;
	}
	if(!url){
		url = self.location.href;
	}
	if(url.indexOf("?") > 0){
		if(url.indexOf("pageIndex=") > 0){
			url = url.replace(/pageIndex=\d*/g,'');
			//alert(url);
			url = url.replace(/&{2,}/g,'&');
		}
		url += '&';
	}else{
		url += '?';
	}
	url += "pageIndex=" + pageIndex;
	
	
	
	if(url.indexOf("?") > 0){
		if(url.indexOf("pageSize=") > 0){
			url = url.replace(/pageSize=\d*/g,'');
			//alert(url);
			url = url.replace(/&{2,}/g,'&');
		}
		url += '&';
	}else{
		url += '?';
	}
	url += "pageSize=" + pageSize;
	
	
	//alert(url);
	self.location.href = url;
}

var queryBtn = null;

//让消息框慢慢消退
$(function(){
	$('#reqMsg').fadeOut(5000); 
	//让所有的导出Excel按钮都小一点
	$('button').each(function(){
		//alert($(this).text().indexOf('xcel'));
		if($(this).text().indexOf('xcel') > -1){
			$(this).css({'padding':'0'});
		}
		//做enter查询功能
		if($(this).text().indexOf('查询') > -1){
			queryBtn = this;
			$('*').keypress(function(e){
				if (e.keyCode == 13) {
					//alert('xxxxx'+$(queryBtn).html());
					$(queryBtn).click();
				}			
			});
		} 
	});
	
});