//当前位置
$(function(){
	//城市隐藏层的位置
	$('#city-list').css({'top':$('#changecity').offset()['top'],'left':$('#changecity').offset()['left']});
	//当前的城市
	if(window['currCityPinyin']){
		$('#city-list li.'+window['currCityPinyin']).addClass('current');
	}else{
		$('#city-list li').eq(0).addClass('current');
	}
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

function searchResource(){
   var searchInput=$('#searchInput').val();
   if(searchInput==null||''==searchInput){
   alert("Please enter keyword!");
   return false;
   }
	document.forms['searchForm'].submit();


}
function showCities(){
	$("#city-list").toggle();
}