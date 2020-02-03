$(function() {

    var tc = parseInt($('#tc').text()); //수량
	var p = parseInt($('#p').text());   //가격
	$('#totalprice').text(tc*p);  //총액
	$('#ORDER_PRICE').val(tc*p); //총액
	$('#ORDER_AMOUNT').val(tc);
	
	//기본 배송지, 배송지 직접 입력 선택에 따라 order_tbl 에 입력될 주소값이 변경되도록함.
	



	$(document).on('click','#paygo',function(){
		if($('#dft').is(":checked")==true){
		    var postcode = $('#info_postcode1').val();
		    var address = $('#info_address1').val();
		    $('#ORDER_ADDRESS').val(postcode + address);
		} else if ($('#input').is(":checked")==true){		
		var input_postcode = $('#input_postcode').val();
		var input_address = $('#input_address').val();
		$('#ORDER_ADDRESS').val(input_postcode + input_address);
	}
	})
	
	
	$('#input').on('click', function() {
		var dft = $('#dft').prop('checked');
		var input = $(this).prop('checked');
		if (input) {
			$('.put').show();
			$('.default').hide();
		}
	});

	$('#dft').on('click', function() {
		var dft = $('#dft').prop('checked');
		var input = $(this).prop('checked');
		if (input) {
			$('.put').hide();
			$('.default').show();
		}
	});
    
	
	$('#allchk').click(function(){
		var allchk = $('#allchk').is(":checked")
		if(allchk==true) {
		$('#chk1').prop("checked", true)
		$('#chk2').prop("checked", true)
		$('#chk3').prop("checked", true)
		} else {
			$('#chk1').prop("checked", false)
			$('#chk2').prop("checked", false)
			$('#chk3').prop("checked", false)
		}
	})
	
    
   
	
	
	
	
});