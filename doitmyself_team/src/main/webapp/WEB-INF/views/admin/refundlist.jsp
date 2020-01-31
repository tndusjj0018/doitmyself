<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<style>
	
	</style>
	
	<script>
		$(document).ready(function(){
			var num = 1;
			function refundList(){
				$.ajax({
					type:"POST",
					url:"refundList",
					data:{num:num},
					success:function(rdata){
						console.log(rdata);
						$(".refundtbl").empty();
						if(rdata.list.length == 0){
							$(".refundlistTbl").append('환불 내역이 존재하지 않습니다.')
						}else{
							var output = "";
							output += "<thead>";
							output += "		<tr>";
							output +="			<td>주문 번호</td>";
							output +="			<td>아이디</td>";
							output +="			<td>판매자</td>";
							output +="			<td>결제 방법</td>";
							output +="			<td>환불 날짜</td>";
							output +="			<td>카테고리</td>";
							output +="			<td>수량</td>";
							output +="			<td>환불 금액</td>";
							output +="			<td>환불 진행 상태</td>";
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
								switch(this.refund_STATUS){
									case 0:
										output +="	<td>환불 요청</td>";
										break;
									case 1:
										output +="	<td>환불 처리중</td>";
										break;
									case 2:
										output +="	<td>환불 완료</td>";
										break;
								}
								output += "</tr>";
							})
							output += "</tbody>";
							$(".refundtbl").append(output);
						}//else end
					},
					error:function(){
						console.log("실패");
					}//error end
				})
			}//function refundList end
			
			//최초 실행
			refundList();
		})
	
	</script>
</head>
<body>
	<font id = "admin_viewtitle">환불 내역</font><br>
	<table class = "refundtbl table table-striped">
		
	</table>
	
</body>
</html>
