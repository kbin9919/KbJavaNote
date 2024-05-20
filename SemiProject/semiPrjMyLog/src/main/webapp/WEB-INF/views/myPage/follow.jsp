<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="/MyLog/resources/follow.css">
<link rel="stylesheet" href="/MyLog/resources/main.css">
<script defer src="/MyLog/resources/follow.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
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
    <div class="with">
            <div class="with-togle">
                    <a class="with-focus">팔로워</a>
                <a>팔로잉</a>
            </div>
            <div class="with-search">
                <form action="" method="post">
                    <span id="search-icon">🔍</span><input type="text" name="midle-search" placeholder="검색어를 입력하세요">
                </form>
            </div>
            <div class="with-list">
                <div>모든 팔로워</div>
                <div class="with-list-name">
                    <div id="with-img"><a href=""><img src="" alt="사진"></a></div>
                    <div><div><a href="">이름</a></div><a href=""><div id="with-email">이메일</div></a></div>
                    <div id="with-following">팔로잉</div>
                    <div>소개문구</div>
                </div>
            </div>
    </div>
</body>
</html>