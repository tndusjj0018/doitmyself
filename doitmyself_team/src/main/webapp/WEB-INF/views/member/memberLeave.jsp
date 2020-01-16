<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html class="perfect-scrollbar-on"><head>
	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
	<title>
 	회원 탈퇴
	</title>
	<meta content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0, shrink-to-fit=no" name="viewport">
	
	<!-- CSS Files -->
	<link href="resources/soo/css/memberLeave.css" rel="stylesheet">
	
	<script src="resources/soo/js/core/jquery.min.js"></script>
	<script>
	function memberLeave(){
		//window.open();
		alert('비밀번호 확인 창 떠야함');
	}
	</script>
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
            			
						<a class="navbar-brand" href="#pablo">회원 정보</a>
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
			    <div class="col-md-8">
			      <div class="card card-user">
			        <div class="card-header">
			          <h5 class="card-title">회원 탈퇴</h5>
			        </div>
			        <div class="card-body">
			        	<div class="container">
			        		<p>회원 탈퇴 전 다음 사항을 꼭 숙지하시기 바랍니다.</p>
			    			<div class="leaveInfo">
			        		<img src="resources/img/mark.PNG" class="leaveImg">			        		
			        		<span>회원 탈퇴 안내</span>
			        		<ul>
			        			<li>회원 탈퇴 시 회원님께서 보유하셨던 회원정보, 거래정보 등은 모두 삭제 됩니다.</li>
			        			<li>회원 탈퇴 후 재가입 시에는 신규 회원 가입으로 처리되며, 탈퇴 전의 회원정보와 거래정보 등은 복구되지 않습니다.</li>
			        		</ul>
			        		</div>
			        		<input type="button" id="memberLeave_btn" name="memberLeave_btn" class="btn btn-primary btn-round" value="회원 탈퇴 신청" 
			        			   style="margin-left:38%; margin-right:15px;" data-toggle="modal" data-target="#memberLeave">
			        	</div>
			        </div>
			      </div>
			    </div>
			  </div>
			</div>
			
			<!-- The Modal -->
			<div class="modal" id="memberLeave">
				<div class="modal-dialog">
					<div class="modal-content">
		
						<!-- Modal body -->
						<div class="modal-body">
							<form name="memberLeaveForm" action="memberLeaveAction" method="post">
								<input type="hidden" name="num" value="${param.num }">
		
								<div class="form-group">
									<label for="pwd">비밀번호 확인</label> 
									   <input type="password"
										class="form-control" placeholder="Enter password"
										name="user_pass" id="user_pass">
								</div>
								<button type="submit" class="btn btn-primary">Submit</button>
							    <button type="button" class="btn btn-danger" data-dismiss="modal">Close</button>
							</form>
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