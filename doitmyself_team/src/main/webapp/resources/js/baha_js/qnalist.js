function getList(page) {
	$.ajax({
		type : "get",
		url : "QnaListAjax.bo",
		data : {
			"page" : page
		},
		dataType : "json",
		success : function(rdata) {
			if (rdata.length > 0) {
				$(".qna_subjects tbody").empty();
				output = '';
				output += "<tr><td>문의유형</td>"
				output += "<td></td>"
				output += "<td>문의/답변</td>"
				output += "<td>작성자</td>"
				output += "<td>작성일</td></tr>"
				// output+= '<table>';
				$(rdata).each(
						function() {

							if (this.qna_CATEGORY == 0) {

								output += "<tr><td>상품"
										+ "</td>";
							} else if (this.qna_CATEGORY == 1) {
								output += "<tr><td>배송"
										+ "</td>";
							} else if (this.qna_CATEGORY == 2) {

								output += "<tr><td>반품/취소"
										+ "</td>";
							} else if (this.qna_CATEGORY == 3) {

								output += "<tr><td>교환/변경"
										+ "</td>";
							} else if (this.qna_CATEGORY == 4) {
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
				// output += '</table>';
				$(".qna_subjects tbody").append(output);

			} else {
				$(".qna_subjects tbody").empty();
				output += "<td id='message' colspan='5'>등록된 글이 없습니다.</td>"

			}

		}
	})

}

$(function() {
	$('.pgnation_qna').click(function(e) {
		e.preventDefault();
		getList($(this).text());
	})
})
