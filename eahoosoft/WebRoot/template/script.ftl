	<script type="text/javascript" src="${appPath}jquery.min.js"></script>
	<script type="text/javascript" src="${appPath}banner.js"></script>
	<script type="text/javascript" src="${appPath}win-mac.js"></script>
	<script type="text/javascript">
		var currModule = '${currModule}';
		$(function(){
			if(currModule!='')
				$('#mainNav li a').eq(parseInt(currModule)).addClass('currentLink');
		});
	</script>