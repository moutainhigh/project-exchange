	<script type="text/javascript" src="${appPath}jquery.min.js"></script>
	<script type="text/javascript" src="${appPath}banner.js"></script>
	<script type="text/javascript" src="${appPath}win-mac.js"></script>
	<script type="text/javascript">
		var currModule = '${currModule?default("")}';
		$(function(){
			if(currModule!='')
				$('#mainNav li a').eq(parseInt(currModule)).addClass('currentLink');
		});
		var currCate = '${currCate?default("")}';
		$(function(){
			if(currCate!='')
				$('#subNavMenu li').eq(parseInt(currCate)).addClass('currentLink');
		});
	</script>
	<script type="text/javascript">	
		var _gaq = _gaq || [];
		_gaq.push(['_setAccount', 'UA-17058425-1']);
		_gaq.push(['_trackPageview']);
		(function() {
			var ga = document.createElement('script'); ga.type = 'text/javascript'; ga.async = true;
			ga.src = ('https:' == document.location.protocol ? ' https://ssl' : ' http://www') + '.google-analytics.com/ga.js';
			var s = document.getElementsByTagName('script')[0]; s.parentNode.insertBefore(ga, s);
		})();	
	</script>
