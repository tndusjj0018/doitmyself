<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
 <link rel="stylesheet" href="resources/css/style.css">
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
   <nav class="navbar navbar-expand-lg navbar-dark ftco_navbar bg-dark ftco-navbar-light" id="ftco-navbar">
       <div class="container">
         <a class="navbar-brand" href="index.html">Do It Myself</a>
         <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#ftco-nav" aria-controls="ftco-nav" aria-expanded="false" aria-label="Toggle navigation">
           <span class="oi oi-menu"></span> Menu
         </button>
         
         <div class="collapse navbar-collapse" id="ftco-nav">
           <ul class="navbar-nav ml-auto">
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
             <li class="nav-item cta cta-colored"><a href="cart.html" class="nav-link"><span class="icon-shopping_cart"></span>[0]</a></li>
           </ul>
         </div>
       </div>
     </nav>
    <!-- END nav -->

</body>
</html>