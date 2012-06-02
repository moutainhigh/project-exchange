           	$(function(){
            		$('#a_hover_ul a').click(function(){
            			$('#search_type').html($(this).html());
            			$('#a_hover_ul').hide();
            		});
            	});
            	function doSearch(){
            		var key = $('#s_key').val();
            		if(key==null || key==''){
            			alert('请输入想要搜索的关键词');
            			return false;
            		}
            		var searchType = '/s/';
            		var search_type = $('#search_type').html();
            		if(search_type == '兼职')
            			searchType = '/sk0/';
            		else if(search_type == '全职')
            			searchType = '/sk2/';
            		else if(search_type == '求职')
            			searchType = '/sk1/';
            		else if(search_type == '简历')
            			searchType = '/sk3/';
            		self.location.href = encodeURI(searchType + key);
            	}
            	function doLocSearch(search_type){
            		$('#s_key').val($('#loc_key').val());            		
            		$('#search_type').html(search_type);
            		doSearch();
            	}
            	
            	
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
				if($('.filter_city a').length > 17){
					$('.filter_city a').slice(17).hide();
					$('.filter_city').append('<a href="javascript:void(0);" onclick="$(\'.filter_city a\').show();$(this).hide()">更多..</a>');
				}
				
				
			});
		
			
			
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
					}else if(locHref.indexOf('job') > 0||locHref.indexOf('zp') > 0){
						$('#search_type').html('全职');
					}else if(locHref.indexOf('rencai') > 0||locHref.indexOf('rc') > 0){
						$('#search_type').html('求职');
					}else if(locHref.indexOf('resume') > 0||locHref.indexOf('rs') > 0){
						$('#search_type').html('简历');
					}
				}
			});
            	