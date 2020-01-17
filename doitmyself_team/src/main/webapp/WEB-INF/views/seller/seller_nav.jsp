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
  <script>
  $(function(){
		function Postcode() {
			    new daum.Postcode({
			        oncomplete: function(data) {
			            // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.
		
			            // 도로명 주소의 노출 규칙에 따라 주소를 조합한다.
			            // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
			            var fullRoadAddr = data.roadAddress; // 도로명 주소 변수
			            var extraRoadAddr = ''; // 도로명 조합형 주소 변수
		
			            // 법정동명이 있을 경우 추가한다. (법정리는 제외)
			            // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
			            if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
			                extraRoadAddr += data.bname;
			            }
			            // 건물명이 있고, 공동주택일 경우 추가한다.
			            if(data.buildingName !== '' && data.apartment === 'Y'){
			               extraRoadAddr += (extraRoadAddr !== '' ? ', ' + data.buildingName : data.buildingName);
			            }
			            // 도로명, 지번 조합형 주소가 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
			            if(extraRoadAddr !== ''){
			                extraRoadAddr = ' (' + extraRoadAddr + ')';
			            }
			            // 도로명, 지번 주소의 유무에 따라 해당 조합형 주소를 추가한다.
			            if(fullRoadAddr !== ''){
			                fullRoadAddr += extraRoadAddr;
			            }
		
			            
			            // 우편번호와 주소 정보를 해당 필드에 넣는다.
			             $('#seller_postcode').val(data.zonecode); //5자리 새우편번호 사용
			            $('#seller_address').val(fullRoadAddr);          
			        }
			    }).open();
			}
	})
  </script>
  <style>
  	input,textarea{border:1px solid #DDDDDD; border-radius:4px; padding:1px;}
  	.p_th{width:150px; height:39px; background:#4f97c3d4; text-align:center; font-weight:bold; color:white; font-size:10pt;}
  	.p_th,.p_td{border:1px solid #e0e0e0;}
  	#test_dname,#test_name{width:97%; display:block; margin:0 auto;}
  	select{margin-left:10px; border-radius: 0 0 3px 3px; color:gray; font-size:10pt;}
  	#new_p{float:right; margin:20px 10px 0 0; width:110px; height:33px; border-style:none; background:#4f97c3d4; color:white;}
  	#new_cancel{float:right; margin:20px 10px 0 0; width:110px; height:33px; border-style:none; background:white; color:#4f97c3d4; border:1px solid #4f97c3d4;}
  	.active .nc-icon{color:#37a4bd!important;}
  	.active{padding-left:10px; transition:.3s;}
  	.active p{color:#3c8dbc!important}
  	.title{color:#3c8dbc}
  	#p_qa,#p_price{margin-left:10px;}
  	.card{width:833px;}
  	#sub_cate_select{width:170px; text-align:center;}
  	#main_cate_select{width:130px; text-align:center;}
  	input:focus,select:focus{outline:none;}
  	input{font-size:10.5pt; text-indent:7px;}
  	#sub_cate{width:150px; display:inline-block;}
  	#main_cate{width:160px; display:inline-block; margin:10px 25px 10px 5px;}
  	#main_cate span,#sub_cate span{margin-left:10px; background:#d3e5f0; display:inline-block;
	    text-align: center; border: 1px solid #a0a0a0; border-bottom:none; font-size:10pt; color:gray; height:24px; line-height:24px; font-weight:bold;}
	#main_cate span{width:130px;}
	#sub_cate span{width:170px;}
	#cate_result span:nth-child(1){
	    width: 160px;
	    font-weight: bold;
	    background: #ffd9d9;
	    color: #7b7b7b;
	    display: inline-block;
	    text-align: center;
	    height: 30px;
	    line-height: 30px;
	    border: 1px solid #dddddd;
	    border-left: none;
	    margin-left:10px;
	    float:left;
	    font-size:10pt;
	}
	#cate_result span:nth-child(2){
		display: inline-block;
	    width: 453px;
	    border-bottom: 1px solid #dddddd;
	    border-top: 1px solid #dddddd;
	    height: 30px;
	    line-height:30px;
	    padding-left:13px;	    
	}
	#cate_result{height:36px; margin-top:10px; margin-bottom:13px;}
	#cate_message{color:gray;}
	.row-1{margin-left:0;}
	option{padding:3px 0;}
	option:hover{cursor:pointer; font-weight:bold; transition:.3s;}
	
	.p_td{position:relative;}
	.arrowImg{
	    opacity: 0.3;
	    height: 37px;
	    left: 163px;
	    top: 47px;
	    position: absolute;
	    width: 31px;
	}
	
	#p_qa,#p_price{text-align:right; padding-right:7px;}
	.btn-primary{background:#3c8dbc!important;}
	.navbar-brand{font-size:11pt!important; color:#a2a2a2!important;}	
  </style>
  <script>
  	$(function(){
  		/* $('#main_cate_select').change(function(){
  			var cate = $(this).val();
  			var output = "";
  			$('#sub_cate_select').empty();
  			
  			switch (cate) {
			case "furniture":
				output += "<option>침실</option>" 
				output += "<option>주방</option>" 
				output += "<option>수납</option>" 
				output += "<option>거실</option>" 
				output += "<option>욕실</option>" 
				$('#sub_cate_select').append(output);
				break;
				
			case "food":
				output += "<option>한식</option>" 
				output += "<option>일식</option>" 
				output += "<option>양식</option>" 
				output += "<option>중식</option>" 
				output += "<option>베이킹</option>" 
				$('#sub_cate_select').append(output);
			default:
				break;
			}
  		})//main_cate change */
  		  		
  		$('#sub_cate_select').click(function(){
  			$('#cate_message').empty();
  			var output = ""; 
  			if($(this).val() != "" && $(this).val() != null){
	  			var main_cate = $('#main_cate_select').find(':selected').text();
	  			var sub_cate = $(this).val();
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
			$('.nav').children().eq(4).addClass('active');
			break;
		default:
			break;
		}
  		
  	})
  </script>
</head>
<input type="hidden" value="${doc}" class="doc">
<body class="">
  <div class="wrapper ">
    <div class="sidebar" data-color="white" data-active-color="danger">
      <!--
        Tip 1: You can change the color of the sidebar using: data-color="blue | green | orange | red | yellow"
    -->
      <div class="logo">
        <a href="http://www.creative-tim.com" class="simple-text logo-normal">
          		Do It MySelf
          <!-- <div class="logo-image-big">
            <img src="../assets/img/logo-big.png">
          </div> -->
        </a>
      </div>
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
            <a href="seller?doc=seller_cancel">
              <i class="nc-icon nc-cart-simple"></i>
              <p>취소/교환/환불</p>
            </a>
          </li>
          <li>
            <a href="seller?doc=seller_sale">
              <i class="nc-icon nc-chart-bar-32"></i>
              <p>판매관리</p>
            </a>
          </li>
          <li>
            <a href="./tables.html">
              <i class="nc-icon nc-tile-56"></i>
              <p>판매통계</p>
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

