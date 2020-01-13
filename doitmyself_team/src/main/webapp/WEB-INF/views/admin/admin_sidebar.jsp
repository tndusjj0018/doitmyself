<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	
	<link rel="stylesheet" href = "resources/css/admin_sidebar.css">
	<script src = "resources/js/admin_sidebar.js"></script>
	
</head>
<body>
	<div class = "admin_sidebar">
		<ul class = "sidebar_category">
			<li class = "first_category">회원관리</li>
			<li><a href="admin?doc=userview">회원 정보 조회</a></li>
			<li><a href="admin?doc=review_management">리뷰 관리</a></li>	
		</ul>
		<ul class = "sidebar_category">
			<li class = "first_category">판매자관리</li>
			<li><a href="admin?doc=seller_info">판매자 정보 조회</a></li>
			<li><a href="admin?doc=seller_revoke">판매자 권한 취소</a></li>
		</ul>
		<ul class = "sidebar_category">
			<li class = "first_category">주문관리</li>
			<li><a href="admin?doc=orderlist">전체 주문 내역</a></li>
			<li><a href="admin?doc=refundlist">환불 내역</a></li>
			<li><a href="admin?doc=exchange_list">교환 내역</a></li>			
		</ul>
		<ul class = "sidebar_category">
			<li class = "first_category">상품관리</li>
			<li><a href="admin?doc=category_management">카테고리 관리</a></li>
			<li><a href="admin?doc=product_delete_request">상품 삭제 요청</a></li>
			<li><a href="admin?doc=product_modify_request">상품 내용 수정 요청</a></li>			
		</ul>
		<ul class = "sidebar_category">
			<li class = "first_category">캘린더</li>
			<li><a href="admin?doc=calendar_share">캘린더 공유</a></li>
			<li><a href="admin?doc=myschedule">내 일정</a></li>
		</ul>
		<ul class = "sidebar_category">
			<li class = "first_category"><a href="admin?doc=statics">통계</a></li>
		</ul>
		<ul class = "sidebar_category">
			<li class = "first_category"><a href="admin?doc=admin_privilege_management">관리자 권한 관리</a></li>
		</ul>
	</div>
	
</body>
</html>