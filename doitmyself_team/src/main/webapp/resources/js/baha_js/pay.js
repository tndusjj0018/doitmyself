$(function() {

    var tc = parseInt($('#tc').text()); //수량
	var p = parseInt($('#p').text());   //가격
	$('#totalprice').text(tc*p);  //총액
	$('#ORDER_PRICE').val(tc*p); //총액
	$('#ORDER_AMOUNT').val(tc);
	
	
	var postcode = $('#info_postcode1').val();
	var address = $('#info_address1').val();
	$('#ORDER_ADDRESS').val(postcode + address)
	
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
    
	

   
	
	
	
	
});