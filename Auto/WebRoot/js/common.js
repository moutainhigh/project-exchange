function newsExchange(tabLi,otherLi,tabId,hideId){
	if($(tabLi).attr('class') == 'current'){
		return false;
	}
	$(tabLi).addClass('current');
	$('#'+otherLi).removeClass('current');
	$('#'+hideId).hide();
	$('#'+tabId).show();
}

function formKeyPress(event){
	if(event.keyCode == 13){
		submitForm();
	}else{
		return false;
	}
}

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


