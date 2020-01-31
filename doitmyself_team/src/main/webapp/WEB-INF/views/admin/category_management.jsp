<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<style>
		.category_updateform{
			width:1000px;
			height:700px;
			margin-top: 50px;
		}
		.category_list{
			width:299px;
			display: inline-block;
			float: left;
			padding: 46px;
			height: 534px;
			overflow-y: auto;
		}
		.category_list ul{
			list-style-type: none;
		}
		.category_viewtbl{
			width: 699px;
			display: inline-block;
			float: left;
			padding-left: 74px;
			padding-top: 124px;
    		padding-bottom: 124px;
    		height: 534px;
		}
		.input{
			width: 400px;
			height: 37px;
			margin: 16px;
			padding-left: 33px;
		}
		
		#btntd{ 
			text-align: center;
			padding-left: 78px;
		}
		#btntd button{
			margin-left: 5px;
			margin-right:5px;
		}
		
		.updatebtn{
			width: 113px;
		    height: 39px;
		    margin-top: 37px;
		    background: #3a8aa2;
		    color: white;
		    border: none;
		}
		.deletebtn{
			width: 113px;
		    height: 39px;
		    margin-top: 37px;
		    background: #a97ab5;
		    color: white;
		    border: none;
		}
		
		.column{
			font-size: 17px;
			font-weight: 600;
    		color: gray;
    		text-align: right;
		}
		.major_sub_font{
		    font-size: large;
    		display: inline-block;
    		margin-bottom: 10px;
		}
			
	</style>
	
	<script>
		$(document).ready(function(){
			$.ajax({
				type:"POST",
				url:"CategoryList",
				dataType:"json",
				async:false,
				success:function(rdata){
					$(".major_categorylist").empty();
					$(".sub_categorylist").empty();
					output ="";
					if(rdata.length == 0){
						output += "분류가 존재하지 않습니다.";
						$(".major_categorylist").append(output);
						$(".sub_categorylist").append(output);
					}else{
						console.log(rdata);
						$(rdata.major).each(function(index, item){
							output += "<li class = 'majorlist'>"+item.c_NAME +"<input type='hidden' name='"+item.c_NAME+"' value ='"+item.c_NO+"'></li>";
						})
						
						$(".major_categorylist").append(output);
						output="";
						
						
						$(rdata.sub).each(function(index, item){
							output += "<li class='sublist'>"+item.sc_NAME +"<input name = 'sc_NO' type='hidden' value ='"+item.sc_NO+"'><input type='hidden' name = 'sc_NO_REF' value ='"+item.sc_NO_REF+"'></li>";
						})
						
						$(".sub_categorylist").append(output);
						
					}
					
					
					//대분류 클릭 시 처리 => 폼에 데이터 끌고 올것임 
					$(".majorlist").click(function(){
						console.log($(this).text() + "/" + $(this).children().val());
						$("input[name=category_name]").val($(this).text());
						$("input[name=major_category]").val($(this).children().val());
						$("input[name=sub_category]").val("");
					})
					//소분류 클릭시 처리 
					$(".sublist").click(function(){
						console.log($(this).text() + "/" + $(this).children().val() + "/" +$(this).children().next().val());
						$("input[name=category_name]").val($(this).text());
						$("input[name=sub_category]").val($(this).children().val());
						$("input[name=major_category]").val($(this).children().next().val());
					})
					
				},//success end
				error:function(){
					console.log("에러");
				}//error end
			})//ajax end
			
			$(".updatebtn").click(function(){
				var category_name =  $("input[name=category_name]").val();
				var major_category = $("input[name=major_category]").val();
				var sub_category = $("input[name=sub_category]").val();
				
				if($("input[name=category_name]").val() == ""){
					alert("카테고리명을 입력하세요");
				}else if($("input[name=major_category]").val() == "" && $("input[name=sub_category]").val() == ""){//분류가 선택이 되어 있지 않을 때 
					alert("분류를 선택하세요");
				}else{//분류도 선택되어 있고 카테고리명도 입력되어있을 때
										
					$.ajax({
						type:"POST",
						url:"UpdateCategory",
						data:{category_name:category_name, major_category:major_category, sub_category:sub_category},
						success:function(rdata){
							console.log("성공");
							history.go(0);
						},
						error:function(){
							console.log("실패");
						}
						
					})//ajax end
					
				}//if-else end
				
			})//click end
			
			$(".deletebtn").click(function(){
				var category_name =  $("input[name=category_name]").val();
				var major_category = $("input[name=major_category]").val();
				var sub_category = $("input[name=sub_category]").val();
				
				if($("input[name=category_name]").val() == ""){
					alert("카테고리명을 입력하세요");
				}else if($("input[name=major_category]").val() == "" && $("input[name=sub_category]").val() == ""){//분류가 선택이 되어 있지 않을 때 
					alert("분류를 선택하세요");
				}else{//분류도 선택되어 있고 카테고리명도 입력되어있을 때
					$.ajax({
						type:"POST",
						url:"DeleteCategory",
						data:{category_name:category_name, major_category:major_category, sub_category:sub_category},
						success:function(rdata){
							console.log("성공");
							history.go(0);
						},
						error:function(){
							console.log("실패");
						}
						
					})//ajax end
				}
			})
			
			
			
		})//ready end
		
	</script>
</head>
<body>
	<font id = "admin_viewtitle">카테고리 관리</font><br>
	
	<form class="category_updateform">
		<div class="category_list">
			<font class= "major_sub_font">대분류</font>
			<ul class = "major_categorylist">
				
			</ul>	
			<font class= "major_sub_font">소분류</font>
			<ul class = "sub_categorylist">

			</ul>
		</div>
		<table class="category_viewtbl">
			<tr>
				<td class = "column">카테고리명</td>
				<td><input type="text" name = "category_name" class="input"></td>
			</tr>
			<tr>
				<td class = "column">대분류</td>
				<td><input type="text" name="major_category" class="input" readOnly></td>
			</tr>
			<tr>
				<td class = "column">소분류</td>
				<td><input type="text" name="sub_category" class="input" readOnly></td>
			</tr>
			<tr>
				<td colspan="2" id="btntd"><button type="button" class="updatebtn">카테고리 수정</button><button type="button" class="deletebtn">카테고리 삭제</button></td>
			</tr>
		</table>
	</form>
</body>
</html>
