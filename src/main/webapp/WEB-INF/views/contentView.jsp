<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">
<head>
  <meta charset="UTF-8" />
  <title>공지사항 상세보기</title>
  <link rel="stylesheet" href="resources/css/style.css" />

</head>
<body>
<%@ include file="header.jsp" %>

<div class="container">
  <h1>${nDto.btitle}</h1>
  <div class="detail-info">
    <span>작성자: ${nDto.memberDto.membername}(${nDto.memberDto.memberid })</span>
     <span>조회수: ${nDto.bhit}</span>
    <span>작성일:
    <fmt:formatDate value="${nDto.bdate}" pattern="yyyy-MM-dd HH:mm"/>
     </span>
  </div>
  <div class="detail-content">
    ${nDto.bcontent}
  </div>
   <!-- 댓글 폼 추가 -->
  <div class="comment-section">
    <h4>댓글 작성</h4>
    <c:choose>
    <c:when test="${sessionScope.sessionId == null}">
    <form action="commentOk" method="post" class="comment-form">
    
      <input type="hidden" name="bnum" value="${bnum}" /> <!-- 게시글 번호 -->
      <textarea name="ctext" placeholder="로그인 후 작성가능합니다" rows="4" required readonly="readonly"></textarea>
    </form>
    </c:when>
    <c:otherwise>
    <form action="commentOk" method="post" class="comment-form">
    
      <input type="hidden" name="bnum" value="${bnum}" /> <!-- 게시글 번호 -->
      <textarea name="ctext" placeholder="댓글을 작성해주세요..." rows="4" required></textarea>
      <button type="submit" class="btn">댓글 작성</button>
    </form>
    </c:otherwise>
    </c:choose>
  </div>

  <!-- 댓글 목록 -->
  <div class="comments-list">
    <h4>댓글 목록[${cDtos.size()}]</h4>
    <c:forEach var="cDto" items="${cDtos}">
      <div class="comment-item">
        <div class="comment-info">
          <span class="comment-author">${cDto.memberDto.membername}</span>
          <span class="comment-date">
            <fmt:formatDate value="${cDto.cdate}" pattern="yyyy-MM-dd HH:mm"/>
          </span>
        </div>
        <p class="comment-content">${cDto.ctext}</p>
         <c:if test="${cDto.memberid == sessionScope.sessionId}">
        <div class="comment-actions">
        <input type="hidden" name="bnum" value="${bnum}" /> <!-- 게시글 번호 -->
          <a href="commentModify?cnum=${cDto.cnum}&bnum=${bnum}" class="btn-edit">수정</a>
          <a href="commentDelete?cnum=${cDto.cnum}&bnum=${bnum}" class="btn-delete" onclick="return confirm('정말 삭제하시겠습니까?');">삭제</a>
        </div>
        </c:if>
      
      </div>
     
    </c:forEach>
  </div>
  <c:if test="${nDto.memberid == sessionId }">
  <a href="contentModify?bnum=${nDto.bnum }" class="btn-back">수정</a>
  <a href="contentDelete?bnum=${nDto.bnum }" class="btn-back">삭제</a>
  </c:if>
  <a href="notice" class="btn-back">목록</a>
</div>

<%@ include file="footer.jsp" %>
</body>
</html>