//member js
Validator = {
	Require : /.+/,
	Email : /^\w+([-+.]\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*$/,
	Phone : /^((\(\d{3}\))|(\d{3}\-))?(\(0\d{2,3}\)|0\d{2,3}-)?[1-9]\d{6,7}$/,
	Phone2 : /^((\(\d{3}\))|(\d{3}\-))?(\(0\d{2,3}\)|0\d{2,3}-)?[1-9]\d{6,7}|((\(\d{3}\))|(\d{3}\-))?13\d{9}$/,
	Mobile : /^((\(\d{3}\))|(\d{3}\-))?1\d{10}$/,
	Url : /^http:\/\/[A-Za-z0-9]+\.[A-Za-z0-9]+[\/=\?%\-&_~`@[\]\':+!]*([^<>\"\"])*$/,
	IdCard : /^\d{15}(\d{2}[A-Za-z0-9])?$/,
	Currency : /^\d+(\.\d+)?$/,
	Number : /^\d+$/,
	Zip : /^[1-9]\d{5}$/,
	QQ : /^[1-9]\d{4,8}$/,
	Integer : /^[-\+]?\d+$/,
	Double : /^[-\+]?\d+(\.\d+)?$/,
	English : /^[A-Za-z]+$/,
	Chinese : /^[\u0391-\uFFE5]+$/
}
function gotoPage(pageIndex, url) {
	if (!pageIndex || pageIndex == '') {
		alert('Please enter page index!');
		return false;
	}
	if (!url) {
		url = self.location.href;
	}
	if (url.indexOf("?") > 0) {
		if (url.indexOf("pageIndex=") > 0) {
			url = url.replace(/pageIndex=\d*/g, '');
			// alert(url);
			url = url.replace(/&{2,}/g, '&');
		}
		url += '&';
	} else {
		url += '?';
	}
	url += "pageIndex=" + pageIndex;
	url = url.replace("#", "");
	// alert(url);
	self.location.href = url;
}