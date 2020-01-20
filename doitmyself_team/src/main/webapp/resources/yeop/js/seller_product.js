//## 가격 콤마찍기 ##
//키를 누르거나 떼었을때 이벤트 발생
$("#p_price").bind('keyup keydown',function(){
    inputNumberFormat(this);
});

//입력한 문자열 전달
function inputNumberFormat(obj) {
    obj.value = comma(uncomma(obj.value));
}
  
//콤마찍기
function comma(str) {
    str = String(str);
    return str.replace(/(\d)(?=(?:\d{3})+(?!\d))/g, '$1,');
}

//콤마풀기
function uncomma(str) {
    str = String(str);
    return str.replace(/[^\d]+/g, '');
}

//## 카테고리 select/option ##
$.ajax({
	type : 'post',
	url : 'productCategory',
	dataType : 'json',
	cache : false,
	success : function(data){
		var output = '';
		console.log(data)
		$(data).each(function(){
			output += "<option value='"+this.c_NO+"'>" + this.c_NAME + "</option>";
		})
		$('#main_cate_select').append(output)
	}
})
//## 카테고리 change ##
$('#main_cate_select').change(function(){
	var cate_val = $(this).val(); //cate_val = 100,200,300...
	var output = "";
	$('#sub_cate_select').empty();
	var c_no = {"c_no" : cate_val};
	
	$.ajax({
		type : 'post',
		url : 'productSubCategory',
		dataType : 'json',
		data : c_no,
		cache : false,
		success : function(data){
			var output = '';
			console.log(data)
			$(data).each(function(){
				output += "<option value='"+this.sc_NO+"'>" + this.sc_NAME + "</option>";
			})
			$('#sub_cate_select').append(output)
		}
	})//ajax		
})//#main_cate_select change
