$(function(){
	go('P_REGDATE')//처음 조회는 등록일 기준
	$('.saleSelect').change(function(){
		var saleSelect = $(this).val();
		go(saleSelect)
	})
})

function go(select){
	var USER_ID =  $('#USER_ID').val();
	var data = "state&=ajax" + "&USER_ID=" + USER_ID + "&saleSelect=" + select;
	ajax(data)
}

function ajax(data){
	$.ajax({
		type : 'post',
		url : 'SaleList',
		data : data,
		dataType : 'json',
		cache : false,
		success : function(data){
			if(data.length > 0){
				$('.orderList-tb tbody').empty();
				$('#message').text('');
				output = '';
				salePrice = null;
				$(data).each(function(){
					var regdate = this.p_REGDATE.split(" ");
					output += "<tr>";
					output += "<td class='slaeDate'>" + regdate[0] + "</td>";				
					output += "<td class='saleName'>" +
							  "		<div class='saleImg'>" +
							  "			<a href='detail?P_NO="+this.p_NO+"' title=상세페이지이동><img src='resources/upload/"+ this.p_IMG +"'></a>" +
							  "		품명 : "+ this.p_NAME +"" +
							  "		</div>" +
							  "</td>";
					output += "<td class='salePrice'>" + this.p_PRICE.toLocaleString() + "&#8361;</td>";
					output += "<td class='saleQuantity'><b>" + this.p_QUANTITY + "개</b></td>";
					output += "<td class='saleReadCount'>조회수: " + this.p_READCOUNT +"<br>찜: "+ this.p_DIBS + "</td>";
					output += "<td class='saleBtn'>" +
							"		<input type='hidden' value='"+ this.p_NO +"'>" +
							"		<a href='productInfo?P_NO="+ this.p_NO +"'>" +
							"			<button class='saleUpdate'>상품수정</button>" +
							"		</a>" +
							"		<a href='productDelete?P_NO="+ this.p_NO +"'>" +
							"			<button class='saleDelete'>상품삭제</button>" +
							"		</a>" +
							"</td>";
					output += "</tr>";		
				}); //each end
				
				$('.orderList-tb tbody').append(output);
				
			}else{
				$('.orderList-tb tbody').empty();
				$('#message').text("주문상품이 없습니다.");
			}
			// ## 총 주문수 ##
			$('.saleCount').empty();
			$('.saleCount').text(data.length);
		}//success end
	})//orderList ajax end
}
