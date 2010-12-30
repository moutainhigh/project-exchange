//用户中心
$(function(){
	//左边菜单
	$('.manager-l li').each(function(index){
		if($('#oldpassword').length>0 && index==3){
			$(this).addClass('manager-hover');
			$(this).find('a').css('color','white');
		}else if($('#info_table').length>0 && index==1){
			$(this).addClass('manager-hover');
			$(this).find('a').css('color','white');
		}else if($('#tel').length>0 && index==2){
			$(this).addClass('manager-hover');
			$(this).find('a').css('color','white');
		}else if($('#finance').length>0 && index==4){
			$(this).addClass('manager-hover');
			$(this).find('a').css('color','white');
		}
	});
});

