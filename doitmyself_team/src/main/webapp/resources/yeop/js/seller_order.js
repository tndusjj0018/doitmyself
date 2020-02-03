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
				var DeleveryMessage = null; //배송 상태 메시지
				var bg = null; //배송 상태 bg
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
				switch (this.order_DELIVERY) {
				case 0:
					DeleveryMessage = "주문완료"
					break;
				case 1:
					DeleveryMessage = "결제완료"
					bg = "#ca1b1b"
					break;
				case 2:
					DeleveryMessage = "상품준비중"
					bg = "#e6811a"
						break;
				case 3:
					DeleveryMessage = "배송중"
					bg = "#428bca"
						break;
				case 4:
					DeleveryMessage = "배송완료"
					bg = "#5bb65b"
						break;
				}
				output += "<td><button class='orderDelivery' value='"+ this.order_DELIVERY +"' style='background:"+bg+"'>"+DeleveryMessage+"</button>" +
						"		<input type='hidden' value='"+ this.order_P_NO +"' id='hidden_p_no'></td>";
				output += "</tr>";
				
				//## 총 주문금액 ##
				orderPrice += this.order_PRICE;
				listcount += 1;						
			}); //each end		
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
			
			//## 배송 상태 변경 ##
			orderDelivery()
			
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

//## 주문상태 ##
function orderDelivery(){
	
	//## 주문상태 ajax ## 
	$('.orderDelivery').click(function(){
		var orderDelivery = $(this).text();
		//주문상태 : 1=결제완료, 2=상품준비중, 3=배송중, 4=배송완료
		var orderDeliveryVal = $(this).val();
		var order_p_no = $(this).next().val();
		var ORDER_TRNO = 0; //운송장 번호
		if(orderDelivery == "결제완료"){
			var ready = confirm("상품준비중 처리하시겠습니까?");
			if(ready){
				$(this).text("상품준비중").css('background','#e6811a');
				orderDeliveryVal = 2; // 2=상품 준비중
			}else{
				return false;
			}
		}else if(orderDelivery == "상품준비중"){			
			//$('#myModal').modal();
			var pt= /[^0-9]/g;
			var orderTRNO = prompt("운송장 번호를 입력해주세요.");
			
			if(orderTRNO != null && orderTRNO != ""){
				if(!pt.test(orderTRNO)){
					$(this).text("배송중").css('background','#428bca');
					ORDER_TRNO = orderTRNO;
					orderDeliveryVal = 3; // 3=배송중
					alert("배송처리 되었습니다.")
				}else{
					alert("숫자로 입력해주세요");
					return false;
				}
			}
			
		}else if(orderDelivery == "배송중"){
			var ready = confirm("배송완료 처리하시겠습니까?");
			if(ready){
				$(this).text("배송완료").css('background','#e6811a');
				orderDeliveryVal = 4; // 4=배송완료
			}else{
				return false;
			}
		}			
		
		//송장번호	
		var order_p_no = $(this).next().val(); //상품 번호
		var data = {"orderDeliveryVal" : orderDeliveryVal, "ORDER_TRNO" : ORDER_TRNO,
					"ORDER_P_NO" : order_p_no}
		$.ajax({
			type : 'post',
			url : 'orderDelivery',
			data : data,
			cache : false,
			success : function(data){
				
			}
		})
	})//orderStatus click
		
}//orderStatus end