<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib prefix ="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Search</title>
	<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <link href="https://fonts.googleapis.com/css?family=Poppins:200,300,400,500,600,700,800&display=swap" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css?family=Lora:400,400i,700,700i&display=swap" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css?family=Amatic+SC:400,700&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="resources/css/homecss/open-iconic-bootstrap.min.css">
    <link rel="stylesheet" href="resources/css/homecss/animate.css">
    <link rel="stylesheet" href="resources/css/homecss/owl.carousel.min.css">
    <link rel="stylesheet" href="resources/css/homecss/owl.theme.default.min.css">
    <link rel="stylesheet" href="resources/css/homecss/magnific-popup.css">
    <link rel="stylesheet" href="resources/css/homecss/aos.css">
    <link rel="stylesheet" href="resources/css/homecss/ionicons.min.css">
    <link rel="stylesheet" href="resources/css/homecss/bootstrap-datepicker.css">
    <link rel="stylesheet" href="resources/css/homecss/jquery.timepicker.css">
    <link rel="stylesheet" href="resources/css/homecss/flaticon.css">
    <link rel="stylesheet" href="resources/css/homecss/icomoon.css">
    <link rel="stylesheet" href="resources/css/homecss/style.css">
    <link rel="stylesheet" href="resources/css/homecss/home.css">
    <jsp:include page="header.jsp"/>
