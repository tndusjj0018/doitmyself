<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html class="perfect-scrollbar-on"><head>
   <meta charset="utf-8">
   <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
   <title>
    	비밀번호 찾기
   </title>
   <meta content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0, shrink-to-fit=no" name="viewport">
   
   <!--     Fonts and icons     -->
   <link href="https://fonts.googleapis.com/css?family=Montserrat:400,700,200" rel="stylesheet">
   <link href="https://maxcdn.bootstrapcdn.com/font-awesome/latest/css/font-awesome.min.css" rel="stylesheet">
  
   <!-- CSS Files -->
   <link href="resources/css/homecss/bootstrap2.min.css" rel="stylesheet">
   <link href="resources/css/homecss/paper-dashboard.css" rel="stylesheet">
   <script src="https://kit.fontawesome.com/cd8a53a953.js" crossorigin="anonymous"></script>
<style type="text/css">/* Chart.js */
      @-webkit-keyframes chartjs-render-animation{
         from{opacity:0.99}
         to{opacity:1}}
      
      @keyframes chartjs-render-animation{
         from{opacity:0.99}
         to{opacity:1}}
         
      .chartjs-render-monitor{
         -webkit-animation:chartjs-render-animation 0.001s;
         animation:chartjs-render-animation 0.001s;}
      .mar20 {margin-left:20px}
      
      .input_check{
            position: absolute;
		    top: 50%;
		    margin-left: 90%;
		    margin-top: 6px;
		    z-index: 1;
		    color: #0fd494;
		    opacity : 0;
      }
</style>
</head>
      <div class="main-panel ps-container ps-theme-default" data-ps-id="e601a05f-e1a5-7530-c875-a9fb1d61329a">
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

                  <a class="navbar-brand" href="#pablo"></a>
               </div>

               <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navigation"
                     aria-controls="navigation-index" aria-expanded="false" aria-label="Toggle navigation">
                  <span class="navbar-toggler-bar navbar-kebab"></span>
                  <span class="navbar-toggler-bar navbar-kebab"></span>
                  <span class="navbar-toggler-bar navbar-kebab"></span>
               </button>

            </div>
         </nav>
         <!-- End Navbar -->

         <div class="content">
               <div class="col-md-8" style="min-width:700px;">
                  <div class="card card-user">
                     <div class="card-header">
                        <h5 class="card-title">비밀번호 찾기</h5>
                     </div>
                     <div class="card-body">
                        <form action='Find_Pass' method='post' id="findBtn">
                           <div class="row">
                              <div class="col-md-12">
                                 <div class="form-group">
                                    <label>아이디</label>
                                    <input type="text" name="USER_ID" class="form-control" placeholder="비밀번호를 찾을 아이디를 입력하세요" required>
                                    <span><i class="far fa-check-circle input_check id_checkbar"></i></span>
                                 </div>
                              </div>
                           </div>
                           <div class="row">
                              <div class="col-md-12">
                                 <div class="form-group">
                                    <label>이메일</label>
                                    <input type="email" name="USER_EMAIL" class="form-control" placeholder="회원가입에 사용했던 이메일을 입력하세요" required>
                                    <span><i class="far fa-check-circle input_check email_checkbar"></i></span>
                                 </div>
                              </div>
                           </div>
                           <div class="row">
                              <div class="update ml-auto mr-auto">
                                 <button type="submit" class="btn btn-primary btn-round">코드 전송</button>
                              </div>
                           </div>
                        </form>
                           <form>
                           <div class="row" style="margin-bottom: -10px; width: 84%;">
                              <div class="addr_box">
                                 <div class="form-group">
                                    <label>코드번호</label>
                                    <input type="text" class="form-control" name="PASS_CODE" id="PostCode" required>
                                 </div>                                 
                              </div>
                              <div class="col-md-3">
                                 <div class="form-group">
                                    <button type="button" class="btn btn-primary btn-round" placeholder="이메일로 전송된 코드를 입력하세요" onclick="Postcode()" style="position: relative; top: 16px;" required>코드 확인</button>
                                 </div>
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
   
   <!--   Core JS Files   -->
   <script src="resources/js/core/jquery.min.js"></script>
   <script src="resources/js/core/popper.min.js"></script>
   <script src="resources/js/core/bootstrap.min.js"></script>
   <script src="resources/js/plugins/perfect-scrollbar.jquery.min.js"></script>
   <script src="resources/js/plugins/chartjs.min.js"></script>
   <!--  Notifications Plugin    -->
   <script src="resources/js/plugins/bootstrap-notify.js"></script>
   <!-- Control Center for Now Ui Dashboard: parallax effects, scripts for the example pages etc -->
   <script src="resources/js/paper-dashboard.min.js" type="text/javascript"></script>
   <script>
   		$(function(){
   			
   			var checkid = false;
   			var checkemail = false;
   			
   			$("#findBtn").submit(function(){
   				
   				if(checkid == true && checkemail == true)
   				$.ajax({
   					url : "check_findPass",
   					type : "POST",
   					data : {
   						
   					},
   					success : function(result) {
   						alert(result);
   					},
   				})
   			});
   			$('input:eq(0)').on('keyup', function(){
   				
   				var USER_ID = $('input:eq(0)').val();
   				
   				$.ajax({
   					url:"idcheck",
   					data:{"USER_ID" : USER_ID},
   					success: function(resp) {
   						if(resp == -1) {
   							$('i:eq(0)').css('opacity', '0');			
   							checkid = false;
   						} else {
   							$('i:eq(0)').css('opacity', '0.95');
   							checkid = true;
   						}
   					}
   				});
	   		})

	   		$('input:eq(1)').on('keyup', function(){
   				
	   			var USER_ID = $('input:eq(0)').val();
   				var USER_EMAIL = $('input:eq(1)').val();
   				
   				$.ajax({
   					url:"emailcheck",
   					data:{"USER_EMAIL" : USER_EMAIL , "USER_ID" : USER_ID},
   					success: function(resp) {
   						if(resp == -1) {
   							$('i:eq(1)').css('opacity', '0');			
   							checkid = false;
   						} else {
   							$('i:eq(1)').css('opacity', '0.95');
   							checkid = true;
   						}
   					}
   				});
	   		})
   		})
   </script>
</body>
</html>
