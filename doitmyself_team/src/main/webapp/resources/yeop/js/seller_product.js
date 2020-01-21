//## 가격 콤마찍기 ##
//키를 누르거나 떼었을때 이벤트 발생
$("#p_price").bind('keyup keydown',function(){
    inputNumberFormat(this);
    $('#p_price_removeComma').val(removeComma($("#p_price").val()));
});
//## 콤마뺀 가격 저장 ##
function removeComma(str){
	n = parseInt(str.replace(/,/g,""));
	return n;
}
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
//숫자만 리턴(저장할때)
function cf_getNumberOnly (str) {
    var len      = str.length;
    var sReturn  = "";

    for (var i=0; i<len; i++){
        if ( (str.charAt(i) >= "0") && (str.charAt(i) <= "9") ){
            sReturn += str.charAt(i);
        }
    }
    return sReturn;    
}

//## 카테고리 select/option ##
$.ajax({
	type : 'post',
	url : 'productCategory',
	dataType : 'json',
	cache : false,
	success : function(data){
		var output = '';
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
			$(data).each(function(){
				output += "<option value='"+this.sc_NO+"'>" + this.sc_NAME + "</option>";
			})
			$('#sub_cate_select').append(output)
		}
	})//ajax		
})//#main_cate_select change


// ## 카테고리 넘버 저장용 ##
$('#sub_cate_select').change(function(){
	var mainCate = parseInt($('#main_cate_select').val());
	var subCate = parseInt($(this).val());
	var cateGory = mainCate + subCate;
	$('#cateGory').val(cateGory);
})

//## Editor 데이터 가져오는 용 ##
var editor;
CKEDITOR.on( 'instanceReady', function( ev ) {
	editor = ev.editor;
	//document.getElementById( 'readOnlyOn' ).style.display = '';
	editor.on( 'readOnly', function() {
		document.getElementById( 'readOnlyOn' ).style.display = this.readOnly ? 'none' : '';
		document.getElementById( 'readOnlyOff' ).style.display = this.readOnly ? '' : 'none';
	});
});

function toggleReadOnly( isReadOnly ) {
	editor.setReadOnly( isReadOnly );
	//editor.getData() 저장된 Editor 데이터
}

//## submit click ##
$('#p-form').submit(function(){
	//Editor 입력값 저장
	$('#editorData').val(editor.getData());
})

function readURL(input) {
    if (input.files && input.files[0]) {
        var reader = new FileReader();
        reader.onload = function (e) {
            $('#upLoadFileImg').attr('src', e.target.result);
        }
        reader.readAsDataURL(input.files[0]);
    }
}