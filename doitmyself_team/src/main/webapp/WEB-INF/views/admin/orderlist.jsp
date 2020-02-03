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
		.order_select{
			float: right;
		}
	</style>
	<script>
		var go = function(page){
			console.log("function go");
			num = page;
			orderList();
		}
		
		var pagination = function(page, startpage, maxpage){
			$(".clearfix").empty();
			console.log("function pagination");
			pageoutput = "";
			//페이지네이션 내용
			pageoutput += "<ul class='pagination pull-right'>";
			if(startpage<page){//이전페이지가 존재할 때
				pageoutput += "<li><a href='javasript:go("+(page-1)+")'><span class='glyphicon glyphicon-chevron-left'></span></a></li>";
			}else{//이전페이지가 존재하지 않을 때
				pageoutput += "<li><a href='#'><span class='glyphicon glyphicon-chevron-left'></span></a></li>";	
			}
			
			for(var i = startpage;i<=maxpage;i++){
				if(i == page){
					pageoutput += "<li><a href='#'>"+i+"</a></li>";
				}else{
					pageoutput += "<li><a href='javascript:go("+i+")'>"+i+"</a></li>";
				}	
				
			}
			if(page<maxpage){//다음페이지가 존재할 때
				pageoutput += "<li><a href='javasript:go("+(page+1)+")'><span class='glyphicon glyphicon-chevron-left'></span></a></li>";
			}else{//다음페이지가 존재하지 않을 때
				pageoutput += "<li><a href='#'><span class='glyphicon glyphicon-chevron-right'></span></a></li>";	
			}
			
			
			$(".clearfix").append(pageoutput);
		}//function pagination end
		$(document).ready(function(){
			var num = 1;
			var orderList = function(){
				$.ajax({
					type:"POST",
					url:"getOrderList",
					dataType:"json",
					data:{num:num, orderBy:$(".order_select").val()},
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
							 var page = rdata.num;
		                     var startpage = rdata.startpage;
		                     var maxpage = rdata.maxpage;
		                     pagination(page, startpage, maxpage);
						}
					},
					error:function(){
						console.log("실패");
					}
				})
			}
			//페이지를 띄울 때 실행
			orderList();
			
			$(".order_select").change(function(){
				orderList();
			})
			
		})
	</script>
</head>
<body>
	<font id = "admin_viewtitle">전체 주문 내역</font><br>
	<select class="order_select">
		<option value="ORDER_DATE DESC">최신순</option>
		<option value="ORDER_ID DESC">아이디 내림차순</option>
		<option value="ORDER_ID ASC">아이디 오름차순</option>
	</select>
	<table class="orderlistTbl table table-striped">
	
	</table>
	<div class="clearfix">
   
   	</div>
	
</body>
</html>
