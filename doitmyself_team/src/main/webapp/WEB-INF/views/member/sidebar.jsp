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
	<!-- <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css"> -->
	
	<link href="resources/css/homecss/style.css" rel="stylesheet">
	<script src="resources/soo/js/core/jquery.min.js"></script>
  
	<!-- CSS Files -->
	<link href="resources/soo/css/bootstrap-soo.css" rel="stylesheet">
	<link href="resources/soo/demo/demo.css" rel="stylesheet">
	<link href="resources/soo/css/paper-dashboard.css" rel="stylesheet">
	<style type="text/css">/* Chart.js */
@-webkit-keyframes chartjs-render-animation{from{opacity:0.99}to{opacity:1}}@keyframes chartjs-render-animation{from{opacity:0.99}to{opacity:1}}.chartjs-render-monitor{-webkit-animation:chartjs-render-animation 0.001s;animation:chartjs-render-animation 0.001s;}


</style>


	<style>
		.mar20 {margin-left:20px}
		.active .nc-icon{color:#37a4bd!important;}
 	.active{padding-left:10px; transition:.3s;}
 	.active p{color:#3c8dbc!important}
	</style>
	<script>
	
		$(document).ready(function(){
			
			$('.nav li').hover(function(){
				$(this).css('background','#e3e3e3')
						.css('transition','.3s')
						.css('padding-left','10px')
						.children().children().css('color','#3c8dbc').css('transition','.3s');

			},function(){//hover 떠낫을때
				$(this).css('background','white')
		  				.css('transition','.3s')
		  				.css('padding-left','0')
						.children().children().css('color','gray').css('transition','.3s');
			})
			
			
			var doc = $('.doc').val();
			console.log(doc);
  			switch (doc) {
			case 'mi':
				$('.nav').children().eq(0).addClass('active');
				break;
			case 'sc':
				$('.nav').children().eq(0).addClass('active');
				break;
			case 'ml':
				$('.nav').children().eq(0).addClass('active');
				break;
			
			case 'od':
				$('.nav').children().eq(1).addClass('active');
				break;
			case 'cp':
				$('.nav').children().eq(1).addClass('active');
				break;
				
			case 'rl':
				$('.nav').children().eq(2).addClass('active');
				break;
			case 'ql':
				$('.nav').children().eq(2).addClass('active');
				break;
				
			case 'wl':
				$('.nav').children().eq(3).addClass('active');
				break;
			
			default:
				break;
		}
			
		});
  		
	</script>
</head>

<body>
<input type="hidden" value="${doc}" class="doc">
<div class="sidebar" data-color="white" data-active-color="danger" style="position: absolute;">     
			<div class="logo" style="background: #f4f3ef">
        		<a href="memberInfo?USER_ID=${USER_ID }" class="simple-text logo-normal" style="text-align:center; font-size:17px;">
          		${USER_ID } 님
        		</a>
      		</div>
      		
      		<div class="sidebar-wrapper" data-ps-id="430cdca9-89f6-13a3-3bfb-213675c1e7ec">
        		<ul class="nav" id="sidenav01">
          			<li>
						<a href="memberInfo" data-toggle="collapse" data-target="#toggleDemo1" data-parent="#sidenav01" class="collapsed ">
              				<i class="nc-icon nc-single-02"></i>
              				<p>회원 정보</p>
            			</a>
            			<div class="collapse" id="toggleDemo1" style="height: 0px;">
							<ul class="nav nav-list">
								<li class="mar20"><a href="memberInfo?USER_ID=${USER_ID }&doc=mi">회원 정보 변경</a></li>
								<li class="mar20"><a href="sellerChange?USER_ID=${USER_ID }&doc=sc">판매자 전환</a></li>
								<li class="mar20"><a href="memberLeave?USER_ID=${USER_ID }&doc=ml">회원 탈퇴</a></li>
							</ul>
						</div>
          			</li>
          			<li>
            			<a href="MyShop" data-toggle="collapse" data-target="#toggleDemo2" data-parent="#sidenav01" class="collapsed">
	              			<i class="nc-icon nc-credit-card"></i>
	              			<p>나의 쇼핑 목록</p>
            			</a>
            			<div class="collapse" id="toggleDemo2" style="height: 0px;">
							<ul class="nav nav-list">
								<li class="mar20"><a href="orderDelivery?USER_ID=${USER_ID }&doc=od">주문 / 배송 조회</a></li>
								<li class="mar20"><a href="cancelProcess?USER_ID=${USER_ID }&doc=cp">취소 / 반품 / 교환 현황</a></li>
							</ul>
						</div>
          			</li>
          			
		          	<li>
		            	<a href="ReviewQna" id="ReviewQna" data-toggle="collapse" data-target="#toggleDemo3" data-parent="#sidenav01" class="collapsed">
			              	<i class="nc-icon nc-chat-33"></i>
			              	<p>리뷰 및 QnA</p>
		            	</a>
		            	<div class="collapse" id="toggleDemo3" style="height: 0px;">
							<ul class="nav nav-list">
								<li class="mar20"><a href="reviewList?USER_ID=${USER_ID }&doc=rl">나의 상품 리뷰</a></li>
								<li class="mar20"><a href="qnaList?USER_ID=${USER_ID }&doc=ql">나의 QnA</a></li>
							</ul>
						</div>
		          	</li>
		          	<li>
            			<a href="wishList?D_USER_ID=${USER_ID }&doc=wl" id="wishList" class="collapsed">
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
