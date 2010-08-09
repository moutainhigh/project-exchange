function newsExchange(tabLi,otherLi,tabId,hideId){
	if($(tabLi).attr('class') == 'current'){
		return false;
	}
	$(tabLi).addClass('current');
	$('#'+otherLi).removeClass('current');
	$('#'+hideId).hide();
	$('#'+tabId).show();
}