<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<style>
		.search{
			width: 550px;
			display: inline-block;
			text-align: right;
			
		}
		.user_search{
			width: 285px;
			height: 40px;
			
		}
		.user_searchbtn{
			width:65px;
			height: 40px;
		}
		#mytable{
			margin-top: 40px;
		}
		.search_col{
			height: 40px;
			position: relative;
    		top: 1px;
		}
		
	</style>
<script>
	$(document).ready(function(){
		
		search_word = "";
		var search = function(search_word){
			console.log(search_word);
			//url 파라미터 삭제 	
			//history.replaceState({}, null, location.pathname);
			$.ajax({
				type:"POST",
				data:{num:"${num}", search_word:search_word, search_col:$(".search_col").val()},
				dataType:"json",
				url:"userList",
				success:function(rdata){
					search_word = rdata.search_word;
					console.log(rdata);
					console.log("검색 기준 = "+rdata.search_col+", 검색어= "+rdata.search_word);
					$("#mytable").empty();
					if(rdata.userlist.length == 0){
						output = "<tr><td>조회된 데이터가 없습니다.</td></tr>";
						$("#mytable").append(output);
					}else{
						output = "";
						output +="<thead>";
						output += "	 <th><input type='checkbox' id='checkall' /></th>";
						output += "  <th>유저 번호</th>";
						output += "  <th>아이디</th>";
						output += "  <th>이름</th>";
						output += "  <th>이메일</th>";
						output += "  <th>휴대전화</th>";
						output += "  <th>수정</th>";
						output += "  <th>삭제</th>";
						output += "</thead>";
						output += "<tbody>";
						
						var endcnt = (rdata.num*10)-1;
						var startcnt = endcnt -9; 
						console.log("startcnt="+startcnt + ", endcnt = "+endcnt);
						$(rdata.userlist).each(function(index, item){
							
							if(startcnt<=index && endcnt>=index){
								output += "<tr>";
								output += "	<td><input type='checkbox' class='checkthis' /></td>";
								output += "<td>"+item.user_NO+"</td>";
								output += "<td>"+item.user_ID+"</td>";
								output += "<td>"+item.user_NAME+"</td>";
								output += "<td>"+item.user_EMAIL+"</td>";
								output += "<td>"+item.user_PHONE+"</td>";
								output += "<td><button class='btn btn-primary btn-xs userModify'><span class='glyphicon glyphicon-pencil'></span></button></td>";
								output += "<td><button class='btn btn-danger btn-xs userDelete'><span class='glyphicon glyphicon-trash'></span></button></td>";
								output += "</tr>";
							}
						})
						
						
						output += "</tbody>";
						$("#mytable").append(output);
						
						pagination(rdata);
						
					}	
				},
				error:function(){
					console.log("실패");
				}//error end
			})//ajax end	
		}//function end
		
		//처음 로드 했을 때 실행 
		search(search_word);
		
		var pagination = function(rdata){
			//페이징 처리 start
			var maxpage = rdata.maxpage;
			var startpage = rdata.startpage;
			var num = rdata.num;
			
			output ="";
			output += "<div class='clearfix'>";
			output += "		<ul class='pagination pull-right'>";
			if(maxpage == startpage){//페이지수가 1개 밖에 존재하지 않을 때
				output += "<li><a href='#'><span class='glyphicon glyphicon-chevron-left'></span></a></li>";
				output += "<li class='active'><a href='#'>1</a></li>";
				output += "<li><a href='#'><span class='glyphicon glyphicon-chevron-right'></span></a></li>";
			}else{
				//이전 버튼 처리
				if((num - startpage) <= 0){//이전페이지가 존재하지 않을 때
					output += "<li><a href='#'><span class='glyphicon glyphicon-chevron-left'></span></a></li>";
				}else{//이전페이지가 존재할 때
					//이전 페이지 버튼 : 1개씩 이동
					output += "<li><a href='admin?doc=userview&num="+(num-1)+"'><span class='glyphicon glyphicon-chevron-left'></span></a></li>";
					
					//현재페이지보다 작은 페이지 버튼
					if(num <3){//현재 페이지 num 이 3 미만인 경우
						output += "<li><a href='admin?doc=userview&num="+(num-1)+"'>"+(num-1)+"</a></li>"  
					}else{//현재페이지 num 이 3 이상인 경우
						output += "<li><a href='admin?doc=userview&num="+(num-2)+"'>"+(num-2)+"</a></li>"
						output += "<li><a href='admin?doc=userview&num="+(num-1)+"'>"+(num-1)+"</a></li>"
					}
				}
				
				//현재 페이지 버튼	
				output += "<li><a href='#'>"+num+"</a></li>";
				
				
				
				//다음 버튼 처리
				if((maxpage - num) > 0){//다음페이지가 존재할 때
					//다음 페이지 버튼 : 1개씩 이동
					
					//현재페이지보다 큰 페이지 버튼
					if((maxpage - num) == 1){//다음 페이지가 한개 존재할 때
						output += "<li><a href='admin?doc=userview&num="+(num+1)+"'>"+(num+1)+"</a></li>";
					}else{//다음페이지가 두개 이상 존재할 때
						output += "<li><a href='admin?doc=userview&num="+(num+1)+"'>"+(num+1)+"</a></li>";
						output += "<li><a href='admin?doc=userview&num="+(num+2)+"'>"+(num+2)+"</a></li>";
					}
					output += "<li><a href='admin?doc=userview&num="+(num+1)+"'><span class='glyphicon glyphicon-chevron-right'></span></a></li>";
					
				}else{//다음페이지가 존재하지 않을 때
					output += "<li><a href='#'><span class='glyphicon glyphicon-chevron-right'></span></a></li>";
				}
				
			}
			output += "		</ul>";
			output += "</div>";
			$(".admin_content").append(output);
			//페이징 처리 end
			
		}
		
		
		
		
		
		$(".user_searchbtn").click(function(){
			
			search_word = $(".user_search").val();
			if(search_word == null || search_word == ""){
				alert("검색어를 입력하세요");
			}else{
				$(".clearfix").remove();
				search(search_word);
			}
		});//click end
		
		
		$("#mytable").on("click",".userDelete",function(){
			var check = confirm("해당 유저를 삭제하시겠습니까?");
			var trNum = $(this).closest('tr').prevAll().length;
			if(check == true){
				alert(trNum+"번째 버튼 선택");
				var usernum = $("#mytable tr:eq("+(trNum+1)+") td:eq(1)").text();
				console.log(trNum + "번째 userNo = " + usernum);// 선택한 버튼 줄의 유저 번호
				location.href = "DeleteUser?USER_NO="+usernum;
				
			}else{
				alert("삭제를 취소합니다.");
			}
		})//click end
		
		$("#mytable").on("click",".userModify",function(){
			var trNum = $(this).closest('tr').prevAll().length;
			console.log(trNum+"번째 버튼 선택");
			var usernum = $("#mytable tr:eq("+(trNum+1)+") td:eq(1)").text();
			console.log(trNum + "번째 userNo = " + usernum);// 선택한 버튼 줄의 유저 번호
			location.href = "admin?doc=memberInfo&USER_NO="+usernum;
		})//click end
		
	})	
				
	
	
	
	
</script>
</head>
<body>
	<font id = "admin_viewtitle">회원 정보 조회</font><br>
	<div class="search">
		<select class = "search_col">
			<option value="USER_ID">아이디</option>
			<option value="USER_PHONE">휴대전화</option>
			<option value="USER_NAME">이름</option>
			<option value="USER_EMAIl">이메일</option>
			<option value="USER_BIRTH">생년월일</option>		
		</select>
		<input type="text" name="user_search" class = "user_search">
		<input type="button" value = "검색" class="user_searchbtn">
	</div>
	<table id="mytable" class="table table-bordred table-striped">

	</table>

</body>
</html>