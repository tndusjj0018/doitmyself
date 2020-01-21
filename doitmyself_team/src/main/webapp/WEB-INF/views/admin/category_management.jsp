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
			border: 1px solid black;
		}
		.category_list{
			width:299px;
			border: 1px solid black;
			display: inline-block;
			float: left;
		}
		.category_list ul{
			list-style-type: none;
		}
		.category_viewtbl{
			width: 699px;
			border: 1px solid black;
			display: inline-block;
			float: left;
			padding-left: 74px;
			padding-top: 124px;
    		padding-bottom: 124px;
		}
		.input{
			width: 400px;
			height: 37px;
			margin: 16px;
			padding-left: 33px;
		}
		
		#btntd{ 
			text-align: center;
		}
		
		.updatebtn{
			width: 113px;
		    height: 39px;
		    margin-top: 37px;
		    background: #3a8aa2;
		    color: white;
		    border: none;
		}
		.column{
			font-size: 17px;
			font-weight: 600;
    		color: gray;
    		text-align: right;
		}
			
	</style>
	
	<script>
		$(document).ready(function(){
			$.ajax({
				type:"POST",
				url:"CategoryList",
				dataType:"json",
				success:function(rdata){
					output ="";
					if(rdata.length == 0){
						output += "분류가 존재하지 않습니다.";
						$(".major_categorylist").append(output);
						$(".sub_categorylist").append(output);
					}else{
						console.log(rdata);
						$(rdata.major).each(function(index, item){
							output += "<li>"+item.c_NAME +"<input type='hidden' value ='"+item.c_NO+"'></li>";
						})
						
						$(".major_categorylist").append(output);
						output="";
						
						
						$(rdata.sub).each(function(index, item){
							output += "<li>"+item.sc_NAME +"<input name = 'sc_NO' type='hidden' value ='"+item.sc_NO+"'><input type='hidden' name = 'sc_NO_REF' value ='"+item.sc_NO_REF+"'></li>";
						})
						
						$(".sub_categorylist").append(output);
						
					}
				},//success end
				error:function(){
					console.log("에러");
				}//error end
			})//ajax end
		})//ready end
		
	</script>
</head>
<body>
	<font id = "admin_viewtitle">카테고리 관리</font><br>
	
	<form action="" method="post" class="category_updateform">
		<div class="category_list">
			<font>대분류</font>
			<ul class = "major_categorylist">
			
			</ul>	
			<font>소분류</font>
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
				<td><input type="text" name="major_category" class="input"></td>
			</tr>
			<tr>
				<td class = "column">소분류</td>
				<td><input type="text" name="sub_category" class="input"></td>
			</tr>
			<tr>
				<td colspan="2" id="btntd"><button type="button" class="updatebtn">카테고리 수정</button></td>
			</tr>
		</table>
	</form>
</body>
</html>