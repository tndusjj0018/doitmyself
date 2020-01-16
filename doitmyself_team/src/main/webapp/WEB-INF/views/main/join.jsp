<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html class="perfect-scrollbar-on"><head>
   <meta charset="utf-8">
   <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
   <title>
   	회원 가입
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
                        <h5 class="card-title">회원 가입</h5>
                     </div>
                     <div class="card-body">
                        <form action='joinProcess' method='post'>
                           <div class="row">
                              <div class="col-md-5 pr-1">
                                 <div class="form-group">
                                    <label>아이디</label>
                                    <input type="text" id="USER_ID" name="USER_ID" class="form-control" placeholder="ID" maxlength="12" required>
                                    <span><i class="far fa-check-circle input_check"></i></span>
                                 </div>
                              </div>
                              <div class="namebox">
                                 <div class="form-group">
                                    <label>이름</label>
                                    <input type="text" id="USER_NAME" name="USER_NAME" class="form-control" placeholder="Name" required style="width: 99% !important;">
                                    <span><i class="far fa-check-circle input_check" style="margin-left: 91.9%;"></i></span>
                                 </div>
                              </div>
                           </div>
                           <div class="row">
                              <div class="col-md-12">
                                 <div class="form-group">
                                    <label>비밀번호</label>
                                    <input type="password" id="USER_PASSWORD" class="form-control" placeholder="Password" maxlength="20" required style="width:99.85%">
                                    <span><i class="far fa-check-circle input_check" style="margin-left: 95.9%;"></i></span>
                                 </div>                                 
                              </div>
                           </div>
                           
                           <div class="row">
                              <div class="col-md-5 pr-1">
                                 <div class="form-group">
                                    <label>생년월일</label>
                                    <input type="text" id="USER_BIRTH" name="USER_BIRTH" class="form-control" placeholder="YYYYMMDD" maxlength="8" required>
                                    <span><i class="far fa-check-circle input_check" style="margin-left: 90%;"></i></span>
                                 </div>
                              </div>
                              <div class="col-md-7">
                                 <div class="form-group">
                                    <label>핸드폰 번호</label>
                                    <input type="text" id="USER_PHONE" name="USER_PHONE" class="form-control" placeholder="-을 빼고 입력해주세요" maxlength="12" required>
                                    <span><i class="far fa-check-circle input_check" style="margin-left: 92.91%;"></i></span>
                                 </div>
                              </div>
                           </div>
                           
                           <div class="row">
                           	<label style="margin-left: 13px;">성별</label>
                           </div>
                              <div class="col-md-5 pr-1 genderbox">
							<div class="btn-group" data-toggle="buttons">
							  <label class="btn btn-primary">
							    <input type="radio" name="options" id="option1" class="radio_none left_radio" autocomplete="off"> 남
							  </label>
							  <label class="btn btn-primary">
							    <input type="radio" name="options" id="option2" class="radio_none right_radio" autocomplete="off"> 여
							  </label>
							</div>
							</div>
                           <div class="row">
                              <div class="col-md-12">
                                 <div class="form-group">
                                    <label>이메일</label>
                                    <input type="email" name="USER_EMAIL" class="form-control" placeholder="Email" required>
                                    <span><i class="far fa-check-circle input_check" style="margin-left: 95.5%;"></i></span>
                                 </div>
                              </div>
                           </div>
                           <div class="row">
                              <div class="addr_box">
                                 <div class="form-group">
                                    <label>주소</label>
                                    <input type="text" class="form-control" required>
                                    <span><i class="far fa-check-circle input_check" style="margin-left: 95%;"></i></span>
                                 </div>                                 
                              </div>
                              <div class="col-md-3">
                                 <div class="form-group">
                                    <button type="button" class="btn btn-primary btn-round" style="position: relative; top: 16px;" required>우편번호 찾기</button>
                                 </div>
                              </div>                                    
                           </div>
                           <div class="row">
                              <div class="col-md-12">
                                 <div class="form-group">
                                    <input type="text" class="form-control">
                                 </div>
                              </div>
                           </div>
                           
                           <div class="row">
                              <div class="update ml-auto mr-auto">
                                 <button type="submit" class="btn btn-primary btn-round">회원 가입 하기</button>
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
   <script src="resources/js/home_js/join.js"></script>
   
</body>
</html>