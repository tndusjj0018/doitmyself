<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html class="perfect-scrollbar-on"><head>
	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
	<title>
 	나의 상품 리뷰
	</title>
	<meta content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0, shrink-to-fit=no" name="viewport">
  
	<!-- CSS Files -->	
	<link href="resources/soo/css/reviewList.css" rel="stylesheet">
	<style>
		.navbar {
			padding-bottom: 1px !important;
		}
		
		.center-block {
     		display: flex !important;  
    		 justify-content:center !important; /* 가운데 정렬 */
    		 position: relative;
    		 top: -12px;
  		 }
   
   		select.form-control{width:auto;margin-bottom:2em;display:inline-block;}
   		.rows{text-align:right;}
   		.row{height:0}
   		.gray{color:gray} 
   		li .current {background:#faf7f7 !important;} 
	</style>
		
	<!-- tab 필요 -->
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
  	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
  	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
  	<script src="resources/soo/js/core/jquery.min.js"></script>
  	
  	<script>
		$(document).ready(function(){
		/* $('#reviewform').on('submit', function(e){
		    e.preventDefault();
		    $.ajax({
		        url: "reviewWrite.rv",
		        type: "POST",
		        data: $("#reviewform").serialize(),
		        success: function(data){
		           alert(data);
		            $('#just-data').modal("hide");
		        },error :function(data){
		           alert("sad");
		        }
		    });
		}); */
		
			$('.star').click(function(){
			      console.log($(this).attr('id'));
			      $(this).parent().children('span').removeClass('checked');
			      $(this).parent().children('span').empty();
			      $(this).addClass('checked').prevAll('span').addClass('checked');
			      $(this).append("<input type='hidden' name='star' value="+$(this).attr('id')+">");
			      return false;
			   })
		   
		
		   $('#productPageGo').click(function(){
				location.href='product?category=all';
			});
		
			$('#ReviewListGo').click(function(){
				location.href='reviewList?USER_ID=${USER_ID}'
			});
		});
	</script>
	
	<style>
		body > div > div.main-panel.ps-container.ps-theme-default > nav > div > div.navbar-wrapper > a:hover {color:#66615B !important} 
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
            			
						<a class="navbar-brand" style="line-height:36px !important;">리뷰 및 QNA</a>
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
     
			<div class="content" style="margin-bottom: 110px">
			  <div class="row">
			    <div class="col-md-10">
			      <div class="card card-user">
			        <div class="card-header">
			          <h5 class="card-title">나의 상품 리뷰</h5>
			        </div>
			        <div class="card-body">
			        	<div class="container">
			        	
							<ul>
								<li>고객님께서 작성하신 상품 리뷰를 조회하고 수정할 수 있습니다.</li>
								<li>컨텐츠 운영 정책에 맞지 않는 리뷰는 삭제 될 수 있습니다.</li>
							</ul>

							<ul class="nav nav-tabs">
								<li class="active"><a data-toggle="tab" href="#home">리뷰 작성 가능 상품</a></li>
								<li><a data-toggle="tab" href="#menu1">내가 작성한 리뷰</a></li>
							</ul>

							<div class="tab-content">
								<div id="home" class="tab-pane in active">
									<!-- 리뷰 쓸 목록 있는 경우 -->
			        				<c:if test="${reviewablecount > 0}">
									<table class="table">
										<tr>
											<td>주문 일자</td> <td colspan="2">주문 상품 정보</td> <td>상품 금액 (수량)</td> <td>스토어 명</td> <td>상태</td>
										</tr>
										<c:forEach var="ral" items="${reviewablelist}">
										<tr>
											<td>
												${ral.ORDER_DATE }
											</td>
											<td>
												<img src="${ral.p_IMG }" class="product_img" onclick="location.href='detail?P_NO=${ral.p_NO}';">
											</td>
											<td>
												<span style="cursor:pointer"onclick="location.href='detail?P_NO=${ral.p_NO}';">${ral.p_NAME }</span>
											</td>
											<td>
												${ral.ORDER_PRICE }<br>
												(${ral.ORDER_AMOUNT}개)
											</td>
											<td>
												${ral.p_SELLER }
											</td>
											<td>
												<!-- <button type="button" class="btn" data-toggle="modal" data-target="#myModal">리뷰 작성</button> -->
												<button type="button" class="btn" onclick="location.href='reviewWrite?P_NO=${ral.p_NO}&REVIEW_ORDER_NO=${ral.ORDER_NO }';">리뷰 작성</button>
											</td>
										</tr>
										</c:forEach>
									</table>
									
									<div class="center-block">
				<div class="row">
					<div class="col">
						<ul class="pagination">
							<c:if test="${page_able <= 1 }">
								<li class="page-item">
									<a class="page-link current" href="#">이전&nbsp;</a>
								</li>
							</c:if>
							
							<c:if test="${page_able > 1 }">
								<li class="page-item">
									<a href="reviewList?page_able=${page_able -1 }&USER_ID=${USER_ID}" class="page-link" style="float: none">이전</a> &nbsp;
								</li>
							</c:if>
							
							<c:forEach var="a" begin="${startpage_able }" end="${endpage_able }">
								<c:if test="${a==page_able }">
									<li class="page-item">
										<a class="page-link current" href="#">${a }</a>
									</li>
								</c:if>
								<c:if test="${a != page_able }">
									<li class="page-item">
										<a href="reviewList?page_able=${a }&USER_ID=${USER_ID}" class="page-link">${a }</a>
									</li>
								</c:if>
							</c:forEach>
							
							<c:if test="${page_able >= maxpage_able }">
								<li class="page-item">
									<a class="page-link current" href="#">&nbsp;다음</a>
								</li>
							</c:if>
							<c:if test="${page_able < maxpage_able }">
								<li class="page-item">
									<a href="reviewList?page_able=${page_able+1 }&USER_ID=${USER_ID}" class="page-link">&nbsp;다음</a>
								</li>
							</c:if>
							
						</ul>
					</div>
				</div>
			</div>
									
									</c:if>
									
									<!-- 리뷰 쓸 목록 없는 경우 -->
			        				<c:if test="${reviewablecount == 0}">
			        					<div class="container">
			    							<div class="leaveInfo">
			    								<i class="nc-icon nc-ruler-pencil"></i>			     	        		
			        							<span>현재 리뷰 작성 가능한 상품이 존재하지 않습니다.</span>
			        						</div>
			        						<input type="button" id="productPageGo" name="productPageGo" class="btn btn-primary btn-round" value="상품 보러 가기" 
			        			   					style="margin-left:38%; margin-right:15px;">
			        					</div>
			        				</c:if>
									
								</div>
								
								<div id="menu1" class="tab-pane fade">
									
									<!-- 작성한 리뷰 있는 경우 -->
			        				<c:if test="${reviewwritecount > 0}">
									<table class="table">
										<tr>
											<td>작성 일자</td> <td colspan="2">주문 상품 정보</td> <td>스토어 명</td> <td>별점</td> <td>상태</td>
										</tr>
										<c:forEach var="rwl" items="${reviewwritelist}">
										<tr>
											<td>
												${rwl.REVIEW_DATE }
											</td>
											<td>
												<img src="${rwl.p_IMG}" class="product_img" onclick="location.href='detail?P_NO=${rwl.p_NO}';">
											</td>
											<td>
												<span style="cursor:pointer" onclick="location.href='detail?P_NO=${rwl.p_NO}';">${rwl.p_NAME}</span>
											</td>
											<td>
												${rwl.p_SELLER }
											</td>
											<td>
												${rwl.REVIEW_RATE }
											</td>
											<td>
												<%-- <button type="button" class="btn" data-toggle="modal" data-target="#myModal_update${rwl.p_NO }">수정 / 삭제</button> --%>
												<button type="button" class="btn" onclick="location.href='reviewUpdate?P_NO=${rwl.p_NO}&REVIEW_NO=${rwl.REVIEW_NO }';">수정 / 삭제</button>
											</td>
										</tr>
										</c:forEach>
									</table>
									
									<div class="center-block">
				<div class="row">
					<div class="col">
						<ul class="pagination">
							<c:if test="${page_write <= 1 }">
								<li class="page-item">
									<a class="page-link current" href="#">이전&nbsp;</a>
								</li>
							</c:if>
							
							<c:if test="${page_write > 1 }">
								<li class="page-item">
									<a href="reviewList#menu1?page_write=${page_write -1 }" class="page-link">이전</a> &nbsp;
								</li>
							</c:if>
							
							<c:forEach var="a" begin="${startpage_write }" end="${endpage_write }">
								<c:if test="${a==page_write }">
									<li class="page-item">
										<a class="page-link current" href="#">${a }</a>
									</li>
								</c:if>
								<c:if test="${a != page_write }">
									<li class="page-item">
										<a href="reviewList#menu1?page_write=${a }" class="page-link">${a }</a>
									</li>
								</c:if>
							</c:forEach>
							
							<c:if test="${page_write >= maxpage_write }">
								<li class="page-item">
									<a class="page-link current" href="#">&nbsp;다음</a>
								</li>
							</c:if>
							<c:if test="${page_write < maxpage_write }">
								<li class="page-item">
									<a href="reviewList#menu1?page_write=${page_write+1 }" class="page-link">&nbsp;다음</a>
								</li>
							</c:if>
							
						</ul>
					</div>
				</div>
			</div>
									
									
									</c:if>
									
									<!-- 작성한 리뷰 없는 경우 -->
			        				<c:if test="${reviewwritecount == 0}">
			        					<div class="container">
			    							<div class="leaveInfo">
			    								<i class="nc-icon nc-paper"></i>			     	        		
			        							<span>작성한 리뷰가 없습니다.</span>
			        						</div>
			        						<input type="button" id="ReviewListGo" name="productPageGo" class="btn btn-primary btn-round" value="리뷰 작성하러 가기" 
			        			   					style="margin-left:38%; margin-right:15px;">
			        					</div>
			        				</c:if>
			        			
									
								</div>
    						</div>    					
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
