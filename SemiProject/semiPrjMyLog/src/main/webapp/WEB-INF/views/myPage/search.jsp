<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="/MyLog/resources/main.css">
<link rel="stylesheet" href="/MyLog/resources/search.css">
</head>
<body>
	<header>
        <div class="top">
            <div>MyLog</div>
            <div>MyHome</div>
            <div class="top-right">
                <div>알림</div>
                <div>검색</div>
                <div id="newBoard">새 글 작성</div>
                <div>set</div>
            </div>
        </div>
    </header>
    <div class="search">
        <div class="input">
            <form action="" method="post">
                <input type="text" name="search" placeholder="🔍검색어를 입력하세요">
            </form>
            <div>총 <span style="font-weight: 900;">n</span>개의 포스트를 찾았습니다.</div>
        </div>
        <div class="search-post">
            <div class="search-profile">
                <div>사진 파일</div>
                <div>이름</div>
            </div>
            <div class="board">
                <div class="img">사진파일</div>
                <div id="board-title">제목 : 프로그래머스</div>
                <div>내용 요약 : 게시글의 내용을 n글자 까지 표시</div>
                <div id="board-tag">
                    <div>프로그래머스</div>
                    <div>12345문제</div>
                    <div>123</div>
                </div>
                <div id="board-etc">
                    <div>작성 시간</div>
                    <div>0개의 댓글</div>
                    <div>🤍0</div>
                </div>
            </div>
        </div>
    </div>
    
</body>
</html>