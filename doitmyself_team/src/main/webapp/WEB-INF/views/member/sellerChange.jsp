<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html class="perfect-scrollbar-on"><head>
	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
	<title>
 	판매자 전환
	</title>
	<meta content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0, shrink-to-fit=no" name="viewport">
	
	<!-- CSS File -->
	<link href="resources/soo/css/memberChange.css" rel="stylesheet">

	<!-- 우편번호 -->
	<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
	<script type="text/javascript" src="http://t1.daumcdn.net/postcode/api/core/191007/1570443254160/191007.js"></script>
	<script>
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
	             $('#SELLER_POSTCODE').val(data.zonecode); //5자리 새우편번호 사용
	            $('#SELLER_ADDRESS').val(fullRoadAddr);          
	        }
	    }).open();
	}
	</script>
	<script src="resources/js/core/jquery.min.js"></script>
	<script>
		$(document).ready(function(){
		
			$('#sellerChange_form').submit(function(){
				
				if($('#process_agree_chk').is(':checked') == false) {
					alert('판매 이용약관에 동의하세요');
					return false;
				}
				
				if($('#personal_info_agree').is(':checked') == false) {
					alert('개인정보 수집에 동의하세요');
					return false;
				}
			
			});
					
		});	
	</script>
</head>

<body class="">
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
            			
						<a class="navbar-brand" href="#pablo">회원 정보</a>
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
     
			<div class="content">
			  <div class="row">
			    <div class="col-md-8">
			      <div class="card card-user">
			        <div class="card-header">
			          <h5 class="card-title">판매자 전환</h5>
			        </div>
			        <div class="card-body">
			        	<!-- 판매자 아닐 경우 -->
			        	<c:if test="${isSeller == 0 }">
			        	<!-- 절차 -->
		        		<table class="chgApply_process1">
		        			<tr>
								<th style="padding-left: 50px;">셀러회원 전환 절차 안내</th>
							</tr>
							<tr>
								<td style="padding-left: 50px !important;">
									<span class="seller_process_num">1.</span>
									<span class="seller_process_title">판매 이용 약관 동의</span><br>
									<span class="seller_process_cont">판매 활동에 필요한 약관에 동의합니다.</span>
								</td>
								<td>
									<i class="nc-icon nc-minimal-right process_right"></i>
								</td>
								<td>
									<span class="seller_process_num">2.</span>
									<span class="seller_process_title">추가 정보 입력 </span><br>
									<span class="seller_process_cont">정보를 추가 입력 합니다.</span>
								</td>
								<td>
									<i class="nc-icon nc-minimal-right process_right"></i>
								</td>
								<td>
									<span class="seller_process_num">3.</span>
									<span class="seller_process_title">전환 완료</span><br>
									<span class="seller_process_cont">상품 등록 및 판매 활동이 가능합니다.</span>
								</td>
							</tr>
						</table>
						<!-- 절차 끝 -->
						
						<!-- 판매 이용약관 -->
						<table>
							<tr>
								<th style="padding: 50px 0px 10px 50px;">DO IT MYSELF 판매 이용 약관</th>
							</tr>
							<tr>
								<td>
									<div class="privacy_agree">
										<span class="agree_bold">제1조 (목적)</span><br>
									본 약관은 DIM 주식회사(이하 “회사”)와 회사가 운영하는 웹사이트(이하 “사이트”. 또한 이하 “회사”에 “사이트”를 포함하여 통칭함)에 판매회원(본 약관에서 ‘판매회원’은 DIM 구매이용약관의 ‘셀러회원’과 같음)으로
									가입하여 사이트에서 판매회원에게 제공하는 전자상거래 관련 서비스와 기타 서비스(이하 “서비스”)를 이용하는 자 간의 권리, 의무를 확정하고 이를 이행하여 상호 발전을 도모하는 것을 목적으로 합니다. <br><br>
	
									<span class="agree_bold">제2조 (용어의 정의)</span><br>
									본 약관에서 사용되는 용어의 정의는 본 약관에서 별도로 규정하는 경우를 제외하고 DIM 구매이용약관 제2조를 따릅니다. <br><br>
									
									<span class="agree_bold">제3조 (효력)</span><br>제3조 (효력)<br>
									① 회사는 본 약관에서 규정되지 않은 세부적인 내용을 판매서비스이용정책(이하 "이용정책")에 규정할 수 있으며, 이를 ‘판매회원 거래관리툴(Seller Tool, 이하 “판매회원툴”)’을 통하여 공지하며, 
									이용정책은 이 약관과 더불어 판매서비스 이용계약(이하 “이용계약”)의 일부를 구성합니다.<br>
									② 회사는 관련 법령의 규정 등에 따라 판매서비스 중 특정 서비스에 관한 약관(이하 "개별약관")을 별도로 제정할 수 있으며, 판매회원이 개별약관에 동의하면 개별약관은 이용계약의 일부를 구성하고, 
									개별약관에 이 약관과 상충하는 내용이 있으면 개별약관이 우선하여 적용됩니다.<br>
									③ 11번가 구매이용약관의 내용 중 성질상 판매 서비스에 적용될 수 있는 내용은 제2항과 동일하게 적용됩니다. 본 약관에 따라 판매회원으로 가입하고자 하는 자는 구매이용약관의 내용을 숙지하고 본 항의 내용에 동의하는 것임을 확인합니다.<br>
									④ 이 약관, 이용정책, 개별약관의 변경이 있으면 회사는 변경 내용의 효력발생일 7일 이전(다만, 판매회원에게 불리한 내용으로 변경할 때에는 30일 이전)에 해당 변경 사항을 판매회원툴에 공지하며, 판매회원이 변경된 약관, 이용정책, 
									개별약관에 동의하지 않으면 판매회원 탈퇴(이용계약의 해지)를 요청할 수 있으며, 변경 적용일까지 거부 의사를 표시하지 않으면 변경 약관, 이용정책, 개별약관에 동의한 것으로 간주합니다.<br>
									⑤ 변경된 약관은 그 적용일자 이전으로 소급하여 적용되지 않습니다.<br>
									⑥ 서비스 이용 기준일 현재 구매이용약관상의 만 19세 미만의 회원이 본 판매이용약관상의 판매회원 중 개인 판매회원으로 전환하려고 하거나 전환 없이 직접 개인 판매회원으로 상품이나 용역을 판매하고자 한다면 회사는 
									해당 회원에게 법정대리인의 동의서와 입증 자료의 제출을 요구할 수 있으며, 해당 회원은 이에 동의해야 합니다. 해당 회원이 본 규정을 지키지 않으면 해당 회원은 상품이나 용역을 판매할 수 없습니다.<br>
									⑦ 구매이용약관상의 회원이 개인 판매회원으로 전환하고자 하거나 전환 없이 직접 개인 판매회원으로 상품 또는 용역을 판매하고자 한다면 
									회사는 해당 회원에게 신원확인 목적 등을 위하여 범용공인인증 또는 회사가 인정하는 신원확인 수단에 대한 자료를 요구할 수 있으며, 해당 회원은 범용공인인증서 등 회사가 요구하는 관련 자료를 회사가 요구하는 기한 내에 제출해야 합니다. 
									해당 회원이 본 규정을 지키지 않으면 회사는 해당 회원에 대하여 사이트 로그인, 상품 및 용역의 등록 또는 판매 등 회사가 제공하는 서비스의 이용을 제한할 수 있습니다.									
									</div>
									<input type="checkbox" style="margin: 10px 0 0 50px" id="process_agree_chk" name="process_agree_chk" value="agree">
									<span style="font-size:13px; position:relative; top:-2px;">판매 이용 약관에 동의합니다.</span>
								<td>
							</tr>
						</table>
						<!-- 판매 이용약관 끝 -->
						
						<!-- 추가 정보 입력 -->
						<form action="sellerChangeAction" id="sellerChange_form" method="post">
						
						<input type="hidden" name="SELLER_ID" value="${USER_ID }" >
					
						<table>
							<tr>
								<th style="padding: 50px 0px 10px 50px;">추가 정보 입력</th>
							</tr>
						</table>
						<table class="table table-bordered" style="margin-left: 50px; width: 80%">
							<tr>
								<td>스토어명</td>
								<td>
									<input type="text" id="SELLER_NAME" name="SELLER_NAME" placeholder="스토어 명" class="form-control placeholder_font" required>
								</td>
							</tr>
							
							<tr>
								<td>출고/반품 주소</td>
								<td>
									<div style="font-size:8px; margin-bottom:8px;">판매상품을 보내고 반품 받을 기본주소입니다.</div>
									<input type="text" class="form-control col-md-3 placeholder_font" id="SELLER_POSTCODE" name="SELLER_POSTCODE" placeholder="우편 번호" style="display: inline-block;" required>
									<button type="button" class="btn btn-primary" id="postsearch" onclick="Postcode()" style="height:32px; line-height:2px !important">우편 번호 찾기</button>
									
									<input type="text" class="form-control placeholder_font" id="SELLER_ADDRESS" name="SELLER_ADDRESS" placeholder="사업지 주소" style="margin-top: 5px;" required>
								</td>
							</tr>
						</table>
						
						<div style="margin: 5px 0 0 50px">
							<input type="checkbox" style="margin-right: 5px;" id="personal_info_agree" ><span class="agree_bold" style="position:relative; top:-2px;">개인정보 수집/이용 동의</span>
							<div style="font-size:11px; margin-bottom:10px;">
							- 고객님께서는 동의를 거부하실 수 있으며, 동의 거부 시 출고지/반품/교환지주소 등록이 불가합니다.
							</div>
							
							<table class="table table-bordered table-striped" style="width:85%; text-align:center">
								<tr>
									<td>수집/이용 목적</td> <td>수집 항목</td> <td>보유/이용기간</td>
								</tr>
								<tr>
									<td>사업지 주소 확인</td>
									<td>가게 이름, 사업지 주소</td>
									<td>DO IT MYSELF 회원 탈퇴시 까지</td>
								</tr>
							</table>
							<input type="submit" id="memberChange_btn" name="memberChange_btn" class="btn btn-primary btn-round" value="판매자 전환" style="margin-left:33%; margin-right:15px;">
							<input type="reset" id="memberReset_btn" name="memberReset_btn" class="btn  btn-round memberReset_btn" value="취소">
						</div>
						</form>
						<!-- 추가 정보 입력 끝 -->
						</c:if>
						
						<!-- 이미 판매자인 경우 -->
			        	<c:if test="${isSeller == 1 }">
			        		<div class="container">
			    				<div class="leaveInfo">
			    					<img src="resources/soo/img/check.png" class="leaveImg">			     	        		
			        				<span>판매자 전환 안내</span>
		        					<ul>
					        			<li>이미 판매자로 등록되어 있는 회원입니다.</li>
		        					</ul>
			        			</div>
			        			<input type="button" id="sellerPageGo" name="sellerPageGo" class="btn btn-primary btn-round" value="판매자 페이지로 이동" 
			        			   style="margin-left:38%; margin-right:15px;" onclick="alert('판매자 페이지로 이동하는 버튼');">
			        		</div>
			        	</c:if>
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
	<script src="resources/soo/js/core/jquery.min.js"></script>
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