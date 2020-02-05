$(function(){
	go(1)//처음 보여줄 페이지를 1페이지로 설정합니다.
	$("#viewcount").change(function(){
		go(1); //페이지 이동값 1페이지
	});
	$('#viewSelect').change(function(){
		go(1);
	})
	
	// ## 검색 ##
	//검색한 값 유지하기 위해선 click했을시 전역변수에 담으면됨 -> change 저장한 변수값 가져감
	$('#orderBtn').click(function(){
		//검색 유효성 검사
		var radioCheck = $('input[name=orderRadio]').is(':checked');
		if(!radioCheck){
			alert("기간을 선택해주세요.");
			$('input[name=orderRadio]').focus();
			return false;
		}
		
		var checkCheck = $('input[name=orderCheck]').is(':checked');
		if(!checkCheck){
			alert("주문상태를 선택해주세요.");
			$('input[name=orderCheck]').focus();
			return false;
		}
		
		var startDate = null;
		var endDate = null;
		var search_field = $('.search_field').val();//검색어 선택
		var search_word = $('.search_word').val();//검색어 입력
		var dateCheck =  $("input[name=orderRadio]:checked").val();//기간 선택
		var status =  $("input[name=orderCheck]:checked").val();//주문상태 선택
		
		var dt = new Date(); //현재 날짜
		//오늘날짜 구함
		var recentYear = dt.getFullYear();
		var recentMonth = dt.getMonth() + 1;
		var recentDay = dt.getDate();
		var recentDay2 = dt.getDate() + 1;
		if(recentMonth < 10) recentMonth = "0" + recentMonth;
		if(recentDay < 10) recentDay = "0" + recentDay;
		if(dateCheck == "orderR-t"){//오늘
			
			if(recentDay2 < 10) recentDay2 = "0" + recentDay2;

			var startDate = recentYear + "-" + recentMonth + "-" + recentDay;
			var endDate = recentYear + "-" + recentMonth + "-" + recentDay2;
			
		}else if(dateCheck == "orderR-1mon"){//1개월
			var dt = new Date();
			dt.setMonth((dt.getMonth() + 1) - 1);

			var year = dt.getFullYear();
			var month = dt.getMonth();
			var day = dt.getDate();

			if(month < 10) month = "0" + month;
			if(day < 10) day = "0" + day;

			var startDate = year + "-" + month + "-" + day;
			var endDate = recentYear + "-" + recentMonth + "-" + recentDay;
			
		}else if(dateCheck == "orderR-6mon"){//6개월
			var dt = new Date();
			dt.setMonth((dt.getMonth() + 1) - 6);

			var year = dt.getFullYear();
			var month = dt.getMonth();
			var day = dt.getDate();

			if(month < 10) month = "0" + month;
			if(day < 10) day = "0" + day;

			var startDate = year + "-" + month + "-" + day;
			var endDate = recentYear + "-" + recentMonth + "-" + recentDay;
		}
		var limit = $('#viewcount').val(); //페이지 수
		var viewSelect = $('#viewSelect').val(); //ㅇㅇ순 정렬
		
		var page = 1;
		var data = "limit=" + limit + "&state=ajax&page=" + page + 
					"&USER_ID=" + $('#USER_ID').val() + "&startDate=" + startDate + "&endDate=" + endDate +
					"&search_field=" + search_field + "&search_word=" + search_word + "&status=" + status + "&viewSelect=" + viewSelect;
		ajax(data);
		
	});	
})

function go(page){
	var limit = $('#viewcount').val(); //페이지 몇개씩 보기
	var USER_ID = $('#USER_ID').val();	
	var viewSelect = $('#viewSelect').val(); //ㅇㅇ순 정렬
	var data = "limit=" + limit + "&state=ajax&page=" + page + "&USER_ID=" + USER_ID + "&viewSelect=" + viewSelect;
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
						  "		<b>품명</b> : "+ this.p_NAME +"" +
						  "		</div>" +
						  "</td>";
				output += "<td class='orderAddress'><b>이름</b>: "+ this.user_NAME +"<br><b>연락처</b>: "+ this.user_PHONE +"<br><b>주소</b>: "+ this.order_ADDRESS + "</td>";
				output += "<td class='orderAmount'>" + this.order_AMOUNT + "</td>";
				output += "<td class='orderPrice'>" + this.order_PRICE.toLocaleString() + "&#8361;</td>";
				output += "<td class='orderPayment'>" + this.order_PAYMENT + "</td>";
				switch (this.order_DELIVERY) {
				case 0:
					DeleveryMessage = "주문완료"
					bg = "silver"
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
				output += "<td class='orderDelivery'><button class='orderDelivery' value='"+ this.order_DELIVERY +"' style='background:"+bg+"'>"+DeleveryMessage+"</button>" +
						"		<input type='hidden' value="+ this.order_NO +" id='hidden_no'>" +
						"		<input type='hidden' value='"+ this.order_AMOUNT +"' id='hidden_amount'></td>";
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
		if(listcount == 0){
			$('#message').text("검색 내용이 없습니다.");
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
		var order_no = $(this).next().val(); //주문번호
		var order_p_no = $(this).next().next().next().val(); //상품번호
		var order_amount = 0;
		var ORDER_TRNO = null; //운송장 번호
		if(orderDelivery == "주문완료"){// 0 = 주문완료
			var ready = confirm("결제완료 처리하시겠습니다?");
			if(ready){
				$(this).text("결제완료").css('background','#ca1b1b');
				orderDeliveryVal = 1; // 1=결제완료
			}else{
				
			}
		}else if(orderDelivery == "결제완료"){
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
					order_amount = $(this).next().next().val(); //구매수량
					var data = "ORDER_P_NO=" + order_p_no + "&state=ajax&ORDER_AMOUNT=" + order_amount;
					$.ajax({
						type : 'post',
						url : 'OrderAmountM',
						data : data
					})
					alert("배송처리 되었습니다.");
				}else{
					alert("숫자로 입력해주세요");
					return false;
				}
			}
			
		}else if(orderDelivery == "배송중"){
			var ready = confirm("배송완료 처리하시겠습니까?");
			if(ready){
				$(this).text("배송완료").css('background','#5bb65b');
				orderDeliveryVal = 4; // 4=배송완료
			}else{
				return false;
			}
		}			
		
		//송장번호	
		var order_p_no = $(this).next().val(); //상품 번호
		var data = {"orderDeliveryVal" : orderDeliveryVal, "ORDER_TRNO" : ORDER_TRNO,
					"ORDER_NO" : order_no}
		$.ajax({
			type : 'post',
			url : 'orderDelivery2',
			data : data,
			cache : false,
			success : function(data){
				//없음
			}
		})
	})//orderStatus click
		
}//orderStatus end