<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script>
	<c:if test="${not empty alertMsg}">
	alert("${alertMsg}");
	</c:if>
</script>
</head>
<body>
	<h1>홈페이지</h1>
	${sessionScope.test + 2}
	<br>
	<c:forEach var="i" begin="1" end="5">
    Item ${i}<br>
	</c:forEach>
</body>
</html>