<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<script>
		$(document).ready(function(){
			var orderList = function(){
				$.ajax({
					type:"POST",
					url:"getOrderList",
					dataType:"json",
					success:function(rdata){
						console.log("성공");
						$(".orderlistTbl").empty();
						if(rdata.list.length == 0){
							$(".orderlistTbl").append('주문 내역이 존재하지 않습니다.')
						}else{
							
							$(rdata.list).each(function(){
								
							})
						}
					},
					error:function(){
						console.log("실패");
					}
				})
			}
			//페이지를 띄울 때 실행
			orderList();
			
		})
	</script>
</head>
<body>
	<font id = "admin_viewtitle">전체 주문 내역</font><br>
	<table class="orderlistTbl">
	
	</table>
	
</body>
</html>