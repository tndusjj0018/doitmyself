<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html class="perfect-scrollbar-on"><head>
	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
	<title>
 	나의 QNA
	</title>
	<meta content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0, shrink-to-fit=no" name="viewport">
	
	<!-- CSS Files -->
	<link href="resources/soo/css/orderDelivery.css" rel="stylesheet">
	
	<script src="resources/soo/js/core/jquery.min.js"></script>
	<script src="resources/soo/js/qnaCate.js"></script>
	
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
            			
						<a class="navbar-brand">리뷰 및 QNA</a>
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
			      <div class="card card-user" style="width: 1100px;">
			        <div class="card-header">
			          <h5 class="card-title">나의 QNA</h5>
			        </div>
			        <div class="card-body">
			        	<div class="container">
			 
			        	<!-- qna 목록 있는 경우 -->
			        	<c:if test="${qnacount > 0}">
			        	<table class="table">
			        		<thead>
								<tr>
									<td width="8%">문의 번호</td>
									<td colspan="2" width="20%">상품 정보</td>
									<td width="15%">스토어 명</td>
									<td width="10%"><select id="qnaCate">
											<option value="q_all">문의 분류</option>
											<option>=========</option>
											<option value="q_delivery">배송문의</option>
											<option value="q_product">상품문의</option>
											<option value="q_cancel">환불문의</option>
											<option value="q_other">기타문의</option>
										</select></td>
									<td width="20%">문의 제목</td>
									<td width="17%">작성일</td>
									<td width="15%">답변 상태</td>
								</tr>
							</thead>
							
							<tbody>
								<!-- qnaCate ajax -->
							</tbody>
						</table>
						
						</c:if>
						
						<!-- qna 목록 없는 경우 -->
						<c:if test="${qnacount == 0}">
							<div class="container">
			    				<div class="leaveInfo">
			    					<i class="nc-icon nc-chat-33"></i>			     	        		
			        				<span>문의한 상품이 없습니다.</span>
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
