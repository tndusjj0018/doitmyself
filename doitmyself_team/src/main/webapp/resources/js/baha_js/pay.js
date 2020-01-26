
	
$('#input').click(function(){
	alert('?')
	var c = $(this).prop('checked');	
	if(c) {
	   $('.put').css("display","block");
	   $('.default').css("display","none");
	}
});
		
	
