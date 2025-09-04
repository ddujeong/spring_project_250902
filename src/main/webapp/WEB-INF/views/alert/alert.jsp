<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8" />
<title>커스텀 경고창</title>
<style>
  /* 배경 반투명 오버레이 */
  #overlay {
    position: fixed;
    top: 0; left: 0;
    width: 100vw; height: 100vh;
    background: rgba(0, 0, 0, 0.3);
    display: none; /* 기본 숨김 */
    align-items: center;
    justify-content: center;
    z-index: 9999;
  }

  #customAlert {
  background: #f0f4f8; /* 연한 하늘색 느낌 */
  border: 1.8px solid #a3c4f3; /* 부드러운 파랑 테두리 */
  color: #2a3a5a; /* 진한 네이비 */
  padding: 20px 30px;
  border-radius: 22px;
  box-shadow: 0 0 15px rgba(163,196,243,0.6);
  font-weight: 700;
  max-width: 300px;
  text-align: center;
  user-select: none;
}

#customAlert button {
  margin-top: 20px;
  background-color: #3b5998; /* 딥 블루 */
  color: white;
  border: none;
  padding: 10px 20px;
  border-radius: 15px;
  cursor: pointer;
  font-weight: 700;
  transition: background-color 0.3s ease;
}

#customAlert button:hover {
  background-color: #2d4373; /* 버튼 호버시 더 진한 파랑 */
}
</style>
</head>
<body>

<div id="overlay">
  <div id="customAlert">
    <div id="alertMsg">경고 메시지</div>
    <button id="alertBtn">확인</button>
  </div>
</div>

<script>
  // 메시지와 URL 서버에서 받아온다고 가정
  var msg  = "${msg}";
  var url  = "${url}";

  // 함수: 모달창 보여주기
  function showCustomAlert(message, redirectUrl) {
    document.getElementById('alertMsg').textContent = message;
    var overlay = document.getElementById('overlay');
    overlay.style.display = 'flex';

    document.getElementById('alertBtn').onclick = function() {
      overlay.style.display = 'none';
      if(redirectUrl) {
        location.href = redirectUrl;
      }
    };
  }

  // 페이지 로드 후 경고창 실행
  window.onload = function() {
    if(msg) {
      showCustomAlert(msg, url);
    }
  };
</script>

</body>
</html>
