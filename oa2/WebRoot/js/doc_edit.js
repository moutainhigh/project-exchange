$(function(){
	$('select').each(function(){		
		if($(this).attr('id')){
			var dropdownType = $(this).attr('id');
			var thisSelect = this;
			$(this).html('<option value=""></option>');
			$.getJSON("../ajax", {dropdownType:dropdownType}, function(json){
				if(json && json.length){
					for(var i=0;i<json.length;i++){
						var str = '<option value="'+json[i]['id']+'">'+json[i]['name']+'</option>';
						$(thisSelect).append(str);
					}
				}
			}); 	
		}	
	}); 	
});