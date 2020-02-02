<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html class="perfect-scrollbar-on"><head>
	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
	<title>
 	취소 신청
	</title>
	<meta content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0, shrink-to-fit=no" name="viewport">
	
	<!--     Fonts and icons     -->
	<link href="https://fonts.googleapis.com/css?family=Montserrat:400,700,200" rel="stylesheet">
	<link href="https://maxcdn.bootstrapcdn.com/font-awesome/latest/css/font-awesome.min.css" rel="stylesheet">
	
	<!-- CSS Files -->
	<link href="resources/soo/css/bootstrap-soo.css" rel="stylesheet">
	<link href="resources/soo/demo/demo.css" rel="stylesheet">
	<link href="resources/soo/css/paper-dashboard.css" rel="stylesheet">
	<link href="resources/soo/css/cancelRegister.css" rel="stylesheet">
	
	<script src="resources/soo/js/core/jquery.min.js"></script>
</head>

<body class="">
	<div class="wrapper ">
		
		
		<div class="main-panel ps-container ps-theme-default" data-ps-id="e601a05f-e1a5-7530-c875-a9fb1d61329a">
			
			<div class="content" style="margin-top: 44px;">
				<div class="row">
					<div class="col-md-11">
						<div class="card card-user">
							<div class="card-header">
								<h5 class="card-title marleft10">취소 신청</h5>
							</div>
							<div class="card-body">
								<form action="cancelRegisterAction?ORDER_NO=${ORDER_NO }">
									<input type="hidden" name="ORDER_NO" value="${ORDER_NO }">
									<input type="hidden" name="USER_ID" value="${USER_ID }">									
									<ul>
										<li>묶음배송 상품 취소 시 배송비 정책에 조건이 맞지 않을 경우 추가배송비가 발생할 수 있습니다.</li>
										<li>결제수단별 환불방법과 환불소요기간에 차이가 있습니다.</li>
									</ul>
									
									<div>
								
										<table class="table cancelRegisterProduct">
											<tr>
												<td>취소 상품</td>
												<td>${productdetail.p_NAME }</td>
											</tr>
											
											<tr>
												<td>취소 금액</td>
												<td>${productdetail.ORDER_PRICE }원</td>
											</tr>

											<tr>
												<td>결제 수단</td>
												<td>${productdetail.ORDER_PAYMENT }</td>
											</tr>
											
											<tr>
												<td>취소 사유</td>
												<td><textarea id="cancelTextarea" style="height:140px; width:225px;" required></textarea></td>
											</tr>										
										</table>
									
									</div>
																	
									<div class="row">
										<div class="update ml-auto mr-auto">
											<button type="submit" class="btn btn-primary btn-round">취소 신청하기</button>
										</div>
									</div>
								</form>
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