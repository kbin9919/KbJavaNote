<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>삭제된 게시글 목록 조회</h1>
	<a href="/MyLog/admin/detail/del/board">삭제된 게시글 상세 조회</a>
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
			<c:forEach items="${delBoardVoList}" var="vo">
				<tr>
					<td>${vo.title}</td>
					<td>${vo.writer}</td>
					<td>${vo.categoryNo}</td>
					<td>${vo.hits}</td>
					<td>${vo.noticeYn}</td>
					<td>${vo.secretYn}</td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
</body>
</html>