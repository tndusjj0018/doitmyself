function go(page) {
	getList(page);
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

function getList(page) {
	
	$.ajax({
		type : "get",
		url : "QnaListAjax.bo",
		data : {
			"page" : page,
			"P_NO" : $('#prd_no').val(),
			"cate" : $('#category').val()
		},
		dataType : "json",
		success : function(rdata) {
			if (rdata.qnalist.length > 0) {
				$(".qna_subjects tbody").empty();
				output = '';
				output += "<tr><td>문의유형</td>"
				output += "<td></td>"
				output += "<td>문의/답변</td>"
				output += "<td>작성자</td>"
				output += "<td>작성일</td></tr>"
				
				$(rdata.qnalist).each(
						function() {
							if (this.qna_CATEGORY == 0) {

								output += "<tr><td>배송"
										+ "</td>";
							} else if (this.qna_CATEGORY == 1) {
								output += "<tr><td>상품"
										+ "</td>";
							} else if (this.qna_CATEGORY == 2) {

								output += "<tr><td>반품/취소"
										+ "</td>";
							} else if (this.qna_CATEGORY == 3) {
								output += "<tr><td>기타"
									+ "</td>";
							}
							if (this.qna_ISRESPONSE == 0) {
								output += "<td>답변대기"
										+ "</td>";
							} else if (this.qna_ISRESPONSE == 1){
								output += "<td>답변완료"
										+ "</td>";
							}

							output += "<td class='clickable'>"
									+ this.qna_SUBJECT + "</td>";
							output += "<td>" + this.qna_WRITER + "</td>";
							output += "<td>" + this.qna_DATE + "</td></tr>";

							output += "<tr class='qna_content'>"
									+ "<td></td> <td></td>" + "<td>"
									if(this.qna_SECRET == 1 && this.qna_WRITER != $("#loginid").val()) {
									output += "비밀글로 작성되었습니다." + "<hr>";
									} else if (this.qna_SECRET == 1 && this.qna_WRITER == $("#loginid").val()) {
										output += "문의 : " + this.qna_CONTENT + "<br>"; 
									} else if (this.qna_SECRET == 0 && this.qna_WRITER == $("#loginid").val()) {
										output += "문의 : " + this.qna_CONTENT + "<br>"; 
									} else if (this.qna_SECRET == 0 && this.qna_WRITER != $("#loginid").val()) {
										output += "문의 : " + this.qna_CONTENT + "<hr>"; 
									}
							
							
							if ($("#loginid").val() == this.qna_WRITER) {
								output += "<a onclick=\"window.open('qnaUpdateView?num=" + this.qna_NO + "','qnaWrite_pop','width=430,height=500,location=no,status=no,scrollbars=yes');\" id='qnaUpdate'>수정</a>&emsp;" +
										"<a href='qnaDelete'>삭제</a><hr>"							
							} 
							if(this.qna_ISRESPONSE == 1 && this.qna_WRITER == $("#loginid").val()) {
								output +=	"답변 : " + this.qna_ANSWER;
							}
							output += "</td>";
							output += "<td></td><td></td>"
							output += "</tr>";
									    																					
						});
				
				$(".qna_subjects tbody").append(output); //문의글 완성
				
				$('#qnapage').empty(); //페이징 처리
				output = "";
			    digit = '이전&nbsp;'
				    href="";
				    if(rdata.page >1) {
				    	href = 'href=javascript:go(' + (rdata.page - 1) + ')';
				    }
				    setPaging(href, digit);

				for (var i = rdata.startpage; i<= rdata.endpage; i++) {
					digit = i;
					href= "";
					if(i != rdata.page){
						href='href=javascript:go('+i+')';
					}
					setPaging(href, digit);
				}
				digit = '다음&nbsp;';
				href="";
				if(rdata.page < rdata.maxpage){
					href='href=javascript:go('+(rdata.page+1)+')';
				}
				setPaging(href, digit);

				$('#qnapage').append(output)

			} else {
				$("#qnapage").empty();
				output =''
				output += "<td id='message' colspan='5'>등록된 문의글이 없습니다.</td>"
					$('#qnapage').append(output)
			}

		},
		error:function(){
			console.log("에러");
		 }
	})

}

$(function() {
	
	go(1)
		$('#category').on('change',function(){
			go(1);
		})
	
//	$('.pgnation_qna').click(function(e) {
//		e.preventDefault();
//			getList($(this).text());
//		
//		
//	})
	
	
	
	
})
