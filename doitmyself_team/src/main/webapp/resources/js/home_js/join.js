$(document).ready(function(){
	
	var checkid = false;
	var checkpass = false;
	var checkemail = false;
	var checkbirth = false;
	var checkphone = false;
		
	$('form').submit(function(){
		
		//아이디 체크
		if(!checkid) {
			alert ('사용 가능한 아이디를 입력하세요.');
			$('input:eq(0)').val('').focus();
			$('#message').text('');
			return false;
		}

		if(!checkpass) {
			alert ('사용 가능한 비밀번호를 입력하세요.');
			$('input:eq(2)').val('').focus();
			$('input:eq(2)').text('');
			return false;
		}
		
		//폰 넘버 체크
		if(!$.isNumeric($("input[name=USER_PHONE]").val())) {
			alert('핸드폰 번호는 숫자만 입력하세요.');
			$("input[name='USER_PHONE']").val('');
			$("input[name='USER_PHONE']").focus();
			return false;
		}

		if(!checkbirth) {  //패턴 사용해도 됨
			alert('생일은 숫자만 입력하세요.');
			$("input[name='age']").val('');
			$("input[name='age']").focus();
			return false;
		}
		
		if(!checkemail) {
			alert('이메일 형식을 확인하세요.');
			$('input:eq(7)').val('').focus();
			return false;
		}
		
		if($(':radio[name="USER_GENDER"]:checked').length < 1){
		    alert('성별을 선택해주세요.');
		    return false;
		}
	});
	
	$('input:eq(0)').on('keyup', function(){
		
		//처음에 pattern에 적합하지 않은 경우 메시지 출력 후 적합한 데이터 입력해도 계속 같은 데이터 출력하므로,
		//이벤트 시작할 때마다 비워둡니다.
		$('#message').empty();
		
		// \w => [A-Za-z0-9_]
		var pattern = /^\w{5,15}$/;
		var USER_ID = $('input:eq(0)').val();
		
		if(!pattern.test(USER_ID)) {
			$('#message').css('color', 'red');
			$('#message').html(" ! 5~15자 사이로 입력하세요.");
			$('i:eq(0)').css('opacity', '0');
			if(('i:eq(0).val()') == ''){
				$('#message').html("");
			}
			return;
		}
		
		$.ajax({
			url:"idcheck",
			data:{"USER_ID" : USER_ID},
			success: function(resp) {
				if(resp == -1) {
					$('i:eq(0)').css('opacity', '0.95');			
					checkid = true;
				} else {
					$('i:eq(0)').css('opacity', '0');
					checkid = false;
				}
			}
		});
	});
	
	$('input:eq(7)').on('keyup', function(){
		
		$('#email_message').empty();
		
		var pattern = /^\w+@\w+[.]\w{3}$/;  //+의 의미는 무조건 글자 한개 이상 필요
		var USER_EMAIL = $("input:eq(7)").val();
		
		$.ajax({
			url:"emailcheck",
			data:{"USER_EMAIL" : USER_EMAIL},
			success: function(resp) {
				if(resp == -1) {
					if(pattern.test(USER_EMAIL)){
						$('.email_checkbar').css('opacity', '0.95');				
						checkemail = true;
					} else {
						$('.email_checkbar').css('opacity', '0');
					}
				} else {
					$('.email_checkbar').css('opacity', '0');
					checkemail = false;
				}
			}
		});
	});
	
	$('input:eq(1)').on('keyup' , function(){
		
		if($('input:eq(1)').val() != ''){
			$('.name_checkbar').css('opacity' , '0.95');
		}
		if($('input:eq(1)').val() == ''){
			$('.name_checkbar').css('opacity' , '0');
		} 
	})

	$('input:eq(2)').on('keyup', function(){
		
		var pattern = /^\w{4,15}$/;
		var USER_PASS = $("input:eq(2)").val();
		
		if(pattern.test(USER_PASS)){
			$('.pass_checkbar').css('opacity' , '0.95');
			checkpass = true;
		} else {
			$('.pass_checkbar').css('opacity' , '0');
			checkpass = false;
		}
	});
	
	$('input:eq(3)').on('keyup' , function(){
		
		var pattern = /^[0-9]{8}$/;
		var USER_BIRTH = $('input:eq(3)').val();
		
		if(pattern.test(USER_BIRTH)){
			$('.birth_checkbar').css('opacity' , '0.95');
			checkbirth = true;
		} else {
			$('.birth_checkbar').css('opacity' , '0');
			checkbirth = false;
		}
	});
	
	$('input:eq(4)').on('keyup' , function(){
		
		var pattern = /^[0-9]{10,11}$/;
		var USER_PHONE = $('input:eq(4)').val();
		
		if(pattern.test(USER_PHONE)){
			$('.phone_checkbar').css('opacity' , '0.95');
			checkphone = true;
		} else {
			$('.phone_checkbar').css('opacity' , '0');
			checkphone = false;
		}
	});
	
	$('input:eq(8)').on('keyup' , function(){
		
		var pattern = /^(19|20)[0-9]{2}(0[1-9]|1[1-2])(0[1-9]|[1-2][0-9]|3[0-1])$/;
		var USER_POST = $('input:eq(8)').val();
		
		if(pattern.test(USER_POST)){
			$('.post_checkbar').css('opacity' , '0.95');
		} else {
			$('.post_checkbar').css('opacity' , '0');
		}
		
	})
	
	$('input:eq(9)').on('keyup' , function(){
		
		var pattern = /^w+$/;
		var USER_ADDR = $('input:eq(9)').val();
		
		if(pattern.test(USER_ADDR)){
			$('.addr_checkbar').css('opacity' , '0.95');
		} else {
			$('.addr_checkbar').css('opacity' , '0');
		}
		
		
	})
});