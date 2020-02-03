<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html class="perfect-scrollbar-on"><head>
	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
	<title>
 	취소 / 반품 현황
	</title>
	<meta content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0, shrink-to-fit=no" name="viewport">
	
	<link href="resources/soo/css/cancelProcess.css" rel="stylesheet">
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
	
	<script src="resources/soo/js/core/jquery.min.js"></script>
	<script>
		$(document).ready(function(){
			$('#productPageGo').click(function(){
				location.href='product?category=all';
			});
		});
	</script>
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
            			
						<a class="navbar-brand">나의 쇼핑 목록</a>
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
     
			<div class="content" style="margin-bottom: 110px">
			  <div class="row">
			    <div class="col-md-10">
			      <div class="card card-user">
			        <div class="card-header">
			          <h5 class="card-title">취소 / 반품 현황</h5>
			        </div>
			        <div class="card-body">
			        	<div class="container">
			        		
			        		<!-- 취소 반품 현황 있는 경우 -->
			        		<c:if test="${!empty cancelreturnlist }">
			        		
			        			<div class="cancelProcessInfo">
			        				<img src="resources/soo/img/mark.PNG" class="leaveImg">			        		
					        		<span class="cancelProcessInfoSpan">반품 절차 안내</span>
					        		<ul>
					        			<li>반품 신청 : 반품하고자 하는 상품을 판매자에게 반품 신청 합니다.</li>
					        			<li>반품 처리중 : 판매자에게 발송한 반품 상품을 판매자는 회수 대기중에 있습니다.</li>
					        			<li>반품 완료 : 반품 상품을 확인 후 이상이 없을 경우 반품이 승인 되며, 환불이 진행됩니다.</li>
					        		</ul>
					        	</div>
			        		
			        			<table class="table">
			        				<tr>
			        					<td>주문 일자</td> <td colspan="2">주문 상품 정보</td> <td>상품 금액 (수량)</td> <td>스토어 명</td> <td>신청 일자</td> <td>처리상태</td>
			        				</tr>
			        				
			        				<c:forEach var="crl" items="${cancelreturnlist}">
			        				<tr>
			        					<td>
			        						${crl.ORDER_DATE }
			        					</td>
			        					<td>
											<img src="${crl.p_IMG }" class="product_img" onclick="location.href='detail?P_NO=${crl.p_NO}';">
										</td>
										<td>
											<span style="cursor:pointer" onclick="location.href='detail?P_NO=${crl.p_NO}';">${crl.p_NAME }</span>
										</td>
										<td>
											${crl.ORDER_PRICE}원<br>
											(${crl.ORDER_AMOUNT }개)
										</td>
										<td>
											${crl.ORDER_SELLER }
										</td>
										<td>
											${crl.ORDER_R_DATE }
										</td>
										<c:choose>
										<c:when test="${crl.ORDER_STATUS == 1}">
											<td>
												취소완료
											</td>
										</c:when>
										<c:when test="${crl.REFUND_STATUS == 0}">
											<td>
												반품신청
											</td>
										</c:when>
										<c:when test="${crl.REFUND_STATUS == 1}">
											<td>
												반품처리중
											</td>
										</c:when>
										<c:when test="${crl.REFUND_STATUS == 2}">
											<td>
												반품완료
											</td>
										</c:when>
										</c:choose>
									
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
									<a href="cancelProcess?page=${page -1 }&USER_ID=${USER_ID}" class="page-link">이전</a> &nbsp;
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
										<a href="cancelProcess?page=${a }&USER_ID=${USER_ID}" class="page-link">${a }</a>
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
									<a href="cancelProcess?page=${page+1 }&USER_ID=${USER_ID}" class="page-link">&nbsp;다음</a>
								</li>
							</c:if>
							
						</ul>
					</div>
				</div>
			</div>
			        		</c:if>
			        	
			        	
			        		<!-- 취소 반품 현황 없는 경우 -->
			        		<c:if test="${empty cancelreturnlist }">
			        			<div class="container">
			    				<div class="leaveInfo">
			    					<i class="nc-icon nc-cart-simple"></i>			     	        		
			        				<span>취소 / 반품 상품이 없습니다.</span>
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
