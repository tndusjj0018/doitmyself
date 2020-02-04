$(function(){
	
	//메뉴 바 클릭 시 클래스를 add하여 css를 변동시킴
	$('input[name="serviceBTN"]').click(function(){
			$('input[name="serviceBTN"]').removeClass('btnOn')
			$(this).addClass('btnOn')
		});	
	$('.product_service td').click(function(){
		$('.product_service td').removeClass('tdOn')
		$(this).addClass('tdOn')
	});
	
     //메뉴 바 중 해당하는 메뉴 클릭시 그 메뉴가 있는 위치로 이동함.
		$('#detail').click(function(){
			var offset = $('.detail').offset();
			$('html, body').animate({scrollTop:offset.top-150},0);
		});
		
		$('#review').click(function(){
			var offset = $('.review').offset();
			$('html, body').animate({scrollTop:offset.top-70},0);
		});
		
		$('#qna').click(function(){
			var offset = $('.qna').offset();
			$('html, body').animate({scrollTop:offset.top-70},0);
		});
		
		$('#return').click(function(){
			var offset = $('.seller').offset();
			$('html, body').animate({scrollTop:offset.top-70},0);
		});


//문의글 제목 클릭시 내용이 나옴.
$(document).on('click','.clickable',function(){
	$(this).parent().next().toggle();	
})

//수량 변동을 연동시킴
$(document).on('change','.input-number', function(){
	var main = $('.input-number').val();
	$('#tno').val(main);
})

$(document).on('change','#tno', function(){
	var main = $('#tno').val();
	$('.input-number').val(main);
})

//가격, 세 자리 수 마다 콤마
function com(str) {
 str = String(str);
 return str.replace(/(\d)(?=(?:\d{3})+(?!\d))/g, '$1,');
 }

//수량 변동시 가격 변동시킴
$(document).on('change','#tno', function(){
    var c = $('#tno').val();
    var hidprc = $('#hiddenprice').val();
    sq = Number(hidprc*c);
    $('#tno_price').text(com(sq));

})

$(document).on('change','.input-number', function(){
    var c = $('.input-number').val();
    var hidprc = $('#hiddenprice').val();
    sq = Number(hidprc*c);
    $('#tno_price').text(com(sq));
})

$(document).on('change','.input-number', function(){
    var c = $('.input-number').val();
    var hidprc = $('#hiddenprice').val();
    sq = Number(hidprc*c);
    $('.totalprice').text(com(sq));
})

$(document).on('change','#tno', function(){
    var c = $('#tno').val();
    var hidprc = $('#hiddenprice').val();
    sq = Number(hidprc*c);
    $('.totalprice').text(com(sq));
})

//결제하기 클릭시  수량값을 pay.jsp 로 보내기위한 문장
$(window).load( function(){ 
	 var c = $('#tno').val();
	 $('#COUNT').val(c);
})


$(document).on('change','#tno',function(){
	  var c = $('#tno').val();
	  $('#COUNT').val(c);
	
})



			
});