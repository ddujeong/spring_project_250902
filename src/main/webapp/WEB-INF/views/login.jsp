<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
  <meta charset="UTF-8" />
  <title>로그인</title>
  <link rel="stylesheet" href="resources/css/style.css" />
</head>
<body>
<%@ include file="header.jsp" %>
  <div class="container">
    <h1>로그인</h1>
    <form action="loginOk" method="post">
      <input type="text" name="memberid" placeholder="아이디" required />
      <input type="password" name="memberpw" placeholder="비밀번호" required />
      <button type="submit">로그인</button>
    </form>
  </div>
  <%@ include file="footer.jsp" %>
</body>
</html>
