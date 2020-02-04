<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!-- 아래는 숫자 포맷을 사용하기 위한 라이브러리임 -->
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>

<script src="resources/js/jquery.min.js"></script>
<script src="resources/js/baha_js/detail.js"></script>
<script src="resources/js/baha_js/qnalist.js"></script>
<script src="resources/js/baha_js/reviewlist.js"></script>
<script>

</script>
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet" href="resources/css/baha_css/detail.css">
<link rel="stylesheet" href="resources/css/baha_css/style.css">
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">

<head>
<jsp:include page="../main/header.jsp" />
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">

<link
	href="https://fonts.googleapis.com/css?family=Poppins:200,300,400,500,600,700,800&display=swap"
	rel="stylesheet">
<link
	href="https://fonts.googleapis.com/css?family=Lora:400,400i,700,700i&display=swap"
	rel="stylesheet">
<link
	href="https://fonts.googleapis.com/css?family=Amatic+SC:400,700&display=swap"
	rel="stylesheet">

<link rel="stylesheet"
	href="resources/css/open-iconic-bootstrap.min.css">
<link rel="stylesheet" href="resources/css/animate.css">

<link rel="stylesheet" href="resources/css/owl.carousel.min.css">
<link rel="stylesheet" href="resources/css/owl.theme.default.min.css">
<link rel="stylesheet" href="resources/css/magnific-popup.css">

<link rel="stylesheet" href="resources/css/aos.css">

<link rel="stylesheet" href="resources/css/ionicons.min.css">

<link rel="stylesheet" href="resources/css/bootstrap-datepicker.css">
<link rel="stylesheet" href="resources/css/jquery.timepicker.css">