</head>
<body>
    <section class="ftco-section2">
     	<div id="floatMenu" style="height:450px;">
    		<c:if test="${empty recentView }">
    			추천 DIM
    			<br>
    			<c:forEach var="recommend" items="${bestDim }" begin="0" end="3" step="1">
   					<a href="detail?P_NO=${recommend.p_NO}">
						<img src="resources/upload/${recommend.p_IMG}" class="float_img" style="width:100px; height:100px; border-radius:10px; padding:2px;">
					</a>
				<br>
				</c:forEach>
    		</c:if>
    		<c:if test="${!empty recentView }">
    			방금 본 DIM
    			<br>
    			<c:forEach var="rv" items="${recentView }" begin="0" end="3" step="1">
    				<a href="detail?P_NO=${rv.IMG}">
						<img src="resources/upload/${rv.IMG}" class="float_img" style="width:100px; height:100px; border-radius:10px; padding:2px;">
					</a>
				<br>
    			</c:forEach>
    		</c:if>
    	</div>
    	<div class="container">
    	 <form action="Search_home" autocomplete="off" name="search_box" id= "searchbox_form" style="margin-top:4.2%;">
		    <fieldset class="url">
					<select name="search_field" size=1>
						<option value='0'>전체</option>
						<option value='1'>판매자 이름</option>
						<option value='2'>상품</option>
						<option value='3'>내용</option>
					</select>
		      		<input id="url" type="text" name="search_word" required style="min-width:350px;">
		      <div class="after"></div>
		    </fieldset>
		    <fieldset class="enter">
		      <button>검색</button>
		    </fieldset>
		</form>
				<div class="row justify-content-center mb-3 pb-3">
          <div class="col-md-12 heading-section text-center ftco-animate">
          	<span class="subheading"></span>
            <h2 class="mb-4" style="margin-top:5%;">검색 결과</h2>
            <p>Search Result</p>
          </div>
        </div>   		
    	</div>
    	<div class="container">
    		<div class="row">
    			<c:forEach var="PL" items="${ProductList}" begin="0" end="7" step="1">
	    			<div class="col-md-6 col-lg-3 ftco-animate">
	    				<div class="product product-add">
	    					<a href="detail?P_NO=${PL.p_NO}" class="img-prod">
	    					<input type="hidden" name="Product_NO" value="${PL.p_NO}">
	    					<img class="img-fluid" src="resources/upload/${PL.p_IMG}" alt="Colorlib Template">
	    						<div class="overlay"></div>
	    					</a>
	    					<div class="text py-3 pb-4 px-3 text-center">
	    						<h3><a href="#">${PL.p_NAME}</a></h3>
	    						<div class="d-flex">
	    							<div class="pricing">
			    						<p class="price"><span>${PL.p_PRICE}</span></p>
			    					</div>
		    					</div>
		    					<div class="bottom-area d-flex px-3">
		    						<div class="m-auto d-flex">
		    							<a href="detail?P_NO=${PL.p_NO}" class="add-to-cart d-flex justify-content-center align-items-center text-center">
		    								<span><i class="ion-ios-menu"></i></span>
		    							</a>
		    							<a href="#" class="heart d-flex justify-content-center align-items-center">
		    								<span><i class="ion-ios-heart"></i></span>
		    							</a>
	    							</div>
	    						</div>
	    					</div>
	    				</div>
	    			</div>
    			</c:forEach>
    			<c:if test="${empty ProductList }">
    					<div class="container">
				<div class="row justify-content-center mb-3 pb-3">
          <div class="col-md-12 heading-section text-center ftco-animate">
          	<span class="subheading"></span>
            <h2 class="mb-4" style="margin-top:7%;">검색 결과가 없습니다</h2>
            <p>다른 단어로 검색 해보세요.</p>
          </div>
        </div>   		
    	</div>
    			</c:if>
    		</div>
    	</div>
    		<c:if test="${!empty ProductList }">
    		<div class="center-block">
				<div class="row">
					<div class="col" style="margin-left:44.13%;">
						<ul class="pagination">
							<c:if test="${page <= 1 }">
								<li class="page-item">
									<a class="page-link current" href="#">이전&nbsp;</a>
								</li>
							</c:if>
							
							<c:if test="${page > 1 }">
								<li class="page-item">
									<a href="Search_home?page=${page -1 }&search_field=${search_field}&search_word=${search_word}" class="page-link">이전</a> &nbsp;
								</li>
							</c:if>
							
							<c:forEach var="a" begin="${startpage }" end="${endpage }">
								<c:if test="${a==page }">
									<li class="page-item">
										<a class="page-link current" href="#">${a }</a>
									</li>
								</c:if>
								<c:if test="${a != page }">
									<li class="page-item">
										<a href="Search_home?page=${a }&search_field=${search_field}&search_word=${search_word}" class="page-link">${a }</a>
									</li>
								</c:if>
							</c:forEach>
							
							<c:if test="${page >= maxpage }">
								<li class="page-item">
									<a class="page-link current" href="#">&nbsp;다음</a>
								</li>
							</c:if>
							<c:if test="${page < maxpage }">
								<li class="page-item">
									<a href="Search_home?page=${page+1 }&search_field=${search_field}&search_word=${search_word}" class="page-link">&nbsp;다음</a>
								</li>
							</c:if>
							
						</ul>
					</div>
				</div>
			</div>
			</c:if>
    </section>
     <div id="ftco-loader" class="show fullscreen"><svg class="circular" width="48px" height="48px"><circle class="path-bg" cx="24" cy="24" r="22" fill="none" stroke-width="4" stroke="#eeeeee"/><circle class="path" cx="24" cy="24" r="22" fill="none" stroke-width="4" stroke-miterlimit="10" stroke="#F96D00"/></svg></div>

  <script src="resources/js/home_js/jquery.min.js"></script>
  <script src="resources/js/home_js/jquery-migrate-3.0.1.min.js"></script>
  <script src="resources/js/home_js/popper.min.js"></script>
  <script src="resources/js/home_js/jquery.easing.1.3.js"></script>
  <script src="resources/js/home_js/jquery.waypoints.min.js"></script>
  <script src="resources/js/home_js/jquery.stellar.min.js"></script>
  <script src="resources/js/home_js/owl.carousel.min.js"></script>
  <script src="resources/js/home_js/jquery.magnific-popup.min.js"></script>
  <script src="resources/js/home_js/aos.js"></script>
  <script src="resources/js/home_js/jquery.animateNumber.min.js"></script>
  <script src="resources/js/home_js/bootstrap-datepicker.js"></script>
  <script src="resources/js/home_js/scrollax.min.js"></script>
  <script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBVWaKrjvy3MaE7SQ74_uJiULgl1JY0H2s&sensor=false"></script>
  <script src="resources/js/home_js/google-map.js"></script>
  <script src="resources/js/home_js/main.js"></script>
  <script>
	    $(function(){
	      	//기존 css에서 플로팅 배너 위치(top)값을 가져와 저장한다.
	    	var floatPosition = parseInt($("#floatMenu").css('top'));
	    	// 250px 이런식으로 가져오므로 여기서 숫자만 가져온다. parseInt( 값 );
	
	    	$(window).scroll(function() {
	    		// 현재 스크롤 위치를 가져온다.
	    		var scrollTop = $(window).scrollTop();
	    		var newPosition = scrollTop + floatPosition + "px";
	
	    		/* 애니메이션 없이 바로 따라감
	    		 $("#floatMenu").css('top', newPosition);
	    		 */
	
	    		$("#floatMenu").stop().animate({
	    			"top" : newPosition
	    		}, 500);
	
	    	}).scroll();
	    	
	    	$("#floatMenu").stop().animate({
	    		"top" : newPosition
	    	}, {
	    		'duration' : 500,
	    		'easing' : 'easeInOutCubic',
	    		'complete' : function() {
	    		}
	    	});
	    })
    </script>
</body>
</html>