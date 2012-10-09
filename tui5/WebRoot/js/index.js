//index js
$(function(){
	$('#gongzhi .tab_title a').mouseover(function(){
		$('#gongzhi .tab_title a').parent().removeClass('a');
		$(this).parent().addClass('a');
		$('.gongzhi_c').hide();
		$('.gongzhi_c').eq($('#gongzhi .tab_title a').index($(this))).show();
	});
});

$(function(){
	$('.zw_leibie1 h2 > a').mouseover(function(){
		$('.zw_leibie1 h2 > a').removeClass('now_a');
		$(this).addClass('now_a');
		$('.add_ul').hide();
		$('.add_ul:eq(' + $('.zw_leibie1 h2 > a').index(this) + ')').show();
	});
});