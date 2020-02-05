<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>

<head>
  <meta charset="utf-8" />
  <link rel="apple-touch-icon" sizes="76x76" href="../assets/img/apple-icon.png">
  <link rel="icon" type="image/png" href="../assets/img/favicon.png">
  <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
  <title>
    	상품등록 페이지
  </title>
  <meta content='width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0, shrink-to-fit=no' name='viewport' />
  <!--     Fonts and icons     -->
  <link href="https://fonts.googleapis.com/css?family=Montserrat:400,700,200" rel="stylesheet" />
  <link href="https://maxcdn.bootstrapcdn.com/font-awesome/latest/css/font-awesome.min.css" rel="stylesheet">
  <!-- CSS Files -->
  <link href="resources/yeop/css/bootstrap.min.css" rel="stylesheet" />
  <link href="resources/yeop/css/paper-dashboard.css?v=2.0.0" rel="stylesheet" />
  <!-- CSS Just for demo purpose, don't include it in your project -->
  <link href="resources/yeop/demo/demo.css" rel="stylesheet" />
  <!-- Seller CSS -->
  <link href="resources/yeop/css/seller.css" rel="stylesheet"/>
  <script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
  <!-- 우편검색 api -->
  <script type="text/javascript" src="http://t1.daumcdn.net/postcode/api/core/191007/1570443254160/191007.js"></script>
  <script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
  <script src="resources/yeop/js/post.js"></script>
  <!-- ck에디터 -->
  <script type="text/javascript" src="resources/yeop/ckeditor/ckeditor.js"></script>
  <script>
  	$(function(){  		  		  		
  		$('#sub_cate_select').click(function(){//카테고리 불러오는용
  			$('#cate_message').empty();
  			var output = ""; 
  			if($(this).val() != "" && $(this).val() != null){
	  			var main_cate = $('#main_cate_select').find(':selected').text();
	  			var sub_cate = $(this).find(':selected').text();
	  			output = main_cate + " > "+ sub_cate;
	  			//cate_result(output);
	  			$('#cate_message').append(output);
  			}else{
  				$('#cate_message').append(output);
  			}
  		})//sub_cate_select click
  		
  		//nav
  		$('.nav li').hover(function(){
  			$(this).css('background','#e3e3e3')
  					.css('transition','.3s')
  					.css('padding-left','10px')
  					.children().children().css('color','#3c8dbc').css('transition','.3s');
  			//$(this).children().children('p').css('color','red');	
  		},function(){//hover 떠낫을때
  			$(this).css('background','white')
		  			.css('transition','.3s')
		  			.css('padding-left','0')
  					.children().children().css('color','gray').css('transition','.3s');
  		})
  		
  	})
  	
  	$(document).ready(function(){
  		var doc = $('.doc').val()
  		switch (doc) {
		case 'seller_info':
		case 'seller_infoUpdate':
			$('.nav').children().eq(0).addClass('active');
			break;
		case 'product':
			$('.nav').children().eq(1).addClass('active');
			break;
		case 'seller_order':
			$('.nav').children().eq(2).addClass('active');
			break;
		case 'seller_sale':
			$('.nav').children().eq(3).addClass('active');
			break;
		case 'seller_cancel':
			$('.nav').children().eq(4).addClass('active');
			break;
		case 'seller_qna':
			$('.nav').children().eq(5).addClass('active');
			break;
		default:
			break;
		}
  		
  	})
  </script>
<style>
	.navbar-brand{color:#3a8aa2!important;}
	.form-control{font-size:10.5pt!important; color:gray!important;}
	.navbar-absolute{z-index:0!important;}
	input[readonly]{background:#f3f3f3!important; color:gray!important;}
	.btn{font-size:10.5pt!important;}
	.sidebar{top:74px; width:259px!important;}
	.nav{margin-top:0px!important;}
	.nav-link{color:black!important; font-size:11.5px!important;}
	#id_X{color:white!important}
	body{margin-bottom:10px;}
	.navbar-toggler{color:gray!important;}
	.sidebar{border-right:none;}
</style>
</head>
<!-- doc저장 -->
<input type="hidden" value="${doc}" class="doc">
<!-- session id 저장 -->
<input type="hidden" value="${USER_ID}" id="USER_ID">
<!-- <input type="hidden" value="admin" id="USER_ID"> -->
<body class="">
  <div class="wrapper ">
   	<jsp:include page="../main/header.jsp"/>
    <div class="sidebar" data-color="white" data-active-color="danger">
      <!--
        Tip 1: You can change the color of the sidebar using: data-color="blue | green | orange | red | yellow"
    -->
      <div class="sidebar-wrapper">
        <ul class="nav">
          <li>
            <a href="seller?doc=seller_info">
              <i class="nc-icon nc-single-02"></i>
              <p>판매자 정보</p>
            </a>
          </li>
          <li>
            <a href="seller?doc=product">
              <i class="nc-icon nc-bag-16"></i>
              <p>상품 등록</p>
            </a>
          </li>
          <li>
            <a href="seller?doc=seller_order">
              <i class="nc-icon nc-cart-simple"></i>
              <p>주문관리</p>
            </a>
          </li>
          <li>
            <a href="seller?doc=seller_sale">
              <i class="nc-icon nc-chart-bar-32"></i>
              <p>상품관리</p>
            </a>
          </li>
          <li>
            <a href="seller?doc=seller_cancel">
              <i class="nc-icon nc-cart-simple"></i>
              <p>주문취소/반품/환불</p>
            </a>
          </li>          
          <li>
            <a href="seller?doc=seller_qna">
              <i class="nc-icon nc-tile-56"></i>
              <p>상품문의 답변</p>
            </a>
          </li>
        </ul>
      </div>
    </div>
    
    <!-- main-pane -->
    <jsp:include page="${doc}.jsp"/>
    
  </div>
  <!--   Core JS Files   -->
  <script src="resources/yeop/js/core/jquery.min.js"></script>
  <script src="resources/yeop/js/core/popper.min.js"></script>
  <script src="resources/yeop/js/core/bootstrap.min.js"></script>
  <script src="resources/yeop/js/plugins/perfect-scrollbar.jquery.min.js"></script>
  <!-- Chart JS -->
  <script src="resources/yeop/js/plugins/chartjs.min.js"></script>
  <!--  Notifications Plugin    -->
  <script src="resources/js/plugins/bootstrap-notify.js"></script>
  <!-- Control Center for Now Ui Dashboard: parallax effects, scripts for the example pages etc -->
  <script src="resources/yeop/js/paper-dashboard.min.js?v=2.0.0" type="text/javascript"></script>
  <!-- Paper Dashboard DEMO methods, don't include it in your project! -->
  <script src="resources/yeop/demo/demo.js"></script>
  <script src="resources/yeop/js/seller_info.js"></script>
  <script src="resources/yeop/js/seller_product.js"></script>
    
</body>

</html>

