$(function(){
	if(leftMenuItemLoc){
		$("#sidebar a").parent().removeClass("current");
		$("#sidebar a[href='"+leftMenuItemLoc+"']").parent().addClass("current");
	}
	if($("#reqMsg").length > 0){
		setTimeout(function(){
			$("#reqMsg").animate(   
	             {   
	                 "opacity": "hide",  
	                 "height":-30,
	                 "marginTop":0,
	                 "marginBottom":0
	             },   
	             500,   
	             function() { $("#reqMsg").hide(); }   
		    ); 
		},10000);
	}
});