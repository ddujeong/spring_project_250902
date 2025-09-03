<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
  <meta charset="UTF-8">
  <title>게시글 작성</title>
  <link rel="stylesheet" href="resources/css/style.css" />
</head>
<body>

<%@ include file="header.jsp" %>

<div class="container">
  <h2>게시글 작성</h2>

  <form action="writeOk" method="post">
    
    <label for="title">제목</label>
    <input type="text" id="btitle" name="btitle" placeholder="제목을 입력하세요" required />

    <label for="writer">작성자</label>
    <input type="text" id="memberid" name="memberid" value="${sessionScope.sessionId}" readonly />

    <label for="content">내용</label>
    <textarea id="bcontent" name="bcontent" rows="8" placeholder="내용을 입력하세요" required></textarea>

    <button type="submit">등록</button>
  </form>
</div>

<%@ include file="footer.jsp" %>

</body>
</html>
