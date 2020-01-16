<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
	<!--     Fonts and icons     -->
	<link href="https://fonts.googleapis.com/css?family=Montserrat:400,700,200" rel="stylesheet">
	<link href="https://maxcdn.bootstrapcdn.com/font-awesome/latest/css/font-awesome.min.css" rel="stylesheet">
  
	<!-- CSS Files -->
	<link href="resources/soo/css/bootstrap-soo.css" rel="stylesheet">
	<link href="resources/soo/demo/demo.css" rel="stylesheet">
	<link href="resources/soo/css/paper-dashboard.css" rel="stylesheet">
	<style type="text/css">/* Chart.js */
@-webkit-keyframes chartjs-render-animation{from{opacity:0.99}to{opacity:1}}@keyframes chartjs-render-animation{from{opacity:0.99}to{opacity:1}}.chartjs-render-monitor{-webkit-animation:chartjs-render-animation 0.001s;animation:chartjs-render-animation 0.001s;}</style>


	<style>
		.mar20 {margin-left:20px}
	</style>
</head>
<body>
<div class="sidebar" data-color="white" data-active-color="danger">     
			<div class="logo">
        		<a href="memberInfo" class="simple-text logo-normal" style="text-align:center; font-size:17px;">
          		${USER_ID } 님
        		</a>
      		</div>
      		
      		<div class="sidebar-wrapper ps-container ps-theme-default" data-ps-id="430cdca9-89f6-13a3-3bfb-213675c1e7ec">
        		<ul class="nav" id="sidenav01">
          			<li>
						<a href="memberInfo" data-toggle="collapse" data-target="#toggleDemo1" data-parent="#sidenav01" class="collapsed">
              				<i class="nc-icon nc-single-02"></i>
              				<p>회원 정보</p>
            			</a>
            			<div class="collapse" id="toggleDemo1" style="height: 0px;">
							<ul class="nav nav-list">
								<li class="mar20"><a href="memberInfo">회원 정보 변경</a></li>
								<li class="mar20"><a href="sellerChange">판매자 전환</a></li>
								<li class="mar20"><a href="memberLeave">회원 탈퇴</a></li>
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
								<li class="mar20"><a href="orderDelivery">주문 / 배송 조회</a></li>
								<li class="mar20"><a href="cancelProcess">취소 / 반품 / 교환 현황</a></li>
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
								<li class="mar20"><a href="reviewList">나의 상품 리뷰</a></li>
								<li class="mar20"><a href="qnaList">나의 QnA</a></li>
							</ul>
						</div>
		          	</li>
		          	<li>
            			<a href="wishList" class="collapsed">
	              			<i class="nc-icon nc-favourite-28"></i>
	              			<p>나의 관심 목록 <span class="badge pull-right" style="float: right!important; position:relative; top:6px">8</span></p>
	              			
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