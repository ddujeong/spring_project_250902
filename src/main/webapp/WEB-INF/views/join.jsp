<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
  <meta charset="UTF-8" />
  <title>회원가입</title>
  <link rel="stylesheet" href="resources/css/style.css" />
</head>
<body>
<%@ include file="header.jsp" %>
  <div class="container">
    <h1>회원가입</h1>
    <form action="joinOk" method="post">
      <input type="text" name="memberid" placeholder="아이디" required />
      <input type="password" name="memberpw" placeholder="비밀번호" required />
      <input type="password" name="checkpw" placeholder="비밀번호 확인" required />
      <input type="text" name="membername" placeholder="이름" required />
      <input type="text" name="memberphone" placeholder="전화번호" required />
      <button type="submit">가입하기</button>
    </form>
  </div>
  <%@ include file="footer.jsp" %>
</body>
</html>
