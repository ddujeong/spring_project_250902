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

  <!-- 댓글 목록 -->
  <div class="comments-list">
    <h4>댓글 목록</h4>
    <c:forEach var="cDto" items="${cDtos}">
      <div class="comment-item">
        <div class="comment-info">
          <span class="comment-author" >${cDto.memberDto.membername}</span>
          <span class="comment-date">
            <fmt:formatDate value="${cDto.cdate}" pattern="yyyy-MM-dd HH:mm"/>
          </span>
        </div>

        <!-- 댓글 수정 처리 -->
        <c:choose>
          <c:when test="${cDto.cnum == cnum}">
            <form action="commentModifyOk" method="post">
              <input type="hidden" name="cnum" value="${cDto.cnum}" />
              <input type="hidden" name="bnum" value="${bnum}" />
              <textarea name="ctext" rows="4" cols="50">${cDto.ctext}</textarea>
              <div class="comment-actions">
                <button type="submit" class="btn-edit">수정</button>
                <button type="button" class="btn-delete" onclick="window.location.href='notice';">취소</button>
              </div>
            </form>
          </c:when>
          <c:otherwise>
            <p class="comment-content">${cDto.ctext}</p>
          </c:otherwise>
        </c:choose>

      </div>
    </c:forEach>
  </div>

  <a href="notice" class="btn-back">목록</a>
</div>

<%@ include file="footer.jsp" %>
</body>
</html>
