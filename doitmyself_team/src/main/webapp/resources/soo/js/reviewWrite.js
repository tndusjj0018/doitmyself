$(document).ready(function() {
	var check = 0;

	show();
	function show() {
		//파일이름이 있는 경우 remove 이미지를 보이게 하고 없는 경우는 보이지 않습니다.
		if ($("#filevalue").text() == '') {
			$(".remove").css('display', "none");
		} else {
			$(".remove").css("display", "inline-block");
		}
	}
	
	$("#upfile").change(function() {
		check++;
		var inputfile = $(this).val().split("\\");
		console.log(inputfile);
		$('#filevalue').text(inputfile[inputfile.length - 1]);
		show();
	});

	$(".remove").click(function() {
		$("#filevalue").text("");
		$(this).css("display", "none");
		$("input[name=BOARD_ORIGINAL]").val('');
		$("input[name=BOARD_FILE]").val('');
	});

});