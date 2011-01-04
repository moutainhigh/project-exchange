$(function(){
	
});

function isAll(){
	if($('#city').parent().find('input[type="checkbox"]').attr('checked')){
		$('#city').val('');
		$('#city').attr('readonly',true);
	}else{
		$('#city').attr('readonly',false);
	}
}