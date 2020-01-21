<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%-- <header><jsp:include page="../main/header.jsp"></jsp:include></header> --%>
	<!--     Fonts and icons     -->
	<link href="https://fonts.googleapis.com/css?family=Montserrat:400,700,200" rel="stylesheet">
	<link href="https://maxcdn.bootstrapcdn.com/font-awesome/latest/css/font-awesome.min.css" rel="stylesheet">
	
	<script src="resources/soo/js/core/jquery.min.js"></script>
  
	<!-- CSS Files -->
	<link href="resources/soo/css/bootstrap-soo.css" rel="stylesheet">
	<link href="resources/soo/demo/demo.css" rel="stylesheet">
	<link href="resources/soo/css/paper-dashboard.css" rel="stylesheet">
	<style type="text/css">/* Chart.js */
@-webkit-keyframes chartjs-render-animation{from{opacity:0.99}to{opacity:1}}@keyframes chartjs-render-animation{from{opacity:0.99}to{opacity:1}}.chartjs-render-monitor{-webkit-animation:chartjs-render-animation 0.001s;animation:chartjs-render-animation 0.001s;}</style>


	<style>
		.mar20 {margin-left:20px}
	</style>
	<script>
	/* $(document).ready(function(){
  		var doc = $('.doc').val()
  		switch (doc) {
		case 'seller_info':
		case 'seller_infoUpdate':
			$('.nav').children().eq(0).addClass('active');
			break;
		case 'product':
			$('.nav').children().eq(1).addClass('active');
			break;
		case 'seller_order':
			$('.nav').children().eq(2).addClass('active');
			break;
		case 'seller_sale':
			$('.nav').children().eq(4).addClass('active');
			break;
		default:
			break;
		}
  		
  	}) */
	</script>
</head>
<body>

<div class="sidebar" data-color="white" data-active-color="danger">     
			<div class="logo">
        		<a href="memberInfo?USER_ID=${USER_ID }" class="simple-text logo-normal" style="text-align:center; font-size:17px;">
          		${USER_ID } 님
        		</a>
      		</div>
      		
      		<div class="sidebar-wrapper ps-container ps-theme-default" data-ps-id="430cdca9-89f6-13a3-3bfb-213675c1e7ec">
        		<ul class="nav" id="sidenav01">
          			<li class="active">
						<a href="memberInfo" data-toggle="collapse" data-target="#toggleDemo1" data-parent="#sidenav01" class="collapsed ">
              				<i class="nc-icon nc-single-02"></i>
              				<p>회원 정보</p>
            			</a>
            			<div class="collapse" id="toggleDemo1" style="height: 0px;">
							<ul class="nav nav-list">
								<li class="mar20"><a href="memberInfo?USER_ID=${USER_ID }">회원 정보 변경</a></li>
								<li class="mar20"><a href="sellerChange?USER_ID=${USER_ID }">판매자 전환</a></li>
								<li class="mar20"><a href="memberLeave?USER_ID=${USER_ID }">회원 탈퇴</a></li>
							</ul>
						</div>
          			</li>
          			<li>
            			<a href="memberChange" data-toggle="collapse" data-target="#toggleDemo2" data-parent="#sidenav01" class="collapsed">
	              			<i class="nc-icon nc-credit-card"></i>
	              			<p>나의 쇼핑 목록</p>
            			</a>
            			<div class="collapse" id="toggleDemo2" style="height: 0px;">
							<ul class="nav nav-list">
								<li class="mar20"><a href="orderDelivery?USER_ID=${USER_ID }">주문 / 배송 조회</a></li>
								<li class="mar20"><a href="cancelProcess?USER_ID=${USER_ID }">취소 / 반품 / 교환 현황</a></li>
							</ul>
						</div>
          			</li>
          			
		          	<li>
		            	<a href="#" data-toggle="collapse" data-target="#toggleDemo3" data-parent="#sidenav01" class="collapsed">
			              	<i class="nc-icon nc-chat-33"></i>
			              	<p>리뷰 및 QnA</p>
		            	</a>
		            	<div class="collapse" id="toggleDemo3" style="height: 0px;">
							<ul class="nav nav-list">
								<li class="mar20"><a href="reviewList?USER_ID=${USER_ID }">나의 상품 리뷰</a></li>
								<li class="mar20"><a href="qnaList?USER_ID=${USER_ID }">나의 QnA</a></li>
							</ul>
						</div>
		          	</li>
		          	<li>
            			<a href="wishList?D_USER_ID=${USER_ID }" class="collapsed">
	              			<i class="nc-icon nc-favourite-28"></i>
	              			<p>내가 찜한 상품</p>
	              			
						</a>
          			</li>
        		</ul>
      
      			<div class="ps-scrollbar-x-rail" style="width: 260px; left: 0px; bottom: 0px;">
      				<div class="ps-scrollbar-x" tabindex="0" style="left: 0px; width: 258px;"></div>
      			</div>
      			
      			<div class="ps-scrollbar-y-rail" style="top: 0px; right: 0px;">
      				<div class="ps-scrollbar-y" tabindex="0" style="top: 0px; height: 0px;"></div>
      			</div>
      		<div class="ps-scrollbar-x-rail" style="left: 0px; bottom: 0px;">
      			<div class="ps-scrollbar-x" tabindex="0" style="left: 0px; width: 0px;"></div>
      		</div>
      		
      		<div class="ps-scrollbar-y-rail" style="top: 0px; right: 0px;">
      			<div class="ps-scrollbar-y" tabindex="0" style="top: 0px; height: 0px;"></div>
      		</div>
      	</div>
	</div>
</body>
</html>
