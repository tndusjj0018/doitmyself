<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html class="perfect-scrollbar-on"><head>
	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
	<title>
 	리뷰 작성하기
	</title>
	<meta content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0, shrink-to-fit=no" name="viewport">
	
	<!-- CSS Files -->	
	<link href="resources/soo/css/reviewList.css" rel="stylesheet">
	<link href="resources/soo/css/reviewUpdate.css" rel="stylesheet">
	
	<script src="resources/soo/js/core/jquery.min.js"></script>
	<script>
		$(document).ready(function(){		
			$('.star').click(function(){
			      console.log($(this).attr('id'));
			      $(this).parent().children('span').removeClass('checked');
			      $(this).parent().children('span').empty();
			      $(this).addClass('checked').prevAll('span').addClass('checked');
			      $(this).append("<input type='hidden' name='REVIEW_RATE' value="+$(this).attr('id')+">");
			      return false;
			   })
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
            			
						<a class="navbar-brand" href="#pablo">리뷰 및 QNA</a>
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
			          <h5 class="card-title">리뷰 작성하기</h5>
			        </div>
			        <div class="card-body">
			        	<form action="reviewWriteAction?USER_ID=${USER_ID }" method="post" enctype="multipart/form-data" name="reviewWriteForm">
			        		<input type="hidden" name="REVIEW_WRITER" value="${USER_ID }">
			        		<input type="hidden" name="REVIEW_P_NO" value="${productdetail.p_NO }">
			        		<div class="modal-header" style="position: relative; top: -45px;">
							</div>
							<div class="modal-body">							
								<table id="reviewUpdateTable">
									<tr>
										<td>구매 상품</td>
										<td><img src="${productdetail.p_IMG }" class="review_img">${productdetail.p_NAME }</td>
									</tr>
									<tr>
										<td>상품 평가</td>
										<td>
											<div class="star_style">
												<span class="fa fa-star star" id="1"></span>
												<span class="fa fa-star star" id="2"></span>
												<span class="fa fa-star star" id="3"></span>
												<span class="fa fa-star star" id="4"></span>
												<span class="fa fa-star star" id="5"></span>
                   							</div>
                   						</td>
									</tr>
									<tr>
										<td>첨부 사진</td>
										<td>
											<input type="file" id="upfile" name="uploadfile">
										</td>
									</tr>
									<tr>
										<td colspan="2">
											<textarea name="REVIEW_CONTENT" class="review_content" placeholder="후기를 입력하세요." required>${reviewdetail.REVIEW_CONTENT }</textarea>
										</td>
									</tr>
								</table>
								
								<div class=review-caution>
									<img src="resources/soo/img/caution.gif">
									<span>작성 시 주의사항</span>
									<ul>
										<li>등록된 내용은 메인페이지, 검색페이지, 상품페이지 등에 노출될 수 있습니다.</li>
										<li>상대방에 대한 욕설, 비방, 명예훼손, 불성실한 내용, 반복문자, 특정 효능에 있어 오해의 소지가 있는 내용을 담고 있거나 저작권/초상권 등 타인의 권리를 침해하는 이미지 사용하면 삭제될 수 있습니다.<br>
											다만, 상품에 대한 불만, 판매자에게 불리한 내용이라는 이유만으로는 삭제하지 않습니다.</li>
									</ul>
								</div>
							</div>
							<div class="modal-footer">
								<button type="submit" class="btn btn-primary">작성하기</button>
								<button type="button" class="btn btn-default" onclick="history.go(-1);">뒤로가기</button>
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
	<script src="resources/soo/js/core/jquery.min.js"></script>
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