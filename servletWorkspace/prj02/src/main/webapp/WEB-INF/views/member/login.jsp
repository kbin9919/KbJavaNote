<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
	<h1>로그인</h1>
	<a href="http://127.0.0.1:8888/prj02/home">홈페이지</a>
	<hr>
	<form action="http://127.0.0.1:8888/app02/login" method="post">
	<input type="text" placeholder="아이디" name = "memberId">
	<br>
	<input type="text" placeholder="비밀번호" name = "memberPwd">
	<br>
	<input type="submit" value="로그인">
	</form>
</body>
</html>