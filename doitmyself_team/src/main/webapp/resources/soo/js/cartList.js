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
			var cartcount = $(this).parent().parent().find('.cartcount').html();
		}
		
		if($(this).is(':checked') == false) {
			var buyproduct = $(this).val();			
			total = total - buyproduct * 1;
			
		}
		
		//총 결제 금액
		console.log("total = " + total);
		console.log("cartpno = " + cartpno);
		console.log("cartcount = " + cartcount);
		go(total)
	});
	
	$('.buyproduct').change(function(){
		
		var rowData = new Array();
		var tdArr = new Array();
		var checkbox = $("input[name=buyproduct]:checked");
		
		// 체크된 체크박스 값을 가져온다
		checkbox.each(function(i) {

			var tr = checkbox.parent().parent().eq(i);
			var td = tr.children();
			
			// 체크된 row의 모든 값을 배열에 담는다.
			rowData.push(tr.text());
			
			// td.eq(0)은 체크박스 이므로  td.eq(1)의 값부터 가져온다.
			var p_no = td.eq(1).text();
			var p_img = td.eq(2).html();
			var p_name = td.eq(3).text();
			var p_seller = td.eq(4).text();
			var cartcount = td.eq(6).text();
			var p_total = td.eq(7).text();
			
			
			// 가져온 값을 배열에 담는다.
			tdArr.push(p_no);
			tdArr.push(p_img);
			tdArr.push(p_name);
			tdArr.push(p_seller);
			tdArr.push(cartcount);
			tdArr.push(p_total);
			
			console.log("p_no : " + p_no);
			console.log("p_img : " + p_img);
			console.log("p_name : " + p_name);
			console.log("p_seller : " + p_seller);
			console.log("cartcount : " + cartcount);
			console.log("p_total : " + p_total);
		});
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
//			output += "<fmt:formatNumber value='" + data.total +"' pattern='#,###,###' />원";
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



