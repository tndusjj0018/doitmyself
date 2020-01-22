var USER_ID = {"USER_ID" : "admin"}; //테스트용 아이디
$.ajax({
	type : 'post',
	url : 'OrderList',
	data : USER_ID,
	dataType : 'json',
	success : function(data){
		console.log(data);
		if(data.length > 0){
			$('.orderList-tb tbody').empty();
			$('#message').text('');
			output = '';
			$(data).each(function(){				
				output += "<tr>";
				output += "<td class='orderDate'>" + this.order_DATE + "</td>";
				output += "<td class='orderNo'>" + this.order_P_NO + "</td>";
				output += "<td class='orderId'>" + this.order_ID + "</td>";				
				output += "<td class='orderName'>" +
						  "		<div class='orderImg'>" +
						  "			<img src='resources/upload/"+ this.p_IMG +"'>" +
						  "		품명 : "+ this.p_NAME +"" +
						  "		</div>" +
						  "</td>";
				output += "<td class='orderAddress'>" + this.order_ADDRESS + "</td>";
				output += "<td class='orderAmount'>" + this.order_AMOUNT + "</td>";
				output += "<td class='orderPrice'>" + this.order_PRICE + "</td>";
				output += "<td class='orderPayment'>" + this.order_PAYMENT + "</td>";
				output += "<td><button class='orderStatus' value='"+ this.order_DELIVERY +"'></td>";
				output += "</tr>";				
			}); //each end
			var orderStatus = $('.orderStatus').val();
			switch (orderStatus) {
			case "결제완료":
				$('.orderStatus').css('background','#ca1b1b');
				break;
			case "상품준비중":
				$('.orderStatus').css('background','#blue');
				break;
			default:
				break;
			}
			$('.orderList-tb tbody').append(output);
			
			//주문상태 message
			var status = $('.orderStatus').val();
			if(status == 1){
				$('.orderStatus').text('결제완료');
			}else{
				$('.orderStatus').text('테스트');
			}
		}else{
			$('.orderList-tb tbody').empty();
			$('#message').text("주문상품이 없습니다.");
		}
	}//success end
})//orderList ajax end