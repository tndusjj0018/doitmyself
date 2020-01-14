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
	</style>
<script>
	$.ajax({
		type:"POST",
		data:{num:"${num}"},
		dataType:"json",
		url:"userList",
		success:function(rdata){
			console.log(rdata);
			$("#mytable").empty();
			if(rdata.length == 0){
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
						output += "<td><p data-placement='top' data-toggle='tooltip' title='Edit'><button class='btn btn-primary btn-xs' data-title='Edit' data-toggle='modal' data-target=''#edit' ><span class='glyphicon glyphicon-pencil'></span></button></p></td>";
						output += "<td><p data-placement='top' data-toggle='tooltip' title='Delete'><button class='btn btn-danger btn-xs' data-title='Delete' data-toggle='modal' data-target='#delete' ><span class='glyphicon glyphicon-trash'></span></button></p></td>";
						output += "</tr>";
					}

				})
				
				output += "</tbody>";
				$("#mytable").append(output);
				
				
				
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
		},
		error:function(){
			console.log("실패");
		}//error end
	})//ajax end
	
</script>
</head>
<body>
	<font id = "admin_viewtitle">회원 정보 조회</font><br>
	<div class="search"><input type="text" name="user_search" class = "user_search"><input type="button" value = "검색" class="user_searchbtn"></div>
	<table id="mytable" class="table table-bordred table-striped">
                  
				        
	</table>
	
</body>
</html>