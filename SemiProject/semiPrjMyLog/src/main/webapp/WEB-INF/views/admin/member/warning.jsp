<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>유저 경고</h1>
	<form action="/MyLog/admin/warning" method="post">
		<input type="text" name="email" placeholder="유저 이메일 입력">
		<select name="warningNo">
			<option value="1">자유</option>
			<option value="2">스포츠</option>
			<option value="3">게임</option>
		</select>
		<br>
		<input type="submit" value="제출"> 
	</form>

</body>
</html>