$(function(){
	
});

function isAll(){
	if($('#city').parent().find('input[type="checkbox"]').attr('checked')){
		$('#city').val('全国');
		$('#city').attr('readonly',true);
	}else{
		$('#city').val('');
		$('#city').attr('readonly',false);
	}
}