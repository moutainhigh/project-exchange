		<script>
			//focus nav button
			$(function(){
				var locHref = location.href;
				$('.nav_botttom a:gt(0)').each(function(){
					var linkHref = $(this).attr('href');
					if(locHref.indexOf(linkHref) > 0){
						$(this).addClass('now_a');
					}
				});	
			});
			//hide area list
			$(function(){
				if($('#areaP a').length <= 1){
					$('#areaP').hide();
				}
				if($('#areaP a').length > 16){
					$('#areaP a').slice(16).hide();
					$('#areaP').append('<a href="javascript:void(0);" onclick="$(\'#areaP a\').show();$(this).hide()">更多..</a>');
				}
				if($('.type_list a').length > 5){
					$('.type_list a').slice(5).hide();
					$('.type_list p').append('<a href="javascript:void(0);" onclick="$(\'.type_list a\').show();$(this).hide()">更多..</a>');
				}
				if($('.brother_city_list a').length > 12){
					$('.brother_city_list a').slice(12).hide();
					$('.brother_city_list p').append('<a href="javascript:void(0);" onclick="$(\'.brother_city_list a\').show();$(this).hide()">更多..</a>');
				}
			});
		</script>