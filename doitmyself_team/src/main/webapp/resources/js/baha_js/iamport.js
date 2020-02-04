$(function() {
	   var IMP = window.IMP; // 생략가능
	   IMP.init('imp62546931');  // 가맹점 식별 코드
	   var d = new Date();
	   no = String(d.getTime());
	   sub = no.substring(4);
	   ORDER_NO = Number(sub);
$('#paygo').click(function () {
	console.log('오더 넘버는~' + ORDER_NO);
	
	
	
	var chk1 = $('#chk1').is(":checked")
	var chk2 = $('#chk2').is(":checked")
	var chk3 = $('#chk3').is(":checked")
	var paychk = $('#kaka').is(":checked")
	if(chk1==false){
		alert('개인정보 판매자 제공에 동의하셔야 합니다.');
		return false;
	} else if (chk2==false) {
		alert('개인정보 수집 및 이용에 동의하셔야 합니다.');
		return false;
	} else if (chk3==false) {
		alert('주문 상품 정보에 동의하셔야 합니다.');
		return false;
	} else if (paychk==false){
		alert('결제 방식을 선택하셔야 합니다.');
		return false;
	} else {

	   IMP.request_pay({
	      pg : 'kakao', // 결제방식
	       pay_method : 'card',	// 결제 수단
	       merchant_uid : 'merchant_' + new Date().getTime(),
	      name : $('#pname').text(),	// order 테이블에 들어갈 주문명 혹은 주문 번호
	       amount : $('#totalprice').text(),	// 결제 금액
	       buyer_email : '',	// 구매자 email
	      buyer_name :  $('#info_name1').val(),	// 구매자 이름
	       buyer_tel :  $('#info_phone1').val(),	// 구매자 전화번호
	       buyer_addr :  $('#info_address1').val(),	// 구매자 주소
	       buyer_postcode :  $('#info_postcode1').val(),	// 구매자 우편번호
	   }, function(rsp) {
		if ( rsp.success ) { // 성공시
			var msg = '결제가 완료되었습니다.';
			msg += '고유ID : ' + rsp.imp_uid;
			msg += '상점 거래ID : ' + rsp.merchant_uid;
			msg += '결제 금액 : ' + rsp.paid_amount;
			msg += '카드 승인번 : ' + rsp.apply_num;
			location.href="/dim2/payComplete?USER_ID="+ $('#ORDER_ID').val() + "&ORDER_NO=" + ORDER_NO +
					"&ORDER_P_NO="+$('#ORDER_P_NO').val() + "&ORDER_ID=" + $('#ORDER_ID').val() + "&ORDER_CATEGORY=" +$('#ORDER_CATEGORY').val() + "&ORDER_PRICE=" + $('#ORDER_PRICE').val() + "&ORDER_PAYMENT=" +$('#ORDER_PAYMENT').val()+ "&ORDER_ADDRESS=" +$('#ORDER_ADDRESS').val()+ "&ORDER_SELLER=" +$('#ORDER_SELLER').val()+ "&ORDER_AMOUNT=" +$('#ORDER_AMOUNT').val()
		} else { // 실패시
			var msg = '결제에 실패하였습니다.';
			msg += '에러내용 : ' + rsp.error_msg;
		}
	});
}
})

})