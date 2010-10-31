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