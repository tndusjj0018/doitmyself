$(function() {
	//가격, 세 자리 수 마다 콤마
	function com(str) {
	 str = String(str);
	 return str.replace(/(\d)(?=(?:\d{3})+(?!\d))/g, '$1,');
	 }
   		
	var tc = parseInt($('#tc').text()); //수량
	var p = parseInt($('#p').text());   //가격
	tempC = tc*p;
	$('#p').text(com(p));
	$('#totalprice').text(com(tempC));  //총액
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
	
	//주소를 직접입력할 시, 주소찾기 클릭하면 다음 API 사용
	$('#Postcode').click(function(){
		 $('#input_postcode').val('');
		 $('#input_address').val('');
    new daum.Postcode({
        oncomplete: function(data) {
        	// 도로명 주소의 노출 규칙에 따라 주소를 조합한다.
            // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
            var fullRoadAddr = data.roadAddress; // 도로명 주소 변수
            var extraRoadAddr = ''; // 도로명 조합형 주소 변수

            // 법정동명이 있을 경우 추가한다. (법정리는 제외)
            // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
            if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                extraRoadAddr += data.bname;
            }
            // 건물명이 있고, 공동주택일 경우 추가한다.
            if(data.buildingName !== '' && data.apartment === 'Y'){
               extraRoadAddr += (extraRoadAddr !== '' ? ', ' + data.buildingName : data.buildingName);
            }
            // 도로명, 지번 조합형 주소가 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
            if(extraRoadAddr !== ''){
                extraRoadAddr = ' (' + extraRoadAddr + ')';
            }
            // 도로명, 지번 주소의 유무에 따라 해당 조합형 주소를 추가한다.
            if(fullRoadAddr !== ''){
                fullRoadAddr += extraRoadAddr;
            }

            
            // 우편번호와 주소 정보를 해당 필드에 넣는다.
            $('#input_postcode').val(data.zonecode)
            $('#input_address').val(fullRoadAddr)

        }
    }).open();

	})
	
	
	
	
});