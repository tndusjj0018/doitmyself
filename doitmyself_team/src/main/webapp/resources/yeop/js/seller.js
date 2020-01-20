var senddata = {"id" : "admin"}; //테스트용 아이디
$.ajax({
	type : 'post',
	url : 'sellerInfo',
	dateType : 'json',
	data : senddata,
	cache : false,
	success : function(data){
		$(data).each(function(){
			$('#seller_name').val(this.seller_NAME);
			$('#seller_id').val(this.seller_ID);
			$('#seller_postcode').val(this.seller_POSTCODE);
			$('#seller_address').val(this.seller_ADDRESS);
			$('#seller_b_num').val(this.seller_B_NUM);
		});
	}
})