<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
  <head>
    <title>DIM - 상품 보기</title>
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
    <link href="https://fonts.googleapis.com/css?family=Poppins:200,300,400,500,600,700,800&display=swap" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css?family=Lora:400,400i,700,700i&display=swap" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css?family=Amatic+SC:400,700&display=swap" rel="stylesheet">

    <link rel="stylesheet" href="resources/css/open-iconic-bootstrap.min.css">
    <link rel="stylesheet" href="resources/css/animate.css">
    
    <link rel="stylesheet" href="resources/css/owl.carousel.min.css">
    <link rel="stylesheet" href="resources/css/owl.theme.default.min.css">
    <link rel="stylesheet" href="resources/css/magnific-popup.css">

    <link rel="stylesheet" href="resources/css/aos.css">

    <link rel="stylesheet" href="resources/css/ionicons.min.css">

    <link rel="stylesheet" href="resources/css/bootstrap-datepicker.css">
    <link rel="stylesheet" href="resources/css/jquery.timepicker.css">

    
    <link rel="stylesheet" href="resources/css/flaticon.css">
    <link rel="stylesheet" href="resources/css/icomoon.css">
    <link rel="stylesheet" href="resources/css/style.css">
    
    <%-- side bar 위해서 추가 --%>
    <link media="all" type="text/css" rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.6.3/css/font-awesome.min.css">
    <link href='https://fonts.googleapis.com/css?family=Raleway' rel='stylesheet' type='text/css'>
    <link rel="stylesheet" href = "resources/css/productdiv.css">
    
    
    <style>
    	.order_option{float:right;height: 28px;
    				color: gray;border: 1px solid lightgrey;}
    	.select_div{margin-bottom: 20px}
    	.sub_li{display:block; height:45px;}
    	.list>li{cursor: pointer;}
    	.search_div{width:100%; text-align: center;min-width: 600px;margin-top: 39px;}
    	.productsearch{width:50%; height: 40px;margin-left: 225px; 
    					text-indent: 35px;border-radius: 3px;
					    border: 1px solid lightgray;}
    	.productsearch::placeholder{color:lightgrey;text-indent: 38%;} 
    	.searchbtn{    height: 40px;
    width: 57px;background: #87cfea;
    				color: white;border: none;}
		.ftco-animate {
    				display: inline-block;
				}
		.main_li1,.main_li2,.main_li3,.allcategory_li{
			list-style-type: none;
		}	    
    </style>
      <script>
    	$(document).ready(function(){
    		var num = 1;// 더보기를 누를 때 마다 num 의 값은 1씩 증가함
    		var option = $(".order_option").val();
    		var category = "";
    		var search_word = "";
    		function productList(){
    			console.log("더보기 할 번호는 = "+ num);
    			console.log("정렬 순서는 ="+option);
    			
    			$.ajax({
    				type:"POST",
    				url:"getProductList",
    				data:{num:num, option:option, category:category, search_word:search_word},
    				async:false,
    				dataType:"json",
    				success:function(rdata){
    					console.log(rdata);
    					var output = "";
    					if(rdata.list.length == 0){
    						output += "<div style='text-align:center;line-height: 300px;'>상품이 존재하지 않습니다.</div>";
    					}else{
    						
	    					$(rdata.list).each(function(index){
	    						output += "<div class='col-md-6 col-lg-3 ftco-animate  fadeInUp ftco-animated'>";
	    						output += "		<div class='product'>";
	    						output += "			<a href='detail?P_NO="+this.p_NO+"' class='img-prod'><img class='img-fluid' src='resources/upload/"+this.p_IMG+"'>";
	    						output += "				<div class='overlay'></div>";
	    						output += "			</a>";
	    						output += "			<div class='text py-3 pb-4 px-3 text-center'>";
	    						output += "				<h3><a href='#'>"+this.p_NAME+"</a></h3>";
	    						output += "				<div class='d-flex'>";
	    						output += "					<div class='pricing'>";
	    						output += "						<p class='price'><span>"+this.p_PRICE+"원</span></p>";
	    						output += "					</div>";
	    						output += "				</div>";
	    						output += "				<div class='bottom-area d-flex px-3'>";
	    						output += "					<div class='m-auto d-flex'>";
	    						//output += "						<a href='#' class='add-to-cart d-flex justify-content-center align-items-center text-center'>";
	    						//output += "							<span><i class='ion-ios-menu'></i></span>";
	    						//output += "						</a>";
	    						//output += "						<a href='#' class='buy-now d-flex justify-content-center align-items-center mx-1'>";
	    						//output += "							<span><i class='ion-ios-cart'></i></span>";
	    						//output += "						</a>";
	    						output += "						<a href='#' class='heart d-flex justify-content-center align-items-center '>";
								output += "							<span><i class='ion-ios-heart'></i></span>"
								output += "						</a>"
	    						output += "					</div>";
	    						output += "				</div>";
	    						output += "			</div>";
	    						output += "		</div>";
	    						output += "</div>"
	    						if((index+1)/4 == 0){//한 줄에 4개씩 띄워주기
	    							output+="<br>";
	    						}
	    						
	    					})//each end
	    					if(rdata.listcount>rdata.end){
	    						output += "<div class='view_more'>더보기▼</div>";
	    					}
    					}//else end
    					$(".productsection").append(output);
    					
    				},
    				error:function(){
    					console.log("실패");
    				}
    			})
    		};//function productList end
    		
    		//처음 페이지 로드 시 실행
    		productList();
    		
    		$(".order_option").change(function(){
    			console.log("select = "+$(this).val());
    			option = $(this).val();
    			$(".productsection").empty();//정렬 방법을 바꿀 시  비우고 다시 띄워줌 
    			productList();	
    		})//change end
    		
    		$(".view_more").click(function(){//더보기 클릭 시 
    			num++;//더보기 클릭시 num 의 값은 1씩 올라감
    			console.log("더보기 클릭 num = "+num);
    			productList();	
    		})//click end
    		
    		$(".list li").click(function(){
    			search_word="";
    			$(".productsearch").val('');
    			var list_name = $(this).text();
    			category = $(this).val();
    			console.log("클릭한 메뉴는 "+list_name + "/ category 번호는 = "+category);
    			productList();
    		})
    		
    		$(".searchbtn").click(function(){
    			console.log("검색 버튼누름");
    			search_word = $(".productsearch").val();
    			console.log("입력된 검색어 = "+search_word);
    			if(search_word == "" || search_word == null){
    				alert("검색어를 입력하세요");
    			}else{
    				productList();
    			}
    		})
    	})
    	
    </script>
  </head>
  <body class="goto-here">
	<header>
		<jsp:include page="../main/header.jsp"/>
	</header>
    <div class="hero-wrap hero-bread" style="background-image: url('resources/images/category_img.jpg');opacity: 0.7;">
      <div class="container">
        <div class="row no-gutters slider-text align-items-center justify-content-center">
          <div class="col-md-9 ftco-animate text-center">
          	<p class="breadcrumbs"><span class="mr-2"><a href="index.html">Home</a></span> <span>Products</span></p>
            <h1 class="mb-0 bread">Products</h1>
          </div>
        </div>
      </div>
    </div>

    <section class="ftco-section">
    	<div class="container">
    		
    		<%-- 검색창 --%>
    		<div class="search_div">
    			<input type="text" name="search" class="productsearch" placeholder="검색어를 입력하세요" autocomplete="off"> <input type="button" class="searchbtn" value="검색">
    		</div>
    		
    		<%-- 셀렉트 --%>
    		<div class = "container select_div">
    				<select class="order_option">
    					<option value="P_REGDATE DESC">최신순</option>
    					<option value="P_DIBS DESC">인기순</option>
    					<option value="P_PRICE DESC">높은 가격순</option>
    					<option value="P_PRICE ASC">낮은 가격순</option>
    				</select>
    		</div><br>
    		
    		
    		<div class="row">
    			<%-- 사이드바 --%>
            	<div class="col-md-3 col-sm-3 sidebar2">
                	<div class="left-navigation">
                		<ul class="list">
                			<li class="allcategory_li">모든 상품 보기</li>
                		</ul>
                    	<ul class="list">
		                   <li class="main_li1" value="100">가구</li>
		                   <li class="sub_li" value="101">침실</li>
		                   <li class="sub_li" value="102">주방</li>
		                   <li class="sub_li" value="103">수납</li>
		                   <li class="sub_li" value="104">거실</li>
		                   <li class="sub_li" value="105">욕실</li>
                    	</ul>
                    	<ul class="list">
		                   <li class="main_li2" value="200">음식</li>
		                   <li class="sub_li" value="206">한식</li>
		                   <li class="sub_li" value="207">일식</li>
		                   <li class="sub_li" value="208">양식</li>
		                   <li class="sub_li" value="209">중식</li>
		                   <li class="sub_li" value="210">베이킹</li>
		                 </ul>
		                 <ul class="list">
		                   <li class="main_li3" value="300">취미</li>
		                   <li class="sub_li" value="311">드로잉</li>
		                   <li class="sub_li" value="312">미니어쳐</li>
		                   <li class="sub_li" value="313">캔들&향수</li>
		                   <li class="sub_li" value="314">슬라임</li>
		                   <li class="sub_li" value="315">액세서리</li>
		                 </ul>
                	</div>
            	</div>
            	<%--sidebar end --%>
				
	    		<%-- 상품들 --%>
            	<section class = "productsection">

            	</section>
    		<div class="row mt-5">
	          <div class="col text-center">
	            <div class="block-27">
					
	            </div>
	          </div>
	        </div>
    	</div>
    </section>

		<section class="ftco-section ftco-no-pt ftco-no-pb py-5 bg-light">
      <div class="container py-4">
        <div class="row d-flex justify-content-center py-5">
          <div class="col-md-6">
          	<h2 style="font-size: 22px;" class="mb-0">Subcribe to our Newsletter</h2>
          	<span>Get e-mail updates about our latest shops and special offers</span>
          </div>
          <div class="col-md-6 d-flex align-items-center">
            <form action="#" class="subscribe-form">
              <div class="form-group d-flex">
                <input type="text" class="form-control" placeholder="Enter email address">
                <input type="submit" value="Subscribe" class="submit px-3">
              </div>
            </form>
          </div>
        </div>
      </div>
    </section>
    <footer class="ftco-footer ftco-section">
      <div class="container">
      	<div class="row">
      		<div class="mouse">
							<div class="mouse-wheel"><span class="ion-ios-arrow-up"></span></div>
						</a>
					</div>
      	</div>
        <div class="row mb-5">
          <div class="col-md">
            <div class="ftco-footer-widget mb-4">
              <h2 class="ftco-heading-2">Vegefoods</h2>
              <p>Far far away, behind the word mountains, far from the countries Vokalia and Consonantia.</p>
              <ul class="ftco-footer-social list-unstyled float-md-left float-lft mt-5">
                <li class="ftco-animate"><a href="#"><span class="icon-twitter"></span></a></li>
                <li class="ftco-animate"><a href="#"><span class="icon-facebook"></span></a></li>
                <li class="ftco-animate"><a href="#"><span class="icon-instagram"></span></a></li>
              </ul>
            </div>
          </div>
          <div class="col-md">
            <div class="ftco-footer-widget mb-4 ml-md-5">
              <h2 class="ftco-heading-2">Menu</h2>
              <ul class="list-unstyled">
                <li><a href="#" class="py-2 d-block">Shop</a></li>
                <li><a href="#" class="py-2 d-block">About</a></li>
                <li><a href="#" class="py-2 d-block">Journal</a></li>
                <li><a href="#" class="py-2 d-block">Contact Us</a></li>
              </ul>
            </div>
          </div>
          <div class="col-md-4">
             <div class="ftco-footer-widget mb-4">
              <h2 class="ftco-heading-2">Help</h2>
              <div class="d-flex">
	              <ul class="list-unstyled mr-l-5 pr-l-3 mr-4">
	                <li><a href="#" class="py-2 d-block">Shipping Information</a></li>
	                <li><a href="#" class="py-2 d-block">Returns &amp; Exchange</a></li>
	                <li><a href="#" class="py-2 d-block">Terms &amp; Conditions</a></li>
	                <li><a href="#" class="py-2 d-block">Privacy Policy</a></li>
	              </ul>
	              <ul class="list-unstyled">
	                <li><a href="#" class="py-2 d-block">FAQs</a></li>
	                <li><a href="#" class="py-2 d-block">Contact</a></li>
	              </ul>
	            </div>
            </div>
          </div>
          <div class="col-md">
            <div class="ftco-footer-widget mb-4">
            	<h2 class="ftco-heading-2">Have a Questions?</h2>
            	<div class="block-23 mb-3">
	              <ul>
	                <li><span class="icon icon-map-marker"></span><span class="text">203 Fake St. Mountain View, San Francisco, California, USA</span></li>
	                <li><a href="#"><span class="icon icon-phone"></span><span class="text">+2 392 3929 210</span></a></li>
	                <li><a href="#"><span class="icon icon-envelope"></span><span class="text">info@yourdomain.com</span></a></li>
	              </ul>
	            </div>
            </div>
          </div>
        </div>
        <div class="row">
          <div class="col-md-12 text-center">

            <p><!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
						  Copyright &copy;<script>document.write(new Date().getFullYear());</script> All rights reserved | This template is made with <i class="icon-heart color-danger" aria-hidden="true"></i> by <a href="https://colorlib.com" target="_blank">Colorlib</a>
						  <!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
						</p>
          </div>
        </div>
      </div>
    </footer>
    
  

  <!-- loader -->
  <div id="ftco-loader" class="show fullscreen"><svg class="circular" width="48px" height="48px"><circle class="path-bg" cx="24" cy="24" r="22" fill="none" stroke-width="4" stroke="#eeeeee"/><circle class="path" cx="24" cy="24" r="22" fill="none" stroke-width="4" stroke-miterlimit="10" stroke="#F96D00"/></svg></div>


  <script src="resources/js/jquery.min.js"></script>
  <script src="resources/js/jquery-migrate-3.0.1.min.js"></script>
  <script src="resources/js/popper.min.js"></script>
  <script src="resources/js/bootstrap.min.js"></script>
  <script src="resources/js/jquery.easing.1.3.js"></script>
  <script src="resources/js/jquery.waypoints.min.js"></script>
  <script src="resources/js/jquery.stellar.min.js"></script>
  <script src="resources/js/owl.carousel.min.js"></script>
  <script src="resources/js/jquery.magnific-popup.min.js"></script>
  <script src="resources/js/aos.js"></script>
  <script src="resources/js/jquery.animateNumber.min.js"></script>
  <script src="resources/js/bootstrap-datepicker.js"></script>
  <script src="resources/js/scrollax.min.js"></script>
  <script src="resources/js/main.js"></script>
   <script>
    	$(function(){
    		$(".list").each(function(index, item){
			//var a = $(this).children(".sub_li").css("display");
				/* if(index ==0){
					$(".list li:gt(0)").toggle("fast");
				}*/
				
				$(this).children("li:eq(0)").click(function(){
					$(item).children("li:gt(0)").toggle("fast");
				})
				
				$(this).children("li").click(function(){
					$(".list li").css("box-shadow", "none");
					$(this).css("box-shadow","1px 1px 10px 1px lightgrey inset");
				})
				
    		})
    		
    		
    	})
    		
    		
    		
    </script>
  </body>
</html>