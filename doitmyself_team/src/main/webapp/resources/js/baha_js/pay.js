$(function() {

	$('#input').on('click', function() {
		var dft = $('#dft').prop('checked');
		var input = $(this).prop('checked');
		if (input) {
			$('.put').show();
			$('.default').hide();
		}
	});

	$('#dft').on('click', function() {
		var dft = $('#dft').prop('checked');
		var input = $(this).prop('checked');
		if (input) {
			$('.put').hide();
			$('.default').show();
		}
	});

});