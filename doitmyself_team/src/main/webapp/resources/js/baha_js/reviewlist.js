function getList(page) {
	$.ajax({
		type : "get",
		url : "ReviewListAjax.bo",
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
								this.qna_CATEGORY = '상품'
								output += "<tr><td>" + this.qna_CATEGORY
										+ "</td>";
							} else if (this.qna_CATEGORY == 1) {
								this.qna_CATEGORY = '배송'
								output += "<tr><td>" + this.qna_CATEGORY
										+ "</td>";
							} else if (this.qna_CATEGORY == 2) {
								this.qna_CATEGORY = '반품/취소'
								output += "<tr><td>" + this.qna_CATEGORY
										+ "</td>";
							} else if (this.qna_CATEGORY == 3) {
								this.qna_CATEGORY = '교환/변경'
								output += "<tr><td>" + this.qna_CATEGORY
										+ "</td>";
							} else if (this.qna_CATEGORY == 4) {
								this.qna_CATEGORY = '기타'
								output += "<tr><td>" + this.qna_CATEGORY
										+ "</td>";
							}
							if (this.qna_ISRESPONSE == 0) {
								this.qna_ISRESPONSE = '답변대기'
								output += "<td>" + this.qna_ISRESPONSE
										+ "</td>";
							} else {
								this.qna_ISRESPONSE = '답변완료'
								output += "<td>" + this.qna_ISRESPONSE
										+ "</td>";
							}

							output += "<td class='clickable'>"
									+ this.qna_SUBJECT + "</td>";
							output += "<td>" + this.qna_WRITER + "</td>";
							output += "<td>" + this.qna_DATE + "</td></tr>";

							output += "<tr class='qna_content'>"
									+ "<td></td> <td></td>" + "<td>"
									+ this.qna_CONTENT + "<br>";
							if ($("#loginid").val() == this.qna_WRITER) {
								output += "<a onclick=\"window.open('qnaUpdateView?num=" + this.qna_NO + "','qnaWrite_pop','width=430,height=500,location=no,status=no,scrollbars=yes');\" id='qnaUpdate'>수정</a>&emsp;" +
										"<a href='qnaDelete'>삭제</a></td>"
							}
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
	$('.page-link review').click(function(e) {
		e.preventDefault();
		getList($(this).text());
	})
})
