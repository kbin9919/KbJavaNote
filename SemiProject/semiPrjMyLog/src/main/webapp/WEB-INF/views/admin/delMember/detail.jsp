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
	<h1>탈퇴한 유저 상세 조회</h1>
	<form action="/MyLog/admin/detail/del/member" method="post">
		<input type="text" name="email" placeholder="탈퇴한 유저 이메일"> <br>
		<input type="submit" value="검색">
	</form>
	<c:if test="${delMemberVo != null}">
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
				<tr>
					<td>${delMemberVo.email}</td>
					<td>${delMemberVo.nick}</td>
					<td>${delMemberVo.password}</td>
					<td>${delMemberVo.enrollDate}</td>
					<td>${delMemberVo.modifyDate}</td>
					<td>${delMemberVo.introduction}</td>
					<td>${delMemberVo.followers}</td>
					<td>${delMemberVo.following}</td>
					<td>${delMemberVo.warnigPoint}</td>
					<td>${delMemberVo.authority}</td>
				</tr>
			</tbody>
		</table>
	</c:if>
</body>
</html>