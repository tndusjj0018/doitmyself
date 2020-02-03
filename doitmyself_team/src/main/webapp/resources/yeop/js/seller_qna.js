$(function(){
	go('Q_REGDATE')//처음 조회는 등록일 기준
	$('.qnaSelect').change(function(){
		var qnaSelect = $(this).val();
		go(qnaSelect)
	})
})

function go(select){
	var USER_ID =  $('#USER_ID').val();
	var data = "state&=ajax" + "&USER_ID=" + USER_ID + "&qnaSelect=" + select;
	ajax(data)
}

function ajax(data){
	$.ajax({
		type : 'post',
		url : 'sellerQna',
		data : data,
		dataType : 'json',
		cache : false,
		success : function(data){
			if(data.length > 0){
				$('.orderList-tb tbody').empty();
				$('#message').text('');
				output = '';
				qnaCategory = '';
				qnaIsresponse = '';
				qnaColor = '';
				$(data).each(function(){
					switch (this.qna_CATEGORY) {
					case 0:
						qnaCategory = "배송문의";
						break;
					case 1:
						qnaCategory = "상품문의";
						break;
					case 2:
						qnaCategory = "주문취소/환불문의";
						break;
					case 3:
						qnaCategory = "기타문의";
						break;
					}
					
					switch (this.qna_ISRESPONSE) {
					case 0:
						qnaIsresponse = "답변예정"
						qnaColor = "#ca1b1b"
						break;
					case 1:
						qnaIsresponse = "답변완료"
						qnaColor = "#5bb65b";
						break;
					}
					output += "<tr>";
					output += "<input type='hidden' value='"+ this.qna_NO+"'>";
					output += "<td>"+ this.qna_DATE +"</td>";
					output += "<td>"+ qnaCategory +"</td>";
					output += "<td>"+ this.qna_P_NO +"</td>";
					output += "<td>"+ this.qna_SUBJECT +"</td>";
					output += "<td>"+ this.qna_WRITER +"</td>";
					output += "<td class='qnaWriter' style='color:"+qnaColor+"'>"+ qnaIsresponse +"</td>";
					output += "</tr>";
				}); //each end
				
				$('.orderList-tb tbody').append(output);				
				
				//## hover event ##
				$('.orderList-tb tbody>tr').hover(function(){
					$(this).css('background','#f5f5f5').css('font-weight','bold').css('transition','.3s');					
				},function(){//hover 떠낫을때
					$(this).css('background','white').css('font-weight','normal').css('transition','.3s');
				})
				
				//## 상품문의 답변 뷰페이지 이동 ##
				$('.orderList-tb tbody>tr').click(function(){
					var qna_no = $(this).children().val();
					location.href = "QnaReplyView?q_p_no="+ qna_no;
				})
				
			}else{
				$('.orderList-tb tbody').empty();
				$('#message').text("문의답변이 없습니다.");
			}
			
			// ## 총 글의 수 ##
			$('.saleCount').empty();
			$('.saleCount').text(data.length);
		}//success end
	})//sellerQna ajax end
}