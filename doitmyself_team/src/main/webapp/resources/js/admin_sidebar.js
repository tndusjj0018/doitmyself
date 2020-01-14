$(function(){
	$(".admin_sidebar ul").each(function(index, item){
		$(this).children("li:eq(0)").click(function(){
			$(item).children("li:gt(0)").toggle("fast");
		})
	})
	
})