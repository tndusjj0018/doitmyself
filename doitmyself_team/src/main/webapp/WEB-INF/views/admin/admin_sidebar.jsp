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
	<link href="resources/css/yehyeong_css/bootstrap-soo.css" rel="stylesheet">
	<link href="resources/css/yehyeong_css/demo/demo.css" rel="stylesheet">
	<link href="resources/css/yehyeong_css/css/paper-dashboard.css" rel="stylesheet">
	<linK href = "resources/css/yehyeong_css/fonts/nucleo-icons.eot" rel="stylesheet">
	<linK href = "resources/css/yehyeong_css/fonts/nucleo-icons.ttf" rel="stylesheet">
	<linK href = "resources/css/yehyeong_css/fonts/nucleo-icons.woff" rel="stylesheet">
	<linK href = "resources/css/yehyeong_css/fonts/nucleo-icons.woff2" rel="stylesheet">
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
				$(this)	.css('transition','.3s')
						.css('padding-left','10px') //children().next().children().next()
						.children().children().css('color','#3c8dbc').css('transition','.3s');

			},function(){//hover 떠낫을때
				$(this)	.css('transition','.3s')
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
				
			case 'cl':
				$('.nav').children().eq(4).addClass('active');
				break;
			
			default:
				break;
		}
			
		});
  		
	</script>
</head>

<body>
<input type="hidden" value="${USER_ID}" id="USER_ID">
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
						<a href="#" data-toggle="collapse" data-target="#toggleDemo1" data-parent="#sidenav01" class="collapsed ">
              				<i class="nc-icon nc-single-02"></i>
              				<p>회원 정보</p>
            			</a>
            			<div class="collapse" id="toggleDemo1" style="height: 0px;">
							<ul class="nav nav-list">
								<li class="mar20"><a href="admin?doc=userview">회원 관리</a></li>
								<li class="mar20"><a href="admin?doc=review_management">리뷰 관리</a></li>
							</ul>
						</div>
          			</li>
          			<li>
            			<a href="admin?doc=seller_info" data-toggle="collapse" data-target="#toggleDemo2" data-parent="#sidenav01" class="collapsed">
	              			<i class="nc-icon nc-alert-circle-i"></i>
	              			<p>판매자 관리</p>
            			</a>
          			</li>
          			
		          	<li>
		            	<a href="#" id="ReviewQna" data-toggle="collapse" data-target="#toggleDemo3" data-parent="#sidenav01" class="collapsed">
			              	<i class="nc-icon nc-credit-card"></i>
			              	<p>주문 관리</p>
		            	</a>
		            	<div class="collapse" id="toggleDemo3" style="height: 0px;">
							<ul class="nav nav-list">
								<li class="mar20"><a href="admin?doc=orderlist">전체 주문 내역</a></li>
								<li class="mar20"><a href="admin?doc=refundlist">환불 내역</a></li>
								<%-- <li class="mar20"><a href="admin?doc=exchange_list">교환 내역</a></li> --%>
							</ul>
						</div>
		          	</li>
		          	<li>
            			<a href="#" id="wishList" class="collapsed" data-toggle="collapse" data-target="#toggleDemo4" data-parent="#sidenav01">
	              			<i class="nc-icon nc-favourite-28"></i>
	              			<p>카테고리 관리</p>
						</a>
						<div class="collapse" id="toggleDemo4" style="height: 0px;">
							<ul class="nav nav-list">
								<li class="mar20"><a href="admin?doc=category_management">카테고리 수정/삭제</a></li>
								<li class="mar20"><a href="admin?doc=add_category">카테고리 추가</a></li>
							</ul>
						</div>
          			</li>
          			
          			<li>
            			<a href="admin?doc=statics" id="cartList" class="collapsed">
	              			<i class="nc-icon nc-chart-pie-36"></i>
	              			<p>통계</p>
						</a>
          			</li>
          			<li>
            			<a href="admin?doc=admin_privilege_management" id="cartList" class="collapsed">
	              			<i class="nc-icon nc-settings-gear-65"></i>
	              			<p>관리자 권한 관리</p>
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
