$(function(){
	//alert("asdf");
	var navArr = [
		{name:"网站首页",url:"index.html"},
		{name:"家族ID",url:"family.html"},
		{name:"散人ID",url:"divide.html"},
		{name:"加速器下载",url:"download.html"},
		{name:"特惠活动",url:"activity.html"},
		{name:"特殊符号",url:"charactor.html"},
		{name:"宣传图片",url:"pic.html"},
		{name:"广告联系",url:"ad.html"}
	];
	var loc = location.href;
	var currUrl = loc.substr(loc.lastIndexOf("/")+1);
	//alert(currUrl);
	if(currUrl != ''){
		for(var i=0;i<navArr.length;i++){
			if(currUrl==navArr[i]['url']){
				//alert(i);
				$("#navTable td:nth-child("+(i+1)+") a").css({ "color": "#FDAC39" }); 
			}
		}
	}
});