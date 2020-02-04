<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<style>
		.category_select {
		    width: 174px;
		    height: 27px;
		    text-align-last: center;
		}
		.category_select option{
			text-align: center;
		}
		.categorydiv{
			text-align: center;
    		padding: 20px;
		}
		.categorydiv >select{
			margin-left: 99px;
		}
		.mm{
			margin-left: 281px;
    		margin-top: 49px;
		}
		.categoryAdd{
			width: 174px;
		    margin-left: 100px;
		    height: 33px;
		    margin-top: 13px;
		    background: #3a8aac;
		    color: white;
		    border: none;
		    margin-bottom: 49px;
		}
		.categoryAddForm{
		    border: 1px solid lightgray;
		    width: 637px;
		    margin: 0 auto;
		    margin-top: 63px;
		}
		.checkSpan{
			padding-left: 101px;
		}
	</style>
	<script>
		$(document).ready(function(){
			var selected = $(".category_select").val();
			console.log("value = "+selected);
			
			function change(selval){
				console.log("function change 가동");
				$(".categorydiv").empty();
				var output="";
				var c_no = "";
				var sc_no="";
				if(selval == "대분류"){
					$.ajax({
						type:"POST",
						url:"maxMajorCategoryNo",
						async:false,
						success:function(rdata){
							console.log("대분류 가장 큰 코드 가져오기 성공");
							console.log("대분류 가장 큰 코드 = "+rdata);
							c_no = Number(rdata)+100;
							console.log("추가될 대분류 코드 = "+c_no);
						},
						error:function(){
							console.log("에러남");
						}
					})
					//등록 되어있는 가장 큰 대분류 코드+100 readOnly
					output += "카테고리 번호 : <input type='text' name = 'C_NO' value = '"+c_no+"'  readOnly style='text-align:center'><br>";
					output += "카테고리 이름 : <input type='text' name = 'C_NAME'><br>";//카테고리 이름 중복 검사해야 함
					output += "<span class='checkSpan'></span><br>";
					output += "<input type='button' value='추가' class='categoryAdd'>"
					$(".categorydiv").append(output);
				}else{
					
					output += "카테고리 번호 : <input type='text' name = 'SC_NO' readOnly><br>";
					var data = mainCategoryList();
					output += data;
					output += "<br>카테고리 이름 : <input type='text' name = 'SC_NAME'><br>";//카테고리 이름 중복 검사해야 함
					output +="<span class='checkSpan'></span><br>"
					output += "<input type='button' value='추가' class='categoryAdd'>"
					$(".categorydiv").append(output);
					majorChange();
				}
				
				
				$("#major").change(function(){
					majorChange();
				})//change end
				
				
				$("input[name=C_NAME]").keyup(function(){
					console.log("입력중");
					$.ajax({
						type:"POST",
						data:{C_NAME:$("input[name=C_NAME]").val()},
						url:"C_NAMECheck",
						success:function(rdata){
							if(rdata == 1){//중복된 카테고리 명일 때
								$(".checkSpan").text("중복된 카테고리명입니다.");
								$(".checkSpan").css("color","red");
							}else{//중복된 카테고리 명이 아닐 때
								$(".checkSpan").text("사용가능한 카테고리명입니다.");
								$(".checkSpan").css("color","green");
							}
						},
						error:function(){
							console.log('c_name 중복검사 실패');
						}
						
					})
				})//keyup end
				
				$("input[name=SC_NAME]").keyup(function(){
					console.log("입력중");
					$.ajax({
						type:"POST",
						data:{SC_NAME:$("input[name=SC_NAME]").val()},
						url:"SC_NAMECheck",
						success:function(rdata){
							if(rdata == 1){//중복된 카테고리 명일 때
								$(".checkSpan").text("중복된 카테고리명입니다.");
								$(".checkSpan").css("color","red");
							}else{//중복된 카테고리 명이 아닐 때
								$(".checkSpan").text("사용가능한 카테고리명입니다.");
								$(".checkSpan").css("color","green");
							}
						},
						error:function(){
							console.log('sc_name 중복검사 실패');
						}
						
					})
				})//keyup end
					$(".categoryAdd").click(function(){
						console.log("버튼 클릭");
						var selectval = $(".category_select").val();
						console.log(selectval);
						if(selectval == "대분류" || selectval == "소분류"){
							if($("input[name=C_NAME]").val()==""||$("input[name=SC_NAME]").val()==""){
								alert("카테고리 이름을 입력하세요");
							}else{
								var data=$(".categoryAddForm").serialize();
								console.log("formdata = "+data);
								$.ajax({
									type:"POST",
									url:"CategoryAdd",
									data:data,
									success:function(rdata){
										console.log("CategoryAdd 갔다옴");
										if(rdata == 1){
											alert("카테고리 추가 성공");
											history.go(0);
										}else{
											alert("카테고리 추가 실패");
										}
									},
									error:function(){
										console.log("실패");
									}
									
								})//ajax end
							}//if-else end
						}		
					})//click end
					
					
				
			}//function change end
			
			function majorChange(){
				var ma = Number($("#major").val());
				console.log("선택된 것 = "+ma);
				$.ajax({
					type:"POST",
					url:"maxSubCategoryNo",
					data:{SC_NO_REF:ma},
					async:false,
					success:function(rdata){
						console.log("소분류 가장 큰 코드 가져오기 성공");
						console.log("소분류 가장 큰 코드 = "+rdata);
						sc_no = Number(rdata)+1;
						console.log("추가될 소분류 코드 = "+sc_no);
						$("input[name=SC_NO]").val(sc_no);
					},
					error:function(){
						console.log("에러남");
					}
				})//ajax end
			}
			
			function mainCategoryList(){
				return_data="";
				$.ajax({
					type:"POST",
					dataType:"json",
					url:"mainCategoryList",
					async:false,//동기식-비동기식 변경
					success:function(rdata){
						console.log("성공");
						console.log(rdata);
						var data = "";
						data += "<select class='category_select' name='SC_NO_REF' id='major'>";
						
						$(rdata.major).each(function(index, item){
							var selected = "";
							if(index == 0){
								selected = "selected";
							}
							data += "<option value='"+this.c_NO+"'"+selected+">";
							data += this.c_NAME;
							data += "</option>";
						})//each end
						data += "</select>";
						return_data= data;
					},
					error:function(){
						console.log("실패");
					}//error end
				})//ajax end
				return return_data;
			}//function mainCategoryList end
			
			
			//처음 로딩시 
			change(selected);
			
			
			//select의 value가 바뀌면
			$(".category_select").change(function(){
				console.log("value 바뀜 = "+$(this).val());
				change($(this).val());	
			})
			
			
		})//document end
	</script>
</head>
<body>
	<font id = "admin_viewtitle">관리자 권한 관리</font><br>
	<form class="categoryAddForm">
		<select class="category_select mm">
			<option>대분류</option>
			<option>소분류</option>
		</select>
		<div class="categorydiv">
			
		</div>
	</form>
</body>
</html>
