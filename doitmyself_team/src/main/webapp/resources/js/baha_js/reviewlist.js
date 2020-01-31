function getList2(page2) {
	$.ajax({
				type : "get",
				url : "ReviewListAjax.bo",
				data : {
					"page2" : page2
				},
				dataType : "json",
				success : function(rdata) {
					if (rdata.length > 0) {
						$(".ReviewWrap").empty();
						output = '';
						output += "<div class=\"review\"><p>전체 리뷰</p></div>";
						output += "<span class=\"product_review\"><select name=\"filter\"id=\"filter\">";
						output += "<option value=\"all\" selected>모든 리뷰</option>";
						output += "<option value=\"new\">최신 등록순</option>";
						output += "<option value=\"high\">평점 높은순</option>";
						output += "<option value=\"low\">평점 낮은순</option>";
						output += "</select></span>";
						$(rdata)
								.each(
										function() {
											output += "<div id=\"review_subwrap\">"
													+ "<div id=\"review_top\">"
													+ "<span id=\"star\">";
											if (this.review_RATE == 1) {
												output += "<i class=\"fa fa-star checked\"></i>"
											} else if (this.review_RATE == 2) {
												this.qna_CATEGORY = '배송'
												output += "<i class=\"fa fa-star checked\"></i>"
												output += "<i class=\"fa fa-star checked\"></i>"
											} else if (this.review_RATE == 3) {
												output += "<i class=\"fa fa-star checked\"></i>"
												output += "<i class=\"fa fa-star checked\"></i>"
												output += "<i class=\"fa fa-star checked\"></i>"
											} else if (this.review_RATE == 4) {
												output += "<i class=\"fa fa-star checked\"></i>"
												output += "<i class=\"fa fa-star checked\"></i>"
												output += "<i class=\"fa fa-star checked\"></i>"
												output += "<i class=\"fa fa-star checked\"></i>"
											} else if (this.review_RATE == 5) {
												output += "<i class=\"fa fa-star checked\"></i>"
												output += "<i class=\"fa fa-star checked\"></i>"
												output += "<i class=\"fa fa-star checked\"></i>"
												output += "<i class=\"fa fa-star checked\"></i>"
												output += "<i class=\"fa fa-star checked\"></i>"
											}
											output += "</span><span id=\"review_writer\">"
													+ this.review_WRITER
													+ "&ensp;"
													+ this.review_DATE
													+ "</span></div>"
											output += "<div id=\"review_body\"><span>"
											output += "<img src=\"resources/upload/"
													+ this.review_IMG
													+ "\" id=\"review_img\"> </span>"
											output += "<span id=\"review_prdname\">&ensp;&ensp;&ensp;"
													+ $('#p_name').text()
													+ "</span> <br>"
											output += "<p id=\"review_content\">"
													+ this.review_CONTENT
													+ "</p>"
											output += "</div></div>"

										});
						
						console.log("에이잭스 체크" + output)
						// output += '</table>';
						$(".ReviewWrap").append(output);

					} else {
						$(".ReviewWrap").empty();
						output += "<div id=\"message2\">등록된 리뷰가 없습니다.</div>"
						$(".ReviewWrap").append(output);
					}

				}
			})

}

$(function() {
	$('.pgnation_review').click(function(e) {
		e.preventDefault();
		getList2($(this).text());
	})
})
