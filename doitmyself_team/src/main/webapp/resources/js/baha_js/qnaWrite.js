$(function(){
		//비밀글 체크 여부. 체크하면 1, 아니면 0
	$('#secretCHK').change(function(){
		var chk = $('#secretCHK').is(":checked");
		var no = 0;
		var yes = 1;
		if(chk==true){
			$('#secretCHK').val(yes); 
		} else {
			$('#secretCHK').val(no); 
		}
	});

	//선택된 radio 의 value 값 보내기 (input type='hidden' 이용)
	$('input:radio[name="categories"]').click(function(){
		var selected = $('input:radio[name="categories"]:checked').val();
		$('#category').val(selected);
		
	})

		
		
	
	
	
})