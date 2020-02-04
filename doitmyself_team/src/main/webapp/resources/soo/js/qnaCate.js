$(document).ready(function(){
			
	$('#productPageGo').click(function(){
		location.href='product?category=all';
	});
	
	go('q_all')
	
	$('#qnaCate').change(function(){
		var qnaCate = $(this).val();
		go(qnaCate)
	})
			

});

function go(qnaCate){
	var USER_ID =  $('#USER_ID').val();
	var data = "state&=ajax" + "&USER_ID=" + USER_ID + "&qnaCate=" + qnaCate;
	ajax(data)
}


function ajax(data){
	console.log(data)
	$.ajax({
		type : "get",
		data : data,
		url : 'qnaListAjax',
		dataType : 'json',
		cache : false,
		success : function(data){
			$("#qnaCate").val(data.qnaCate);
			console.log(data.qnaCate)
			
			if(data.qnacount > 0){
				$('tbody').empty();
				output = "";
				
				$(data.qnalist).each(function(index, item){
					console.log(item.p_NO);
					output += "<tr>";
//					output += "		<td>";
//					output += 		item.qna_NO;
//					output += "		</td>";
					output += "		<td>";
					output += "		<img src='resources/upload/" +item.p_IMG+"' class='product_img'>";
					output += "		</td>"
					output += "		<td>";
					output += "		<a href='detail?P_NO=" + item.p_NO + "' <span style='cursor: pointer'>" + item.p_NAME +"</span></a>";
					output += "		</td>";
					output += "		<td>";
					output += 		item.p_SELLER;
					output += "		</td>";	
					output += "		<td>";
					
									if (item.qna_CATEGORY == 0){
										output += "배송문의";
									} else if (item.qna_CATEGORY == 1) {
										output += "상품문의";
									} else if (item.qna_CATEGORY == 2) {
										output += "환불문의";
									} else if (item.qna_CATEGORY == 3) {
										output += "기타문의";
									}
					
					output += "		</td>";
					output += "		<td>";
					output += 		item.qna_SUBJECT;
					output += "		</td>";	
					output += "		<td>";
					output += 		item.qna_DATE;
					output += "		</td>";
					output += "		<td>";
					
									if (item.qna_ISRESPONSE == 0) {
										output += "<span style='color: #9d9da5'>답변예정</span>";
									} else if (item.qna_ISRESPONSE == 1) {
										output += "<span style='color:#3a8aa2; cursor:pointer' onclick=window.open('qna_answer?qna_NO="+item.qna_NO+"','','width=700,height=500,left=450,top=100');>답변완료</span>";
									}
									
					output += "</td>";
					output += "</tr>"
				});
				
				$('tbody').append(output);
				
				
			}
		},
		
		error : function(){
			console.log('qnaListAjax 에러');
		}
	});
	
}