<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
  <head>
    <title>DIM - 관리자 페이지</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    
    <link href="https://fonts.googleapis.com/css?family=Poppins:200,300,400,500,600,700,800&display=swap" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css?family=Lora:400,400i,700,700i&display=swap" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css?family=Amatic+SC:400,700&display=swap" rel="stylesheet">

    <link rel="stylesheet" href="resources/css/open-iconic-bootstrap.min.css">
    
    <link rel="stylesheet" href="resources/css/owl.carousel.min.css">
    <link rel="stylesheet" href="resources/css/owl.theme.default.min.css">

    <link rel="stylesheet" href="resources/css/aos.css">

    <link rel="stylesheet" href="resources/css/ionicons.min.css">

    <link rel="stylesheet" href="resources/css/bootstrap-datepicker.css">
    <link rel="stylesheet" href="resources/css/jquery.timepicker.css">
    
    <link rel="stylesheet" href="resources/css/flaticon.css">
    <link rel="stylesheet" href="resources/css/icomoon.css">
    
    <!-- 추가  있어야됨-->
    <link rel="stylesheet" href="resources/css/admin.css">
	<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
	<script src="resources/js/admin.js"></script>
	
	<!-- header 의 css 각자 첨부 -->
	<link rel = "stylesheet" href = "resources/css/homecss/style.css">
	<link rel = "stylesheet" href = "resources/css/homecss/style.css.map">	
	
	<style>
		.admin_aside, .admin_content{
			float:left
		}
		.admin_aside{
			width:220px;
		}
		#admin_viewtitle {
		    font-size: x-large;
		    width: 600px;
		    display: inline-block;
		    margin-bottom: 16px;
		    float: left;
		}
		.admin_content{
			padding-left:50px;
			width: 1200px
		}
		.wrapper{
			background: #f4f3ef;
		}
			
		.admin_content{
        	margin-left: 300px;
        	margin-top: 40px;   
        }
        
	</style>
	<!-- .goto-here {background: #f4f3ef;} -->
	<script>
		$(document).ready(function(){
			var adminOrNot = <%=session.getAttribute("adminNumber")%>;
			if(adminOrNot != 1){
				history.back();
				alert("비정상적인 접근입니다.");
			}
			
			
			<%-- 
			
			
			var num =  <%=request.getParameter("num")%>;
			var reset = function (){
				$.ajax({
					type:"post",
					url:"resetstaticvalue",
					success:function(){
						console.log("변수 초기화 성공");
					},
					error:function(){
						console.log("변수 초기화 실패");
					}
				})//ajax end
			}//function reset end 
			
			--%>
			
			
			// 다른 메뉴를 누르면 static 변수 초기화
			$(".admin_sidebar a").click(function(){
				reset();
			})// click end
			
			$(document).on("keydown",function(){
				if(window.event.keyCode == 116){
					reset();
				}
				
			})

			
		})
	</script>
  </head>
  <body class="goto-here">
	<header><jsp:include page="../main/header.jsp" ></jsp:include></header>

    
	    
	<div class="wrapper">
		<%-- 여기부터  작성 --%>
	     <aside class = "admin_aside">
	     	<jsp:include page="admin_sidebar.jsp"></jsp:include>     
	   	 </aside>
	    
	    <%-- sidebar 옆에 띄워질 내용 --%>
	    <article class="admin_content">
	    	<jsp:include page="${doc}.jsp"></jsp:include>
		</article>		
	
	</div>
	
	<jsp:include page="footer.jsp"></jsp:include>	
	
	
	
	
	
	
	
  



  <script src="resources/js/jquery.min.js"></script>
  <script src="resources/js/jquery-migrate-3.0.1.min.js"></script>
  <script src="resources/js/popper.min.js"></script>
  <%-- <script src="resources/js/bootstrap.min.js"></script>--%>
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
  <%-- <link href="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css"> --%><%-- 충돌 --%>
  <link href = "resources/css/yehyeong_css/bootstrap/3.3.0/css/bootstrap3.3.0.css" rel="stylesheet" >
   <link href="resources/css/yehyeong_css/bootstrap/3.3.0/fonts/glyphicons-halflings-regular.woff" rel="stylesheet" id="bootstrap-css">
   <link href="resources/css/yehyeong_css/bootstrap/3.3.0/fonts/glyphicons-halflings-regular.ttf">
  <script src="resources/css/yehyeong_css/bootstrap/3.3.0/js/bootstrap.min.js"></script>
  <script src = "resources/js/user_table.js"></script>
  
    
  </body>
</html>
