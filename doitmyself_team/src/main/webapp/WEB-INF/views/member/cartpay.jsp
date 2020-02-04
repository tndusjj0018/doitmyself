<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!-- 아래는 숫자 포맷을 사용하기 위한 라이브러리임 -->
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>

<script src="resources/js/jquery.min.js"></script>
<script src="resources/js/baha_js/pay.js"></script>

<script type="text/javascript"
	src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
<script type="text/javascript"
	src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>
<script src="resources/js/baha_js/iamport.js"></script>
<head>
<link rel="stylesheet" href="resources/css/baha_css/pay.css">
<script>

</script>

<meta charset="utf-8">
<title>Insert title here</title>
</head>
<body>



	<input type="hidden" name="P_SELLER" value="${productdetail.p_SELLER }">
	<input type="hidden" name="P_CATEGORY_NO"
		value="${productdetail.p_CATEGORY_NO }">
	
	<div id="BodyWrap" style="width: 1000px;">
		<div class="Order_DetailCheck">
			<div class="state1">
				<h3 class="state1_1">주문 상품 확인</h3>
			</div>
			<table class="table_DetailCheck">
				<colgroup>
					<col width="15%">
					<col width="40%">
					<col width="15%">
					<col width="30%">
				</colgroup>
				<thead>
					<tr>
						<th colspan="2" class="test">상품정보</th>
						<th>개수</th>
						<th class="test2">상품금액</th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td class="test">
							<div class="prd_Photo">
								<img src="${productdetail.p_IMG}" class="img-fluid"
									name="P_IMG" id="mainIMG">
							</div>
						</td>
						<td class="td_prdWrap">
							<div class="prd_Name">${productdetail.p_NAME }</div>
						</td>
						<td>
							<div class="prd_Count">
								<span id="tc">${cartcount }</span>
							</div>
						</td>
						<td class="test2">
							<div class="prd_Price">
								<span id="p">${productdetail.p_PRICE }</span>원
							</div>
						</td>
					</tr>
				</tbody>
			</table>
		</div>

		<div class="Order_InfoCheck">
			<table class="table_InfoCheck" border="1">
				<colgroup>
					<col width="15%">
					<col>
				</colgroup>
				<tbody>
					<tr>
						<td>배송지 선택</td>
						<td><label><input type="radio" name="loc" id="dft"
								checked>기본배송지</label> <label><input type="radio"
								name="loc" id="input">직접입력</label></td>
					</tr>
					<tr class="default">
						<td>이름</td>
						<td><input type="text" class="info_name" id="info_name1"
							name="USER_NAME" value="${memberinfo.USER_NAME}"></td>
					</tr>
					<tr class="default">
						<td>주소</td>
						<td><input type="text" class="info_loc1" id="info_postcode1"
							name="USER_POSTCODE" value="${memberinfo.USER_POSTCODE}">&ensp;<input
							type="button" value="주소 찾기"></td>
					</tr>
					<tr class="default">
						<td><input type="hidden" id="info_address1"
							value="${memberinfo.USER_ADDRESS }"></td>
						<td><input type="text" class="info_loc2" name="USER_ADDRESS"
							value="${memberinfo.USER_ADDRESS}"></td>
					</tr>

					<tr class="default">
						<td>연락처<input type="hidden" name="USER_PHONE"
							id="info_phone1" value="${memberinfo.USER_PHONE }"></td>
						<c:set var="phone" value="${memberinfo.USER_PHONE}" />
						<td><input type="text" class="phone"
							value="<c:out value="${fn:substring(phone,0,3)}"/>">&nbsp;-&nbsp;
							<input type="text" class="phone"
							value="${fn:substring(phone,3,7)}">&nbsp;-&nbsp; <input
							type="text" class="phone" value="${fn:substring(phone,7,11)}"></td>
					</tr>
					<tr class="default">
						<td>배송시 요구사항</td>
						<td><input type="text" class="info_request"></td>
					</tr>

					<tr class="put">
						<td>이름</td>
						<td><input type="text" class="info_name" name="USER_NAME"></td>
					</tr>
					<tr class="put">
						<td>주소</td>
						<td><input type="text" class="info_loc1" name="USER_POSTCODE">&ensp;<input
							type="button" value="주소 찾기"></td>
					</tr>
					<tr class="put">
						<td></td>
						<td><input type="text" class="info_loc2" name="USER_ADDRESS"></td>
					</tr>
					<tr class="put">
						<td>연락처</td>
						<td><input type="text" class="phone">&nbsp;-&nbsp; <input
							type="text" class="phone">&nbsp;-&nbsp; <input
							type="text" class="phone"></td>
					</tr>
					<tr class="put">
						<td>배송시 요구사항</td>
						<td><input type="text" class="info_request"></td>
					</tr>

				</tbody>
			</table>
		</div>

		<div class="Order_PayMethod">
			<table class="table_PayMethod" border="1">
				<thead>
					<tr>
						<td><label><input type="radio" name="pay">신용카드</label>
							&ensp;<label><input type="radio" name="pay">무통장입금</label>
						</td>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td>미정</td>
					</tr>
				</tbody>
			</table>
		</div>


		<div class="Order_TotalPrice">
			<table class="table_TotalPrice" border="1">
				<tbody>
					<tr>
						<td>최종결제금액</td>
					</tr>
					<tr>
						<td>${total }원</td>
					</tr>
					<tr>
						<td>&nbsp;&nbsp;&nbsp;현금 영수증 신청<br></td>
					</tr>
					<tr>
						<td><label>&nbsp;&nbsp;<input type="radio"
								name="receipt">신청
						</label> <label><input type="radio" name="receipt">미신청</label></td>
					</tr>
					<tr>
						<td>&nbsp;<label><input type="checkbox" id="chk1">개인정보
								판매자 제공에 동의합니다.</label></td>
					</tr>
					<tr>
						<td><textarea class="agree">고객님께서는 아래 내용에 대하여 동의를 거부하실 수 있으며, 거부시 상품 배송, CS가 제한됩니다.
