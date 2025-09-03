<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="ko">
<head>
  <meta charset="UTF-8" />
  <title>빨래방 키오스크</title>
  <link rel="stylesheet" href="resources/css/style.css" />
  <link href="https://fonts.googleapis.com/css2?family=Comfortaa:wght@400;700&family=Noto+Sans+KR&display=swap" rel="stylesheet" />
</head>
<body>
<%@ include file="header.jsp" %>
  <div class="container">
    <h1>무인 빨래방 키오스크</h1>
    <form action="reserveOk">
      <label for="machine">기기 선택</label>
      <select id="machine" name="machine">
        <option value="세탁기">세탁기</option>
        <option value="건조기">건조기</option>
        <option value="탈수기">탈수기</option>
      </select>

      <label for="date">예약 날짜</label>
      <input type="date" id="rdate" name="rdate" />

      <label for="time">예약 시간</label>
      <select id="rtime" name="rtime">
        <option value="" disabled selected>시간 선택</option>
        <option value="10:00">10:00</option>
        <option value="11:00">11:00</option>
        <option value="12:00">12:00</option>
        <option value="13:00">13:00</option>
        <option value="14:00">14:00</option>
        <option value="15:00">15:00</option>
        <option value="16:00">16:00</option>
        <option value="17:00">17:00</option>
      </select>
      <button type="submit">예약하기</button>
    </form>
  </div>
<%@ include file="footer.jsp" %>
</body>
</html>
