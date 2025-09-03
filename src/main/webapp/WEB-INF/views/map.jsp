<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
  <meta charset="UTF-8">
  <title>오시는 길</title>
  <link rel="stylesheet" href="resources/css/style.css">
  <script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=여기에_API_키_입력"></script>
</head>
<body>
<%@ include file="header.jsp" %>
  <div class="container">
    <h1>오시는 길</h1>
    <div class="map-box" id="map"></div>
  </div>

  <script>
    var mapContainer = document.getElementById('map'),
        mapOption = {
            center: new kakao.maps.LatLng(37.5665, 126.9780), // 서울 중심 좌표
            level: 3
        };
    var map = new kakao.maps.Map(mapContainer, mapOption);
    var marker = new kakao.maps.Marker({
        position: map.getCenter()
    });
    marker.setMap(map);
  </script>
  <%@ include file="footer.jsp" %>
</body>
</html>
