<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>계정 제제</h1>
	<form action="/MyLog/admin/quit/member" method="post">
		<input type="text" name="email" placeholder="제제할 계정 이메일"> 
		<input type="submit">
	</form>
</body>
</html>