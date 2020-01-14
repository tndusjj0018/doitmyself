<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
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