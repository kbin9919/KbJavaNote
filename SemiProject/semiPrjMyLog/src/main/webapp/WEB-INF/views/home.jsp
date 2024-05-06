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
<c:remove var="alertMsg" scope="session" />

</head>
<body>
	<h1>홈페이지</h1>
	<c:if test="${newAdminVo == null}">
		<a href="/MyLog/admin/login">로그인</a>
	</c:if>
	<c:if test="${newAdminVo != null}">
		<span>프로필</span>
		<br>
		<span>아이디 : ${sessionScope.newAdminVo.email} </span>
		<br>
		<span>닉네임 : ${sessionScope.newAdminVo.nick} </span>
		<br>
		<button onclick="location.href = '/app/member/logout'">로그아웃</button>
	</c:if>
	<c:if test="${newAdminVo != null}">
		<br>
		<a>계정 경고</a>
		<br>
		<a>계정 제제</a>
		<br>
		<a href="/MyLog/admin/select/board">게시글 목록 조회</a>
		<br>
		<a>유저 조회</a>
		<br>
		
	</c:if>
</body>
</html>