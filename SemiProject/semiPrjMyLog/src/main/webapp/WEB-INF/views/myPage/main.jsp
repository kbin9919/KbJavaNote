<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <!DOCTYPE html>
    <html>

    <head>
        <meta charset="UTF-8">
        <title>Insert title here</title>
        <link rel="stylesheet" href="/MyLog/resources/main.css">
    </head>

    <body>
        <div class="top">MyLog</div>
        <div class="top">MyHome</div>
        <div class="top top-right">
            <div>알림</div>
            <div>검색</div>
            <div id="newBoard">새 글 작성</div>
            <div>set</div>
        </div>
        <div class="midle">
            <div class="midle-profile">
                <div>사진파일</div>
                <div>이름</div>
                <div>한줄 소개</div>
            </div>
            <div class="midle-follow">
                <div>0 팔로워</div>
                <div>0 팔로잉</div>
            </div>
            <div class="midle-category">
                <div>글</div>
                <div>시리즈</div>
                <div>소개</div>
            </div>
            <div class="midle-search">
                <form action="" method="post">
                    <input type="text" name="search" placeholder="🔍검색어를 입력하세요">
                </form>
            </div>
        </div>
        <div class="tag">
        <table>
            <tr><td><div id="tagList">태그 목록</div></td></tr>
            <tr><td><div>전체보기(10)</div></td></tr>
            <tr><td><div>프로그래머스(1)</div></td></tr>
            <tr><td><div>java(3)</div></td></tr>
            <tr><td><div>db(2)</div></td></tr>
            <tr><td><div>jdbc(1)</div></td></tr>
            <tr><td><div>html(5)</div></td></tr>
            <tr><td><div>css(4)</div></td></tr>
            <tr><td><div>js(6)</div></td></tr>
            <tr><td><div>was(11)</div></td></tr>
            <tr><td><div>tomcat(12)</div></td></tr>
            <tr><td><div>ajax(1)</div></td></tr>
        </table>
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
    </body>

    </html>
