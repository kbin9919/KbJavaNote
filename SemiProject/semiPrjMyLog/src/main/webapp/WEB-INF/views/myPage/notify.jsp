<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="/MyLog/resources/main.css">
<link rel="stylesheet" href="/MyLog/resources/notify.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
<script defer src="/MyLog/resources/notify.js"></script>
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

    <div class="notify">
            <div class="notify-togle">
                <div>
                    <div class="notify-togle-border notify-togle-focus">전체</div>
                    <div class="notify-togle-border">읽지 않음</div>
                </div>
                <div>
                    <a href="">모두 읽음</a>
                    <a href="">모두 삭제</a>
                </div>
            </div>
            <div class="notify-list">
                <div class="notify-list-name">
                    <div id="notify-img"><a href=""><img src="" alt="사진"></a></div>
                    <div><a href=""><div>이름</div></a><a href=""><div id="notify-email">이메일</div></a></div>
                    <div id="notify-date">2024.01.23</div>
                    <div><a href="">내용</a></div>
                </div>
            </div>
    </div>
</body>
</html>