		<script>
			String.prototype.replaceAll = function(reallyDo, replaceWith, ignoreCase) {  
				if (!RegExp.prototype.isPrototypeOf(reallyDo)) {  
			        return this.replace(new RegExp(reallyDo, (ignoreCase ? "gi": "g")), replaceWith);  
			    } else {  
			        return this.replace(reallyDo, replaceWith);  
			    }  
			}
			$(function(){
				var key = '${key}';
				if(key != ''){
					//red
					$(".td_1").each(function(){
						var html = $(this).html();
						if(html.indexOf(key) > -1){
							html = html.replaceAll(key,"<font color='red'>"+key+"</font>");
							$(this).html(html);
						}
					});
					//selected
					var locHref = self.location.href;
					locHref = locHref.substring(locHref.indexOf('com'));
					if(locHref.indexOf('jianzhi') > 0){
						$('#search_type').html('兼职');
					}else if(locHref.indexOf('job') > 0){
						$('#search_type').html('全职');
					}else if(locHref.indexOf('rencai') > 0){
						$('#search_type').html('求职');
					}else if(locHref.indexOf('resume') > 0){
						$('#search_type').html('简历');
					}
				}
			});
		</script>