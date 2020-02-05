<%@ taglib prefix ="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<!DOCTYPE html>
  <head>
    <title>DIM - Final Project</title>
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
  
  <body class="goto-here">
    <section id="home-section" class="hero">
    	<div id="floatMenu">
    		<c:if test="${empty recentView }">
    			추천 DIM
    			<br>
    			<c:forEach var="recommend" items="${bestDim }" begin="0" end="3" step="1">
   					<a href="detail?P_NO=${recommend.p_NO}">
						<img src="resources/upload/${recommend.p_IMG}" class="float_img" style="width:100px; height:100px; border-radius:10px; padding:2px; z-index:-1;">
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
		  <div class="home-slider owl-carousel" style="z-index:7;">
	      <div class="slider-item" style="background-image: url(resources/img/img_w_banner_30406_ctc.jpg);">
	      	<div class="overlay"></div>
	        <div class="container">
	          <div class="row slider-text justify-content-center align-items-center" data-scrollax-parent="true">
	            <div class="col-md-12 ftco-animate text-center">
	              <h1 class="mb-2">Do It Myself</h1>
	              <h2 class="subheading mb-4">DIM - final project</h2>
	              <p><a href="#" class="btn btn-primary">View Details</a></p>
	            </div>

	          </div>
	        </div>
	      </div>
	      <div class="slider-item" style="background-image: url(resources/img/img_w_banner_legacy.jpg);">
	      	<div class="overlay"></div>
	        <div class="container">
	          <div class="row slider-text justify-content-center align-items-center" data-scrollax-parent="true">
	            <div class="col-sm-12 ftco-animate text-center">
	              <h1 class="mb-2">Do It Myself</h1>
	              <h2 class="subheading mb-4">DIM</h2>
	              <p><a href="#" class="btn btn-primary">View Details</a></p>
	            </div>
	          </div>
	        </div>
	      </div>
	    </div>
    </section>
		<form action="Search_home" autocomplete="off" name="search_box" id= "searchbox_form">
		    	<fieldset class="url">
					<select name="search_field" size=1>
						<option value='0'>전체</option>
						<option value='1'>판매자 이름</option>
						<option value='2'>상품</option>
						<option value='3'>내용</option>
					</select>
		      		<input id="url" type="text" name="search_word" required>
		      <div class="after"></div>
		    </fieldset>
		    <fieldset class="enter">
		      <button>검색</button>
		    </fieldset>
		  </form>
    <section class="ftco-section1">
		<div class="container">
				<div class="row no-gutters ftco-services">
          <div class="col-md-3 text-center d-flex align-self-stretch ftco-animate">
            <div class="media block-6 services mb-md-0 mb-4">
              <div class="icon bg-color-1 active d-flex justify-content-center align-items-center mb-2">
            		<span class="flaticon-shipped"></span>
              </div>
              <div class="media-body">
                <h3 class="heading">배송 조회</h3>
                <span>당신의 DIY가 어딨는지 확인해보세요</span>
              </div>
            </div>      
          </div>
          <div class="col-md-3 text-center d-flex align-self-stretch ftco-animate">
            <div class="media block-6 services mb-md-0 mb-4">
              <div class="icon bg-color-2 d-flex justify-content-center align-items-center mb-2">
            		<span class="flaticon-diet"></span>
              </div>
              <div class="media-body">
                <h3 class="heading">맛있는 음식</h3>
                <span>간단한 조리</span>
              </div>
            </div>    
          </div>
          <div class="col-md-3 text-center d-flex align-self-stretch ftco-animate">
            <div class="media block-6 services mb-md-0 mb-4">
              <div class="icon bg-color-3 d-flex justify-content-center align-items-center mb-2">
            		<span class="flaticon-award"></span>
              </div>
              <div class="media-body">
                <h3 class="heading">향상된 품질</h3>
                <span>더 나은 품질</span>
              </div>
            </div>      
          </div>  
          <div class="col-md-3 text-center d-flex align-self-stretch ftco-animate">
            <div class="media block-6 services mb-md-0 mb-4">
              <div class="icon bg-color-4 d-flex justify-content-center align-items-center mb-2">
            		<span class="flaticon-customer-service"></span>
              </div>
              <div class="media-body">
                <h3 class="heading">고객 센터 운영</h3>
                <span>24시간 매일 운영됩니다</span>
              </div>
            </div>      
          </div>
        </div>
		</div>
		</section>
    <section class="ftco-section2">
    	<div class="container">
				<div class="row justify-content-center mb-3 pb-3">
          <div class="col-md-12 heading-section text-center ftco-animate">
          	<span class="subheading"></span>
            <h2 class="mb-4">BEST</h2>
            <p>Best DIY</p>
          </div>
        </div>   		
    	</div>
    	<div class="container">
    		<div class="row">
    			<c:forEach var="best" items="${bestDim}" begin="0" end="7" step="1">
    			<div class="col-md-6 col-lg-3 ftco-animate">
    				<div class="product product-add" style="width:255px; height:266.87px;">
    					<a href="detail?P_NO=${best.p_NO}" class="img-prod">
    					<input type="hidden" name="Product_NO" value="${best.p_NO}">
    					<img class="img-fluid" src="resources/upload/${best.p_IMG}" alt="Colorlib Template"style="width:253px; height:168.62px;">
    						<div class="overlay"></div>
    					</a>
    					<div class="text py-3 pb-4 px-3 text-center">
    						<h3><a href="#">${best.p_NAME}</a></h3>
    						<div class="d-flex">
    							<div class="pricing">
		    						<p class="price"><span>&#8361; <fmt:formatNumber value="${best.p_PRICE}" pattern="#,###,###" /></span></p>
		    					</div>
	    					</div>
	    					<div class="bottom-area d-flex px-3">
	    						<div class="m-auto d-flex">
	    							<a href="#" class="heart d-flex justify-content-center align-items-center">
	    								<span><i class="ion-ios-heart"></i></span>
	    							</a>
    							</div>
    						</div>
    					</div>
    				</div>
    			</div>
    			</c:forEach>
    		</div>
    	</div>
    </section>

    <section class="ftco-section2">
    	<div class="container">
				<div class="row justify-content-center mb-3 pb-3">
          <div class="col-md-12 heading-section text-center ftco-animate">
          	<span class="subheading"></span>
            <h2 class="mb-4">NEW ARRIVALS</h2>
            <a href="product?category=all" style="color: cornflowerblue;"><p>새로운 DIY 더 보기</p></a>
          </div>
        </div>
    	</div>
    	<div class="container">
    		<div class="row">
    			<c:forEach var="New" items="${newDim }" begin="0" end="11" step="1">
    			<div class="col-md-6 col-lg-3 ftco-animate">
    				<div class="product product-add" style="width:255px; height:266.87px;">
    					<a href="detail?P_NO=${New.p_NO }" class="img-prod">
    					<input type="hidden" name="Product_NO" value="${New.p_NO}">
    					<img class="img-fluid" src="resources/upload/${New.p_IMG }" alt="Colorlib Template" style="width:253px; height:168.62px;">
    						<div class="overlay"></div>
    					</a>
    					<div class="text py-3 pb-4 px-3 text-center">
    						<h3><a href="#">${New.p_NAME }</a></h3>
    						<div class="d-flex">
    							<div class="pricing">
		    						<p class="price"><span>&#8361; <fmt:formatNumber value="${New.p_PRICE }" pattern="#,###,###" /></span></p>
		    					</div>
	    					</div>
	    					<div class="bottom-area d-flex px-3">
	    						<div class="m-auto d-flex">
	    							<a href="#" class="heart d-flex justify-content-center align-items-center" style="background:red;">
	    								<span><i class="ion-ios-heart"></i></span>
	    							</a>
	    								<input type="hidden" name="USER_ID" id="USER_ID" value="${USER_ID }">
    							</div>
    						</div>
    					</div>
    				</div>
    			</div>
    			</c:forEach>
    		</div>
    	</div>
    </section>
	
	<section class="ftco-section ftco-no-pt ftco-no-pb py-5 bg-light">
      <div class="container py-4">
        <div class="row d-flex justify-content-center py-5">
          <div class="col-md-6">
          	<h2 style="font-size: 22px;" class="mb-0"></h2>
          	<span></span>
          </div>
          <div class="col-md-6 d-flex align-items-center">
            
          </div>
        </div>
      </div>
    </section>
 <!--	<footer class="ftco-footer ftco-section">
   		</footer>-->

  <!-- loader -->
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