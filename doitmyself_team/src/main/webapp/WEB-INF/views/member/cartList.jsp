<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html class="perfect-scrollbar-on"><head>
	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
	<title>
 	장바구니
	</title>
	<meta content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0, shrink-to-fit=no" name="viewport">
	
	<!-- CSS Files -->
	<link href="resources/soo/css/wishList.css" rel="stylesheet">
	
	<script src="resources/soo/js/core/jquery.min.js"></script>
	<script src="resources/soo/js/cartList.js"></script>
	
	<style>
		body > div > div.main-panel.ps-container.ps-theme-default > nav > div > div.navbar-wrapper > a:hover {color:#66615B !important}
		
		.center-block {
     		display: flex;  
    		justify-content:center; /* 가운데 정렬 */
    		position: relative;
    		top: 4px;
  		 }
   
   		select.form-control{width:auto;margin-bottom:2em;display:inline-block;}
   		.rows{text-align:right;}
   		.row{height:0}
   		.gray{color:gray} 
   		li .current {background:#faf7f7;} 
	</style>
</head>

<body class="">
<header><jsp:include page="../main/header.jsp"></jsp:include></header>
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
            			
						<a class="navbar-brand">장바구니</a>
          			</div>
          			
          			<button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navigation" aria-controls="navigation-index" aria-expanded="false" aria-label="Toggle navigation">
		            	<span class="navbar-toggler-bar navbar-kebab"></span>
			            <span class="navbar-toggler-bar navbar-kebab"></span>
			            <span class="navbar-toggler-bar navbar-kebab"></span>
          			</button>
          			
          			<div class="collapse navbar-collapse justify-content-end" id="navigation">
		            
					</div>
        		</div>
      		</nav>
      		<!-- End Navbar -->
     
			<div class="content">
			  <div class="row">
			    <div class="col-md-10">
			      <div class="card card-user" style="width:1100px;">
			        <div class="card-header">
			          <h5 class="card-title">CART<span class="badge" style="margin-left: 15px; position: relative; top: -4px;">${cartcount }</span></h5>
			        </div>
			        <div class="card-body">
			        	<div class="container">
			        	
			        	<!-- 찜 목록 있는 경우 -->
			        	<c:if test="${cartcount > 0}">
			        	<table class="table">
							<tr>
								<td></td><td>상품 번호</td> <td colspan="2">주문 상품 정보</td> <td>스토어 명</td> <td>상품 금액</td> <td>수량</td> <td>총 금액</td> <td>삭제</td>
							</tr>
							<c:forEach var="cl" items="${cartlist}">
							<c:set var= "total_price" value="${cl.CART_COUNT * cl.p_PRICE}" />
							<tr>
								<td>
									<input type="checkbox" name="buyproduct" class="buyproduct" value="${total_price }">
								</td>
								<td>
									<span class="cartpno">${cl.p_NO}</span>
								</td>
								<td>
									<img src="${cl.p_IMG }" class="product_img" onclick="location.href='detail?P_NO=${cl.p_NO}';">
								</td>
								<td>
									<span style="cursor: pointer" onclick="location.href='detail?P_NO=${cl.p_NO}';">${cl.p_NAME }</span>
								</td>
								<td>
									${cl.p_SELLER }
								</td>
								<td>
									${cl.p_PRICE }원
								</td>
								<td>
									<span class="cartcount">${cl.CART_COUNT }</span>개
								</td>
								<td>
									
									<c:out value="${total_price }"/>원
								</td>
								<td>
									<button type="button" id="btn-wishdelete" onclick="if(confirm('장바구니에서 삭제하시겠습니까?') == true)location.href='cartdelete?P_NO=${cl.p_NO}&USER_ID=${USER_ID }';"><img src="resources/soo/img/trash.png" style="width: 25px; height: 25px;"></button>
								</td>
							</tr>
							</c:forEach>
						</table>
						
						<div class="center-block">
							<div class="row">
								<div class="col">
									<ul class="pagination">
										<c:if test="${page <= 1 }">
											<li class="page-item">
												<a class="page-link current" href="#">이전&nbsp;</a>
											</li>
										</c:if>
										
										<c:if test="${page > 1 }">
											<li class="page-item">
												<a href="wishList?page=${page -1 }&USER_ID=${USER_ID}" class="page-link">이전</a> &nbsp;
											</li>
										</c:if>
										
										<c:forEach var="a" begin="${startpage }" end="${endpage }">
											<c:if test="${a==page }">
												<li class="page-item">
													<a class="page-link current" href="#">${a }</a>
												</li>
											</c:if>
											<c:if test="${a != page }">
												<li class="page-item">
													<a href="wishList?page=${a }&USER_ID=${USER_ID}" class="page-link">${a }</a>
												</li>
											</c:if>
										</c:forEach>
										
										<c:if test="${page >= maxpage }">
											<li class="page-item">
												<a class="page-link current" href="#">&nbsp;다음</a>
											</li>
										</c:if>
										<c:if test="${page < maxpage }">
											<li class="page-item">
												<a href="wishList?page=${page+1 }&USER_ID=${USER_ID}" class="page-link">&nbsp;다음</a>
											</li>
										</c:if>
										
									</ul>
								</div>
							</div>
						</div>
						
						<div style="display:table; float:right; padding:10px 30px 0 0; line-height:27px;">
						<table id="cart_checked">
							<thead>
								<tr>
									<th>총 주문 금액</th>
								</tr>
							</thead>
							<tbody>
								<!-- cartList ajax -->
							</tbody>
						</table>
						</div>
						</c:if>
						
						<!-- 장바구니 목록 없는 경우 -->
						<c:if test="${cartcount == 0}">
							<div class="container">
			    				<div class="leaveInfo">
			    					<i class="nc-icon nc-favourite-28"></i>			     	        		
			        				<span>장바구니에 담긴 상품이 없습니다.</span>
			        			</div>
			        			<input type="button" id="productPageGo" name="productPageGo" class="btn btn-primary btn-round" value="상품 보러 가기" 
			        			   style="margin-left:38%; margin-right:15px;">
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