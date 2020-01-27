<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<script>
		$(document).ready(function(){
			var selected = $(".category_select").val();
			console.log("value = "+selected);
			function change(selval){
				console.log("function change 가동");
				$(".categorydiv").empty();
				var output="";
				if(selval == "대분류"){
					//등록 되어있는 가장 큰 대분류 코드+100 readOnly
					output += "카테고리 번호 : <input type='text' name = 'C_NO' readOnly><br>";
					output += "카테고리 이름 : <input type='text' name = 'C_NAME'><br>";//카테고리 이름 중복 검사해야 함
				}else{
					output += "카테고리 번호 : <input type='text' name = 'SC_NO' readOnly><br>";
					var data = mainCategoryList();
					output += data;
					output += "<br>카테고리 이름 : <input type='text' name = 'SC_NAME'><br>";//카테고리 이름 중복 검사해야 함
				}
				output += "<input type='button' value='추가' class='categoryAdd'>"
				$(".categorydiv").append(output);
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
						data += "<select>";
						$(rdata.major).each(function(){
							data += "<option value="+this.c_NO+">";
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
			
			$(".categoryAdd").click(function(){
				var selectval = $(".category_select").val();
				if(selectval == "대분류"){
					if($("input[name=C_NAME]")==""){
						alert("카테고리 이름을 입력하세요");
					}else{
						
					}
				}else{
					if($("input[name=SC_NAME]")==""){
						alert("카테고리 이름을 입력하세요");
					}
				}
				
			})
		})
	</script>
</head>
<body>
	<font id = "admin_viewtitle">관리자 권한 관리</font><br>
	<form>
		<select class="category_select">
			<option>대분류</option>
			<option>소분류</option>
		</select>
		<div class="categorydiv">
			
		</div>
	</form>
</body>
</html>