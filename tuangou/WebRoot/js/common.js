//当前位置
$(function(){
});


function gotoPage(pageIndex,url){
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
	self.location.href = url;
}

function search(root){
	var catePinyin = $('#catePinyin').val();
	var key = $('#keywords').val();
	if(!key || key==''){
		alert('请输入需要搜索的关键字');
		return false;
	}
	var path = root + '/search/' + key + '/' + catePinyin;
	//alert(path);
	window.location.href = path;
}
