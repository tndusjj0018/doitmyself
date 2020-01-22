<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<style>
		.search{
			width: 1152px;
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
		
		.privilege{
			height: 40px;
			position: relative;
			top: 1px;
		}
		.is_adminfont{
			font-size: 25px
		}
		#mytable td, #mytable th{
			height: 25px;
			line-height: 25px
		}
		
	</style>
	<script>
		var go = function(page){
			search(page);
		}
		$(function(){
			search_word = "";
			//조회 옵션 선택
			selected_option = "";
			var search = function(search_word){
				console.log("admin_privilege_management.jsp 현재 페이지는 = ${num}");
				$.ajax({
					type:"POST",
					dataType:"json",
					data:{num:"${num}", search_word:search_word, search_col:$(".search_col").val(), option:selected_option},
					url:"userList",
					success:function(rdata){
						var option = rdata.option; 
						console.log("option = "+option);
						if(option != ""){
							// privilege select 가져가기
							var p ='.privilege option[value='+rdata.option+']';
							console.log(p);
							$(p).prop("selected", true);
						}
						
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
							output += "	 <th>관리자 여부</th>"
							output += "  <th>권한 부여</th>";
							output += "  <th>권한 철회</th>";
							output += "</thead>";
							output += "<tbody>";
							
							var endcnt = (rdata.num*10)-1;
							var startcnt = endcnt -9; 
							console.log("startcnt="+startcnt + ", endcnt = "+endcnt);
							$(rdata.userlist).each(function(index, item){
								console.log("startcnt = "+startcnt);
								if(startcnt<=index && endcnt>=index){
									output += "<tr>";
									output += "	<td><input type='checkbox' class='checkthis' /></td>";
									output += "<td>"+item.user_NO+"</td>";
									output += "<td>"+item.user_ID+"</td>";
									output += "<td>"+item.user_NAME+"</td>";
									output += "<td>"+item.user_EMAIL+"</td>";
									output += "<td>"+item.user_PHONE+"</td>";
									if(item.user_IS_ADMIN == 0){
										output += "<td class='is_adminfont'></td>";
									}else{
										output += "<td class='is_adminfont'>○</td>";
									}
									
									output += "<td><button class='btn btn-primary btn-xs ok'><span class='glyphicon glyphicon-ok-circle'></span></button></td>";
									output += "<td><button class='btn btn-danger btn-xs cancel'><span class='glyphicon glyphicon-remove'></span></button></td>";
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
										output += "<li><a href='admin?doc=admin_privilege_management&num="+(num-1)+"'>"+(num-1)+"</a></li>"  
									}else{//현재페이지 num 이 3 이상인 경우
										output += "<li><a href='admin?doc=admin_privilege_management&num="+(num-2)+"'>"+(num-2)+"</a></li>"
										output += "<li><a href='admin?doc=admin_privilege_management&num="+(num-1)+"'>"+(num-1)+"</a></li>"
									}
								}
								
								//현재 페이지 버튼	
								output += "<li><a href='#'>"+num+"</a></li>";
								
								
								
								//다음 버튼 처리
								if((maxpage - num) > 0){//다음페이지가 존재할 때
									//다음 페이지 버튼 : 1개씩 이동
									
									//현재페이지보다 큰 페이지 버튼
									if((maxpage - num) == 1){//다음 페이지가 한개 존재할 때
										output += "<li><a href='admin?doc=admin_privilege_management&num="+(num+1)+"'>"+(num+1)+"</a></li>";
									}else{//다음페이지가 두개 이상 존재할 때
										output += "<li><a href='admin?doc=admin_privilege_management&num="+(num+1)+"'>"+(num+1)+"</a></li>";
										output += "<li><a href='admin?doc=admin_privilege_management&num="+(num+2)+"'>"+(num+2)+"</a></li>";
									}
									output += "<li><a href='admin?doc=admin_privilege_management&num="+(num+1)+"'><span class='glyphicon glyphicon-chevron-right'></span></a></li>";
									
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

			}
			//처음에 로드되면 실행 
			search(search_word);
			
			//검색버튼 눌렀을 때
			$(".user_searchbtn").click(function(){
				
				search_word = $(".user_search").val();
				if(search_word == null || search_word == ""){
					alert("검색어를 입력하세요");
				}else{
					$(".clearfix").remove();
					search(search_word);
				}
			});//click end
			
			//권한이 수정되었을 때 리로드해서 바로 반영
			var privilege = function(user_no, is_admin){
				$.ajax({
					type:"POST",
					data:{USER_NO:user_no, USER_IS_ADMIN:is_admin},
					url:"admin_privilege_change",
					success:function(rdata){
						console.log(rdata);
						//페이지 리로드
						location.reload(true);
					},
					error:function(){
						console.log("실패");
					}
					
				})
			}
			
			
			//권한 부여 클릭 했을 때
			$("#mytable").on("click",".ok",function(){
				//해당 유저가 관리자인지 일반회원인지 판별 
				var trNum = $(this).closest('tr').prevAll().length;
				var is_admin = $("#mytable tr:eq("+(trNum + 1) + ") td:eq(6)").text();//USER_IS_ADMIN 칼럼 확인
				var user_no = $("#mytable tr:eq("+(trNum + 1) + ") td:eq(1)").text();//USER_NO 
				if(is_admin == "○"){//관리자 회원에게 권한 부여를 시도
					console.log("이미 관리자 회원입니다.");
				}else{//일반회원 일 때
					privilege(user_no, 1);
				}
				
				
			})
			
			//권한 철회 클릭했을 때
			$("#mytable").on("click",".cancel",function(){
				//해당 유저가 관리자인지 일반회원인지 판별 
				var trNum = $(this).closest('tr').prevAll().length;
				var is_admin = $("#mytable tr:eq("+(trNum + 1) + ") td:eq(6)").text();//USER_IS_ADMIN 칼럼 확인
				var user_no = $("#mytable tr:eq("+(trNum + 1) + ") td:eq(1)").text();//USER_NO 
				if(is_admin == "○"){//관리자의 권한 취소를 눌렀을 때
					var check = confirm("권한을 취소하시겠습니까?");
					if(check == true){
						privilege(user_no, 0);
					}
				}else{
					console.log("일반 회원입니다.");
				}
				
			})
			
			$(".search").on("change", ".privilege", function(){
				console.log("privilege 선택 옵션 바뀜 ="+$(this).val());
				selected_option = $(this).val();
				search(search_word);
				$(".clearfix").remove();
				
			})
			
			
		})
	</script>
</head>
<body>
	<font id = "admin_viewtitle">관리자 권한 관리</font><br>
	<div class="search">
		<select class = "privilege">
			<option value="">전체</option>
			<option value="1">관리자 조회</option>
			<option value="0">일반 사용자 조회</option>
		</select>
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