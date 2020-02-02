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
			
		}
		
		if($(this).is(':checked') == false) {
			var buyproduct = $(this).val();			
			total = total - buyproduct * 1;
			
		}
		
		//총 결제 금액
		console.log(total);
		
		go(total)
	});			

});

function go(total){
	var USER_ID =  $('#USER_ID').val();
	var data = "state&=ajax" + "&USER_ID=" + USER_ID + "&total=" + total;
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
			$('#cart_checked > tbody').empty();
			output = "";
			output += "<tr>";
			output += "		<th>";
			output += 		data.total + "원<br>";
			output += "		</th>";
			output += "</tr>";
			output += "<tr>";
			output += "		<td colspan='2'>";
			output += "		<input type='button' value='결제 하러 가기' class='btn btn-primary btn-round'>";
			output += "		</td>";
			output += "</tr>";
			$('#cart_checked > tbody').append(output);
		},
		error : function(){
			console.log('totalAjax 에러');
		} 
	});
}



