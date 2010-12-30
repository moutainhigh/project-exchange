//当前位置
$(function(){
	var endTime = $('#endTime').val();
	if(endTime){
		var now = new Date().getTime();
		if(now > endTime){
			$('#info_email').html('');
			$('#info_tel').html('');
			$('#info_qq').html('');
		}
	}
});

