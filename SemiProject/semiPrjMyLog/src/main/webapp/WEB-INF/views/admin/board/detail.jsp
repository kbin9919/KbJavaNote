<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>게시판 상세 조회</h1>
	<form action="/MyLog/admin/detail/board" method="post">
		<input type="text" name="title" placeholder="게시글 제목"> <br>
		<input type="submit" value="검색">
	</form>
	<c:if test="${boardVo != null}">
		<table border="1">
			<thead>
				<tr>
					<th>제목</th>
					<th>작성자</th>
					<th>카테고리</th>
					<th>조회수</th>
					<th>공지사항</th>
					<th>비밀글</th>
				</tr>
			</thead>
			<tbody>
				<tr>
					<td>${boardVo.title}</td>
					<td>${boardVo.writer}</td>
					<td>${boardVo.categoryNo}</td>
					<td>${boardVo.hits}</td>
					<td>${boardVo.noticeYn}</td>
					<td>${boardVo.secretYn}</td>
				</tr>
			</tbody>
		</table>
	</c:if>
</body>
</html>