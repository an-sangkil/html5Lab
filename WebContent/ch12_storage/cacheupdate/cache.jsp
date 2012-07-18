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
		autoUpdate();
	};
	
	// 캐시를 자동으로 업데이트 한다.
	function autoUpdate(){

		var updateTime = window.localStorage.getItem("timeUpdate");
		console.log("cache.jsp [page] timeUpdate :" + updateTime );
		
		if(updateTime != null) {
			addCacheEvent();
			setInterval("window.applicationCache.update()", updateTime*1000);
		}
		
	}
	
	function addCacheEvent () {
		window.applicationCache.onnoupdate    = noupdateMessage;
		window.applicationCache.onupdateready = cacheUpdate;
	}
	
	function cacheUpdate(){
		console.log("update 하고 있나?");
		window.applicationCache.swapCache();
		window.location.reload();
	}
	
	// manifest가 변경되지 않았을 경우
	function noupdateMessage(){
		console.log("현재 최신상태의 캐시를 사용중입니다.");
		//alert("");
	}
	
	
</script>
</head>
<body>
	<h1>캐시되는 페이지</h1>
	<p>업데이트 버튼을 누르면 서버의 최신 데이터로 캐시를 업데이트 합니다.</p>
	<p>서버의 현재 시간 : <%= new java.text.SimpleDateFormat("yyyy-MM-dd hh:mm:ss").format(System.currentTimeMillis()) %></p>
	<p>클라이언트의 현재 시간 : <span id="clientTime"></span></p>
</body>
</html>









