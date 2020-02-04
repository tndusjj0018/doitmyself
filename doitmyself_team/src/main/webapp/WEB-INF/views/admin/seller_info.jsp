<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<style>
		#sellerinfotable>thead{
			border-bottom: 2px solid #ddd!important;
	      }
	      .search{
	      	    margin-bottom: 28px!important;
	      	    margin-top: 40px;
	      	    float: right;
	      }
	      .sellerinfo_orderselect, .search_col{
	      		height: 26px;
	      		position: relative;
    			top: 1px;
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
						if(rdata.sellerList.length == 0){
							output += "<tr><td>조회된 데이터가 없습니다.</td></tr>";
						}else{
							output += "<thead>";
							output += "		<tr>";
							output +="			<td>판매자 번호</td>";
							output +="			<td>판매자 ID</td>";
							output +="			<td>가게 이름</td>";
							output +="			<td>사업장 주소</td>";
							output +="			<td>판매자 평점</td>";
							//output +="			<td>정보</td>";
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
								//output += "			<td><button class='btn btn-primary btn-xs info_view'><span class='glyphicon glyphicon-search'></span></button></td>";
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
						
						$("#sellerinfotable").on("click",".info_view",function(){//판매자 정보 조회
							var trNum = $(this).closest('tr').prevAll().length;//몇번째 row를 선택했는지 확인
		                	var sellerNum = $("#sellerinfotable tr:eq("+(trNum+1)+") td:eq(0)").text();//trNum 번째 row에서 판매자 번호 확인
		                	console.log("trNum = "+trNum + " / sellerNum = "+sellerNum);
							
		                	location.href = "admin?doc=sellerInfo&SELLER_NO="+sellerNum;
						})
						
						$("#sellerinfotable").on("click",".cancel",function(){//판매자 삭제
							var trNum = $(this).closest('tr').prevAll().length;//몇번째 row를 선택했는지 확인
							var sellerNum = $("#sellerinfotable tr:eq("+(trNum+1)+") td:eq(0)").text();//trNum 번째 row에서 판매자 번호 확인
							console.log("trNum = "+trNum + " / sellerNum = "+sellerNum);
							var checkboolean = confirm("해당 판매자를 삭제하시겠습니까?");
							if(checkboolean == true){
								$.ajax({
									type:"POST",
									data:{SELLER_NO:sellerNum},
									url:"DeleteSeller",
									success:function(rdata){
										if(rdata == 1){
											alert("해당 판매자가 삭제되었습니다.");
											history.go(0);//새로고침
										}else{
											alert("해당 판매자를 삭제 할 수 없습니다.");
										}
										
									},
									error:function(){
										console.log("판매자 삭제 에러남");
									}
								})
							}
							
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
				
			$(".seller_searchbtn").click(function(){
				order1 = $(".sellerinfo_orderselect").val();
				search_word = $(".seller_search").val();
				search_col = $(".search_col").val();
				if(search_word == ""){
					alert("검색어를 입력하세요");
				}else{
					console.log("검색 학꾸임");
					console.log("검색 칼럼 = "+search_col+"검색어= "+search_word);
					sellerList(order1, search_col, search_word);
					
				}
				
				
			})
			
			
			
			
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
