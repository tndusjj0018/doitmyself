<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html class="perfect-scrollbar-on"><head>
	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
	<title>
 	주문 / 배송 조회
	</title>
	<meta content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0, shrink-to-fit=no" name="viewport">
	
	<!-- CSS Files -->
	<link href="resources/soo/css/orderDelivery.css" rel="stylesheet">
</head>

<body class="">
	<div class="wrapper ">
		<jsp:include page="sidebar.jsp"></jsp:include>
		
		<div class="main-panel ps-container ps-theme-default" data-ps-id="e601a05f-e1a5-7530-c875-a9fb1d61329a">
		<!-- Navbar -->
			<nav class="navbar navbar-expand-lg navbar-absolute fixed-top navbar-transparent">
        		<div class="container-fluid">
					<div class="navbar-wrapper">
						<div class="navbar-toggle">
							<button type="button" class="navbar-toggler">
				                <span class="navbar-toggler-bar bar1"></span>
				                <span class="navbar-toggler-bar bar2"></span>
				                <span class="navbar-toggler-bar bar3"></span>
              				</button>
            			</div>
            			
						<a class="navbar-brand" href="#pablo">나의 쇼핑 목록</a>
          			</div>
          			
          			<button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navigation" aria-controls="navigation-index" aria-expanded="false" aria-label="Toggle navigation">
		            	<span class="navbar-toggler-bar navbar-kebab"></span>
			            <span class="navbar-toggler-bar navbar-kebab"></span>
			            <span class="navbar-toggler-bar navbar-kebab"></span>
          			</button>
          			
          			<div class="collapse navbar-collapse justify-content-end" id="navigation">
		            	
            			
            			<ul class="navbar-nav">
							
              				<li class="nav-item btn-rotate dropdown">
                				<a class="nav-link dropdown-toggle" href="http://example.com" id="navbarDropdownMenuLink" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                  					<i class="nc-icon nc-bell-55"></i>
                  					<p><span class="d-lg-none d-md-block">Some Actions</span></p>
                				</a>
                				<div class="dropdown-menu dropdown-menu-right" aria-labelledby="navbarDropdownMenuLink">
                  					<a class="dropdown-item" href="#">Action</a>
                  					<a class="dropdown-item" href="#">Another action</a>
                  					<a class="dropdown-item" href="#">Something else here</a>
                				</div>
              				</li>             				
            			</ul>
					</div>
        		</div>
      		</nav>
      		<!-- End Navbar -->
     
			<div class="content">
			  <div class="row">
			    <div class="col-md-9">
			      <div class="card card-user">
			        <div class="card-header">
			          <h5 class="card-title">주문 / 배송 조회</h5>
			        </div>
			        <div class="card-body">
			        	<div class="container">
			        	
			        	<!-- 주문내역 있는 경우 -->
			        	<c:if test="${ordercount > 0}">
			        	<table class="table">
							<tr>
								<td>주문 일자</td> <td colspan="2">주문 상품 정보</td> <td>상품 금액 (수량)</td> <td>주문상태</td> <td>신청 및 조회</td>
							</tr>
							<c:forEach var="ol" items="${orderlist}">
							<tr>
								<td>
								${ol.ORDER_DATE }
								</td>
								<td>
									<img src="resources/soo/img/product.PNG" class="product_img" onclick="alert('제품 상세 페이지로 넘어감')">
								</td>
								<td>
									<span onclick="alert('제품 상세 페이지로 넘어감')">데이터 불러와야돼~ 수정!</span>
								</td>
								<td>
									[계산식]원<br>
									(${ol.ORDER_AMOUNT }개)
								</td>
								
									<c:if test="${ol.ORDER_DELIVERY == 0}">
									<td>
										<span class="order_status">주문완료</span><br>
									</td>
									<td>
										<button type="button" class="btn" id="btn-cancel">취소 신청</button>
									</td>
									</c:if>
									<c:if test="${ol.ORDER_DELIVERY == 1}">
									<td>
										<span class="order_status">결제완료</span><br>
									</td>
									<td>
										<button type="button" class="btn" id="btn-cancel">취소 신청</button>
									</td>
									</c:if>
									<c:if test="${ol.ORDER_DELIVERY == 2}">
									<td>
										<span class="order_status">상품 준비중</span><br>
									</td>
									<td>
										<button type="button" class="btn" id="btn-cancel">취소 신청</button>
									</td>
									</c:if>
									<c:if test="${ol.ORDER_DELIVERY == 3}">
									<td>
										<span class="order_status">배송중</span><br>
									</td>
									<td>
										<button type="button" class="btn" id="btn-order">배송조회</button>
									</td>
									</c:if>
									<c:if test="${ol.ORDER_DELIVERY == 4}">
									<td>
										<span class="order_status">배송완료</span><br>
									</td>
									<td>
										<button type="button" class="btn" id="btn-return">반품 신청</button>
									</td>	
									</c:if>
									<!-- <button type="button" class="btn" id="btn-order">배송조회</button> -->
								
								
														
							</tr>
							</c:forEach>
						</table>
						</c:if>
						
						<!-- 주문 내역 없는 경우 -->
						<c:if test="${ordercount == 0}">
							<div class="container">
			    				<div class="leaveInfo">
			    					<i class="nc-icon nc-cart-simple"></i>			     	        		
			        				<span>주문한 상품이 없습니다.</span>
			        			</div>
			        			<input type="button" id="sellerPageGo" name="sellerPageGo" class="btn btn-primary btn-round" value="상품 보러 가기" 
			        			   style="margin-left:38%; margin-right:15px;" onclick="alert('상품 목록 페이지');">
			        		</div>
						</c:if>
						</div>
			        </div>
			      </div>
			    </div>
			  </div>
			</div>
    		
    		<div class="ps-scrollbar-x-rail" style="left: 0px; bottom: 0px;">
    			<div class="ps-scrollbar-x" tabindex="0" style="left: 0px; width: 0px;"></div>
    		</div>
    		<div class="ps-scrollbar-y-rail" style="top: 0px; right: 0px;">
    			<div class="ps-scrollbar-y" tabindex="0" style="top: 0px; height: 0px;"></div>
    		</div>
    	</div>
	</div>
	
	<!--   Core JS Files   -->
	
	<script src="resources/soo/js/core/popper.min.js"></script>
	<script src="resources/soo/js/core/bootstrap.min.js"></script>
	<script src="resources/soo/js/plugins/perfect-scrollbar.jquery.min.js"></script>
	<!--  Google Maps Plugin    -->
	<script src="https://maps.googleapis.com/maps/api/js?key=YOUR_KEY_HERE"></script>
	<!-- Chart JS -->
	<script src="resources/soo/js/plugins/chartjs.min.js"></script>
	<!--  Notifications Plugin    -->
	<script src="resources/soo/js/plugins/bootstrap-notify.js"></script>
	<!-- Control Center for Now Ui Dashboard: parallax effects, scripts for the example pages etc -->
	<script src="resources/soo/js/paper-dashboard.min.js" type="text/javascript"></script>
	<!-- Paper Dashboard DEMO methods, don't include it in your project! -->
	<script src="resources/soo/demo/demo.js"></script>
	
</body>
</html>