<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html class="perfect-scrollbar-on"><head>
	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
	<title>
 	비밀번호 변경
	</title>
	<meta content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0, shrink-to-fit=no" name="viewport">
	
	<!--     Fonts and icons     -->
	<link href="https://fonts.googleapis.com/css?family=Montserrat:400,700,200" rel="stylesheet">
	<link href="https://maxcdn.bootstrapcdn.com/font-awesome/latest/css/font-awesome.min.css" rel="stylesheet">
	
	<!-- CSS Files -->
	<link href="resources/soo/css/bootstrap-soo.css" rel="stylesheet">
	<link href="resources/soo/demo/demo.css" rel="stylesheet">
	<link href="resources/soo/css/paper-dashboard.css" rel="stylesheet">
	
	<script src="resources/soo/js/core/jquery.min.js"></script>
	
	<style>
		.font-size {
			font-size: 12px;
		}
	</style>
	<script>
	$(document).ready(function(){
		pattern = /^[a-zA-z0-9]{5,15}$/;
		
		$("#user_password").blur(function(){
			
			var currpass = $('#user_password').val();
			
		});
		
		$("#change_password").blur(function(){
			
			var pass = $("#change_password").val();
			
			if(!pattern.test(pass)){
				$("#change_password").css("border","1px solid #fda4a4")
								.prop("type","text")
								.css("color","red")
								.val("5글자 이상 설정하세요");
				
				$("#change_password").focus(function(){
					$("#change_password").css("border","1px solid #DDDDDD")
									.prop("type","password")
									.val('')
									.css("color","#66615b");
				});			
			}
		});
		
		$("form").submit(function(){
			var pass=$("#change_password").val();
			var passcheck = $("#change_password_chk").val();
			
			if(pass != passcheck){
				$("#change_password_chk").css("border","1px solid #fda4a4")
								.prop("type", "text")
								.css("color","red")
								.val("비밀번호가 일치하지 않습니다.");
				
				$("#change_password_chk").focus(function(){
					$("#change_password").css("border","1px solid #DDDDDD")
									.prop("type","password")
									.val('')
									.css("color","#66615b");
				});	
				
				return false;								
			}
		});
	});
	</script>
</head>

<body class="">
	<div class="wrapper ">
		
		
		<div class="main-panel ps-container ps-theme-default" data-ps-id="e601a05f-e1a5-7530-c875-a9fb1d61329a">
			
			<div class="content" style="margin-top: 44px;">
				<div class="row">
					<div class="col-md-8">
						<div class="card card-user">
							<div class="card-header">
								<h5 class="card-title">비밀번호 변경</h5>
							</div>
							<div class="card-body">
								<form action="passChange.net?USER_ID=${USER_ID }" method="post">									
									<div class="row">
										<div class="col-md-12">
											<div class="form-group">
												<label>현재 비밀번호</label>
												<input type="password" id="user_password" name="user_password" class="form-control font-size" placeholder="현재 비밀번호를 입력하세요" required>
											</div>											
										</div>											
									</div>
									
									<div class="row">
										<div class="col-md-12">
											<div class="form-group">
												<label>변경할 비밀번호</label>
												<input type="password" id="change_password" name="change_password" class="form-control font-size" placeholder="변경할 비밀번호를 입력하세요" required>
											</div>
										</div>
									</div>
									
									<div class="row">
										<div class="col-md-12">
											<div class="form-group">
												<label>비밀번호 확인</label>
												<input type="password" id="change_password_chk" name="change_password_chk" class="form-control font-size" placeholder="다시 한 번 입력하세요" required>
											</div>
										</div>
									</div>
																	
									<div class="row">
										<div class="update ml-auto mr-auto">
											<button type="submit" class="btn btn-primary btn-round">비밀번호 변경</button>
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