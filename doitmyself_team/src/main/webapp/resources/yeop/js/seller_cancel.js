var data = {"USER_ID" : $('#USER_ID').val(), "status" : 1}
$.ajax({
	type : 'post',
	url : 'CancelList',
	data : data,
	dataType : 'json',
	cache : false,
	success : function(data){
		if(data.length > 0){
			$('.orderList-tb tbody').empty();
			$('#message').text('');
			output = '';
			console.log(data)
			$(data).each(function(){
				//시간빼고 날짜만 뽑아옴
				//var orderDateAll = this.order_R_DATE ;
				//var orderDate = orderDateAll.split(" ");
				output += "<tr>";
				output += "<td class='orderDate'>" + this.order_R_DATE + "</td>";
				output += "<td class='orderNo'>" + this.order_NO + "</td>";
				output += "<td class='orderId'>" + this.order_ID + "</td>";				
				output += "<td class='orderName'>" +
						  "		<div class='orderImg'>" +
						  "			<img src='resources/upload/"+ this.p_IMG +"'>" +
						  "		<b>품명</b> : "+ this.p_NAME +"" +
						  "		</div>" +
						  "</td>";
				output += "<td class='orderAddress'><b>이름</b>: "+ this.user_NAME +"<br><b>연락처</b>: "+ this.user_PHONE +"<br><b>주소</b>: "+ this.order_ADDRESS + "</td>";
				output += "<td class='orderAmount'>" + this.order_AMOUNT + "</td>";
				output += "<td class='orderPrice'>" + this.order_PRICE.toLocaleString() + "&#8361;</td>";
				output += "<td class='orderPayment'>" + this.order_PAYMENT + "</td>";
				output += "</tr>";
			}); //each end
			
			$('.orderList-tb tbody').append(output);
			
		}else{
			$('.orderList-tb tbody').empty();
			$('#message').text("취소상품이 없습니다.");
		}
		// ## 총 상품수 ##
		$('.saleCount').empty();
		$('.saleCount').text(data.length);
	}//success end
})