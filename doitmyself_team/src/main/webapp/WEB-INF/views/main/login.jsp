<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<title>Login</title>
<link rel="stylesheet" href="resources/css/homecss/style_login.css">
<script src="resources/js/home_js/jquery.min.js"></script>
<script src="resources/js/home_js/login.js"></script>
<script>
	$(function(){
		$('.join').click(function(){
			location.href="join.net";
		});
	})
    </script>
  </head>
  <body>
    <div class="container-scroller">
      <div class="container-fluid page-body-wrapper full-page-wrapper">
        <div class="content-wrapper d-flex align-items-center auth auth-bg-1 theme-one">
          <div class="row w-100">
            <div class="col-lg-4 mx-auto" style="min-width:600px;">
              <div class="auto-form-wrapper">
                <form action="loginProcess" method="post">
                  <div class="form-group">
                    <label class="label">아이디</label>
                    <div class="input-group">
                      <input type="text" name="USER_ID" class="form-control" placeholder="ID">
                      <div class="input-group-append">
                        <span class="input-group-text">
                          <i class="mdi mdi-check-circle-outline"></i>
                        </span>
                      </div>
                    </div>
                  </div>
                  <div class="form-group">
                    <label class="label">비밀번호</label>
                    <div class="input-group">
                      <input type="password" name="USER_PASSWORD" class="form-control" placeholder="PASSWORD">
                      <div class="input-group-append">
                        <span class="input-group-text">
                          <i class="mdi mdi-check-circle-outline"></i>
                        </span>
                      </div>
                    </div>
                  </div>
                  <div class="form-group">
                    <button class="btn btn-primary submit-btn btn-block">로그인</button>
                  </div>
                  </form>
                  <div class="form-group d-flex justify-content-between">
                    <div class="form-check form-check-flat mt-0">
                    </div>
                    <a href="#" class="text-small forgot-password text-black" style="text-align: center; flex: auto;">비밀번호를 잊으셨나요?</a>
                  </div>
                  <hr>
                  <div class="form-group">
                      <span><img src="resources/img/naver_login.PNG" class="naver_login" style="width:43%; height:40px; margin-left:2%"></span>
                       <button class="btn btn-primary join" style="width:43%; height:40px; margin-left:9.42%">회원가입</button>
                   </div>
                  <div class="text-block text-center my-3">
                  </div>
              </div>
              <ul class="auth-footer">
              </ul>
            </div>
          </div>
        </div>
      </div>
    </div>
  </body>
</html>
