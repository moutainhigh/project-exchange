//当前位置
$(function(){
	var loc = self.location.href;
	//alert(loc);
	if(loc.indexOf('/user/publish/')>0){
		$('#pos2').html('信息发布');
	}else if(loc.indexOf('/user/infoList')>0){
		$('#pos2').html('会员中心 >> 信息列表');
	}else if(loc.indexOf('/user/password')>0){
		$('#pos2').html('会员中心 >> 密码修改');
	}else if(loc.indexOf('/info/')>0 && loc.indexOf('htm')<0){
		$('#pos2').html('信息列表');
	}else if(loc.indexOf('/info/')>0 && loc.indexOf('htm')>0){
		$('#pos2').html('信息详情');
	}else if(loc.indexOf('/search')>0){
		$('#pos2').html('信息搜索');
	}
	
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

function showCities(){
	$("#city-list").toggle();
}

