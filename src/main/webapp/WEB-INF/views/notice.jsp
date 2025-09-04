<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="ko">
<head>
  <meta charset="UTF-8" />
  <title>공지사항</title>
  <link rel="stylesheet" href="resources/css/style.css" />
</head>
<body>
<%@ include file="header.jsp" %>
  <div class="container">
    <h1>공지사항</h1>
    <button class="btn-write" onclick="window.location.href='writeForm'">글쓰기</button>
    <table class="table">
      <thead>
        <tr>
          <th>번호</th>
          <th>제목</th>
          <th>작성자</th>
          <th>작성일</th>
        </tr>
      </thead>
      <tbody>
      <c:forEach var="nDto" items="${nDtos}">
      	<tr>
          <td>${nDto.bnum }</td>
          <td><a href="contentView?bnum=${nDto.bnum }">${nDto.btitle }</a></td>
          <td>${nDto.memberDto.membername }</td>
          <td>
          <fmt:formatDate value="${nDto.bdate }" pattern="yyyy-MM-dd HH:mm"/>
          </td>
        </tr>
      </c:forEach>
      </tbody>
    </table>
    <!-- 페이징 버튼 -->
<div class="pagination">
  <!-- 이전 버튼 -->
   <c:if test="${pageNum >1 }">
  <button class="${pageNum == 1 ? 'disabled' : ''}" onclick="location.href='notice?pageNum=1'">처음</button>
  <button class="${pageNum == 1 ? 'disabled' : ''}" onclick="location.href='notice?pageNum=${pageNum - 1}'">◀</button>
</c:if>
  <!-- 페이지 숫자 버튼들 -->
  <c:forEach var="i" begin="${startPage }" end="${endPage}">
    <button class="${pageNum == i ? 'active' : ''}" onclick="location.href='notice?pageNum=${i}'">${i}</button>
  </c:forEach>

  <!-- 다음 버튼 -->
  <c:if test="${pageNum <totalPage }">
  <button class="${pageNum == totalPages ? 'disabled' : ''}" onclick="location.href='notice?pageNum=${pageNum + 1}'">▶</button>
  <!-- 마지막 버튼 -->
  <button class="${pageNum == totalPages ? 'disabled' : ''}" onclick="location.href='notice?pageNum=${totalPage}'">마지막</button>
</c:if>
</div>
  </div>
  <%@ include file="footer.jsp" %>
</body>
</html>
