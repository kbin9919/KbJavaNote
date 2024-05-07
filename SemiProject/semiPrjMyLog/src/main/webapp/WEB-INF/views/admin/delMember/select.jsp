<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>탛퇴한 유저 목록 조회</h1>
	<a href="/MyLog/admin/detail/del/member">탈퇴한 유저 상세 조회</a>
	<table border="1">
		<thead>
			<tr>
				<th>이메일</th>
				<th>닉네임</th>
				<th>패스워드</th>
				<th>가입일</th>
				<th>정보 수정일</th>
				<th>소개글</th>
				<th>팔로워</th>
				<th>팔로잉</th>
				<th>경고 점수</th>
				<th>권한 여부</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach items="${delMemberVoList}" var="vo">
				<tr>
					<td>${vo.email}</td>
					<td>${vo.nick}</td>
					<td>${vo.password}</td>
					<td>${vo.enrollDate}</td>
					<td>${vo.modifyDate}</td>
					<td>${vo.introduction}</td>
					<td>${vo.followers}</td>
					<td>${vo.following}</td>
					<td>${vo.warnigPoint}</td>
					<td>${vo.authority}</td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
</body>
</html>