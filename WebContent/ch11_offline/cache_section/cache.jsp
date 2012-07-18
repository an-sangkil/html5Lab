<!DOCTYPE html>
<%@ page contentType="text/html;charset=UTF-8" %>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>HTML5</title>
<link rel="stylesheet" type="text/css" href="../../css/common.css">
<script src="../../js/common.js"></script>
<script>
	window.onload = function(){
		document.getElementById("clientTime").innerHTML =  dateToString();
	};
</script>
</head>
<body>
	<h1>캐시되는 페이지(수정)</h1>
	<p>캐시가 되었다면 새로 고침 시 서버의 시간은 변하지 않고 클라이언트의 시간만 변해야 함.</p>
	<p>서버의 현재 시간 : <%= new java.text.SimpleDateFormat("yyyy-MM-dd hh:mm:ss").format(System.currentTimeMillis()) %></p>
	<p>클라이언트의 현재 시간 : <span id="clientTime"></span></p>
	
</body>
</html>





















