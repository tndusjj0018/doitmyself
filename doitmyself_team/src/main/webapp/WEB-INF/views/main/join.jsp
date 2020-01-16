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
   <link href="resources/css/homecss/demo.css" rel="stylesheet">
   <link href="resources/css/homecss/paper-dashboard.css" rel="stylesheet">
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
   </style>
   <script type="text/javascript" charset="UTF-8" src="https://maps.googleapis.com/maps-api-v3/api/js/39/6/intl/ko_ALL/common.js"></script>
   <script type="text/javascript" charset="UTF-8" src="https://maps.googleapis.com/maps-api-v3/api/js/39/6/intl/ko_ALL/util.js"></script>
   <script type="text/javascript" charset="UTF-8" src="https://maps.googleapis.com/maps/api/js/AuthenticationService.Authenticate?1sfile%3A%2F%2F192.168.40.39%2F39%25EA%25B3%25B5%25EC%259C%25A0%25ED%258F%25B4%25EB%258D%2594%2Fpaper-dashboard-master%2Fexamples%2Fuser.html&amp;4sYOUR_KEY_HERE&amp;callback=_xdc_._olygxi&amp;key=YOUR_KEY_HERE&amp;token=48474"></script>
   <style>
      .mar20 {margin-left:20px}
   </style>
</head>

<body class="">
   <div class="wrapper ">
      
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
            <div class="row">
               <div class="col-md-8">
                  <div class="card card-user">
                     <div class="card-header">
                        <h5 class="card-title">회원 가입</h5>
                     </div>
                     <div class="card-body">
                        <form>
                           <div class="row">
                              <div class="col-md-5 pr-1">
                                 <div class="form-group">
                                    <label>아이디</label>
                                    <input type="text" id="user_id" name="user_id" class="form-control" placeholder="ID" maxlength="12">
                                 </div>
                              </div>
                              <div class="namebox">
                                 <div class="form-group">
                                    <label>이름</label>
                                    <input type="text" id="user_name" name="user_name" class="form-control" placeholder="Name">
                                 </div>
                              </div>
                           </div>
                           <div class="row">
                              <div class="col-md-12">
                                 <div class="form-group">
                                    <label>비밀번호</label>
                                    <input type="password" class="form-control" placeholder="Password" maxlength="20">
                                 </div>                                 
                              </div>
                           </div>
                           
                           <div class="row">
                              <div class="col-md-5 pr-1">
                                 <div class="form-group">
                                    <label>생년월일</label>
                                    <input type="text" id="user_birth" name="user_birth" class="form-control" placeholder="YYYYMMDD" maxlength="8">
                                 </div>
                              </div>
                              <div class="col-md-7">
                                 <div class="form-group">
                                    <label>핸드폰 번호</label>
                                    <input type="text" id="user_phone" name="user_phone" class="form-control" placeholder="-을 빼고 입력해주세요" maxlength="12">
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
							    <input type="radio" name="options" id="option2" class="radio_none" autocomplete="off"> 여
							  </label>
							</div>
							</div>
                           <div class="row">
                              <div class="col-md-12">
                                 <div class="form-group">
                                    <label>이메일</label>
                                    <input type="text" class="form-control" placeholder="Email">
                                 </div>
                              </div>
                           </div>
                           <div class="row">
                              <div class="addr_box">
                                 <div class="form-group">
                                    <label>주소</label>
                                    <input type="password" class="form-control">
                                 </div>                                 
                              </div>
                              <div class="col-md-3">
                                 <div class="form-group">
                                    <button type="button" class="btn btn-primary btn-round" style="position: relative; top: 16px;">우편번호 찾기</button>
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
   </div>
   
   <!--   Core JS Files   -->
   <script src="resources/js/core/jquery.min.js"></script>
   <script src="resources/js/core/popper.min.js"></script>
   <script src="resources/js/core/bootstrap.min.js"></script>
   <script src="resources/js/plugins/perfect-scrollbar.jquery.min.js"></script>
   <!--  Google Maps Plugin    -->
   <script src="https://maps.googleapis.com/maps/api/js?key=YOUR_KEY_HERE"></script>
   <!-- Chart JS -->
   <script src="resources/js/plugins/chartjs.min.js"></script>
   <!--  Notifications Plugin    -->
   <script src="resources/js/plugins/bootstrap-notify.js"></script>
   <!-- Control Center for Now Ui Dashboard: parallax effects, scripts for the example pages etc -->
   <script src="resources/js/paper-dashboard.min.js" type="text/javascript"></script>
   <!-- Paper Dashboard DEMO methods, don't include it in your project! -->
   <script src="resources/demo/demo.js"></script>
   
</body>
</html>