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
	}else if(loc.indexOf('/info/list')>0){
		$('#pos2').html('信息列表');
	}else if(loc.indexOf('/info/page')>0){
		$('#pos2').html('信息详情');
	}
});

