function go(page){
	var limit = $('#viewcount').val();
	var USER_ID = $('#USER_ID').val();
	var data = "limit=" + limit + "&state=ajax&page=" + page + "&USER_ID=" + USER_ID;
	ajax(data);
}

function setPaging(href, digit){
	output += "<li class=page-item>";
	gray = "";
	if(href == ""){
		gray = "gray";
	}
	anchor = "<a class='page-link " + gray + "'" + href + ">"
				+ digit + "</a></li>";
	output += anchor;
}

function ajax(data){
console.log(data)	
	
$.ajax({
	type : 'post',
	url : 'OrderList',
	data : data,
	dataType : 'json',
	cache : false,
	success : function(data){
		if(data.listcount > 0){
			$('.orderList-tb tbody').empty();
			$('#message').text('');
			output = '';
			orderPrice = null;
			listcount = 0;
			$(data.orderlist).each(function(){		
				//시간빼고 날짜만 뽑아옴
				var orderDateAll = this.order_DATE;
				var orderDate = orderDateAll.split(" ");
				output += "<tr>";
				output += "<td class='orderDate'>" + orderDate[0] + "</td>";
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
				output += "<td class='orderPrice'>" + this.order_PRICE.toLocaleString() + "</td>";
				output += "<td class='orderPayment'>" + this.order_PAYMENT + "</td>";
				output += "<td><button class='orderStatus' value='"+ this.order_DELIVERY +"'></td>";
				output += "</tr>";		
				//## 총 주문금액 ##
				orderPrice += this.order_PRICE;
				listcount += 1; 
			}); //each end
			// ## 주문 상태 ##
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
			
			//## 페이징 처리 ##
			$(".pagination").empty();
			output = "";
			
			digit = '이전&nbsp;'
			href = "";
			if(data.page > 1){
				href = 'href=javascript:go(' + (data.page - 1) + ')';
			}
			setPaging(href, digit);
			
			for(var i=data.startpage; i<=data.endpage; i++){
				digit = i;
				href = "";
				if(i != data.page){
					href = 'href=javascript:go(' + i + ')';
				}
				setPaging(href, digit);				
			}
			
			digit = '다음&nbsp;';
			href = "";
			if(data.page < data.maxpage){
				href = 'href=javascript:go(' + (data.page + 1) + ')';
			}
			setPaging(href, digit);
			
			$('.pagination').append(output)
			
			// ## 주문상태 message ##
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
		// ## 총 주문수 ##
		$('.orderCount').empty();
		$('.orderCount').text(listcount);
		// ## 총 주문금액 ##
		$('.orderPriceAll').empty();
		$('.orderPriceAll').text(orderPrice.toLocaleString());//자동 콤마
	}//success end
})//orderList ajax end
}

$(function(){
	go(1)//처음 보여줄 페이지를 1페이지로 설정합니다.
	$("#viewcount").change(function(){
		go(1);
	});
	
	// ## 01/28 여기부터 시작
	// ## 검색 ##
	$('.orderSearchForm').submit(function(){
		var orderSelect = $('.orderSelect').val();
		var orderSearch = $('.orderSearch').text();
		var orderDay = $('input[name=radio]').text();
		var orderS = $('input[name=checkbox]').text();
		
		var data = "limit=" + limit + "&state=ajax&page=" + page + "&USER_ID=" + "admin";
		ajax(data)
	});
})