<link rel="stylesheet" href="resources/css/flaticon.css">
<link rel="stylesheet" href="resources/css/icomoon.css">
<link rel="stylesheet" href="resources/css/style.css">
<style>
</style>
</head>
<body class="goto-here">

	<input type="hidden" id="loginid" value="${USER_ID}" name="loginid">
	<input type="hidden" id="prd_no" value="${prdData.p_NO}" name="num">




	<!-- END nav -->

	<!-- 	<div class="hero-wrap hero-bread" -->
	<!-- 		style="background-image: url('resources/image/bg_1.jpg');"> -->
	<!-- 		<div class="container"> -->
	<!-- 			<div -->
	<!-- 				class="row no-gutters slider-text align-items-center justify-content-center"> -->
	<!-- 				<div class="col-md-9 ftco-animate text-center"> -->
	<!-- 					<p class="breadcrumbs"> -->
	<!-- 						<span class="mr-2"><a href="index.html">Home</a></span> <span -->
	<!-- 							class="mr-2"><a href="index.html">Product</a></span> <span>Product -->
	<!-- 							Single</span> -->
	<!-- 					</p> -->
	<!-- 					<h1 class="mb-0 bread">Product Single</h1> -->
	<!-- 				</div> -->
	<!-- 			</div> -->
	<!-- 		</div> -->
	<!-- 	</div> -->

	<section class="ftco-section">
		<div class="container">
			<div class="row">
				<div class="col-lg-6 mb-5 ftco-animate">
					<img src="resources/upload/${prdData.p_IMG}" class="img-fluid"
						name="P_IMG" id="mainIMG">
				</div>
				<div class="col-lg-6 product-details pl-md-5 ftco-animate">
					<h3 id="p_name">${prdData.p_NAME}</h3>
					<div class="rating d-flex">
						<p class="text-left mr-4">
							<a href="#" class="mr-2">${rate }</a> <a href="#"><span
								class="ion-ios-star-outline"></span></a> <a href="#"><span
								class="ion-ios-star-outline"></span></a> <a href="#"><span
								class="ion-ios-star-outline"></span></a> <a href="#"><span
								class="ion-ios-star-outline"></span></a> <a href="#"><span
								class="ion-ios-star-outline"></span></a>
						</p>
					</div>
					<input type="hidden" value="${prdData.p_PRICE}" id="hiddenprice">
					<p class="price">
						<span id="mainPrice"><fmt:formatNumber value="${prdData.p_PRICE}" pattern="#,###,###" /></span><span>원</span>
					</p>

					<div class="row mt-4">
						<div class="col-md-6">
							<div class="form-group d-flex">
								<div class="select-wrap">
									<div class="icon">
										<span class="ion-ios-arrow-down"></span>
									</div>

								</div>
							</div>
						</div>
						<div class="w-100"></div>
						<div class="input-group col-md-6 d-flex mb-3">
							<!-- 							<span class="input-group-btn mr-2"> -->
							<!-- 								<button type="button" class="quantity_minus btn"> -->
							<!-- 									<i class="ion-ios-remove"></i> -->
							<!-- 								</button> -->
							<!-- 							</span> -->
							<input type="number" id="quantity" name="CART_COUNT"
								class="form-control input-number" value="1" min="1" max="100">
							<!-- 							<span class="input-group-btn ml-2"> -->
							<!-- 								<button type="button" class="quantity_plus btn"> -->

							<!-- 								</button> -->
							<!-- 							</span> -->
						</div>
						<div class="w-100"></div>
						<div class="col-md-12">
							<p style="color: #000;">
								<c:if test="${prdData.p_QUANTITY eq 0}">
							품절되었습니다.
							</c:if>
								<c:if test="${prdData.p_QUANTITY ne 0}">
							현재 주문 가능
							</c:if>
							</p>
						</div>
					</div>
					<p>
						<a class="btn btn-black py-3 px-5" onclick="add()" style="color:white">Add to
							Cart</a>
							
					</p>
				</div>
			</div>
		</div>
	</section>

	<section class="wrap-section">
		<div class="WRAP">
			<div class="ServiceWrap">
				<div class="service">
					<table class="product_service">
						<tr>
							<td><input type="button" class="svsBTN" name="serviceBTN"
								id="detail" value="상세정보"></td>
							<td><input type="button" class="svsBTN" name="serviceBTN"
								id="review" value="리뷰"></td>
							<td><input type="button" class="svsBTN" name="serviceBTN"
								id="qna" value="문의"></td>
							<td><input type="button" class="svsBTN" name="serviceBTN"
								id="return" value="교환/반품 정보"></td>
						</tr>
					</table>
				</div>

				<div class="DetailWrap">
					<div class="detail">
						<table border="1" class="product_detail">
							<tr>

								<td>
									<p>${prdData.p_DESCRIPTION}</p></td>

							</tr>
						</table>
					</div>
				</div>
				<div class="ReviewWrap">
					<div class="review">
						<p>전체 리뷰</p>
					</div>
					<span class="product_review"><select name="filter"
						id="filter">
							<option value="all" selected>모든 리뷰</option>
							<option value="new">최신 등록순</option>
							<option value="high">평점 높은순</option>
							<option value="low">평점 낮은순</option>
					</select></span>
					<c:if test="${listcount2 > 0 }">
						<c:set var="num" value="${listcount2-(page2-1)*10 }" />
						<c:forEach var="review" items="${reviewlist}">
							<div id="review_subwrap">
								<div id="review_top">
									<span id="star"> <c:choose>
											<c:when test="${review.REVIEW_RATE eq 1}">
												<i class="fa fa-star checked"></i>
											</c:when>
											<c:when test="${review.REVIEW_RATE eq 2}">
												<i class="fa fa-star checked"></i>
												<i class="fa fa-star checked"></i>
											</c:when>
											<c:when test="${review.REVIEW_RATE eq 3}">
												<i class="fa fa-star checked"></i>
												<i class="fa fa-star checked"></i>
												<i class="fa fa-star checked"></i>
											</c:when>
											<c:when test="${review.REVIEW_RATE eq 4}">
												<i class="fa fa-star checked"></i>
												<i class="fa fa-star checked"></i>
												<i class="fa fa-star checked"></i>
												<i class="fa fa-star checked"></i>
											</c:when>
											<c:when test="${review.REVIEW_RATE eq 5}">
												<i class="fa fa-star checked"></i>
												<i class="fa fa-star checked"></i>
												<i class="fa fa-star checked"></i>
												<i class="fa fa-star checked"></i>
												<i class="fa fa-star checked"></i>
											</c:when>
										</c:choose>

									</span> <span id="review_writer">${review.REVIEW_WRITER}&ensp;
										${review.REVIEW_DATE}</span>
								</div>
								<div id="review_body">
									<span><img src="resources/reviewupload/${review.REVIEW_IMG}"
										id="review_img"> </span> <span id="review_prdname">&ensp;&ensp;&ensp;${prdData.p_NAME }
									</span> <br>
									<p id="review_content">${review.REVIEW_CONTENT }</p>

								</div>
							</div>
						</c:forEach>
					</c:if>

					<c:if test="${listcount2 == 0 }">
						<div id="message2">등록된 리뷰가 없습니다.</div>
					</c:if>
				</div>

				<c:if test="${listcount2 > 0 }">
					<div class="center-block">

						<div class="row">
							<div class="col">
								<ul class="pagination">
									<c:if test="${page2 <= 1 }">
										<li class="page-item"><a
											class="page-link pgnation_review" href="#">이전&nbsp;</a></li>
									</c:if>
									<c:if test="${page2 > 1 }">
										<li class="page-item"><a href="detail?page=${page2 - 1 }"
											class="page-link pgnation_review">이전</a>&nbsp;</li>
									</c:if>

									<c:forEach var="a" begin="${startpage2 }" end="${endpage2 }">
										<c:if test="${a == page2 }">
											<li class="page-item"><a
												class="page-link pgnation_review" href="#">${a }</a></li>
										</c:if>
										<c:if test="${a != page2 }">
											<li class="page-item"><a href="detail?page=${a }"
												class="page-link pgnation_review">${a }</a></li>
										</c:if>
									</c:forEach>

									<c:if test="${page2 >= maxpage2 }">
										<li class="page-item"><a
											class="page-link pgnation_review" href="#">&nbsp;다음</a></li>
									</c:if>
									<c:if test="${page2 < maxpage2 }">
										<li class="page-item"><a href="detail?page=${page2+1 }"
											class="page-link pgnation_review">&nbsp;다음</a></li>
									</c:if>
								</ul>
							</div>
						</div>
					</div>
				</c:if>




				<div class="QnaWrap">
					<div class="qna">
						<p>문의</p>
					</div>
					<span class="qna_category"><select name="category"
						id="category">
							<option value="all" selected>문의유형(전체)</option>
							<option value="prd">상품</option>
							<option value="track">배송</option>
							<option value="return">반품/취소</option>
							<option value="swap">교환/변경</option>
							<option value="swap">기타</option>
					</select></span>
					<table class="qna_subjects">
						<colgroup width="10%">

							<colgroup width="8%">
						
						<colgroup width="52%">
						
						<colgroup width="10%">
						
						<colgroup width="20%">
						
						<tr>
							<td>문의유형</td>
							<td>답변상태</td>
							<td>문의/답변</td>
							<td>작성자</td>
							<td>작성일</td>
						</tr>						

						<c:if test="${listcount > 0 }">
							<c:set var="num" value="${listcount-(page-1)*10}" />
							<c:forEach var="qna" items="${qnalist}">
								<tr>
									<c:choose>
										<c:when test="${qna.QNA_CATEGORY eq 0 }">
											<td>배송</td>
										</c:when>
										<c:when test="${qna.QNA_CATEGORY eq 1 }">
											<td>상품</td>
										</c:when>
										<c:when test="${qna.QNA_CATEGORY eq 2 }">
											<td>반품/취소</td>
										</c:when>
										<c:when test="${qna.QNA_CATEGORY eq 3 }">
											<td>기타</td>
										</c:when>
									</c:choose>
									<c:choose>
										<c:when test="${qna.QNA_ISRESPONSE eq 0 }">
											<td>답변대기</td>
										</c:when>
										<c:when test="${qna.QNA_ISRESPONSE eq 1 }">
											<td>답변완료</td>
										</c:when>
									</c:choose>
									<td class="clickable">${qna.QNA_SUBJECT}</td>
									<td>${qna.QNA_WRITER}</td>
									<td>${qna.QNA_DATE}</td>

								</tr>

								<tr class='qna_content'>
									<td></td>
									<td></td>
									<td><br>
									<c:if test= "${qna.QNA_SECRET eq 1 && qna.QNA_WRITER ne USER_ID}">
									비밀글로 작성되었습니다.<hr> 
									</c:if>
									<c:if test= "${qna.QNA_SECRET eq 1 && qna.QNA_WRITER eq USER_ID}">
									문의 :&emsp;${qna.QNA_CONTENT}<br> 
									</c:if>
									<c:if test= "${qna.QNA_SECRET eq 0 && qna.QNA_WRITER eq USER_ID }">
									문의 :&emsp;${qna.QNA_CONTENT}<br> 
									</c:if>
									<c:if test= "${qna.QNA_SECRET eq 0 && qna.QNA_WRITER ne USER_ID }">
									문의 :&emsp;${qna.QNA_CONTENT}<hr> 
									</c:if>
																	
									<c:if
											test="${USER_ID eq qna.QNA_WRITER}">
											<a
												onclick="window.open('qnaUpdateView?num=${qna.QNA_NO}','qnaWrite_pop','width=670,height=510,location=no,status=no,scrollbars=yes');"
												id='qnaUpdate'> 수정 </a>
											&emsp;
											<a href='qnaDelete?qna_no=${qna.QNA_NO }' id='qnaDelete'>삭제</a><hr>
											<c:if test ="${qna.QNA_ISRESPONSE eq 1 && qna.QNA_WRITER eq USER_ID}">
									 답변 :&emsp;${qna.QNA_ANSWER}<hr>
									</c:if>

										</c:if></td>
									<td></td>
									<td></td>
								</tr>
								<input type="hidden" value="${qna.QNA_NO}" name="QNA_NO">
							</c:forEach>
						</c:if>
						
						
						<c:if test="${listcount == 0 }">
							<td id="message" colspan="5">등록된 글이 없습니다.</td>
						</c:if>
					</table>
					
					
					<c:if test="${listcount > 0 }">
						<div class="center-block">

							<div class="row">
								<div class="col">
									<ul class="pagination">
										<c:if test="${page <= 1 }">
											<li class="page-item"><a class="page-link pgnation_qna"
												href="#">이전&nbsp;</a>
											</li>
										</c:if>
										<c:if test="${page > 1 }">
											<li class="page-item"><a href="detail?page=${page-1 }"
												class="page-link pgnation_qna">이전</a>&nbsp;</li>
										</c:if>

										<c:forEach var="a" begin="${startpage }" end="${endpage }">
											<c:if test="${a == page }">
												<li class="page-item"><a class="page-link pgnation_qna"
													href="#">${a }</a>
												</li>
											</c:if>
											<c:if test="${a != page }">
												<li class="page-item"><a href="detail?page=${a }"
													class="page-link pgnation_qna">${a }</a></li>
											</c:if>
										</c:forEach>

										<c:if test="${page >= maxpage }">
											<li class="page-item"><a class="page-link pgnation_qna"
												href="#">&nbsp;다음</a>
											</li>
										</c:if>
										<c:if test="${page < maxpage }">
											<li class="page-item"><a href="detail?page=${page+1 }"
												class="page-link pgnation_qna">&nbsp;다음</a></li>
										</c:if>
									</ul>
								</div>
							</div>
						</div>
					</c:if>

					<span class="qnaWrite">
					<c:if test="${USER_ID ne null}">
						<button
							onclick="window.open('qnaWrite?QNA_P_NO=${prdData.p_NO}','qnaWrite_pop','width=670,height=510,location=no,status=no,scrollbars=yes');">상품
							문의하기</button>
							</c:if>
					</span>

				</div>


				<div class="ReturnWrap">
					<div class="seller">
						<p>반품/교환 정보</p>
					</div>
					<table class="seller_info">
						<colgroup width="15%">
						
						<colgroup width="85%">
						
						<tr>
							<td>고객문의 대표번호</td>
							<td>&emsp;070-5133-4629</td>
						</tr>
						<tr>
							<td>고객응대 가능시간</td>
							<td>&emsp;10시 ~ 17시 (점심시간,토요일,일요일,공휴일 제외)</td>
						</tr>
						<tr>
							<td>반품/교환 배송비</td>
							<td>&emsp;(구매자귀책) 3,000원/6,000원 / 초기배송비 무료시 반품배송비 부과방법 :
								왕복(편도x2)</td>
						</tr>
						<tr>
							<td>반품/교환지 주소</td>
							<td>&emsp;보내실 곳: 08507 서울특별시 금천구 가산디지털1로 128 (가산동,에스티엑스브이타워)
								16층 1603호</td>
						</tr>
						<tr>
							<td>반품/교환 기준</td>
							<td>&emsp;상품 수령 후 7일 이내에 신청하실 수 있습니다.<br> &emsp; 단, 제품이
								표시광고 내용과 다르거나 불량 등 계약과 다르게 이행된 경우는<br> &emsp;제품 수령일부터 3개월
								이내, 그 사실을 안 날 또는 알 수 있었던 날부터 30일이내에 교환/반품이 가능합니다<br>
								&emsp;추가적으로 다음의 경우 해당하는 반품/교환은 신청이 불가능할 수 있습니다.<br> &emsp;-
								소비자의 책임 있는 사유로 상품 등이 멸실 또는 훼손된 경우 (단지, 상품 확인을 위한 포장 훼손 제외)<br>
								&emsp;- 소비자의 사용 또는 소비에 의해 상품 등의 가치가 현저히 감소한 경우<br> &emsp;-
								시간의 경과에 의해 재판매가 곤란할 정도로 상품 등의 가치가 현저히 감소한 경우<br> &emsp;-
								복제가 가능한 상품 등의 포장을 훼손한 경우<br> &emsp;- 소비자의 주문에 따라 개별적으로 생산되는
								상품이 제작에 들어간 경우
							</td>
						</tr>
					</table>

				</div>

			</div>
			<!-- class="ServiceWrap" 끝 -->
		<div class="SelectedWrap">

								<div class="selected">
					<table class="product_selected">
						<tr>
							<td></td>
						</tr>
						

						<tr>
							<td>
								<div class="chosen">
									<span id="prd_img"><img
														src="resources/upload/${prdData.p_IMG}" class="img-fluid"
														name="P_IMG" alt="Colorlib Template" id="detailIMG"> </span> <span
														id="prd_name">${prdData.p_NAME}</span>
								</div>

								<div class="option_detail">
									<label><input type="number" id="tno" value="1" min="1"></label>
									<span id="tno_price">${prdData.p_PRICE}</span>원
								</div>
							</td>
						</tr>
						<tr>
							<td>
								<div class="total_price">
									<span class="total">총</span><span class="totalprice"><fmt:formatNumber
															value="${prdData.p_PRICE}" pattern="#,###,###" /></span><span>원</span>
								</div>
								<div class="checkout">
								<form action="/dim2/pay" onsubmit="return chkoutGo()" >
								<input type="hidden" id="prd_no" value="${prdData.p_NO}" name="P_NO">
									    <input type="hidden" name="P_NAME" value="${prdData.p_NAME}">
									    <input type="hidden" name="P_QUANTITY" value="${prdData.p_QUANTITY}">
										<input type="hidden" name="USER_ID" value="${USER_ID }">
										<input type="hidden" name="COUNT" id="COUNT" value="">
										<input type="submit" class="checkoutGo" value="결제하기"/>
									<button class="cartGo" value="장바구니" onclick="add()">장바구니</button>	
								</form>
										
								</div>
							</td>
						</tr>

					</table>
				</div>
			</div>
			<!-- class="SelectedWrap" 끝 -->




		
						</div>
		<!-- class="WRAP" 끝 -->
	</section>

	<section class="ftco-section ftco-no-pt ftco-no-pb py-5 bg-light"
		style="clear: both">
		<div class="container py-4">
			<div class="row d-flex justify-content-center py-5">
				<div class="col-md-6">
					<h2 style="font-size: 22px;" class="mb-0">Subcribe to our
						Newsletter</h2>
					<span>Get e-mail updates about our latest shops and special
						offers</span>
				</div>
				<div class="col-md-6 d-flex align-items-center">
					<form action="#" class="subscribe-form">
						<div class="form-group d-flex">
							<input type="text" class="form-control"
								placeholder="Enter email address"> <input type="submit"
								value="Subscribe" class="submit px-3">
						</div>
					</form>
				</div>
			</div>
		</div>
	</section>
	<footer class="ftco-footer ftco-section" style="clear: both">
		<div class="container">
			<div class="row"></div>
		</div>
		<div class="row mb-5">
			<div class="col-md">
				<div class="ftco-footer-widget mb-4">
					<h2 class="ftco-heading-2">Vegefoods</h2>
					<p>Far far away, behind the word mountains, far from the
						countries Vokalia and Consonantia.</p>
					<ul
						class="ftco-footer-social list-unstyled float-md-left float-lft mt-5">
						<li class="ftco-animate"><a href="#"><span
								class="icon-twitter"></span></a></li>
						<li class="ftco-animate"><a href="#"><span
								class="icon-facebook"></span></a></li>
						<li class="ftco-animate"><a href="#"><span
								class="icon-instagram"></span></a></li>
					</ul>
				</div>
			</div>
			<div class="col-md">
				<div class="ftco-footer-widget mb-4 ml-md-5">
					<h2 class="ftco-heading-2">Menu</h2>
					<ul class="list-unstyled">
						<li><a href="#" class="py-2 d-block">Shop</a></li>
						<li><a href="#" class="py-2 d-block">About</a></li>
						<li><a href="#" class="py-2 d-block">Journal</a></li>
						<li><a href="#" class="py-2 d-block">Contact Us</a></li>
					</ul>
				</div>
			</div>
			<div class="col-md-4">
				<div class="ftco-footer-widget mb-4">
					<h2 class="ftco-heading-2">Help</h2>
					<div class="d-flex">
						<ul class="list-unstyled mr-l-5 pr-l-3 mr-4">
							<li><a href="#" class="py-2 d-block">Shipping
									Information</a></li>
							<li><a href="#" class="py-2 d-block">Returns &amp;
									Exchange</a></li>
							<li><a href="#" class="py-2 d-block">Terms &amp;
									Conditions</a></li>
							<li><a href="#" class="py-2 d-block">Privacy Policy</a></li>
						</ul>
						<ul class="list-unstyled">
							<li><a href="#" class="py-2 d-block">FAQs</a></li>
							<li><a href="#" class="py-2 d-block">Contact</a></li>
						</ul>
					</div>
				</div>
			</div>
			<div class="col-md">
				<div class="ftco-footer-widget mb-4">
					<h2 class="ftco-heading-2">Have a Questions?</h2>
					<div class="block-23 mb-3">
						<ul>
							<li><span class="icon icon-map-marker"></span><span
								class="text">203 Fake St. Mountain View, San Francisco,
									California, USA</span></li>
							<li><a href="#"><span class="icon icon-phone"></span><span
									class="text">+2 392 3929 210</span></a></li>
							<li><a href="#"><span class="icon icon-envelope"></span><span
									class="text">info@yourdomain.com</span></a></li>
						</ul>
					</div>
				</div>
			</div>
		</div>
		<div class="row">
			<div class="col-md-12 text-center">

				<p>
					<!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
					Copyright &copy;
					<script>
						document.write(new Date().getFullYear());
					</script>
					All rights reserved | This template is made with <i
						class="icon-heart color-danger" aria-hidden="true"></i> by <a
						href="https://colorlib.com" target="_blank">Colorlib</a>
					<!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
				</p>
			</div>
		</div>
		</div>
	</footer>



	<!-- loader -->
	<div id="ftco-loader" class="show fullscreen">
		<svg class="circular" width="48px" height="48px">
			<circle class="path-bg" cx="24" cy="24" r="22" fill="none"
				stroke-width="4" stroke="#eeeeee" />
			<circle class="path" cx="24" cy="24" r="22" fill="none"
				stroke-width="4" stroke-miterlimit="10" stroke="#F96D00" /></svg>
	</div>



	<script src="resources/js/jquery-migrate-3.0.1.min.js"></script>
	<script src="resources/js/popper.min.js"></script>
	<script src="resources/js/jquery.easing.1.3.js"></script>
	<script src="resources/js/jquery.waypoints.min.js"></script>
	<script src="resources/js/jquery.stellar.min.js"></script>
	<script src="resources/js/owl.carousel.min.js"></script>
	<script src="resources/js/jquery.magnific-popup.min.js"></script>
	<script src="resources/js/aos.js"></script>
	<script src="resources/js/jquery.animateNumber.min.js"></script>
	<script src="resources/js/bootstrap-datepicker.js"></script>
	<script src="resources/js/scrollax.min.js"></script>
	<script
		src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBVWaKrjvy3MaE7SQ74_uJiULgl1JY0H2s&sensor=false"></script>
	<script src="resources/js/google-map.js"></script>
	<script src="resources/js/main.js"></script>

	<script>
		$(document).ready(function() {

			var quantitiy = 0;
			$('.quantity-right-plus').click(function(e) {

				// Stop acting like a button
				e.preventDefault();
				// Get the field name
				var quantity = parseInt($('#quantity').val());

				// If is not undefined

				$('#quantity').val(quantity + 1);

				// Increment

			
			});

			$('.quantity-left-minus').click(function(e) {
				// Stop acting like a button
				e.preventDefault();
				// Get the field name
				var quantity = parseInt($('#quantity').val());

				// If is not undefined

				// Increment
				if (quantity > 0) {
					$('#quantity').val(quantity - 1);
				}
			});

		});

		function add(){
			
			var no = $('#prd_no').val()
			var data = {"CART_ID" : $('#loginid').val(), "CART_P_NO" : no, "CART_COUNT" : $('#quantity').val()}
			$.ajax({
				type : "POST",
				url : "addCart",
				data : data,
				success : function(data) {
					alert(data)
			}
			})			
		}
		
		function chkoutGo(){
			var idchk = $('#loginid').val();
			if(idchk == '') {
				alert('로그인 하셔야 합니다.');
				return false;
			} else {
				alert('이거 되는거?');
                return true;
			}
		}
		

			
		
		
	</script>

</body>
</html>