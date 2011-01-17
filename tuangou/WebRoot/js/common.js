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

function showTargetInfo(li){
		
		if(li.id=='saituanba'){
		li.className="current";
		document.getElementById('zhuanrang').className="";	
		
		var div1=document.getElementById('saituandiv');
		div1.style.display="";
		document.getElementById('zhuanrangdiv').style.display="none";
		}
		if(li.id=='zhuanrang'){
		
		li.className="current";
		document.getElementById('saituanba').className="";
		var div1=document.getElementById('zhuanrangdiv');
		div1.style.display="";
		document.getElementById('saituandiv').style.display="none";
		
		}

}	
function showTargetInfoForSaleAndClick(li){
		
		if(li.id=='clickrank'){
		li.className="current";
		document.getElementById('salerank').className="";	
		
		var div1=document.getElementById('clickrankdiv');
		div1.style.display="";
		document.getElementById('salerankdiv').style.display="none";
		}
		if(li.id=='salerank'){
		
		li.className="current";
		document.getElementById('clickrank').className="";
		var div1=document.getElementById('salerankdiv');
		div1.style.display="";
		document.getElementById('clickrankdiv').style.display="none";
		
		}

}	

function showTargetInfoForComment(li){
		
		if(li.id=='teamcomment'){
		li.className="current";
		document.getElementById('sitecomment').className="";	
		
		var div1=document.getElementById('teamcommentdiv');
		div1.style.display="";
		document.getElementById('sitecommentdiv').style.display="none";
		}
		if(li.id=='sitecomment'){
		
		li.className="current";
		document.getElementById('teamcomment').className="";
		var div1=document.getElementById('sitecommentdiv');
		div1.style.display="";
		document.getElementById('teamcommentdiv').style.display="none";
		
		}

}	
