$(document).ready(function(){
	
	var checkid = false;
	var checkemail = false;
		
	$('form').submit(function(){
		
		//아이디 체크
		if(!checkid) {
			alert ('사용 가능한 id를 입력하세요.');
			$('input:eq(0)').val('').focus();
			$('#message').text('');
			return false;
		}
		
		//나이 숫자 체크
		if(!$.isNumeric($("input[name=USER_PHONE]").val())) {  //패턴 사용해도 됨
			alert('핸드폰 번호는 숫자만 입력하세요.');
			$("input[name='age']").val('');
			$("input[name='age']").focus();
			return false;
		}

		if(!$.isNumeric($("input[name=USER_BIRTH]").val())) {  //패턴 사용해도 됨
			alert('생일은 숫자만 입력하세요.');
			$("input[name='age']").val('');
			$("input[name='age']").focus();
			return false;
		}
		
		if(!checkemail) {
			alert('이메일 형식을 확인하세요.');
			$('input:eq(6)').val('').focus();
			return false;
		}
		
		if($(':radio[name="options"]:checked').length < 1){
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
		var id = $('input:eq(0)').val();
		
		if(!pattern.test(id)) {
			$('#message').css('color', 'red');
			$('#message').html("영문자 숫자 _로 5~12자 가능합니다.");
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
		var email = $("input:eq(7)").val();
		
		$.ajax({
			url:"emailcheck",
			data:{"USER_EMAIL" : USER_EMAIL},
			success: function(resp) {
				if(resp == -1) {
					$('#email_message').css('color', 'red').html("사용 가능한 이메일 입니다.");				
					checkemail = false;
				} else {
					$('#email_message').css('color', 'green').html("사용 가능한 이메일 입니다.");
					checkemail = true;
				}
			}
		});
	});
});