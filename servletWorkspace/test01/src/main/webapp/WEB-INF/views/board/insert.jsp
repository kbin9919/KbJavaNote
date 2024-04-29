<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel = "stylesheet" href="/test01/resources/file.css">
</head>
<body>
	<h1>게시글 작성</h1>
	<hr>
	<a href="/test01/home">홈페이지</a>
	<hr>
	<form action="/test01/board/insert" method="post">
	<input type="text" name="title" placeholder="제목">
	<br>
	<input type="text" name="content">
	<br>
	<input type="submit" value="SUBMIT">
	</form>
</body>
</html>