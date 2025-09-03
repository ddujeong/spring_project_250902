<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
  <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>  
  <!-- header.jsp -->
    <link rel="stylesheet" href="resources/css/style.css" />
<nav class="navbar">
  <ul>
    <li><a href="reservation">예약하기</a></li>
    <li><a href="notice">게시판</a></li>
    <c:choose>
    <c:when test="${sessionScope.sessionId == null }">
    <li><a href="login" >로그인</a></li>
    <li><a href="join" >회원가입</a></li>
    </c:when>
    <c:otherwise>
    <li><a href="orders" >예약확인</a></li>
    <li><a href="logout" >로그아웃</a></li>
    </c:otherwise>
    </c:choose>
  </ul>
</nav>
