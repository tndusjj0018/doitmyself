<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<script src="resources/js/jquery.min.js"></script>
<script src="resources/js/baha_js/qnaWrite.js"></script>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<form action ="qnaGo" method="post"  name="qnaForm">
	<input type="hidden" id="category" name="QNA_CATEGORY">
		<table border="1">
			<tr>
				<td>문의유형</td>
				<td><input type="radio" name="categories" value="0">상품</td>&emsp;
				<td><input type="radio" name="categories" value="1">배송</td>&emsp;
				<td><input type="radio" name="categories" value="2">반품/취소</td>&emsp;
				<td><input type="radio" name="categories" value="3">교환/변경</td>&emsp;
				<td><input type="radio" name="categories" value="4">기타</td>&emsp;
			</tr>
			<tr>
			<td>작성자</td>
			<td><input name="QNA_WRITER" id="writer"
			 type="text" size="10" maxlength="30" class="form-control" value="${USER_ID}" readonly></td>
			<tr>
			 <td>제목</td>
			 <td><input  name="QNA_SUBJECT"  id="subject" type="text" size="10"   
			 maxlength="100" class="form-control" placeholder="제목 입력"></td>
			<tr>
				<td>내용</td>
				<td><textarea name="QNA_CONTENT" id="content"></textarea>
				<td><input type="checkbox" name="QNA_SECRET" id="secretCHK" value="0">비밀글로
					문의하기</td>
			</tr>
			<tr>
				<td>
					<button type="submit" class="btn btn-primary" id="submit" onclick="window.close()">등록</button>
					<button type="reset" class="btn btn-primary"
						onClick="window.close()">취소</button>
				</td>
			</tr>
		</table>
	</form>
</body>
</html>