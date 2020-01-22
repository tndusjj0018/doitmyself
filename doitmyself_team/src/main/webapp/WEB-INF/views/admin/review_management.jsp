<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<style>
		.review_orderselect{
			float:right;
			height: 40px;
			margin-bottom: 16px;
		}
	</style>
	<script>
		$(document).ready(function(){
			
			//선택된 정렬 방법 그대로 가져가기
			if("${reviewOrder}" == ""){//정렬 기준을 정하지 않았을 때 => 기본적으로 최신순이 선택되어 있음
				console.log("기본적으로 선택된 정렬 방법이 없습니다.최신순으로 정렬합니다.");
				console.log(".review_orderselect의 최초 value = "+$(".review_orderselect").val());
			}else{
				console.log("선택된 정렬 방법은 ${reviewOrder}입니다.");
				//주소의 parameter 값 받아와서 select 설정
				$(".review_orderselect option[value = ${reviewOrder}]").prop("selected", true);
			}
			
			
			//review 목록 가져오기
			var reviewList = function(){
				$.ajax({
					type:"POST",
					dataType:"json", 
					data:{num:"${num}", reviewOrder:$(".review_orderselect").val()},
					url:"reviewlist",
					success:function(rdata){
						$("#reviewtable").empty();
						output = "";
						if(rdata.reviewlist.length == 0){//리뷰가 하나도 없을 때
							output = "<tr><td>조회된 데이터가 없습니다.</td></tr>";
							$("#reviewtable").append(output);
						}else{//리뷰가 있을 때
							output += "<thead>";
							output += "		<tr>";
							output += "			<td>리뷰 번호</td>";
							output += "			<td>아이디</td>";
							output += "			<td>리뷰 내용</td>";
							output += "			<td>작성일</td>";
							output += "			<td>삭제</td>";
							output += "		</tr>";
							output += "</thead>";
							output += "<tbody>";
							
							
							output += "</tbody>";
							
						}
					},
					error:function(){
						console.log("reviewList ajax 에러남");
					}
					
				})//ajax end
				
				
				
			}//reviewList function end
			//기본적으로 실행
			reviewList();
			
			
			
			$(".review_orderselect").change(function(){
				console.log($(this).val());
				reviewList();	
			})//change end
			
			
		})
	</script>
</head>
<body>
	<font id = "admin_viewtitle">리뷰 관리</font><br>
	<select class="review_orderselect">
		<option value="REVIEW_DATE DESC">최신순</option>
		<option value="REVIEW_WRITER DESC">아이디 내림차순</option>
		<option value="REVIEW_WRITER ASC">아이디 오름차순</option>
		<option value="REVIEW_RATE DESC">별점 높은순</option>
		<option value="REVIEW_RATE ASC">별점 낮은순</option>
	</select>
	<table class = "table table-bordered table-striped" id="reviewtable">
		
	</table>
	
	
</body>
</html>