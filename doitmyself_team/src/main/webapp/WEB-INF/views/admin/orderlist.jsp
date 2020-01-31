<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<style>
		.orderlistTbl{
		}
		.orderlistTbl> thead{
			border-bottom: 1px solid lightgray;
		}
	</style>
	<script>
		$(document).ready(function(){
			var orderList = function(){
				$.ajax({
					type:"POST",
					url:"getOrderList",
					dataType:"json",
					success:function(rdata){
						console.log(rdata);
						$(".orderlistTbl").empty();
						if(rdata.list.length == 0){
							$(".orderlistTbl").append('주문 내역이 존재하지 않습니다.')
						}else{
							var output = "";
							output += "<thead>";
							output += "		<tr>";
							output +="			<td>주문 번호</td>";
							output +="			<td>아이디</td>";
							output +="			<td>판매자</td>";
							output +="			<td>결제 방법</td>";
							output +="			<td>주문 날짜</td>";
							output +="			<td>카테고리</td>";
							output +="			<td>수량</td>";
							output +="			<td>가격</td>";
							output +="			<td>주문 상태</td>";
							output += "		</tr>";
							output += "</thead>";
							output += "<tbody>";
							$(rdata.list).each(function(){
								output += "<tr>";
								output +="	<td>"+this.order_TRNO+"</td>";
								output +="	<td>"+this.order_ID+"</td>";
								output +="	<td>"+this.order_SELLER+"</td>";
								if(this.order_PAYMENT == 'deposit'){
									output +="	<td>무통장 입금</td>";
								}else{
									output +="	<td>카카오 페이</td>";
								}
								output +="	<td>"+this.order_DATE+"</td>";
								output +="	<td>"+this.order_CATEGORY+"</td>";
								output +="	<td>"+this.order_AMOUNT+"</td>";
								output +="	<td>"+this.order_PRICE+"</td>";
								switch(this.order_STATUS){
									case 0:
										output +="	<td>주문</td>";
										break;
									case 1:
										output +="	<td>주문 취소</td>";
										break;
									case 2:
										output +="	<td>반품</td>";
										break;
									case 3:
										output +="	<td>교환</td>";
										break;
								}
								output += "</tr>";
							})
							output += "</tbody>";
							
							$(".orderlistTbl").append(output);
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
	<table class="orderlistTbl table table-striped">
	
	</table>
	
</body>
</html>
