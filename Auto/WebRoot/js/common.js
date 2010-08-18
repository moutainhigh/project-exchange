function newsExchange(tabLi,otherLi,tabId,hideId){
	if($(tabLi).attr('class') == 'current'){
		return false;
	}
	$(tabLi).addClass('current');
	$('#'+otherLi).removeClass('current');
	$('#'+hideId).hide();
	$('#'+tabId).show();
}
$(function(){
	$('input').css('border','1px solid #3A6EA5');
	$('input').focus(function(){
		$(this).css('border','1px solid #9D2703');
	});
	$('input').blur(function(){
		$(this).css('border','1px solid #3A6EA5');
	});
	$('textarea').css('border','1px solid #3A6EA5');
	$('textarea').focus(function(){
		$(this).css('border','1px solid #9D2703');
	});
	$('textarea').blur(function(){
		$(this).css('border','1px solid #3A6EA5');
	});
});

function gotoPage(pageIndex,url){
	if(!url){
		url = self.location.href;
	}
	if(url.indexOf("?") > 0){
		if(url.indexOf("page=") > 0){
			url = url.replace(/page=\d*/g,'');
			//alert(url);
			url = url.replace(/&{2,}/g,'&');
		}
		url += '&';
	}else{
		url += '?';
	}
	url += "page=" + pageIndex;
	self.location.href = url;
}

function checkAll(){
	if($('input[type="checkbox"]:first').attr('checked')){
		$('input[type="checkbox"]').attr('checked',false);
	}else{
		$('input[type="checkbox"]').attr('checked',true);
	}	
}
