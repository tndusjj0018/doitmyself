<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<script src="resources/js/jquery.min.js"></script>
<script src="resources/js/baha_js/qnaWrite.js"></script>
<link rel="stylesheet" href="resources/css/baha_css/qna_write.css">
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div id="header">
		<h1>&emsp;&emsp;&nbsp;문의 내용 작성</h1>
	</div>
	<form action="qnaGo" method="post" name="qnaForm">
		<input type="hidden" id="category" name="QNA_CATEGORY"> <input
			type="hidden" name="QNA_P_NO"
			value="<%=request.getParameter("QNA_P_NO")%>">
		<input type="hidden" value="<%=request.getParameter("QNA_S_ID") %>" name="QNA_S_ID">
		<table>
			<colgroup>
				<col style="width: 25%">
				<col style="width: 75%">
			</colgroup>
			<tbody>
				<tr>
					<td>문의유형</td>
					<td>
						<div>
							&emsp; <label><input type="radio" name="categories"
								value="0">배송&emsp;</label> <label><input type="radio"
								name="categories" value="1">상품&emsp;</label> <label><input
								type="radio" name="categories" value="2">반품/취소&emsp;</label> <label><input
								type="radio" name="categories" value="3">기타</label>
						</div>
					</td>
				</tr>
				<tr>
					<td>작성자</td>
					<td><input name="QNA_WRITER" id="writer" type="text" size="10"
						maxlength="30" class="form-control" value="${USER_ID}" readonly></td>
				<tr>
					<td>제목</td>
					<td><input name="QNA_SUBJECT" id="subject" type="text"
						size="10" maxlength="460" class="form-control" placeholder="제목 입력"></td>
				<tr>
					<td>내용</td>
					<td><textarea name="QNA_CONTENT" id="content"
							style="resize: none;"></textarea> <!-- 사이즈 484 / 96 -->
				</tr>
				<tr>
					<td>비밀글 여부</td>
					<td><label><input type="checkbox" name="QNA_SECRET"
							id="secretCHK" value="0">비밀글로 문의하기</label></td>
				</tr>
			</tbody>
		</table>
		<div id="buttons">
			<input type="submit" class="btn btn-primary" id="submit" value="등록">
			<button type="reset" class="btn btn-primary" onClick="window.close()">취소</button>
		</div>
	</form>

</body>
</html>