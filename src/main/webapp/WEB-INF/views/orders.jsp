<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="ko">
<head>
  <meta charset="UTF-8" />
  <title>내 예약 내역</title>
</head>
<body>
  <%@ include file="header.jsp" %>
  <div class="container">
    <h2>내 예약 목록</h2>
    <table class="table">
      <thead>
        <tr>
          <th>예약 번호</th>
          <th>기기</th>
          <th>예약 날짜</th>
          <th>예약 시간</th>
          <th>상태</th>
          <th>취소</th>
        </tr>
      </thead>
      <tbody>
      <c:forEach var="rDto" items="${rDtos }">
        <tr>
          <td>${rDto.rid }</td>
          <td>${rDto.machine }</td>
       	  <td><fmt:formatDate value="${rDto.rdatetime}" pattern="yyyy-MM-dd" /></td> <!-- 날짜 포맷 -->
          <td><fmt:formatDate value="${rDto.rdatetime}" pattern="HH:mm" /></td> <!-- 시간 포맷 -->
          <td><span class="status confirmed">${rDto.status }</span></td>
         <c:if test="${rDto.status != '진행중' }">
         	 <c:choose>
          		<c:when test="${rDto.status == '세탁완료' }">
          			<td><button class="btn-cancel" onclick="window.location.href='reserveDelete?rid=${rDto.rid}'">삭제</button></td>
          		</c:when>
          		 <c:otherwise>
          			<td><button class="btn-cancel" onclick="window.location.href='reserveDelete?rid=${rDto.rid}'">취소</button></td>
          		</c:otherwise>
         	 </c:choose>
          </c:if>
        </tr>
        </c:forEach>
      </tbody>
    </table>
     <form action="memberDelete" method="post" onsubmit="return confirm('정말 탈퇴하시겠습니까?');" style="margin-top: 20px;">
      <input type="hidden" name="memberid" value="${sessionScope.sessionId}" />
      <button type="submit" class="btn-cancel">회원탈퇴</button>
    </form>
   
  </div>
  <%@ include file="footer.jsp" %>
</body>
</html>
