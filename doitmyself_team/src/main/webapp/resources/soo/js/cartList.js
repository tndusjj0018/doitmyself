$(document).ready(function(){
			
	$('#productPageGo').click(function(){
		location.href='product?category=all';
	});
	
	go(0)
	
	var total = 0;
	$('.buyproduct').change(function(){
		
		if($(this).is(':checked') == true) {
			var buyproduct = $(this).val();			
			total = total + buyproduct * 1;
			var cartpno = $(this).parent().parent().find('.cartpno').html();
		}
		
		if($(this).is(':checked') == false) {
			var buyproduct = $(this).val();			
			total = total - buyproduct * 1;
			
		}
		
		//총 결제 금액
		console.log(total);
		console.log(cartpno);
		go(total)
	});
	
	

});

function go(total){
	var USER_ID =  $('#USER_ID').val();
	var cartpno = $('.cartpno').html();
	var cartcount = $('.cartcount').html();
	var data = "state&=ajax" + "&USER_ID=" + USER_ID + "&total=" + total +"&P_NO=" + cartpno + "&cartcount=" +cartcount;
	ajax(data)
}


function ajax(data){
	console.log(data)
	$.ajax({
		type: 'get',
		data : data,
		url : 'totalAjax',
		dataType : 'json',
		cache : false,
		success : function(data){
			console.log(data.total);
			console.log(data.cartcount);
			$('#cart_checked > tbody').empty();
			output = "";
			output += "<tr>";
			output += "		<th>";	
			output += 		data.total + "원<br>";
			output += "		</th>";
			output += "</tr>";
			output += "<tr>";
			output += "		<td colspan='2'>";
			output += "		<input type='submit' value='결제 하러 가기' onclick=location.href='cartpay?P_NO="+data.p_no +"&cartcount="+data.cartcount+"&total="+data.total+"'; class='btn btn-primary btn-round'>";
			output += "		</td>";
			output += "</tr>";
			$('#cart_checked > tbody').append(output);
		},
		error : function(){
			console.log('totalAjax 에러');
		} 
	});
}



