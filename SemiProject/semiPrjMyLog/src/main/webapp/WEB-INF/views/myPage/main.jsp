<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <!DOCTYPE html>
    <html>

    <head>
        <meta charset="UTF-8">
        <title>Insert title here</title>
        <link rel="stylesheet" href="/MyLog/resources/main.css">
        <script defer src="/MyLog/resources/main.js"></script>
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
        
        <div class="midle">
            <div class="midle-profile">
                <div class="img"><img src="" alt="기본이미지"></div>
                <div class="font-weight"">이경빈</div>
                <div style="color: rgb(99, 98, 98);">no pain no gain</div>
            </div>
            <a href="" class="midle-follow">
                <div><span class="font-weight">n</span> 팔로워</div>
                <div><span class="font-weight">n</span> 팔로잉</div>
            </a>
            <div class="midle-category">
                <a href="" class="category-focus">글</a>
                <a >시리즈</a>
                <a >소개</a>
            </div>
            <div class="midle-search">
                <form action="" method="post">
                    <span id="search-icon">🔍</span><input type="text" name="midle-search" placeholder="검색어를 입력하세요">
                </form>
            </div>
        </div>
        <div class="tag">
            <table>
                <tr><td><div id="tagList">태그 목록</div></td></tr>
                <tr><td><a href="" class="tag-focus">전체보기 (10)</a></td></tr>
                <tr><td><a >프로그래머스 (1)</a></td></tr>
                <tr><td><a >프로그래머스 (1)</a></td></tr>
                <tr><td><a >프로그래머스 (1)</a></td></tr>
                <tr><td><a >프로그래머스 (1)</a></td></tr>
                <tr><td><a >프로그래머스 (1)</a></td></tr>
            </table>
        </div>
        <div class="board">
            <div class="img"><img src="" alt="기본이미지"></div>
            <div id="board-title">제목 : 프로그래머스</div>
            <div>내용 요약 : 게시글의 내용을 n글자 까지 표시</div>
            <div id="board-tag">
                <a href="">프로그래머스</a>
                <a href="">12345문제</a>
                <a href="">123</a>
            </div>
            <div id="board-etc">
                <div>작성 시간</div>
                <div>0개의 댓글</div>
                <div>🤍0</div>
            </div>
        </div>
    </body>

    </html>
