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
		.heart_background{ background: red!important;}	
		.view_more{
			text-align: center;
    		border-top: 1px solid #d3d3d345;
    		cursor: pointer;
		}    
		.img-fluid {
		    width: 190px;
		    height: 183px;
		}
		.product .text h3  {
			width: 154px;
		    overflow: hidden;
		    text-overflow: ellipsis;
		    white-space: nowrap;
		}
    </style>
      <script>
      
      function dibs(p_NO){//찜하기 눌렀을 때 실행될 함수
    	  	if("${USER_ID}"){
				$.ajax({
					type:"POST",
					url:"jjim",
					data:{P_NO:p_NO, D_USER_ID:"${USER_ID}"},
					success:function(rdata){
						if(rdata == 2){
							console.log("찜 취소 완료");
						}else{
							console.log("찜 하기 완료");
						}
					},
					error:function(){
						console.log("에러");
					}//error end
				})//ajax end
    	  	}else{
    	  		var loginCheck = confirm("로그인이 필요합니다.\n로그인하시겠습니까?");
    	  		if(loginCheck == true){
    	  			location.href = 'login';	
    	  		}
    	  	}
    	  
		}//function dibs end
		
		
		function ProductDibsCheck(P_NO,USER_ID){
			$.ajax({
				type:"POST",
				url:"ProductDibsCheck",
				data:{P_NO:P_NO,D_USER_ID:USER_ID},
				async:false,
				success:function(rdata){
					console.log(rdata);
					if(rdata == null){
						
					}else{
						
					}
				},
				error:function(){
					
				}
			})
		}
		
    	$(document).ready(function(){
    		var num = 1;// 더보기를 누를 때 마다 num 의 값은 1씩 증가함
    		var option = $(".order_option").val();
    		var category = "all";
    		
    		var pa_category = '<%=request.getParameter("category") %>';
    		if(pa_category){
    			category = pa_category;
    		}
    		$("list li[value = '"+category+"]'").prop("box-shadow","lightgrey 1px 1px 10px 1px inset");
    		console.log("접속 했을 때 category = "+category);
    		
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
    					$(".view_more").remove();
    					var output = "";
    					if(rdata.list.length == 0 && num <2){
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
	    						output += "						<p class='price'><span>&#8361;"+this.p_PRICE.toLocaleString()+"</span></p>";
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
	    						
	    						//찜하기 되어 있을 경우 .heart_background a태그에 주어야함
	    						if(this.d_NO == null){
	    							output += "						<a href='javascript:dibs("+this.p_NO+")' class='heart d-flex justify-content-center align-items-center '>";
	    							output += "							<span><i class='ion-ios-heart'></i></span>"
	    							output += "						</a>"
	    						}else{
	    							output += "						<a href='javascript:dibs("+this.p_NO+")' class=' heart_background heart d-flex justify-content-center align-items-center '>";
	    							output += "							<span><i class='ion-ios-heart'></i></span>"
	    							output += "						</a>"
	    						}
	    						output += "					</div>";
	    						output += "				</div>";
	    						output += "			</div>";
	    						output += "		</div>";
	    						output += "</div>"
	    						if(((index+1)/4) == 0){//한 줄에 4개씩 띄워주기
	    							output += "<br>";
	    						}//if end
	    						
	    					})//each end
	    					if(rdata.listcount>rdata.end){
	    						output += "<div class='view_more'>더보기▼</div>";
	    					}//if end
	    					
    					}//else end
    					
    					$(".productsection").append(output);
    					$(".view_more").click(function(){//더보기 클릭 시 
    		    			num++;//더보기 클릭시 num 의 값은 1씩 올라감
    		    			console.log("더보기 클릭 num = "+num);
    		    			productList();	
    		    		})//click end
    					
    					$(".heart").click(function(){//찜 클릭시 바로 하트 색 바꿔 주기
    						var login_id = '<%=session.getAttribute("USER_ID")%>';
    						console.log("login한 아이디="+ login_id);
    						if(login_id != null){//로그인 했을 때만 찜 /찜 취소 가능
								var current_color = $(this).css("backgroundColor");
    							console.log("현재 색 = "+current_color);
    							
    							if(current_color != "rgb(255, 0, 0)"){
    								$(this).addClass("heart_background");
    								console.log($(this).css("backgroundColor"));
    							}else{
    								$(this).removeClass("heart_background");
    								console.log($(this).css("backgroundColor"));
    							}
    							
    						}
    						
    						console.log("선택한 하트 = "+$(this).prop('href'));
    					})
    					
    					
    					
    					
    				},//success end
    				error:function(){
    					console.log("실패");
    				}//error end
    			})//ajax end
    		};//function productList end
    		
    		
    		
    		//처음 페이지 로드 시 실행
    		productList();
    		
    		$(".order_option").change(function(){
    			console.log("select = "+$(this).val());
    			option = $(this).val();
    			$(".productsection").empty();//정렬 방법을 바꿀 시  비우고 다시 띄워줌
    			num = 1;
    			productList();	
    		})//change end
    		
    		
    		
    		$(".list li").click(function(){
                $(".productsection").empty();
    			search_word="";
    			$(".productsearch").val('');
    			var list_name = $(this).text();
    			category = $(this).val();
    			console.log("클릭한 메뉴는 "+list_name + "/ category 번호는 = "+category);
    			num = 1;
    			productList();
    		})//click end
    		
    		$(".searchbtn").click(function(){
    			$(".productsection").empty();
    			console.log("검색 버튼누름");
    			search_word = $(".productsearch").val();
    			console.log("입력된 검색어 = "+search_word);
    			if(search_word == "" || search_word == null){
    				alert("검색어를 입력하세요");
    			}else{
	    			num = 1;
    				productList();
    			}
    		})//click end
    		
    		
    		
    		
    	})//ready end
    	
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
                			<li class="allcategory_li" value = "ALL">모든 상품 보기</li>
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
		                   <li class="sub_li" value="313">캔들/향수</li>
		                   <li class="sub_li" value="314">슬라임</li>
		                   <li class="sub_li" value="315">기타</li>
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
    	</div>
    </section>

    
  	<jsp:include page="footer.jsp"></jsp:include>

  <!-- loader -->
  <div id="ftco-loader" class="show fullscreen"><svg class="circular" width="48px" height="48px"><circle class="path-bg" cx="24" cy="24" r="22" fill="none" stroke-width="4" stroke="#eeeeee"/><circle class="path" cx="24" cy="24" r="22" fill="none" stroke-width="4" stroke-miterlimit="10" stroke="#F96D00"/></svg></div>


  <script src="resources/js/jquery.min.js"></script>
  <script src="resources/js/jquery-migrate-3.0.1.min.js"></script>
  <script src="resources/js/popper.min.js"></script>
  <%--<script src="resources/js/bootstrap.min.js"></script> --%>
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