제공받는자 : [(주)DIM]
목적 : 주문상품의 배송(예약), 고객상담 및 불만처리
항목 : 성명, 주소, 연락처(안심번호 적용 시 연락처는 제외), 개인통관고유부호(선택시), 현관비밀번호(입력시)
보유기간 : 구매확정 후 3개월까지></textarea></td>
					</tr>
					<tr>
						<td>&nbsp;<label><input type="checkbox" id="chk2">개인정보
								수집 및 이용에 동의합니다.</label></td>
					</tr>
					<tr>
						<td><textarea class="agree">고객님께서는 아래 내용에 대하여 동의를 거부하실 수 있으며, 거부 시 상품배송, 구매 및 결제, 일부 포인트 적립이 제한됩니다.

<수집이용목적>
대금 결제/환불 서비스 제공, 주문/배송/거래 내역 조회 서비스 제공, 전자상거래법 준수 등 신용카드 정보, 계좌 정보, 주문/배송/거래 내역   
<수집 항목보유기간>
회원탈퇴 시 까지 단, 관계 법령의 규정에 따라 보존할 의무가 있으면 해당 기간 동안 보존
<수집이용목적>
상품 및 경품(포인트, 쿠폰 포함) 배송(반품/환불/취소등), 배송지 확인, 최초 입력 후 불러오기 기능 제공,아이디, 배송지 정보 (수령인,전화번호,주소), 현관비밀번호(입력시)   
<수집 항목보유기간>
회원탈퇴 시 까지 단, 관계 법령의 규정에 따라 보존할 의무가 있으면 해당 기간 동안 보존
<수집이용목적>
이용계약(이용약관)이 존속중인 탈퇴하지 않은 회원의 경우 보유기간은 보존의무기간 이상 보관할 수 있으며 이 기간이 경과된 기록에 대해서 파기요청이 있는 경우 파기함
<수집 항목보유기간>
결제수단에 따른 개인정보 수집.이용 항목이 상이할 수 있음</textarea></td>
					</tr>
					<tr>
						<td>&nbsp;<label><input type="checkbox" id="chk3">주문
								상품정보에 동의</label></td>
					</tr>
					<tr>
						<td><textarea class="agree">주문 상품의 상품명,가격,배송정보에 동의합니다.</textarea></td>
					</tr>
					<tr>
						<td>&nbsp;<label><input type="checkbox" id="allchk">위 내용을
								확인하였으며 모든 내용에 동의합니다.</label></td>
					</tr>
					<tr>
						<td>				
						
								<input type="hidden" id="ORDER_P_NO" name="ORDER_P_NO" value="${prdInfo.p_NO }">
								<input type="hidden" id="ORDER_ID" name="ORDER_ID" value="${USER_ID}">
								<input type="hidden" id="ORDER_CATEGORY" name="ORDER_CATEGORY" value="${prdInfo.p_CATEGORY_NO}">
								<input type="hidden" id="ORDER_PRICE" name="ORDER_PRICE" value="">
								<input type="hidden" id="ORDER_PAYMENT" name="ORDER_PAYMENT" value="kakaopay">
								<input type="hidden" id="ORDER_ADDRESS" name="ORDER_ADDRESS" value="">
								<input type="hidden" id="ORDER_SELLER" name="ORDER_SELLER" value="${prdInfo.p_SELLER}">
								<input type="hidden" id="ORDER_AMOUNT" name="ORDER_AMOUNT" value="">
								
								
								<button  class="submit" class="paygo">결제하기</button>
								<button class="reset" onclick="history.go(-1)">취소하기</button>
							
						</td>
						
					</tr>
				</tbody>
			</table>
		</div>


	</div>

</body>

</html>