<!DOCTYPE html>
<%@ page contentType="text/html;charset=UTF-8" %>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>HTML5</title>
<link rel="stylesheet" type="text/css" href="../../css/common.css">
<script type="text/javascript" src="../../js/common.js"></script>
<script type="text/javascript">
	window.onload = function(){
		document.getElementById("clientTime").innerHTML =  dateToString();
		checkOffLine();
		
		
		document.querySelector("button").onclick = function(){
			// TODO 캐시를 업데이트 한다.
			addCacheEvent();
			window.applicationCache.update();	
		};
	};
	
	// 캐시 관련 이벤트를 등록한다
	function addCacheEvent(){
		window.applicationCache.onnoupdate    = noupdateMessage;
		window.applicationCache.onupdateready = cacheUpdate;
		
	}
	
	// manifest가 변경되지 않았을 경우
	function noupdateMessage(){
		alert("현재 최신상태의 캐시를 사용중입니다.");
	}
	
	// 업데이트 다운로드가 완료되었을 경우
	function cacheUpdate(){
		// TODO 이전의 캐시를 새로운 캐시로 변경
		window.applicationCache.swapCache();
		
		if(confirm("최신정보로 업데이트 되었습니다. 새로고침 하시겠습니까?")){
			window.location.reload();
		}
	}
	
	function checkOffLine(){
		// TODO 오프라인 상태일 경우 캐시 업데이트 버튼을 비활성화 시킨다.
		if(window.navigator.onLine == true) {
			onlineState();
		} else {
			offlineState();
		}
		
		// TODO 오프라인에서 온라인으로 바뀔 경우
		window.ononline = onlineState;
		
		// TODO 온라인에서 오프라인으로 바뀔 경우
		window.onoffline = offlineState;
		
		
		
	}
	
	// 오프라인 상태일 경우 캐시 업데이트 버튼을 활성화 시킨다.
	function offlineState(){
		document.querySelector('button').disabled = true;
		document.querySelector('#online').innerHTML = "(오프라인)";
	}
	
	// 온라인 상태일 경우 캐시 업데이트 버튼을 비활성화 시킨다.
	function onlineState(){
		document.querySelector('button').disabled = false;
		document.querySelector('#online').innerHTML = "(온라인)";
	}
</script>
</head>
<body>
	<h1>캐시되는 페이지<span id="online">(온라인)</span></h1>
	<button>업데이트</button>
	<p>업데이트 버튼을 누르면 서버의 최신 데이터로 캐시를 업데이트 합니다.</p>
	<p>서버의 현재 시간 : <%= new java.text.SimpleDateFormat("yyyy-MM-dd hh:mm:ss").format(System.currentTimeMillis()) %></p>
	<p>클라이언트의 현재 시간 : <span id="clientTime"></span></p>
</body>
</html>