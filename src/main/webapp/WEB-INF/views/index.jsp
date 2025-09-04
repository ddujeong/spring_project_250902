<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
 <meta name="viewport" content="width=device-width, initial-scale=1" />
<title>키오스크 대문</title>
 <link rel="stylesheet" href="resources/css/style.css" />
</head>
<body>
	<div class="container main-container">
    <h1>세탁기 돌릴 시간! 👕🌀</h1>
    <a href="reservation" class="btn">예약하기</a>
    <a href="notice" class="btn">게시판</a>
    <c:choose>
    <c:when test="${sessionScope.sessionId == null }">
    <a href="login" class="btn">로그인</a>
    <a href="join" class="btn">회원가입</a>
    </c:when>
    <c:otherwise>
    <a href="orders" class="btn">예약확인</a>
    <a href="logout" class="btn">로그아웃</a>
    </c:otherwise>
    </c:choose>
  </div>
</body>
</html>