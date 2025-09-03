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
  <h2>게시글 수정</h2>

  <form action="contentModifyOk?bnum=${nDto.bnum }" method="post">
  	<input type="hidden" value="${nDto.bnum }">
    
    <label for="title">제목</label>
    <input type="text" id="btitle" name="btitle" value="${nDto.btitle }" required />

    <label for="writer">작성자</label>
    <input type="text" id="memberid" name="memberid" value="${sessionScope.sessionId}" readonly />

    <label for="content">내용</label>
    <textarea id="bcontent" name="bcontent" rows="8" required>${nDto.bcontent }</textarea>
	
    <button type="submit">수정완료</button>
  </form>
</div>

<%@ include file="footer.jsp" %>

</body>
</html>
