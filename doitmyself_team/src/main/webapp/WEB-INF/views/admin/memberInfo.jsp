<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html class="perfect-scrollbar-on"><head>
	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
	<title>
 	회원 정보 변경
	</title>
	<meta content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0, shrink-to-fit=no" name="viewport">
	
	<!-- 우편번호 -->
	<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
	<script type="text/javascript" src="http://t1.daumcdn.net/postcode/api/core/191007/1570443254160/191007.js"></script>
	<script>	
	function Postcode() {
	    new daum.Postcode({
	        oncomplete: function(data) {
	            // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

	            // 도로명 주소의 노출 규칙에 따라 주소를 조합한다.
	            // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
	            var fullRoadAddr = data.roadAddress; // 도로명 주소 변수
	            var extraRoadAddr = ''; // 도로명 조합형 주소 변수

	            // 법정동명이 있을 경우 추가한다. (법정리는 제외)
	            // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
	            if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
	                extraRoadAddr += data.bname;
	            }
	            // 건물명이 있고, 공동주택일 경우 추가한다.
	            if(data.buildingName !== '' && data.apartment === 'Y'){
	               extraRoadAddr += (extraRoadAddr !== '' ? ', ' + data.buildingName : data.buildingName);
	            }
	            // 도로명, 지번 조합형 주소가 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
	            if(extraRoadAddr !== ''){
	                extraRoadAddr = ' (' + extraRoadAddr + ')';
	            }
	            // 도로명, 지번 주소의 유무에 따라 해당 조합형 주소를 추가한다.
	            if(fullRoadAddr !== ''){
	                fullRoadAddr += extraRoadAddr;
	            }

	            
	            // 우편번호와 주소 정보를 해당 필드에 넣는다.
	            $('#changePostcode').val(data.zonecode); //5자리 새우편번호 사용
	            $('#changeAddress').val(fullRoadAddr);          
	        }
	    }).open();
	}
	</script>
	<script src="resources/js/core/jquery.min.js"></script>
	<script>
		$(document).ready(function(){
			$("#change_password").click(function(){
				var popup= window.open("change_password","","width=500,height=500,left=550,top=300");
			});//click end
			
			
			$(".modifybtn").click(function(){
				var data = $(".updateform").serialize();
				$.ajax({
					type:"post",
					data : data,
					//dataType 은 받는 데이터 타입
					url:'ModifyUser?USER_NO=<%=request.getParameter("USER_NO")%>',
					success:function(rdata){
						//member 갖고 왔는지 확인
						console.log(rdata);
						alert(rdata);
					},//success end
					error: function(){
						console.log("실패");
					}//error end
				})//ajax end
			})//click end
			
			
			
		});// ready end
	</script>
</head>

<body class="">
	<div class="wrapper ">
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

						<a class="navbar-brand" href="#pablo">회원 정보</a>
					</div>

					<button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navigation"
							aria-controls="navigation-index" aria-expanded="false" aria-label="Toggle navigation">
						<span class="navbar-toggler-bar navbar-kebab"></span>
						<span class="navbar-toggler-bar navbar-kebab"></span>
						<span class="navbar-toggler-bar navbar-kebab"></span>
					</button>

					<div class="collapse navbar-collapse justify-content-end" id="navigation">
						<ul class="navbar-nav">
							<li class="nav-item btn-rotate dropdown">
									<i class="nc-icon nc-bell-55"></i>
									<p>
										<span class="d-lg-none d-md-block">Some Actions</span>
									</p>
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
					<div class="col-md-8">
						<div class="card card-user">
							<div class="card-header">
								<h5 class="card-title">회원 정보 변경</h5>
							</div>
							<div class="card-body">
								<form class="updateform" action = "passCheck">
									<div class="row">
										<div class="col-md-5 pr-1">
											<div class="form-group">
												<label>ID</label>
												<input type="text" id="user_id" name="USER_ID" class="form-control" readOnly value="${member.USER_ID }">
											</div>
										</div>
										<div class="col-md-7">
											<div class="form-group">
												<label>NAME</label>
												<input type="text" id="user_name" name="USER_NAME" class="form-control" placeholder="Username" value="${member.USER_NAME }">
											</div>
										</div>
							
									</div>
									
									<div class="row">
										<div class="col-md-5 pr-1">
											<div class="form-group">
												<label>PASSWORD</label>
												<input type="password" id="user_pssword" name="USER_PASSWORD"  class="form-control" value="${member.USER_PASSWORD }">
											</div>											
										</div>
										<div class="col-md-3">
											<div class="form-group">
											</div>
										</div>												
									</div>
									
									<div class="row">
										<div class="col-md-5 pr-1">
											<div class="form-group">
												<label>BIRTH</label>
												<input type="text" id="user_birth" name="USER_BIRTH" class="form-control" readOnly value="${member.USER_BIRTH }">
											</div>
										</div>
										<div class="col-md-7">
											<div class="form-group">
												<label>PHONE</label>
												<input type="text" id="user_phone" name="USER_PHONE" class="form-control" placeholder="Phone Number" value="${member.USER_PHONE }">
											</div>
										</div>
									</div>
									
									<div class="row">
										<div class="col-md-12">
											<div class="form-group">
												<label>Email</label>
												<input type="text" id="user_email" name="USER_EMAIL" class="form-control" placeholder="Email" value="${member.USER_EMAIL }">
											</div>
										</div>
									</div>
									
									<div class="row">
										<div class="col-md-5 pr-1">
											<div class="form-group">
												<label>ADDRESS</label>
												<input type="text" id="changePostcode" name="USER_POSTCODE" class="form-control" value="${member.USER_POSTCODE }">
											</div>											
										</div>
										<div class="col-md-3">
											<div class="form-group">
												<button type="button" class="btn btn-primary btn-round" onclick="Postcode()"style="position: relative; top: 16px;">우편번호 검색</button>
											</div>
										</div>												
									</div>
									
									<div class="row">	
										<div class="col-md-12">
											<div class="form-group">
												<input type="text" id="changeAddress" name="USER_ADDRESS" class="form-control" placeholder="상세 주소" value="${member.USER_ADDRESS }">
											</div>
										</div>
									</div>
						
								
									<div class="row">
										<div class="update ml-auto mr-auto">
											<button type="button" class="btn btn-primary btn-round modifybtn">Update Profile</button>
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
	
	<script src="resources/js/core/popper.min.js"></script>
	<script src="resources/js/core/bootstrap.min.js"></script>
	<script src="resources/js/plugins/perfect-scrollbar.jquery.min.js"></script>
	<!-- Chart JS -->
	<script src="resources/js/plugins/chartjs.min.js"></script>
	<!--  Notifications Plugin    -->
	<script src="resources/js/plugins/bootstrap-notify.js"></script>
	<!-- Control Center for Now Ui Dashboard: parallax effects, scripts for the example pages etc -->
	<script src="resources/js/paper-dashboard.min.js" type="text/javascript"></script>
	
</body>
</html>
