<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<style>
		#sellerinfotable>thead{
			border-bottom: 2px solid #ddd!important;
	      }
	</style>
	<script>
		$(document).ready(function(){
			var go = function(page){
				console.log("function go");
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
			
			
			var num = 1;
			var order1 = $(".sellerinfo_orderselect").val();
			var search_col = $(".search_col").val();
			var search_word = "";
			var sellerList = function(order1, search_col, search_word){
				$.ajax({
					type:"POST",
					data:{option1:order1, search_col:search_col,search_word:search_word, num:num},
					url:"sellerList",
					async:false,
					success:function(rdata){
						console.log(rdata);
						//판매자 정보 테이블
						$("#sellerinfotable").empty();
						output = "";
						if(rdata.length == 0){
							output += "<tr><td>등록되어 있는 판매자가 존재하지 않습니다.</td></tr>";
						}else{
							output += "<thead>";
							output += "		<tr>";
							output +="			<td>판매자 번호</td>";
							output +="			<td>판매자 ID</td>";
							output +="			<td>가게 이름</td>";
							output +="			<td>사업장 주소</td>";
							output +="			<td>판매자 평점</td>";
							output +="			<td>정보</td>";
							output +="			<td>권한 취소</td>";
							output += "		</tr>";
							output += "</thead>";
							output += "<tbody>";
							$(rdata.sellerList).each(function(index, item){
								output += "		<tr>";
								output +="			<td>"+this.seller_NO+"</td>";
								output +="			<td>"+this.seller_ID+"</td>";
								output +="			<td>"+this.seller_NAME+"</td>";
								output +="			<td>"+this.seller_ADDRESS+"</td>";
								output +="			<td>"+this.seller_RATE+"</td>";
								output += "			<td><button class='btn btn-primary btn-xs info_view'><span class='glyphicon glyphicon-search'></span></button></td>";
								output += "			<td><button class='btn btn-danger btn-xs cancel'><span class='glyphicon glyphicon-remove'></span></button></td>";
								output += "		</tr>";
								
							})
							output += "</tbody>";
							
						}
						
						
						
						$("#sellerinfotable").append(output);
						//페이지네이션
						var page = rdata.num;
						var startpage = rdata.startpage;
						var maxpage = rdata.maxpage;
						pagination(page, startpage, maxpage);
						
						$(".info_view").click(function(){
							var trNum = $(this).closest('tr').prevAll().length;//몇번째 row를 선택했는지 확인
		                	var sellerNum = $("#reviewtable tr:eq("+(trNum+1)+") td:eq(0)").text();//trNum 번째 row에서 판매자 번호 확인
		                	console.log("trNum = "+trNum + " / sellerNum = "+sellerNum);
							
		                	location.href = "admin?doc=sellerInfo&SELLER_NO="+sellerNum;
						})
						
						
						
						
					},
					error:function(){
						console.log("실패");
					}
					
				})
			}
			//처음 한번 실행
			sellerList(order1, search_col, search_word);
			
			$(".sellerinfo_orderselect").change(function(){
				order1 = $(".sellerinfo_orderselect").val();
				sellerList(order1, search_col, search_word);
				
			})//change end
				
			
			
			
			
			
		})
	</script>
</head>
<body>
	<font id = "admin_viewtitle">판매자 정보 조회</font><br>
   
   <div class="search">
		<select class="sellerinfo_orderselect">
	      <option value="SELLER_NAME ASC">가게이름 오름차순</option>
	      <option value="SELLER_NAME DESC">가게이름 내림차순</option>
	      <option value="SELLER_ID ASC">아이디 오름차순</option>
	      <option value="SELLER_ID DESC">아이디 내림차순</option>
	      <option value="SELLER_RATE ASC">평점 낮은순</option>
	      <option value="SELLER_RATE DESC">평점 높은순</option>
	   </select>
	   <select class="search_col">
	   	  <option value="SELLER_ID">아이디</option>
	   	  <option value="SELLER_NAME">가게이름</option>
	   	  <option value="SELLER_ADDRESS">주소</option>	
	   </select>
	   <input type="text" name="seller_search" class = "seller_search">
	   <input type="button" value = "검색" class="seller_searchbtn">
   </div>
   
   
   <table class = "table table-striped" id="sellerinfotable">
      
   </table>
   <div class="clearfix">
   
   </div>
	
</body>
</html>