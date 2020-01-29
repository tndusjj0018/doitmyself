<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix ="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
 
 <script src="resources/js/jquery.min.js"></script>
 <script>
 	$(function(){
 		
 		function getCart_count(){
 			$.ajax({
 				type : "post",
 	 			url : "cart_count",
 				data : {"id" : "${USER_ID}"},
 				success : function(rdata){
 					
 					$('#cart_count').empty();
 					var output = "";
 					output += "<span class='icon-shopping_cart'></span>[" + rdata + "]";
 					$('#cart_count').append(output);
					},
				error : function(){
					$('#cart_count').empty();
 					var output = "";
 					output += "<span class='icon-shopping_cart'></span>[0]";
 					$('#cart_count').append(output);
				}
 			})
 		}
 		getCart_count();
 		
 		$('#id_X').on('click' , function(){
 			alert('로그인 후 이용해주세요');
 		})
 		
 	})
 		
 </script>
<meta charset="UTF-8">
<title>DIM</title>
</head>
<body>
   <nav class="navbar navbar-expand-lg navbar-dark ftco_navbar bg-dark ftco-navbar-light" id="ftco-navbar">
       <div class="container">
         <a class="navbar-brand" href="home">Do It Myself</a>
         <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#ftco-nav" aria-controls="ftco-nav" aria-expanded="false" aria-label="Toggle navigation">
           <span class="oi oi-menu"></span> Menu
         </button>
         
         <div class="collapse navbar-collapse" id="ftco-nav">
           <ul class="navbar-nav ml-auto">
           <c:if test="${SELLER_RESULT == 1}">
           		<li class="nav-item">
                	<a class="nav-link" href="#" id="dropdown04" style="padding-right:12px !important;">판매자페이지</a>
	            </li>
           </c:if>
             <li class="nav-item">
                 <a class="nav-link" href="product?category=all" id="dropdown04">모든 상품 보기</a>
              </li>
             <li class="nav-item dropdown">
              <a class="nav-link dropdown-toggle" href="#" id="dropdown04" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">가구</a>
              <div class="dropdown-menu" aria-labelledby="dropdown04">
                <a class="dropdown-item" href="#">침실</a>
                <a class="dropdown-item" href="#">주방</a>
                <a class="dropdown-item" href="#">수납</a>
                <a class="dropdown-item" href="#">거실</a>
                <a class="dropdown-item" href="#">욕실</a>
              </div>
              </li>
               <li class="nav-item dropdown">
              <a class="nav-link dropdown-toggle" href="#" id="dropdown04" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">음식</a>
              <div class="dropdown-menu" aria-labelledby="dropdown04">
                <a class="dropdown-item" href="#">한실</a>
                <a class="dropdown-item" href="#">일식</a>
                <a class="dropdown-item" href="#">양식</a>
                <a class="dropdown-item" href="#">중식</a>
                <a class="dropdown-item" href="#">베이킹</a>
              </div>
              </li>
               <li class="nav-item dropdown">
              <a class="nav-link dropdown-toggle" href="#" id="dropdown04" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">취미</a>
              <div class="dropdown-menu" aria-labelledby="dropdown04">
                <a class="dropdown-item" href="#">드로잉</a>
                <a class="dropdown-item" href="#">미니어쳐</a>
                <a class="dropdown-item" href="#">캔들&향수</a>
                <a class="dropdown-item" href="#">슬라임</a>
                <a class="dropdown-item" href="#">악세서리</a>
              </div>
            </li>

            <c:if test="${adminNumber != 1}">
            	 <c:if test="${!empty USER_ID }">
            		<li class="nav-item cta cta-colored"><a href="cart" class="nav-link" id="cart_count"style="background: #3a8aa2; color: white;"></a></li>
            	 </c:if>
            	 <c:if test="${empty USER_ID }">
            		<li class="nav-item cta cta-colored"><a href="#" class="nav-link" id="id_X" style="background: #3a8aa2; color: white;"><span class='icon-shopping_cart'></span>[X]</a></li>
            	 </c:if>
            </c:if>
          	<c:if test="${empty USER_ID}">
          	 	<a class="navbar-brand" href="login" style="font-size:13pt; margin-left: 20px; margin-top: 4.8px;">Log-in</a>
          	</c:if>

          	<c:if test="${adminNumber == 1}">
	          	 <a class="navbar-brand" href="login" style="font-size:13pt; margin-left: 20px; margin-top: 4.8px;">관리자</a>
	          	 <li class="nav-item">
	                 <a class="nav-link" href="#" id="dropdown04">관리자페이지</a>
	              </li>
	          	 <li class="nav-item">
	                 <a class="nav-link" href="logout" id="dropdown04" style="background: #3a8aa2; color: white;">관리자모드 종료</a>
	              </li>
          	</c:if>
          	<c:if test="${!empty USER_ID && adminNumber != 1}">
	             <a class="navbar-brand" href="memberInfo?USER_ID=${USER_ID }" style="font-size:13pt; margin-left: 20px; margin-top: 4.8px;">${USER_ID}</a>
	             
	             <c:if test="${SELLER_RESULT == 1}">
	             	 <a class="navbar-brand" href="#" style="font-size:9pt; margin-left: -13px; margin-top: 1px;">$</a>
	             </c:if>
	             <c:if test="${SELLER_RESULT != 1}">
					<a class="navbar-brand" href="#" style="font-size:9pt; margin-left: -13px; margin-top: 1px;"></a>
	             </c:if>
	             
	             <a class="navbar-brand" href="logout" style="font-size:10pt; margin-left: 10px; margin-top: 9.5px; color: dimgray;">로그아웃</a>
            </c:if>
           </ul>
         </div>
       </div>
     </nav>
    <!-- END nav -->

</body>
</html>
