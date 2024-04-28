<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>로그인 결과</h1>
	<%String msg = (String) request.getAttribute("x");%>
	<h1><%=msg%></h1>
	
</body>
</html>